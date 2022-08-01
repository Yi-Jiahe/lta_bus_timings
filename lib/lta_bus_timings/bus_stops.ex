defmodule LtaBusTimings.BusStops do
  defmodule Recursion do
    def insert_stops(bus_stops, new_bus_stops, offset, count) when count > 0 do
      bus_stops = Enum.reduce(new_bus_stops, bus_stops, fn %{
                                                 "BusStopCode" => bus_stop_code,
                                                 "RoadName" => road_name,
                                                 "Description" => description,
                                                 "Latitude" => latitude,
                                                 "Longitude" => longitude
                                               },
                                               acc ->
        Map.put_new(acc, bus_stop_code, %{
          "road_name" => road_name,
          "description" => description,
          "latitude" => latitude,
          "longitude" => longitude
        })
      end)

      %{"value" => new_bus_stops} = LtaBusTimings.LTADataMallWrapper.get_bus_stops(offset)
      count = Enum.count(new_bus_stops)
      insert_stops(bus_stops, new_bus_stops, offset + count, count)
    end

    def insert_stops(bus_stops, _new_bus_stops, _offset, 0) do
      bus_stops
    end
  end

  def refresh_bus_stops() do
    %{"value" => new_bus_stops} = LtaBusTimings.LTADataMallWrapper.get_bus_stops(0)
    bus_stops = Recursion.insert_stops(%{}, new_bus_stops, 0, Enum.count(new_bus_stops))
    IO.inspect(Path.join(:code.priv_dir(:lta_bus_timings), "data/bus_stops.json"))
    File.write!(Path.join(:code.priv_dir(:lta_bus_timings), "data/bus_stops.json"), Jason.encode!(bus_stops))
  end

  def get_bus_stops do
    Jason.decode!(File.read!(Path.join(:code.priv_dir(:lta_bus_timings), "data/bus_stops.json")))
  end
end
