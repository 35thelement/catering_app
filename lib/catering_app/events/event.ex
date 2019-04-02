defmodule CateringApp.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :approved, :boolean, default: false
    field :day, :date
    field :name, :string
    belongs_to :client, CateringApp.Users.User
    belongs_to :caterer, CateringApp.Users.User
    has_one :menu, CateringApp.Menus.Menu

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :approved, :day, :client_id, :caterer_id])
    |> validate_required([:name, :approved, :day, :client_id, :caterer_id])
  end
end
