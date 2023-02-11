defmodule Wariva do
  @moduledoc """
  Wariva keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @doc false
  def context do
    quote do
      import Ecto.Query, warn: false

      alias Wariva.Mailer
      alias Wariva.Repo

      alias Wariva.Accounts
      alias Wariva.Accounts.User
    end
  end

  @doc false
  def schema do
    quote do
      use Ecto.Schema

      import Ecto.Changeset

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
    end
  end

  @doc """
  When used, dispatch to the appropriate function.
  """
  @spec __using__(atom) :: any()
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
