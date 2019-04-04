defmodule CateringAppWeb.TangerineChannel do
  use CateringAppWeb, :channel

  def join("tangerine", _payload, socket) do
    if authorized?(_payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end

  end

  def handle_in("new_user", %{"user" => current_user}, socket) do
    IO.inspect("in handle new user")
    IO.inspect(current_user)
    #Routes.user_path(@conn, :index)
  end

  defp authorized?(_payload) do
    true
  end
end
