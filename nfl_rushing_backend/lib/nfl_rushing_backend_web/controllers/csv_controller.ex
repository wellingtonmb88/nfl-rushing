defmodule NflRushingBackendWeb.CSVController do
  use NflRushingBackendWeb, :controller
  alias NflRushingBackend.Players

  def export(conn, %{"all_table" => "true"}) do
    %{items: players} = Players.get_players(0, 0)
    downlaod_csv(conn, players)
  end

  def export(conn, %{"page" => page, "per_page" => per_page, "query" => query}) do
    page = String.to_integer(page)
    per_page = String.to_integer(per_page)

    %{items: players} = Players.filter_palyers_by_name(query, page - 1, per_page)

    downlaod_csv(conn, players)
  end

  defp downlaod_csv(conn, data) do
    csv =
      data
      |> Enum.map(fn d -> Map.from_struct(d) end)
      |> IO.inspect()
      |> CSV.encode(headers: true)
      |> Enum.to_list()
      |> to_string

    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"rushing_players.csv\"")
    |> send_resp(200, csv)
  end
end
