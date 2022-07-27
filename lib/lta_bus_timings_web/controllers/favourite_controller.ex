defmodule LtaBusTimingsWeb.FavouriteController do
  use LtaBusTimingsWeb, :controller

  def create(conn, %{"stop_id" => stop_id, "service" => service}) do
    favourites =
      Map.update(
        LtaBusTimingsWeb.Favourites.get_favourites(conn),
        stop_id,
        [service],
        fn services ->
          if Enum.member?(services, service) do
            services
          else
            [service | services]
          end
        end
      )

    conn = put_resp_cookie(conn, "favourites", Jason.encode!(favourites), max_age: 3_156_000_000)

    redirect(conn, to: Routes.page_path(conn, :index, %{"stop_id" => stop_id}))
  end

  def delete(conn, %{"id" => id}) do
    # Hacky bit to encode the favourite in the id
    %{"stop_id" => stop_id, "service" => service} = Jason.decode!(id)

    favourites = LtaBusTimingsWeb.Favourites.get_favourites(conn)
    services = favourites[stop_id]
    services = List.delete(services, service)

    favourites = if Enum.empty?(services) do
      Map.drop(favourites, [stop_id])
    else
      Map.replace!(favourites, stop_id, services)
    end

    conn = put_resp_cookie(conn, "favourites", Jason.encode!(favourites), max_age: 3_156_000_000)

    redirect(conn, to: Routes.page_path(conn, :index, %{"stop_id" => stop_id}))
  end
end
