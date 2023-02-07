defmodule Wariva do
  @moduledoc """
  Wariva keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @doc false
  def context(_opts) do
    quote do
      import Ecto.Query, warn: false

      alias Wariva.Mailer
      alias Wariva.Repo
    end
  end

  @doc false
  def schema(_opts) do
    quote do
      use Ecto.Schema

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
    end
  end

  @doc """
  When used, dispatch to the appropriate function.
  """
  @spec __using__(atom, list) :: any()
  defmacro __using__(which, opts \\ []) when is_atom(which) do
    apply(__MODULE__, which, opts)
  end
end
