defmodule LtaBusTimingsWeb.PageController do
  use LtaBusTimingsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
