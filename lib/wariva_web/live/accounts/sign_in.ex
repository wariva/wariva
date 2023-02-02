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
    <div class="flex min-h-full flex-col justify-center py-12 lg:mt-28 sm:px-6 lg:px-8">
      <div class="sm:mx-auto sm:w-full sm:max-w-md">
        <h1 class="font-cursive text-7xl w-full text-center mb-10">
          <.link navigate="/signin">Wariva</.link>
        </h1>
        <h2 class="mt-6 text-center text-2xl lg:text-3xl font-bold tracking-tight">
          <%= dgettext("forms", "Sign in to your account") %>
        </h2>
      </div>

      <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div class="bg-white dark:bg-neutral-900 py-8 px-4 shadow sm:rounded-lg sm:px-10">
          <form class="space-y-6" action="#" method="POST">
            <div class="form-control">
              <label for="email" class="block text-sm font-medium">Email</label>
              <div class="mt-1">
                <input id="email" name="email" type="email" autocomplete="email" required class="block w-full dark:text-neutral-100 dark:bg-zinc-800 appearance-none rounded-md border border-neutral-300 dark:border-zinc-600 px-3 py-2 shadow-sm focus:border-purple-500 focus:outline-none focus:ring-purple-500 dark:focus:ring-zinc-900 sm:text-sm">
              </div>
            </div>

            <div class="form-control">
              <button type="submit" class="flex w-full justify-center rounded-md border border-transparent bg-purple-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2"><%= dgettext("forms", "Sign In") %></button>
            </div>
          </form>

          <p class="text-sm text-center mt-5">
            <%= dgettext("forms", "Don't have an account?") %> <.link navigate="/register"><%= dgettext("forms", "Register") %></.link>.
          </p>
        </div>
      </div>
    </div>
    """
  end
end
