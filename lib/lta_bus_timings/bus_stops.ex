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
end
