defmodule CateringAppWeb.Plugs.CheckAdmin do
  use CateringAppWeb, :controller

  def init(args), do: args

  def call(conn, _params) do
    user = conn.assigns[:current_user]

    if user do
      if user.admin or user.id == String.to_integer(conn.params["id"]) do
        conn
      end
    else
      conn
      |> put_flash(:error, "Permission denied!")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt
    end
  end
end
