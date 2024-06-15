defmodule MyCrudAppWeb.Router do
  use MyCrudAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authenticated do
    plug :ensure_authenticated
  end

  pipeline :redirect_if_authenticated do
    plug :redirect_authenticated_user
  end

  scope "/", MyCrudAppWeb do
    pipe_through [:browser, :redirect_if_authenticated]

    live "/sign_up", UserLive.New
    live "/login", UserLive.Login
    post "/sessions", SessionController, :create
  end

  scope "/", MyCrudAppWeb do
    pipe_through [:browser, :authenticated]

    live "/home", HomeLive
    delete "/logout", SessionController, :delete
  end

  # Catch-all route for 404 errors
  scope "/", MyCrudAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/*path", PageController, :not_found
  end

  defp ensure_authenticated(conn, _opts) do
    if get_session(conn, :user_email) do
      conn
    else
      conn
      |> Phoenix.Controller.redirect(to: "/login")
      |> halt()
    end
  end

  defp redirect_authenticated_user(conn, _opts) do
    if get_session(conn, :user_email) do
      conn
      |> Phoenix.Controller.redirect(to: "/home")
      |> halt()
    else
      conn
    end
  end
end
