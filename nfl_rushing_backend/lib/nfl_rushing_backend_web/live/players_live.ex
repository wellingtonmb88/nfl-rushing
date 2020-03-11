defmodule NflRushingBackendWeb.PlayersLive do
  use Phoenix.LiveView
  alias NflRushingBackendWeb.PlayerView
  alias NflRushingBackend.Players

  @page 1
  @rows_per_page 5

  def render(assigns) do
    PlayerView.render("index.html", assigns)
  end

  def mount(_params, _, socket) do
    %{total: total, items: players} = Players.get_players(@page - 1, @rows_per_page)

    {:ok,
     assign(socket,
       query: nil,
       page: @page,
       total: total,
       players: players,
       per_page: @rows_per_page
     )}
  end

  def handle_event("update_rows_per_page", %{"per_page" => per_page}, socket) do
    {per_page, ""} = Integer.parse(per_page)
    query = socket.assigns.query

    %{total: total, items: players} = Players.filter_palyers_by_name(query, 0, per_page)

    {:noreply, assign(socket, total: total, per_page: per_page, page: @page, players: players)}
  end

  def handle_event("filter", %{"q" => query}, socket) when byte_size(query) <= 100 do
    per_page = socket.assigns.per_page
    %{total: total, items: players} = Players.filter_palyers_by_name(query, 0, per_page)
    {:noreply, assign(socket, query: query, page: @page, total: total, players: players)}
  end

  def handle_event(_, _, socket), do: {:noreply, socket}

  def handle_params(%{"page" => page}, _uri, socket) do
    page = String.to_integer(page)
    per_page = socket.assigns.per_page
    query = socket.assigns.query

    %{total: total, items: players} = Players.filter_palyers_by_name(query, page - 1, per_page)

    {:noreply, assign(socket, total: total, page: page, players: players)}
  end

  def handle_params(%{"sort_by" => sort_by}, _uri, socket) do
    case sort_by do
      sort_by
      when sort_by in ~w(total_rushing_yards longest_rush total_rushing_touchdowns) ->
        {:noreply,
         assign(socket,
           players: Players.sorting_by(socket.assigns.players, sort_by)
         )}

      _ ->
        {:noreply, socket}
    end
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end
end
