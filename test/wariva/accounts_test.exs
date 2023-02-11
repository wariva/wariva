defmodule Wariva.AccountsTest do
  @moduledoc false

  use Wariva.DataCase

  alias Wariva.Accounts

  describe "list_users/0" do
    test "returns all users" do
      user = insert!(:user)
      assert Accounts.list_users() == [user]
    end
  end

  describe "get_user!/1" do
    test "returns the user with given id" do
      user = insert!(:user)
      assert Accounts.get_user!(user.id) == user
    end
  end

  describe "create_user/1" do
    test "with valid data creates a user" do
      assert {:ok, %Accounts.User{} = user} =
               Accounts.create_user(%{display_name: "Adrian", email: "adriant@belmont.com"})

      assert user.display_name == "Adrian"
      assert user.email == "adriant@belmont.com"
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(%{email: nil})
    end
  end

  describe "update_user/2" do
    test "with valid data updates the user" do
      user = insert!(:user)

      assert {:ok, %Accounts.User{} = user} =
               Accounts.update_user(user, %{display_name: "Jane", email: "jane@mail.com"})

      assert user.display_name == "Jane"
      assert user.email == "jane@mail.com"
    end

    test "with invalid data returns error changeset" do
      user = insert!(:user)

      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, %{email: nil})
      assert user == Accounts.get_user!(user.id)
    end
  end

  describe "delete_user/1" do
    test "deletes the user" do
      user = insert!(:user)

      assert {:ok, %Accounts.User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end
  end

  describe "change_user/1" do
    test "returns a user changeset" do
      user = insert!(:user)

      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
