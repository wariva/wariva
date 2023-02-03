defmodule WarivaWeb.PageController do
  @moduledoc false

  use WarivaWeb, :controller

  @spec home(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def home(conn, _params) do
    render(conn, "home.html")
  end
end
