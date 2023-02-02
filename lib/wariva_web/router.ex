defmodule WarivaWeb.Router do
  use WarivaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {WarivaWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WarivaWeb.Live do
    pipe_through :browser

    live "/", Home
    live "/signin", Accounts.SignIn
    live "/register", Accounts.Register
  end

  if Mix.env() == :dev do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: WarivaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  scope "/api", WarivaWeb do
    pipe_through :api
  end
end
