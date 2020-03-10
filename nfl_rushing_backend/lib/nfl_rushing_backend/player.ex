defmodule NflRushingBackend.Player do
  @derive Jason.Encoder
  defstruct [
    :name,
    :team,
    :position,
    :rushing_attempts,
    :rushing_attempts_per_game,
    :total_rushing_yards,
    :rushing_avg_yards_per_attempt,
    :rushing_yards_per_game,
    :total_rushing_touchdowns,
    :longest_rush,
    :rushing_first_downs,
    :rushing_first_downs_percentage,
    :rushing_twenty_plus_yeards,
    :rushing_forty_plus_yeards,
    :rushing_fumbles
  ]
end
