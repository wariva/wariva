defmodule Wariva.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Wariva.Repo,
      WarivaWeb.Telemetry,
      {Phoenix.PubSub, name: Wariva.PubSub},
      WarivaWeb.Endpoint
    ]

    Supervisor.start_link(children, [strategy: :one_for_one, name: Wariva.Supervisor])
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WarivaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
