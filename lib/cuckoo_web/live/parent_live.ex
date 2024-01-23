defmodule CuckooWeb.ParentLive do
  alias CuckooWeb.ParentLive.Child
  alias CuckooWeb.Components.Tabs
  use CuckooWeb, :live_view

  def render(assigns) do
    ~H"""
    I am parent liveview.
    Rendering the child liveview inside a live component
    <div class="bg-red-100 px-4 py-4 rounded-lg">
      <Tabs.tabs>
        <:tab path={~p"/one/child"} >
          First tab.
        </:tab>
        <:tab path={~p"/one/child"}>
          second tab.

        </:tab>
      </Tabs.tabs>
    </div>
    """
  end
end
