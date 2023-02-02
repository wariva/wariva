defmodule Wariva.Gettext do
  @moduledoc """
  A module providing Internationalization with a gettext-based API.

  By using [Gettext](https://hexdocs.pm/gettext),
  your module gains a set of macros for translations, for example:

      import Wariva.Gettext

      # Simple translation
      gettext("Here is the string to translate")

      # Plural translation
      ngettext("Here is the string to translate",
               "Here are the strings to translate",
               3)

      # Domain-based translation
      dgettext("errors", "Here is the error message to translate")

  See the [Gettext Docs](https://hexdocs.pm/gettext) for detailed usage.
  """

  use Gettext,
    otp_app: :wariva,
    default_locale: "en"

  @supported_locales [
    %{code: "en", name: "English"},
    %{code: "es", name: "Español"},
    %{code: "fr", name: "Français"},
    %{code: "it", name: "Italiano"},
    %{code: "pt", name: "Português"}
  ]

  @type locale :: %{code: String.t(), name: String.t()}

  @spec get_locale(String.t()) :: locale() | nil
  def get_locale(code) do
    Enum.find(@supported_locales, &(&1.code == code))
  end

  @doc "Returns the suported locales."
  @spec get_supported_locales() :: [locale()]
  def get_supported_locales do
    @supported_locales
  end

  @doc "Sets a given locale if it's supported"
  @spec put_supported_locale(String.t()) :: nil
  def put_supported_locale(locale) do
    if known?(locale) do
      Gettext.put_locale(locale)
    end
  end

  @doc "Verifies if the location is a known location by us."
  @spec known?(String.t()) :: boolean()
  def known?(locale) do
    locale in Gettext.known_locales(__MODULE__)
  end
end
