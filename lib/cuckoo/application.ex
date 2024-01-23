defmodule Cuckoo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CuckooWeb.Telemetry,
      Cuckoo.Repo,
      {DNSCluster, query: Application.get_env(:cuckoo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Cuckoo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Cuckoo.Finch},
      CuckooWeb.Endpoint,
      # enable multiple backends
      {Cuckoo.Proxy, [log_requests: false]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cuckoo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CuckooWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
