defmodule WarivaWeb.ErrorJSONTest do
  use WarivaWeb.ConnCase, async: true

  test "renders 404" do
    assert WarivaWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert WarivaWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
