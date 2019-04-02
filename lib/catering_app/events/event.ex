defmodule CateringApp.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :approved, :boolean, default: false
    field :day, :date
    field :feedback, :string
    field :name, :string
    field :preferences, :string
    belongs_to :client, CateringApp.Users.User
    belongs_to :caterer, CateringApp.Users.User
    has_one :menu, CateringApp.Menus.Menu

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :approved, :preferences, :feedback, :day, :client_id, :caterer_id])
    |> validate_required([:name, :approved, :preferences, :day, :client_id, :caterer_id])
    |> validate_format(:preferences, ~r/^([a-zA-Z]+,?)*$/)
  end
end
