# Wariva 🐒 [![Elixir](https://github.com/wariva/wariva/actions/workflows/ci.yaml/badge.svg)](https://github.com/wariva/wariva/actions/workflows/ci.yaml)

Wariva is a delightfully simple async communication platform. It's fast, free, and easy to use, with all the features you need to have a successful community. It's also extremely extensible, allowing for ultimate customizability.

## Useful link

* 📜 [Wiki](https://github.com/wariva/wariva/wiki)
* 👮 [Code of Conduct](https://github.com/wariva/wariva/wiki/Code-of-Conduct)
* 🐛 [Reporting Bugs](https://github.com/wariva/wariva/wiki/Reporting-Bugs)

## Development

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Run the database with `mix docker-compose up -d postgres`
* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# O11Y

- Enable `o11y` profile for docker compose by setting `COMPOSE_PROFILES=o11y`
- Run `docker-compose up -d`
- Now you have:
  - Grafana on http://localhost:3000/
  - Prometheus on http://localhost:9090/
  - Promtail on http://localhost:9080/
  - Tempo on http://localhost:3100/
