defmodule GraphqlEx.Repo do
  use Ecto.Repo,
    otp_app: :graphql_ex,
    adapter: Ecto.Adapters.Postgres
end
