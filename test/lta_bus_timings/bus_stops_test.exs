defmodule LtaBusTimings.BusStopsTest do
  use LtaBusTimings.DataCase

  alias LtaBusTimings.BusStops

  describe "bus_stops" do
    alias LtaBusTimings.BusStops.BusStop

    import LtaBusTimings.BusStopsFixtures

    @invalid_attrs %{bus_stop_code: nil, description: nil, latitude: nil, longitude: nil, road_name: nil}

    test "list_bus_stops/0 returns all bus_stops" do
      bus_stop = bus_stop_fixture()
      assert BusStops.list_bus_stops() == [bus_stop]
    end

    test "get_bus_stop!/1 returns the bus_stop with given id" do
      bus_stop = bus_stop_fixture()
      assert BusStops.get_bus_stop!(bus_stop.id) == bus_stop
    end

    test "create_bus_stop/1 with valid data creates a bus_stop" do
      valid_attrs = %{bus_stop_code: "some bus_stop_code", description: "some description", latitude: 120.5, longitude: 120.5, road_name: "some road_name"}

      assert {:ok, %BusStop{} = bus_stop} = BusStops.create_bus_stop(valid_attrs)
      assert bus_stop.bus_stop_code == "some bus_stop_code"
      assert bus_stop.description == "some description"
      assert bus_stop.latitude == 120.5
      assert bus_stop.longitude == 120.5
      assert bus_stop.road_name == "some road_name"
    end

    test "create_bus_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BusStops.create_bus_stop(@invalid_attrs)
    end

    test "update_bus_stop/2 with valid data updates the bus_stop" do
      bus_stop = bus_stop_fixture()
      update_attrs = %{bus_stop_code: "some updated bus_stop_code", description: "some updated description", latitude: 456.7, longitude: 456.7, road_name: "some updated road_name"}

      assert {:ok, %BusStop{} = bus_stop} = BusStops.update_bus_stop(bus_stop, update_attrs)
      assert bus_stop.bus_stop_code == "some updated bus_stop_code"
      assert bus_stop.description == "some updated description"
      assert bus_stop.latitude == 456.7
      assert bus_stop.longitude == 456.7
      assert bus_stop.road_name == "some updated road_name"
    end

    test "update_bus_stop/2 with invalid data returns error changeset" do
      bus_stop = bus_stop_fixture()
      assert {:error, %Ecto.Changeset{}} = BusStops.update_bus_stop(bus_stop, @invalid_attrs)
      assert bus_stop == BusStops.get_bus_stop!(bus_stop.id)
    end

    test "delete_bus_stop/1 deletes the bus_stop" do
      bus_stop = bus_stop_fixture()
      assert {:ok, %BusStop{}} = BusStops.delete_bus_stop(bus_stop)
      assert_raise Ecto.NoResultsError, fn -> BusStops.get_bus_stop!(bus_stop.id) end
    end

    test "change_bus_stop/1 returns a bus_stop changeset" do
      bus_stop = bus_stop_fixture()
      assert %Ecto.Changeset{} = BusStops.change_bus_stop(bus_stop)
    end
  end
end
