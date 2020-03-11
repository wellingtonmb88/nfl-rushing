defmodule NflRushingBackendWeb.PlayersLiveTest do
  use NflRushingBackendWeb.ConnCase
  use Phoenix.ConnTest
  import Phoenix.LiveViewTest

  test "connected mount", %{conn: conn} do
    conn = get(conn, "/live/players")
    {:ok, _view, _html} = live(conn)

    assert conn.assigns.page == 1
    assert conn.assigns.per_page == 5
    assert Enum.at(conn.assigns.players, 0).name == "Aaron Ripkowski"
  end

  test "update_rows_per_page handle_event", %{conn: conn} do
    conn = get(conn, "/live/players")
    {:ok, view, _html} = live(conn)

    assert render_change(view, :update_rows_per_page, %{per_page: 10}) != nil
  end

  test "filter handle_event", %{conn: conn} do
    conn = get(conn, "/live/players")
    {:ok, view, _html} = live(conn)
    assert render_change(view, :filter, %{q: "Adam"}) != nil
  end

  test "page live_path", %{conn: conn} do
    conn = get(conn, "/live/players?page=2")
    {:ok, _view, _html} = live(conn)
    assert conn.assigns.page == 2
  end

  test "sort_by live_path", %{conn: conn} do
    conn = get(conn, "/live/players?sort_by=longest_rush")
    {:ok, _view, _html} = live(conn)
    assert Enum.at(conn.assigns.players, 0).longest_rush == "23"
  end
end
