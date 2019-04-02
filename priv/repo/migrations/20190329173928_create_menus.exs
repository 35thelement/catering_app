defmodule CateringApp.Repo.Migrations.CreateMenus do
  use Ecto.Migration

  def change do
    create table(:menus) do
      add :dish1, :string
      add :dish2, :string
      add :dish3, :string
      add :dish4, :string
      add :dish5, :string
      add :preferences, :string
      add :feedback, :string
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:menus, [:event_id])
  end
end
