defmodule LtaBusTimingsWeb.PageController do
  use LtaBusTimingsWeb, :controller

  def index(conn, _params) do
    %{"Services" => services} = LtaBusTimings.LTADataMallWrapper.get_bus_arrivals(83139)
    
    conn
    |> assign(:services, services)
    |> render("index.html")
  end
end
