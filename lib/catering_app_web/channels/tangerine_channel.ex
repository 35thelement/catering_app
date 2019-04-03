defmodule CateringAppWeb.TangerineChannel do
  use CateringAppWeb, :channel

  alias CateringAppWeb.UserController

  def join("tangerine", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_user", %{"user" => current_user}, socket) do
    IO.inspect("in handle new user")
    IO.inspect(current_user)
    #Routes.user_path(@conn, :index)
  end

  def broadcast_update() do
    IO.inspect("payload")
    CateringAppWeb.Endpoint.broadcast("tangerine", "change", %{})
  end
end
