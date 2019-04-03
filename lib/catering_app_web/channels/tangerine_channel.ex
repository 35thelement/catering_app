defmodule CateringAppWeb.TangerineChannel do
  use CateringAppWeb, :channel

  def join("tangerine", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_user", attrs, socket) do
    
  end
end
