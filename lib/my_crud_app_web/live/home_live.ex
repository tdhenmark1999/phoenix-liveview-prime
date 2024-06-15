defmodule MyCrudAppWeb.HomeLive do
  use MyCrudAppWeb, :live_view

  def mount(_params, %{"user_email" => _user_email}, socket) do
    {:ok, socket}
  end

  def mount(_params, _session, socket) do
    {:ok, redirect(socket, to: "/login")}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Welcome to the Home Page!</h1>
      <form method="post" action={Routes.session_path(@socket, :delete)}>
        <input type="hidden" name="_method" value="delete">
        <input type="hidden" name="_csrf_token" value={csrf_token()}>
        <button type="submit">Logout</button>
      </form>
    </div>
    """
  end

  defp csrf_token do
    Plug.CSRFProtection.get_csrf_token()
  end
end
