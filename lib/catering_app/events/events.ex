defmodule CateringApp.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias CateringApp.Repo

  alias CateringApp.Events.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
    |> Repo.preload(:menu)
  end


    def list_events_or(user_id) do
    if user_id do
      query = from e in Event,
               where: e.client_id == ^user_id or e.caterer_id == ^user_id,
               select: e
      Repo.all(query)
    else
      []
    end
  end

  def list_events_by_user(client_id, caterer_id) do
  if client_id do
    query = from e in Event,
             where: e.client_id == ^client_id and e.caterer_id == ^caterer_id,
             select: e
    Repo.all(query)
  else
    []
  end
end

def list_events_by_caterer(caterer_id) do
if caterer_id do
  query = from e in Event,
           where: e.caterer_id == ^caterer_id or e.client_id == ^caterer_id,
           preload: :menu,
           select: e
  Repo.all(query)
else
  []
end
end


def list_events_by_client(client_id) do
if client_id do
  query = from e in Event,
           where: e.client_id == ^client_id,
           preload: :menu,
           select: e
  Repo.all(query)
else
  []
end
end

def count_events(caterer_id) do
if caterer_id do
  query = from e in Event,
           where: e.caterer_id == ^caterer_id,
           preload: :menu,
           select: e
  Repo.all(query)
  length(Repo.all(query))
else
  []
end
end



  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id) do
     Repo.get!(Event, id)
     |> Repo.preload(:menu)
   end

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{source: %Event{}}

  """
  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end
end
