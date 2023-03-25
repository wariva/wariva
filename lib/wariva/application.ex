defmodule Wariva.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WarivaWeb.Telemetry,
      # Start the Ecto repository
      Wariva.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wariva.PubSub},
      # Start Finch
      {Finch, name: Wariva.Finch},
      # Start the Endpoint (http/https)
      WarivaWeb.Endpoint
      # Start a worker by calling: Wariva.Worker.start_link(arg)
      # {Wariva.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wariva.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WarivaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
