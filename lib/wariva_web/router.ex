defmodule WarivaWeb.Router do
  @moduledoc false

  use WarivaWeb, :router

  @csp :wariva
       |> Application.compile_env(:content_security_policy)
       |> Enum.join("; ")

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {WarivaWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers, %{"content-security-policy" => @csp}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WarivaWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/signin", Live.Accounts.SignIn
    live "/register", Live.Accounts.Register
  end

  scope "/api", WarivaWeb do
    pipe_through :api
  end

  if Mix.env() == :dev do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: WarivaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
