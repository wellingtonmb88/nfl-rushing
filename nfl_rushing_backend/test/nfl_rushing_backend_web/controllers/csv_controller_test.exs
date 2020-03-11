defmodule NflRushingBackendWeb.CSVControllerTest do
  use NflRushingBackendWeb.ConnCase

  test "GET /download_csv?query=k&page=1&per_page=10", %{conn: conn} do
    conn =
      get(
        conn,
        Routes.csv_path(conn, :export, %{
          query: "k",
          page: 1,
          per_page: 10
        })
      )

    assert conn.status == 200
  end

  test "GET /download_csv?all_table=true", %{conn: conn} do
    conn =
      get(
        conn,
        Routes.csv_path(conn, :export, %{
          all_table: true
        })
      )

    assert conn.status == 200
  end
end
