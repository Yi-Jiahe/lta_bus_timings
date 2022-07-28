defmodule LtaBusTimings.BusStops do
  @moduledoc """
  The BusStops context.
  """

  import Ecto.Query, warn: false
  alias LtaBusTimings.Repo

  alias LtaBusTimings.BusStops.BusStop

  @doc """
  Returns the list of bus_stops.

  ## Examples

      iex> list_bus_stops()
      [%BusStop{}, ...]

  """
  def list_bus_stops do
    Repo.all(BusStop)
  end

  @doc """
  Gets a single bus_stop.

  Raises `Ecto.NoResultsError` if the Bus stop does not exist.

  ## Examples

      iex> get_bus_stop!(123)
      %BusStop{}

      iex> get_bus_stop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bus_stop!(id), do: Repo.get!(BusStop, id)

  def get_bus_stop_by_code(bus_stop_code), do: Repo.get_by(BusStop, bus_stop_code: bus_stop_code)

  @doc """
  Creates a bus_stop.

  ## Examples

      iex> create_bus_stop(%{field: value})
      {:ok, %BusStop{}}

      iex> create_bus_stop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bus_stop(attrs \\ %{}) do
    %BusStop{}
    |> BusStop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bus_stop.

  ## Examples

      iex> update_bus_stop(bus_stop, %{field: new_value})
      {:ok, %BusStop{}}

      iex> update_bus_stop(bus_stop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bus_stop(%BusStop{} = bus_stop, attrs) do
    bus_stop
    |> BusStop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bus_stop.

  ## Examples

      iex> delete_bus_stop(bus_stop)
      {:ok, %BusStop{}}

      iex> delete_bus_stop(bus_stop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bus_stop(%BusStop{} = bus_stop) do
    Repo.delete(bus_stop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bus_stop changes.

  ## Examples

      iex> change_bus_stop(bus_stop)
      %Ecto.Changeset{data: %BusStop{}}

  """
  def change_bus_stop(%BusStop{} = bus_stop, attrs \\ %{}) do
    BusStop.changeset(bus_stop, attrs)
  end

  defmodule Recursion do
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

    def insert_stops(_bus_stops, _offset, 0) do
      :ok
    end
  end

  def refresh_bus_stops() do
    from(s in BusStop) |> Repo.delete_all()
    %{"value" => bus_stops} = LtaBusTimings.LTADataMallWrapper.get_bus_stops(0)
    Recursion.insert_stops(bus_stops, 0, Enum.count(bus_stops))
  end
end
