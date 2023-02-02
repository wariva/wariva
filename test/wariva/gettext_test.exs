defmodule Wariva.GettextTest do
  @moduledoc false

  use ExUnit.Case

  describe "known?/1" do
    test "returns true for known locales" do
      for locale <- Gettext.known_locales(Wariva.Gettext) do
        assert Wariva.Gettext.known?(locale)
      end
    end

    test " returns false for unkown locale" do
      refute Wariva.Gettext.known?("fa_KE")
    end
  end

  describe "get_supported_locales/0" do
    test "asserts all entries have a code and a name" do
      locales = Wariva.Gettext.get_supported_locales()

      for locale <- locales do
        assert is_binary(locale.code)
        assert is_binary(locale.name)
      end
    end

    test "assert that at least english is part of the supported locales" do
      locales = Wariva.Gettext.get_supported_locales()

      assert Enum.member?(locales, %{
               code: "en",
               name: "English"
             })
    end

    test "assert that all locales are unique" do
      locales = Wariva.Gettext.get_supported_locales()

      assert length(locales) == length(Enum.uniq_by(locales, & &1.code))
    end
  end

  describe "get_locale/1" do
    test "returns locale when code is valid" do
      locales = Wariva.Gettext.get_supported_locales()

      for locale <- locales do
        assert locale == Wariva.Gettext.get_locale(locale.code)
      end
    end

    test "returns nil when code is invalid" do
      assert nil == Wariva.Gettext.get_locale("invalid")
    end
  end

  describe "put_supported_locale/1" do
    test "puts the locale when code is valid" do
      Wariva.Gettext.put_supported_locale("pt")
      assert "pt" == Gettext.get_locale(Wariva.Gettext)
    end

    test "puts default locale when code is invalid" do
      Wariva.Gettext.put_supported_locale("invalid")
      assert "en" == Gettext.get_locale(Wariva.Gettext)
    end
  end
end
