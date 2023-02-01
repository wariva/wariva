defmodule WarivaWeb.Live.Accounts.RegisterTest do
  @moduledoc false

  use WarivaWeb.ConnCase

  setup %{conn: conn} do
    [conn: init_test_session(conn, %{})]
  end

  describe "render/1" do
    test "mount successfully", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/register")
      assert html =~ "Register"
    end
  end
end
