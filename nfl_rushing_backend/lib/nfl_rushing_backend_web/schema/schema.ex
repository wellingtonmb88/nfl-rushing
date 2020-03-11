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
  end
end
