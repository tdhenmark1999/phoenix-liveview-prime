defmodule MyCrudAppWeb.UserLive.Show do
  use MyCrudAppWeb, :live_view
  import MyCrudAppWeb.ModalHelper

  alias MyCrudApp.Accounts

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :user, get_user(socket.assigns[:id]))}
  end

  def render(assigns) do
    ~H"""
    <h1>Show User</h1>
    <p><%= @user.email %></p>
    <%= modal(assigns) %>
    """
  end

  defp get_user(id) do
    Accounts.get_user!(id)
  end
end
