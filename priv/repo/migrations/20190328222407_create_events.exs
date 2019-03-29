defmodule CateringApp.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :approved, :boolean, default: false, null: false
      add :caterer_turn, :boolean, default: false, null: false
      add :preferences, :string
      add :feedback, :string
      add :day, :date
      add :client_id, references(:users, on_delete: :delete_all), null: false
      add :caterer_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:events, [:client_id])
    create index(:events, [:caterer_id])
  end
end
