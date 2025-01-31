defmodule MyCrudApp.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyCrudApp.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        password: "some password",
        email: "some email"
      })
      |> MyCrudApp.Accounts.create_user()

    user
  end
end
