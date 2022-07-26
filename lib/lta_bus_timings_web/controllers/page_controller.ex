defmodule LtaBusTimingsWeb.PageController do
  use LtaBusTimingsWeb, :controller

  def index(conn, _params) do
    token = Application.fetch_env!(:lta_bus_timings, :api_account_key)
    url = "http://datamall2.mytransport.sg/ltaodataservice/BusArrivalv2?BusStopCode=83139"
    headers = ["AccountKey": token, "Accept": "Application/json"]
    {:ok, response} = HTTPoison.get(url, headers)

    %{"Services" => services} = Jason.decode!(response.body)

    conn
    |> assign(:services, services)
    |> render("index.html")
  end
end
