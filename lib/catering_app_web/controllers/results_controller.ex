defmodule CateringAppWeb.ResultsController do
  use CateringAppWeb, :controller

  alias CateringApp.Menus
  alias CateringApp.Menus.Menu

  def index(conn, %{"prefs" => prefs}) do
    render(conn, "index.html", prefs: prefs)
  end
end
