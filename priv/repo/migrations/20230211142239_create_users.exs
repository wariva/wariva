defmodule Wariva.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true

      add :email, :string, null: false
      add :username, :string

      add :display_name, :string, null: false
      add :bio, :string
      add :website, :string

      add :locale, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:username])
  end
end
