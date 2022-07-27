defmodule LtaBusTimingsWeb.PageController do
  use LtaBusTimingsWeb, :controller

  def index(conn, %{"stop_id" => stop_id}) do
    services = case LtaBusTimings.LTADataMallWrapper.get_bus_arrivals(stop_id) do
      %{"Services" => services} ->
        services
      _ ->
        []
    end

    favourites = LtaBusTimingsWeb.Favourites.get_favourites(conn)
    favourited_services = case favourites[stop_id] do
      nil ->
        []
      favourited_services ->
        favourited_services
    end

    conn
    |> assign(:services, services)
    |> assign(:favourited_services, favourited_services)
    |> render("index.html")
  end

  def index(conn, _params) do
    conn
    |> assign(:services, [])
    |> assign(:favourited_services, [])
    |> render("index.html")
  end
end
