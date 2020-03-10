defmodule NflRushingBackend.Players do
  @moduledoc """
  The Players context.
  """
  alias NflRushingBackend.PlayersStoreAgent

  @total_rushing_yards :total_rushing_yards
  @longest_rush :longest_rush
  @tt_rushing_touchdowns :total_rushing_touchdowns

  def get_players(skip, take), do: players_pagination(skip, take)

  def filter_palyers_by_name(search, skip, take) when is_bitstring(search) do
    %{total: total, items: items} = players_pagination(skip, take)

    %{
      total: total,
      items:
        items
        |> Flow.from_enumerable()
        |> Flow.partition()
        |> Flow.filter(&String.contains?(String.downcase(&1.name), String.downcase(search)))
        |> Enum.to_list()
    }
  end

  def filter_palyers_by_name(_, skip, take), do: players_pagination(skip, take)

  def sorting_by(@total_rushing_yards, skip, take, is_desc) do
    sorting_with_desc(@total_rushing_yards, skip, take, is_desc)
  end

  def sorting_by(@longest_rush, skip, take, is_desc),
    do: sorting_with_desc(@longest_rush, skip, take, is_desc)

  def sorting_by(@tt_rushing_touchdowns, skip, take, is_desc),
    do: sorting_with_desc(@tt_rushing_touchdowns, skip, take, is_desc)

  defp sorting_with_desc(field, skip, take, true), do: sorting(field, skip, take, true)
  defp sorting_with_desc(field, skip, take, false), do: sorting(field, skip, take, false)

  defp sorting(field, skip, take, is_desc)
       when is_atom(field) and is_boolean(is_desc) do
    order = if is_desc, do: :desc, else: :asc
    %{total: total, items: items} = players_pagination(skip, take)

    %{
      total: total,
      items: Enum.sort_by(items, &parse_integer(Map.get(&1, field)), order)
    }
  end

  defp players_pagination(skip, take) do
    players = PlayersStoreAgent.list_players()
    total_items = length(players)
    skip = if is_nil(skip), do: 0, else: skip
    take = if is_nil(take) or take == 0, do: total_items, else: take
    %{total: total_items, items: Enum.slice(players, skip, take)}
  end

  defp parse_integer(value) when is_integer(value), do: value

  defp parse_integer(value) do
    {parsed_value, _} = Integer.parse(value)
    parsed_value
  end
end
