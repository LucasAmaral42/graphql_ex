defmodule GraphqlEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GraphqlEx.Repo,
      # Start the Telemetry supervisor
      GraphqlExWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GraphqlEx.PubSub},
      # Start the Endpoint (http/https)
      GraphqlExWeb.Endpoint
      # Start a worker by calling: GraphqlEx.Worker.start_link(arg)
      # {GraphqlEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GraphqlEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GraphqlExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
