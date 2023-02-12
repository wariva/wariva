defmodule WarivaWeb.Live.Accounts.SignIn do
  @moduledoc false

  use WarivaWeb, :live_view

  import Wariva.Gettext

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, dgettext("pages", "Sign In"))}
  end

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <div class="relative flex min-h-full justify-center md:px-12 lg:px-0 h-screen">
      <div class="relative z-10 flex flex-1 flex-col py-10 px-4 shadow-2xl sm:justify-center md:flex-none md:px-28">
        <div class="mx-auto w-full max-w-md sm:px-4 md:w-96 md:max-w-sm md:px-0">
          <div class="flex flex-col">
            <h1 class="font-cursive text-7xl w-full text-center lg:text-left">
              <.link navigate="/">Wariva</.link>
            </h1>

            <div class="flex flex-col">
              <h2 class="text-xl font-semibold mt-16">
                <%= dgettext("forms", "Sign in to your account") %>
              </h2>
            </div>
          </div>

          <form action="#" method="POST" class="space-y-6 mt-4">
            <div>
              <label for="email" class="block text-sm font-medium">Email</label>
              <div class="mt-1">
                <input id="email" name="email" type="email" autocomplete="email" required class="block w-full dark:text-neutral-100 dark:bg-zinc-800 appearance-none rounded-md border border-neutral-300 dark:border-zinc-600 px-3 py-2 shadow-sm focus:border-amber-500 focus:outline-none focus:ring-amber-500 dark:focus:ring-zinc-900 sm:text-sm">
              </div>
            </div>

            <div>
              <button type="submit" class="flex w-full justify-center rounded-md border border-transparent bg-amber-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-amber-700 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:ring-offset-2"><%= dgettext("forms", "Login") %> &rarr;</button>
            </div>
          </form>

          <p class="text-sm text-center mt-5">
            <%= dgettext("forms", "Don't have an account?") %> <.link navigate="/register" class="text-amber-700 hover:underline"><%= dgettext("forms", "Register") %></.link>.
          </p>
        </div>
      </div>

      <div class="hidden sm:contents lg:relative lg:block lg:flex-1">
        <img
          src="/images/background-auth.jpg"
          class="absolute inset-0 h-full w-full object-cover"
          alt="">
      </div>
    </div>
    """
  end
end
