defmodule NflRushingBackend.Players do
  @moduledoc """
  The Players context.
  """
  alias NflRushingBackend.PlayersStoreAgent

  @total_rushing_yards "total_rushing_yards"
  @longest_rush "longest_rush"
  @tt_rushing_touchdowns "total_rushing_touchdowns"

  def get_players(skip, take), do: players_pagination(skip, take)

  def filter_palyers_by_name(search, skip, take) when is_nil(search) or search == "",
    do: players_pagination(skip, take)

  def filter_palyers_by_name(search, skip, take) when is_bitstring(search) do
    %{items: items} = players_pagination(nil, nil)

    players =
      items
      |> Flow.from_enumerable()
      |> Flow.partition()
      |> Flow.filter(&String.contains?(String.downcase(&1.name), String.downcase(search)))
      |> Enum.to_list()

    %{total: length(players), items: Enum.slice(players, skip * take, take)}
  end

  def sorting_by(players, @total_rushing_yards), do: sorting(players, :total_rushing_yards)

  def sorting_by(players, @longest_rush), do: sorting(players, :longest_rush)

  def sorting_by(players, @tt_rushing_touchdowns), do: sorting(players, :total_rushing_touchdowns)

  defp sorting(players, field)
       when is_list(players) and is_atom(field) do
    Enum.sort_by(players, &parse_integer(Map.get(&1, field)), :desc)
  end

  defp players_pagination(skip, take) do
    players = PlayersStoreAgent.list_players()
    total_items = length(players)
    skip = if is_nil(skip), do: 0, else: skip
    take = if is_nil(take) or take <= 0, do: total_items, else: take
    %{total: total_items, items: Enum.slice(players, skip * take, take)}
  end

  defp parse_integer(value) when is_integer(value), do: value

  defp parse_integer(value) do
    {parsed_value, _} = Integer.parse(value)
    parsed_value
  end
end
