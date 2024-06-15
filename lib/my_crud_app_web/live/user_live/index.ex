defmodule MyCrudAppWeb.UserLive.Index do
  use MyCrudAppWeb, :live_view
  import MyCrudAppWeb.ModalHelper

  alias MyCrudApp.Accounts
  alias MyCrudApp.Accounts.User

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :users, list_users())}
  end

  def render(assigns) do
    ~H"""
    <h1>Listing Users</h1>
    <%= for user <- @users do %>
      <p><%= user.email %></p>
    <% end %>
    <%= modal(assigns) %>
    """
  end

  defp list_users do
    Accounts.list_users()
  end
end
