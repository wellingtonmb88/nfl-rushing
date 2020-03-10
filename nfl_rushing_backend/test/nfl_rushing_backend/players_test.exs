defmodule NflRushingBackend.PlayersTest do
  use ExUnit.Case
  alias NflRushingBackend.Players

  describe "Players" do
    test "get_all_players/0 returns all players" do
      %{items: players} = Players.get_players(0,0)
      assert length(players) > 1
      player = Enum.at(players, 0)
      refute is_nil(player.name)
    end

    test "filter_palyers_by_name/3 returns a list of players by name" do
      %{items: players} = Players.filter_palyers_by_name("Joe Banyard", nil, nil)
      assert length(players) == 1
      player = Enum.at(players, 0)
      assert player.name == "Joe Banyard"
    end

    test "filter_palyers_by_name/3 returns all list of players" do
      %{items: players} = Players.filter_palyers_by_name(nil, nil, nil)
      assert length(players) == 326
    end

    test "sorting_by/0 returns a list of players sorted by total rushing yards" do
      %{items: players_list} = Players.sorting_by(:total_rushing_yards, 5, 10, true)
      assert length(players_list) > 1
      player = Enum.at(players_list, 0)
      assert player.total_rushing_yards == 420
    end

    test "sorting_by/0 returns a list of players sorted by longest_rush" do
      %{items: players_list} = Players.sorting_by(:longest_rush, 0, 2, false)
      assert length(players_list) > 1
      player = Enum.at(players_list, 0)
      assert player.longest_rush == "15"
    end

    test "sorting_by/0 returns a list of players sorted by total rushing touchdowns" do
      %{items: players_list} = Players.sorting_by(:total_rushing_touchdowns, nil, nil, true)
      assert length(players_list) > 1
      player = Enum.at(players_list, 0)
      assert player.total_rushing_touchdowns == 18
    end
  end
end
