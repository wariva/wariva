FROM elixir:1.14.3-alpine AS builder

ENV MIX_ENV=prod

WORKDIR /app

RUN apk add git build-base nodejs npm python3

RUN mix do local.hex --force, local.rebar --force

COPY mix.exs mix.lock ./
COPY config config

RUN mix deps.get --only $MIX_ENV
RUN mix deps.compile

# build assets
COPY assets assets
RUN cd assets && npm install
RUN mix phx.digest

# compile dependencies
COPY priv priv
COPY lib lib
RUN mix compile

# build release
COPY rel rel
RUN mix release

FROM alpine:3.16.3 AS app

ENV MIX_ENV=prod
ENV ECTO_IPV6 true
ENV ERL_AFLAGS "-proto_dist inet6_tcp"

WORKDIR /app

COPY --from=builder /app/_build/prod/rel/wariva .

RUN apk add --update make build-base bash openssl
RUN chown -R nobody: /app

USER nobody

EXPOSE 4000

CMD ["/app/bin/wariva", "start"]

