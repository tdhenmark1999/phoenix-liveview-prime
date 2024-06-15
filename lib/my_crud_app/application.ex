defmodule MyCrudApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MyCrudApp.Repo,
      # Start the Telemetry supervisor
      MyCrudAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MyCrudApp.PubSub},
      # Start the Endpoint (http/https)
      MyCrudAppWeb.Endpoint
      # Start a worker by calling: MyCrudApp.Worker.start_link(arg)
      # {MyCrudApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyCrudApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyCrudAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
