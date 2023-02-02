defmodule WarivaWeb.Live.Home do
  @moduledoc false

  use WarivaWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, dgettext("pages", "Home"))}
  end

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <main class="container mx-auto">
      <header class="flex justify-between py-12">
        <h1 class="text-3xl font-cursive">
          <.link navigate="/">Wariva</.link>
        </h1>

        <.link
          class="inline-flex items-center font-semibold"
          navigate="/signin">
          <span class="mr-1"><%= dgettext("home", "Log In") %></span>
          <Heroicons.arrow_left_on_rectangle class="w-5 h-5 rotate-180 text-indigo-800 dark:text-indigo-400" />
        </.link>
      </header>
    </main>
    """
  end
end
