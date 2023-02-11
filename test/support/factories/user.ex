defmodule Wariva.Factories.User do
  @moduledoc false

  def build(nil), do: build(%{})

  def build(params) do
    %Wariva.Accounts.User{
      email: Map.get(params, :email, "adrian@belmont.com"),
      username: Map.get(params, :username, "adriant-#{Ecto.UUID.generate()}"),
      display_name: Map.get(params, :display_name, "Adrian"),
      locale: Map.get(params, :locale, "en")
    }
  end
end
