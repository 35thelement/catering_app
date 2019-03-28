defmodule CateringAppWeb.SessionsController do
  use CateringAppWeb, :controller

  def create(conn, %{"username" => username, "password" => password}) do
    user = CateringApp.Users.User.get_auth_user(username, password)
    if user do
      IO.inspect("Retrieved User")
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back, #{user.username}")
      |> redirect(to: Routes.page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Login failed.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
