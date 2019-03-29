defmodule CateringApp.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :bio, :string
    field :is_caterer, :boolean, default: false
    field :password_hash, :string
    field :admin, :boolean, default: false
    field :username, :string
    has_many :events_client, CateringApp.Events.Event, foreign_key: :client_id, references: :id
    has_many :events_caterer, CateringApp.Events.Event, foreign_key: :caterer_id, references: :id

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :password_confirmation, :admin, :is_caterer, :bio])
    |> validate_confirmation(:password)
    |> validate_pass(:password)
    |> hash_pass()
    |> validate_required([:username, :password_hash, :admin, :is_caterer, :bio])
  end

  def get_auth_user(username, password) do
    user = CateringApp.Users.get_by_username(username)
    case Comeonin.Argon2.check_pass(user, password) do
      {:ok, user} -> user
      _else -> nil
    end
  end

  def validate_pass(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_pass?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end

  def valid_pass?(password) when byte_size(password) > 6 do
    {:ok, password}
  end

  def valid_pass?(_), do: {:error, "Passwords must be more than 6 characters long."}

  def hash_pass(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end

  def hash_pass(changeset), do: changeset
end
