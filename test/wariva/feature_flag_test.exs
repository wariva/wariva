defmodule Wariva.FeatureFlagTest do
  @moduledoc false

  use WarivaWeb.ConnCase

  doctest Wariva.FeatureFlag

  setup do
    Application.put_env(:wariva, Wariva.FeatureFlag, accounts: true)

    on_exit(fn ->
      Application.put_env(:wariva, Wariva.FeatureFlag, :accounts)
    end)
  end

  describe "available?/1" do
    test "return truthy for a previous added flag" do
      assert Application.get_env(:wariva, Wariva.FeatureFlag, :accounts)
      assert Wariva.FeatureFlag.available?(:accounts)
    end

    test "returns falsy if doesn't exists" do
      refute :flag in Application.get_env(:wariva, Wariva.FeatureFlag)
      refute Wariva.FeatureFlag.available?(:flag)
    end
  end
end
