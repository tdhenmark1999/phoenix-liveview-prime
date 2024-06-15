defmodule MyCrudAppWeb.UserLive.New do
  use MyCrudAppWeb, :live_view

  alias MyCrudApp.Firebase

  def mount(_params, _session, socket) do
    {:ok, assign(socket, changeset: %Ecto.Changeset{}, error: nil)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    %{"email" => email, "password" => password} = user_params

    case Firebase.sign_up(email, password) do
      {:ok, _response} ->
        {:noreply, redirect(socket, to: "/login")}
      {:error, %{"error" => %{"message" => message}}} ->
        {:noreply, assign(socket, :error, message)}
      {:error, reason} ->
        {:noreply, assign(socket, :error, inspect(reason))}
    end
  end
end
