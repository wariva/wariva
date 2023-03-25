defmodule Wariva.PromEx do
  @moduledoc """
  `PromEx` is the library we use to define Prometheus metrics.
  It has a plugin system that defines a collection of metrics and dashboards.
  For more information check `PromEx` documentation.
  """

  use PromEx, otp_app: :wariva

  alias PromEx.Plugins

  @doc """
  Defines all the Plugins we want to use. It is important to only enable the
  ones for the libraries we are currently using.
  """
  @impl PromEx
  def plugins do
    [
      # PromEx built in plugins
      Plugins.Application,
      Plugins.Beam,
      {Plugins.Phoenix, router: WarivaWeb.Router, endpoint: WarivaWeb.Endpoint},
      Plugins.Ecto,
      Plugins.PhoenixLiveView
    ]
  end

  @doc """
  This implement defaults for the dashboard assigns, so we should aim for sane
  defaults.

  This can always be overriden when generating the dashboards via CLI arguments,
  so we are not locked in.
  """
  @impl PromEx
  def dashboard_assigns do
    [
      datasource_id: "prometheus",
      default_selected_interval: "30s"
    ]
  end

  @doc """
  The list of dashboards we know how to generate.
  """
  @impl PromEx
  def dashboards do
    [
      {:prom_ex, "application.json"},
      {:prom_ex, "beam.json"},
      {:prom_ex, "phoenix.json"},
      {:prom_ex, "ecto.json"},
      {:prom_ex, "phoenix_live_view.json"}
    ]
  end
end
