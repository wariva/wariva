defmodule Wariva.Accounts.User do
  @moduledoc "User"

  use Wariva, :schema

  import Wariva.Gettext

  @typedoc "User"
  @type t :: %__MODULE__{
          id: binary(),
          email: binary(),
          username: binary(),
          display_name: binary() | nil,
          bio: binary() | nil,
          website: binary() | nil,
          locale: binary() | nil,
          updated_at: binary(),
          inserted_at: binary()
        }

  schema "users" do
    field :email, :string
    field :username, :string

    field :display_name, :string
    field :bio, :string
    field :website, :string

    field :locale, :string, default: "en"

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, fields())
    |> validate_required([:display_name, :email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/,
      message: dgettext("errors", "must have the @ sign and no spaces")
    )
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

  @spec fields :: list()
  defp fields do
    __MODULE__.__schema__(:fields)
    |> Enum.filter(&(&1 not in [:inserted_at, :updated_at]))
  end
end
