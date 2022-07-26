defmodule LtaBusTimingsWeb.PageController do
  use LtaBusTimingsWeb, :controller

  def index(conn, %{"stop_id" => stop_id}) do
    services = case LtaBusTimings.LTADataMallWrapper.get_bus_arrivals(stop_id) do
      %{"Services" => services} ->
        services
      _ ->
        []
    end

    conn
    |> assign(:services, services)
    |> render("index.html")
  end

  def index(conn, _params) do
    conn
    |> assign(:services, [])
    |> render("index.html")
  end
end
