defmodule CateringAppWeb.MenuChannel do
  use CateringAppWeb, :channel

  def join(channelName, _payload, socket) do
    if authorized?(_payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  defp authorized?(_payload) do
    true
  end
end
