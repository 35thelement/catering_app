defmodule CateringAppWeb.EventController do
  use CateringAppWeb, :controller

  alias CateringApp.Events
  alias CateringApp.Events.Event
  alias CateringApp.Menus
  alias CateringApp.Menus.Menu

  plug CateringAppWeb.Plugs.CheckUser when action in [:new, :create, :update, :delete]

  def index(conn, _params) do
    current_user = conn.assigns[:current_user]
    if current_user.admin do
      events = Events.list_events()
      render(conn, "index.html", events: events)
    else
      events = Events.list_events_by_caterer(current_user.id)
      render(conn, "index.html", events: events)
    end
  end

  def new(conn, _params) do
    changeset = Events.change_event(%Event{})
    caterers = CateringApp.Users.get_caterers()
    render(conn, "new.html", changeset: changeset, caterers: caterers)
  end

  def create(conn, %{"event" => event_params}) do
    case Events.create_event(event_params) do
      {:ok, event} ->
        Menus.create_menu(%{
          event_id: event.id,
          preferences: "preferences",
          dish1: "No Dish Selected",
          dish2: "No Dish Selected",
          dish3: "No Dish Selected",
          dish4: "No Dish Selected",
          dish5: "No Dish Selected"
        })
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.event_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        caterers = CateringApp.Users.get_caterers()
        render(conn, "new.html", changeset: changeset, caterers: caterers)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    render(conn, "show.html", event: event)
  end

  def edit(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    changeset = Events.change_event(event)
    caterers = CateringApp.Users.get_caterers()
    render(conn, "edit.html", event: event, changeset: changeset, caterers: caterers)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Events.get_event!(id)

    case Events.update_event(event, event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event updated successfully.")
        |> redirect(to: Routes.event_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event: event, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    Menus.delete_menu(event.menu)
    IO.inspect(event)
    {:ok, _event} = Events.delete_event(event)

    conn
    |> put_flash(:info, "Event deleted successfully.")
    |> redirect(to: Routes.event_path(conn, :index))
  end
end
