defmodule Wariva.Factories do
  @moduledoc false

  alias Wariva.Factories.User

  def build(:user, params),
    do: User.build(params)

  def build(factory_name, params) do
    factory_name
    |> build(params)
    |> struct!()
  end

  @doc false
  def insert(factory_name, params \\ %{}) do
    factory_name
    |> build(params)
    |> Wariva.Repo.insert()
  end

  @doc false
  def insert!(factory_name, params \\ %{}) do
    factory_name
    |> build(params)
    |> Wariva.Repo.insert!()
  end
end
