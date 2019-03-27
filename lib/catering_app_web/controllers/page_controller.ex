defmodule CateringAppWeb.PageController do
  use CateringAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
