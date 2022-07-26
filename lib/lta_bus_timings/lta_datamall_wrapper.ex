defmodule LtaBusTimings.LTADataMallWrapper do

def get_bus_arrivals(bus_stop_code) do
    token = Application.fetch_env!(:lta_bus_timings, :api_account_key)
    url = "http://datamall2.mytransport.sg/ltaodataservice/BusArrivalv2?BusStopCode=#{bus_stop_code}"
    headers = ["AccountKey": token, "Accept": "Application/json"]
    {:ok, response} = HTTPoison.get(url, headers)

    {:ok, body} = Jason.decode(response.body)
    body
end

end
