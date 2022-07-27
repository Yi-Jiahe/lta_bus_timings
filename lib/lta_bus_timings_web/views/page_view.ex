defmodule LtaBusTimingsWeb.PageView do
  use LtaBusTimingsWeb, :view

  def seconds_till_arrival(arrival_time) do
    {:ok, datetime_arrival, _} = DateTime.from_iso8601(arrival_time)
    {:ok, datetime_now} = DateTime.now("Etc/UTC")
    seconds = DateTime.diff(datetime_arrival, datetime_now, :second)
    "#{div(seconds, 60)}m#{rem(seconds, 60)}s"
  end

  def favourited_service?(favourited_services, service) do
    Enum.member?(favourited_services, service)
  end

  def bus_stop_description(bus_stop_code) do
    case IO.inspect(LtaBusTimings.BusStops.get_bus_stop_by_code(bus_stop_code)) do
      nil -> ""
      %{description: description} -> description
    end
  end
end
