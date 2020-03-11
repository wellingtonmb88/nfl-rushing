defmodule NflRushingBackendWeb.Resolvers.Player do
  alias NflRushingBackend.Players

  def list_players(_parent, args, _resolution) do
    {:ok, Players.get_players(Map.get(args, :skip), Map.get(args, :take))}
  end

  def filter_palyers_by_name(_parent, %{name: name} = args, _resolution) do
    {:ok, Players.filter_palyers_by_name(name, Map.get(args, :skip), Map.get(args, :take))}
  end
end
