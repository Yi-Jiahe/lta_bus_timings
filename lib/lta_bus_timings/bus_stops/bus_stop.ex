defmodule LtaBusTimings.BusStops.BusStop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bus_stops" do
    field :bus_stop_code, :string
    field :description, :string
    field :latitude, :float
    field :longitude, :float
    field :road_name, :string

    timestamps()
  end

  @doc false
  def changeset(bus_stop, attrs) do
    bus_stop
    |> cast(attrs, [:bus_stop_code, :road_name, :description, :latitude, :longitude])
    |> validate_required([:bus_stop_code, :road_name, :description, :latitude, :longitude])
  end
end
