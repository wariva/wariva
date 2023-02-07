defmodule Wariva.FeatureFlag do
  @moduledoc """
  Provides Feature Flag support for features.
  """

  @doc """
  Return a boolean saying if the provided flag exists.
  """
  @spec available?(atom()) :: boolean()
  def available?(key) do
    Application.get_env(:wariva, __MODULE__)[key]
  end
end
