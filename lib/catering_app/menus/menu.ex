defmodule CateringApp.Menus.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menus" do
    field :dish1, :integer
    field :dish2, :integer
    field :dish3, :integer
    field :dish4, :integer
    field :dish5, :integer
    belongs_to :event, CateringApp.Events.Event


    timestamps()
  end

  @doc false
  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:dish1, :dish2, :dish3, :dish4, :dish5])
    |> validate_required([:dish1, :dish2, :dish3, :dish4, :dish5])
  end
end
