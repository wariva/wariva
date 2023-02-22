defmodule WarivaWeb.AppPageController do
  @moduledoc false

  use WarivaWeb, :controller

  @spec app(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def app(conn, _params) do
    render(conn, "app.html")
  end
end
