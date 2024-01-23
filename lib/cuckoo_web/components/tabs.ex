defmodule CuckooWeb.Components.Tabs do
  use CuckooWeb, :html

  def tabs(assigns) do
    ~H"""
    <.link patch={tabi.path} :for={tabi <- @tab} >
      <%= render_slot(tabi) %>
    </.link>

    <div class=" my-4 border-t-2 border  border-zinc-600" />
    <pre> <%= inspect(assigns, pretty: true)%> </pre>
    """
  end
end
