defmodule LtaBusTimingsWeb.FavouriteController do
  use LtaBusTimingsWeb, :controller

  def create(conn, %{"stop_id" => stop_id, "service" => service}) do
    IO.puts("#{stop_id}: #{service}")

    favourites =
      case conn.req_cookies["favourites"] do
        nil -> %{}
        favourites -> Jason.decode!(favourites)
      end

    IO.inspect(favourites)

    favourites =
      Map.update(favourites, stop_id, [service], fn services ->
        if Enum.member?(services, service) do
          services
        else
          [service | services]
        end
      end)

    conn = put_resp_cookie(conn, "favourites", Jason.encode!(favourites), max_age: 3_156_000_000)

    redirect(conn, to: Routes.page_path(conn, :index, %{"stop_id" => stop_id}))
  end
end
