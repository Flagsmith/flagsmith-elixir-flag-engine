defmodule Flagsmith.Schemas.Identity do
  use TypedEctoSchema
  import Ecto.Changeset

  @moduledoc """
  Ecto schema representing an object containing Flagsmith's flags and traits associated
  with an identity and helpers to cast responses from the api.
  """

  @primary_key false
  typed_embedded_schema do
    field(:identifier, :string)
    field(:environment_key, :string)
    embeds_many(:flags, Flagsmith.Schemas.Features.FeatureState)
    embeds_many(:traits, Flagsmith.Schemas.Traits.Trait)
  end

  @spec changeset(map()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), map()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:identifier, :environment_key])
    |> validate_required([:identifier])
    |> cast_embed(:traits)
    |> cast_embed(:flags)
  end

  def from_id_traits(identifier, traits, environment_key \\ nil),
    do: %__MODULE__{
      identifier: identifier,
      environment_key: environment_key,
      traits: Flagsmith.Schemas.Traits.Trait.from(traits)
    }

  @spec from_response(element :: map() | list(map())) :: __MODULE__.t() | any()
  def from_response(element) when is_map(element) do
    element
    |> changeset()
    |> apply_changes()
  end

  def from_response(elements) when is_list(elements) do
    Enum.map(elements, fn element ->
      element
      |> changeset()
      |> apply_changes()
    end)
  end

  def from_response(element), do: element

  def set_env_key(%__MODULE__{} = struct, %Flagsmith.Schemas.Environment{api_key: environment_key})
      when is_binary(environment_key),
      do: set_env_key(struct, environment_key)

  def set_env_key(%__MODULE__{} = struct, environment_key) when is_binary(environment_key),
    do: %{struct | environment_key: environment_key}

  def composite_key(%__MODULE__{identifier: identifier, environment_key: environment_key})
      when is_binary(environment_key),
      do: "#{environment_key}_#{identifier}"

  def composite_key(%__MODULE__{identifier: identifier}, environment_key)
      when is_binary(environment_key),
      do: "#{environment_key}_#{identifier}"
end
