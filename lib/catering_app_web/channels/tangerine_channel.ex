defmodule CateringAppWeb.TangerineChannel do
  use CateringAppWeb, :channel

  def join("tangerine:all", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  defp authorized?(_payload) do
    true
  end
end
