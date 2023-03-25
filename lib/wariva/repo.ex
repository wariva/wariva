defmodule Wariva.Repo do
  use Ecto.Repo,
    otp_app: :wariva,
    adapter: Ecto.Adapters.Postgres
end
