defmodule LtaBusTimingsWeb.PageView do
  use LtaBusTimingsWeb, :view

  def render("service.json", %{page: page}) do
    %{ServiceNo: page["ServiceNo"]}
  end
end
