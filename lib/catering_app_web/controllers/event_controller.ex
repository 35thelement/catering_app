defmodule CateringAppWeb.EventController do
  use CateringAppWeb, :controller

  alias CateringApp.Events
  alias CateringApp.Events.Event
  alias CateringApp.Menus
  alias CateringApp.Menus.Menu

  def index(conn, _params) do
    events = Events.list_events()
    render(conn, "index.html", events: events)
  end

  def new(conn, _params) do
    changeset = Events.change_event(%Event{})
    caterers = CateringApp.Users.get_caterers()
    IO.inspect(caterers)
    render(conn, "new.html", changeset: changeset, caterers: caterers)
  end

  def create(conn, %{"event" => event_params}) do
    case Events.create_event(event_params) do
      {:ok, event} ->
        Menus.create_menu(%{event_id: event.id, dish1: "-1", dish2: "-1", dish3: "-1", dish4: "-1", dish5: "-1"})
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
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
    IO.inspect(caterers)
    render(conn, "edit.html", event: event, changeset: changeset, caterers: caterers)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Events.get_event!(id)

    case Events.update_event(event, event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event updated successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

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
