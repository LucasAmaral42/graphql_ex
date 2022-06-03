defmodule GraphqlEx.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:description, :power_consumption, :rate]

  schema "items" do
    field :description, :string
    field :power_consumption, :float
    field :rate, :string

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(item, attrs \\ %{}) do
    item
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
