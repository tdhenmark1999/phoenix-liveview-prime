defmodule MyCrudAppWeb.Plugs.Authentication do
  import Plug.Conn
  import Phoenix.Controller

  alias MyCrudAppWeb.Router.Helpers, as: Routes

  def init(default), do: default

  def call(conn, _opts) do
    if get_session(conn, :user_email) do
      conn
    else
      conn
      |> redirect(to: Routes.live_path(conn, MyCrudAppWeb.UserLive.Login))
      |> halt()
    end
  end
end
