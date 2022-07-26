defmodule LtaBusTimingsWeb.FavouriteController do
  use LtaBusTimingsWeb, :controller

  def create(conn, %{"stop_id" => stop_id, "service" => service}) do
    IO.puts("#{stop_id}: #{service}")
    redirect(conn, to: Routes.page_path(conn, :index, %{"stop_id" => stop_id}))
  end
end
