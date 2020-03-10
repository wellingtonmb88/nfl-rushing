defmodule NflRushingBackendWeb.PageController do
  use NflRushingBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
