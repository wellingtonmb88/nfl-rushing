defmodule NflRushingBackendWeb.Resolvers.Player do
  alias NflRushingBackend.Players

  def list_players(_parent, args, _resolution) do
    {:ok, Players.get_players(Map.get(args, :skip), Map.get(args, :take))}
  end

  def filter_palyers_by_name(_parent, %{name: name} = args, _resolution) do
    {:ok, Players.filter_palyers_by_name(name, Map.get(args, :skip), Map.get(args, :take))}
  end

  def sort_palyers_by_total_rushing_yards(_parent, args, _resolution) do
    is_desc = Map.get(args, :is_desc)
    is_desc = if is_nil(is_desc), do: false, else: is_desc

    {:ok,
     Players.sorting_by(:total_rushing_yards, Map.get(args, :skip), Map.get(args, :take), is_desc)}
  end

  def sort_palyers_by_longest_rush(_parent, args, _resolution) do
    is_desc = Map.get(args, :is_desc)
    is_desc = if is_nil(is_desc), do: false, else: is_desc
    {:ok, Players.sorting_by(:longest_rush, Map.get(args, :skip), Map.get(args, :take), is_desc)}
  end

  def sort_palyers_by_total_rushing_touchdowns(_parent, args, _resolution) do
    is_desc = Map.get(args, :is_desc)
    is_desc = if is_nil(is_desc), do: false, else: is_desc

    {:ok,
     Players.sorting_by(
       :total_rushing_touchdowns,
       Map.get(args, :skip),
       Map.get(args, :take),
       is_desc
     )}
  end
end
