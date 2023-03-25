defmodule Wariva.Application do
  @moduledoc false

  use Application

  alias TelemetryLoggers.PlugLogger

  @impl Application
  def start(_type, _args) do
    TelemetryLogger.attach_loggers([
      {PlugLogger, router: WarivaWeb.Router}
    ])

    children = [
      Wariva.PromEx,
      WarivaWeb.Telemetry,
      Wariva.Repo,
      {Phoenix.PubSub, name: Wariva.PubSub},
      {Finch, name: Wariva.Finch},
      WarivaWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Wariva.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    WarivaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
