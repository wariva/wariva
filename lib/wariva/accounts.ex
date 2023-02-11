defmodule Wariva.Accounts do
  @moduledoc """
  The Accounts context.
  """

  use Wariva, :context

  @doc "Returns the list of users"
  def list_users do
    Repo.all(User)
  end

  @doc "Gets a single user"
  def get_user!(id), do: Repo.get!(User, id)

  @doc "Creates a user"
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc "Updates a user"
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc "Deletes a user"
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc "Returns an `%Ecto.Changeset{}` for tracking user changes"
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
