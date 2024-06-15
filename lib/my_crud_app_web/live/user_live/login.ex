defmodule MyCrudAppWeb.UserLive.Login do
  use MyCrudAppWeb, :live_view

  alias MyCrudApp.Firebase

  def mount(_params, _session, socket) do
    {:ok, assign(socket, error: nil)}
  end

  def handle_event("login", %{"user" => user_params}, socket) do
    %{"email" => email, "password" => password} = user_params

    case Firebase.sign_in(email, password) do
      {:ok, _response} ->
        {:noreply, push_redirect(socket, to: Routes.session_path(socket, :create, %{user: user_params}))}
      {:error, %{"error" => %{"message" => message}}} ->
        {:noreply, assign(socket, :error, message)}
      {:error, reason} ->
        {:noreply, assign(socket, :error, inspect(reason))}
    end
  end
end
