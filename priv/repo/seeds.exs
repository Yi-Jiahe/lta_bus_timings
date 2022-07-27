# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LtaBusTimings.Repo.insert!(%LtaBusTimings.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LtaBusTimings.Repo
alias LtaBusTimings.BusStops.BusStop
import Ecto.Query

from(s in BusStop) |> Repo.delete_all()

defmodule Seed do
  def insert_stops(bus_stops, offset, count) when count > 0 do
    for %{
          "BusStopCode" => bus_stop_code,
          "RoadName" => road_name,
          "Description" => description,
          "Latitude" => latitude,
          "Longitude" => longitude
        } <- bus_stops do
      Repo.insert!(%BusStop{
        bus_stop_code: bus_stop_code,
        road_name: road_name,
        description: description,
        latitude: latitude,
        longitude: longitude
      })
    end

    %{"value" => bus_stops} = LtaBusTimings.LTADataMallWrapper.get_bus_stops(offset)
    count = Enum.count(bus_stops)
    insert_stops(bus_stops, offset + count, count)
  end

  def insert_stops(bus_stops, offset, 0) do
    :ok
  end
end

%{"value" => bus_stops} = LtaBusTimings.LTADataMallWrapper.get_bus_stops(0)
Seed.insert_stops(bus_stops, 0, Enum.count(bus_stops))

# Verify number of stops added
# Should be ~5000 stops
n_bus_stops = Repo.one(from s in BusStop, select: count(s.id))
IO.puts(n_bus_stops)
