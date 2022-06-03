defmodule GraphqlExWeb.Resolvers.Item do
  alias GraphqlEx.Items

  def get(%{id: item_id}, _context) do
    case Items.get_item(item_id) do
      nil -> {:error, "Item not found"}
      item -> {:ok, item}
    end
  end

  def create(%{input: params}, _context) do
    Items.create_item(params)
  end
end
