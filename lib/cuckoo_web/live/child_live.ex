defmodule CuckooWeb.ParentLive.Child do
  use CuckooWeb, :live_view

  def render(assigns) do
    ~H"""
    CHILD LIVEVIEW
    WELCOME HERE.
    """
  end
end
