defmodule CateringApp.Repo.Migrations.CreateMenus do
  use Ecto.Migration

  def change do
    create table(:menus) do
      add :dish1, :integer
      add :dish2, :integer
      add :dish3, :integer
      add :dish4, :integer
      add :dish5, :integer
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:menus, [:event_id])
  end
end
