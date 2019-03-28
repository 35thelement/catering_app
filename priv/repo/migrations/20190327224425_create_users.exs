defmodule CateringApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password_hash, :string
      add :is_caterer, :boolean, default: false, null: false
      add :bio, :text

      timestamps()
    end

  end
end
