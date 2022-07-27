defmodule LtaBusTimings.BusStopsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LtaBusTimings.BusStops` context.
  """

  @doc """
  Generate a bus_stop.
  """
  def bus_stop_fixture(attrs \\ %{}) do
    {:ok, bus_stop} =
      attrs
      |> Enum.into(%{
        bus_stop_code: "some bus_stop_code",
        description: "some description",
        latitude: 120.5,
        longitude: 120.5,
        road_name: "some road_name"
      })
      |> LtaBusTimings.BusStops.create_bus_stop()

    bus_stop
  end
end
