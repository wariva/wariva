defmodule Wariva.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :wariva,
    adapter: Ecto.Adapters.Postgres
end
