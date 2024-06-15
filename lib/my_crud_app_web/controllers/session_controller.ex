defmodule MyCrudAppWeb.SessionController do
  use MyCrudAppWeb, :controller

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    # Handle the authentication logic, assuming it's successful:
    conn
    |> put_session(:user_email, email)
    |> redirect(to: "/home")
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/login")
  end
end
