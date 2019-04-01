defmodule CateringAppWeb.Plugs.CheckUser do
  use CateringAppWeb, :controller

  def init(args), do: args

  def call(conn, _params) do
    user = conn.assigns[:current_user]

    if user do
      conn
    else
      conn
      |> put_flash(:error, "Must login first!")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt
    end
  end
end
