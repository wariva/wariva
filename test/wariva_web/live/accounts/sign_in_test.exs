defmodule WarivaWeb.Live.Accounts.SignInTest do
  @moduledoc false

  use WarivaWeb.ConnCase

  setup %{conn: conn} do
    [conn: init_test_session(conn, %{})]
  end

  describe "render/1" do
    test "mount successfully", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/signin")
      assert html =~ "Sign In"
    end
  end
end
