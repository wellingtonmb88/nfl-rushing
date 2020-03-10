defmodule NflRushingBackendWeb.Schema.PlayerTypes do
  use Absinthe.Schema.Notation

  @desc "A player of NFL Rushing"
  object :player do
    field :name, :string
    field :team, :string
    field :position, :string
    field :longest_rush, :string
    field :rushing_attempts, :float
    field :rushing_attempts_per_game, :float
    field :total_rushing_yards, :integer
    field :rushing_avg_yards_per_attempt, :float
    field :rushing_yards_per_game, :float
    field :total_rushing_touchdowns, :integer
    field :rushing_first_downs, :integer
    field :rushing_first_downs_percentage, :float
    field :rushing_twenty_plus_yeards, :integer
    field :rushing_forty_plus_yeards, :integer
    field :rushing_fumbles, :integer
  end

  @desc "Response"
  object :players_response do
    field :total, :integer
    field :items, list_of(:player)
  end
end
