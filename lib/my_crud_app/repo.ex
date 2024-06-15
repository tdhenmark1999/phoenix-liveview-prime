defmodule MyCrudApp.Repo do
  use Ecto.Repo,
    otp_app: :my_crud_app,
    adapter: Ecto.Adapters.Postgres
end
