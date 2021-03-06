defmodule CateringApp.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias CateringApp.Repo

  alias CateringApp.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Returns the list of caterers.
  """
  def list_caterers do
    Repo.all from u in User,
    where: u.is_caterer
  end

  @doc """
  Returns the list of non-admin clients.
  """
  def list_clients do
    Repo.all from u in User,
    where: not u.is_caterer and not u.admin
  end



  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Gets a single user. Raises no error.
  """
  def get_user(id) do
    Repo.one from u in User,
    where: u.id == ^id,
    preload: [events_client: :caterer, events_caterer: :client]
  end

  @doc """
  Get all users that are caterers.
  """
  def get_caterers() do
    Repo.all from u in User,
    where: u.is_caterer
  end

  @doc """
  Gets a user that matches a username.
  """
  def get_by_username(username) do
    Repo.get_by(User, username: username)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
