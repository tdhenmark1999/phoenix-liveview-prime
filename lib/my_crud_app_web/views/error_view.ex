defmodule MyCrudAppWeb.ErrorView do
  use MyCrudAppWeb, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  # Optional: Define other error renders if needed
  def render("500.html", _assigns) do
    "Internal server error"
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render("500.html", assigns)
  end
end
