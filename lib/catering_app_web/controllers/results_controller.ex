defmodule CateringAppWeb.ResultsController do
  use CateringAppWeb, :controller
  def index(conn, %{"prefs" => prefs}) do
    IO.inspect("API Request sent!")
    http_prefs = String.replace(prefs, " ", "%20")
    results = HTTPoison.get("https://www.food2fork.com/api/search?key=d6203ad14cc7132eb562d765899b7d1d&q=" <> http_prefs)
    decResults = Poison.decode(elem(results, 1).body)
    listResults = decResults |> elem(1) |> Map.fetch("recipes") |> elem(1)
    render(conn, "index.html", prefs: prefs, results: listResults)
  end
end
