defmodule Cuckoo.Proxy do
  use MainProxy.Proxy

  @impl MainProxy.Proxy
  def backends do
    [
      #   %{
      #     domain: "my-cool-app.com",
      #     phoenix_endpoint: MyAppWeb.Endpoint
      #   },
      #   %{
      #     domain: "members.my-cool-app.com",
      #     phoenix_endpoint: MyAppMembersWeb.Endpoint
      #   },
      %{
        verb: ~r/get/i,
        path: ~r{^/main-proxy-plug-test$},
        plug: MainProxy.Plug.Test,
        opts: [1, 2, 3]
      },
      %{
        domain: "mathocrat.test",
        phoenix_endpoint: CuckooWeb.Endpoint
      }
    ]
  end
end
