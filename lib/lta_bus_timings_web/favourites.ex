defmodule LtaBusTimingsWeb.Favourites do
  def get_favourites(conn) do
    case conn.req_cookies["favourites"] do
      nil -> %{}
      favourites -> Jason.decode!(favourites)
    end
  end
end
