defmodule CateringApp.Menus.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menus" do
    field :dish1, :string
    field :dish2, :string
    field :dish3, :string
    field :dish4, :string
    field :dish5, :string
    field :feedback, :string
    field :preferences, :string
    belongs_to :event, CateringApp.Events.Event


    timestamps()
  end

  @doc false
  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:event_id, :preferences, :feedback, :dish1, :dish2, :dish3, :dish4, :dish5])
    |> validate_required([:event_id, :preferences, :dish1, :dish2, :dish3, :dish4, :dish5])
    |> validate_format(:preferences, ~r/^([a-zA-Z]+,?)*$/)
  end
end
