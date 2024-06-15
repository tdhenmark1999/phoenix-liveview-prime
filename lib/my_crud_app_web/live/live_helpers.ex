defmodule MyCrudAppWeb.LiveHelpers do
  import Phoenix.LiveView

  defp hide_modal(js \\ nil) do
    js = """
    document.querySelector('#modal').style.display = 'none';
    document.querySelector('#modal-content').style.display = 'none';
    """
    Phoenix.LiveView.JS.execute(js)
  end

  defp show_modal(js \\ nil) do
    js = """
    document.querySelector('#modal').style.display = 'block';
    document.querySelector('#modal-content').style.display = 'block';
    """
    Phoenix.LiveView.JS.execute(js)
  end
end
