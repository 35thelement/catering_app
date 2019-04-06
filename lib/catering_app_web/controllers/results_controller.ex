defmodule CateringAppWeb.ResultsController do
  use CateringAppWeb, :controller
  def index(conn, %{"prefs" => prefs}) do
    IO.inspect("API Request sent!")
    http_prefs = String.replace(prefs, " ", "%20")
    api_key = "3c67ca2f9ed8271d62d8759bb3356721"
    results = HTTPoison.get("https://www.food2fork.com/api/search?key=" <> api_key <> "&q=" <> http_prefs)
    decResults = Poison.decode(elem(results, 1).body)
    listResults = decResults |> elem(1) |> Map.fetch("recipes") |> elem(1)
    render(conn, "index.html", prefs: prefs, results: listResults)
  end
end
