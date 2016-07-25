defmodule Superfundme.Repo.Migrations.CreateSite do
  use Ecto.Migration

  def change do
    create table(:sites) do
      add :name, :string
      add :latitude, :float
      add :longitude, :float

      timestamps
    end

  end
end
