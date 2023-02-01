defmodule WarivaWeb.Live.Home do
  @moduledoc false

  use WarivaWeb, :live_view

  def render(assigns) do
    ~H"""
    <aside class="flex flex-col items-center justify-center mt-12">
      <h1 class="text-7xl mb-5">Wariva</h1>

      <a href="/signin">Sign in</a>
    </aside>
    """
  end
end
