defmodule GraphqlEx.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :power_consumption, :float
    field :rate, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:description, :power_consumption, :rate])
    |> validate_required([:description, :power_consumption, :rate])
  end
end
