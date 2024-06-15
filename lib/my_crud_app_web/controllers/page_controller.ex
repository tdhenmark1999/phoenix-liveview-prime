defmodule MyCrudAppWeb.PageController do
  use MyCrudAppWeb, :controller

  def index(conn, _params) do
    conn
    |> redirect(to: "/home")
    |> halt()
  end

  def not_found(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(MyCrudAppWeb.ErrorView, "404.html")
  end
end
