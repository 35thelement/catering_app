defmodule CateringAppWeb.ResultsController do
  use CateringAppWeb, :controller

  alias CateringApp.Menus
  alias CateringApp.Menus.Menu

  def index(conn, %{"prefs" => prefs}) do
    http_prefs = String.replace(prefs, " ", "%20")
    results = HTTPoison.get("https://www.food2fork.com/api/search?key=d6203ad14cc7132eb562d765899b7d1d&q=" <> http_prefs)
    IO.inspect(results)
    render(conn, "index.html", prefs: prefs)
  end
end
