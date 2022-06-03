defmodule GraphqlEx.Items do
  @moduledoc false

  alias __MODULE__.Item
  alias GraphqlEx.Repo

  @spec create_item(map()) :: nil
  def create_item(attrs) do
    %Item{}
    |> change_item(attrs)
    |> Repo.insert()
  end

  @spec get_item(Integer.t()) :: any
  def get_item(id) do
    Item
    |> Repo.get(id)
  end

  @spec change_item(
          {map(), map()}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def change_item(struct, attrs \\ %{}) do
    struct
    |> Item.changeset(attrs)
  end
end
