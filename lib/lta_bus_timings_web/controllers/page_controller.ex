defmodule LtaBusTimingsWeb.PageController do
  use LtaBusTimingsWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:api_account_key, Application.fetch_env!(:lta_bus_timings, :api_account_key))
    |> render("index.html")
  end
end
