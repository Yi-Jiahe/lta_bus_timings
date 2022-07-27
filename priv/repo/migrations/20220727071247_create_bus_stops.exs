defmodule LtaBusTimings.Repo.Migrations.CreateBusStops do
  use Ecto.Migration

  def change do
    create table(:bus_stops) do
      add :bus_stop_code, :string
      add :road_name, :string
      add :description, :string
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end
  end
end
