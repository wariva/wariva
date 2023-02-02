defmodule WarivaWeb.PageControllerTest do
  use WarivaWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Wariva"
  end
end
