defmodule NflRushingBackendWeb.Schema do
  use Absinthe.Schema
  import_types NflRushingBackendWeb.Schema.PlayerTypes

  alias NflRushingBackendWeb.Resolvers

  query do

    @desc "Get all players"
    field :players, :players_response do
      arg :skip, :integer
      arg :take, :integer
      resolve &Resolvers.Player.list_players/3
    end

    @desc "Filter players by name"
    field :filter_palyers_by_name, :players_response do
      arg :name, non_null(:string)
      arg :skip, :integer
      arg :take, :integer
      resolve &Resolvers.Player.filter_palyers_by_name/3
    end

    @desc "Sort players by total rushing yards"
    field :sort_palyers_by_total_rushing_yards, :players_response do
      arg :skip, :integer
      arg :take, :integer
      arg :is_desc, :boolean
      resolve &Resolvers.Player.sort_palyers_by_total_rushing_yards/3
    end

    @desc "Sort players by the longest rush"
    field :sort_palyers_by_longest_rush, :players_response do
      arg :skip, :integer
      arg :take, :integer
      arg :is_desc, :boolean
      resolve &Resolvers.Player.sort_palyers_by_longest_rush/3
    end

    @desc "Sort players by total rushing touchdowns"
    field :sort_palyers_by_total_rushing_touchdowns, :players_response do
      arg :skip, :integer
      arg :take, :integer
      arg :is_desc, :boolean
      resolve &Resolvers.Player.sort_palyers_by_total_rushing_touchdowns/3
    end
  end
end
