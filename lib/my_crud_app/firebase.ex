defmodule MyCrudApp.Firebase do
  @moduledoc """
  A module to handle Firebase authentication.
  """

  alias HTTPoison
  alias Jason

  @api_key "AIzaSyBlqkk3lScottXyfRFalZDGvce77v6ngtw"
  @firebase_url "https://identitytoolkit.googleapis.com/v1/accounts"

  def sign_up(email, password) do
    body = %{
      email: email,
      password: password,
      returnSecureToken: true
    }

    headers = [
      {"Content-Type", "application/json"}
    ]

    case HTTPoison.post("#{@firebase_url}:signUp?key=#{@api_key}", Jason.encode!(body), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} when status_code >= 400 ->
        {:error, Jason.decode!(body)}
      {:error, reason} ->
        {:error, reason}
    end
  end

  def sign_in(email, password) do
    body = %{
      email: email,
      password: password,
      returnSecureToken: true
    }

    headers = [
      {"Content-Type", "application/json"}
    ]

    case HTTPoison.post("#{@firebase_url}:signInWithPassword?key=#{@api_key}", Jason.encode!(body), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} when status_code >= 400 ->
        {:error, Jason.decode!(body)}
      {:error, reason} ->
        {:error, reason}
    end
  end
end
