defmodule MyCrudAppWeb.ModalHelper do
  import Phoenix.LiveView.Helpers
  import Phoenix.View

  def modal(assigns) do
    ~H"""
    <div id="modal">
      <div id="modal-content">
        <%= render(assigns.view_module, assigns.view_template, assigns) %>
      </div>
    </div>
    """
  end
end
