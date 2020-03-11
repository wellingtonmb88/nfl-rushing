defmodule NflRushingBackendWeb.Resolvers.PlayerTest do
  use NflRushingBackendWeb.ConnCase
  alias NflRushingBackendWeb.AbsintheHelpers

  describe "Player Resolver" do
    test "list_players/0 returns a list of players", context do
      query = """
      {
        players {
            items{
              longestRush
              name
              position
              rushingTwentyPlusYeards
              rushingFortyPlusYeards
              rushingAttempts
              rushingAttemptsPerGame
              rushingAvgYardsPerAttempt
              rushingFirstDowns
              rushingFirstDownsPercentage
              rushingFumbles
              rushingYardsPerGame
              team
              totalRushingTouchdowns
              totalRushingYards
            }
          }
      }
      """

      res = post_request(context, query, "players")
      data = Enum.at(json_response(res, 200)["data"]["players"]["items"], 0)

      assert data["name"] == "Aaron Ripkowski"
      assert data["longestRush"] == "15"
      assert data["position"] == "FB"
      assert data["team"] == "GB"
      assert data["rushingAttempts"] == 34
      assert data["rushingAttemptsPerGame"] == 2.1
      assert data["rushingAvgYardsPerAttempt"] == 4.4
      assert data["rushingFirstDowns"] == 10
      assert data["rushingFirstDownsPercentage"] == 29.4
      assert data["rushingFortyPlusYeards"] == 0
      assert data["rushingFumbles"] == 0
      assert data["rushingTwentyPlusYeards"] == 0
      assert data["rushingYardsPerGame"] == 9.4
      assert data["totalRushingTouchdowns"] == 2
      assert data["totalRushingYards"] == 150
    end

    test "filterPalyersByName/3 returns a list of players by name", context do
      query = """
      {
        filterPalyersByName(name: "Adam Thielen", skip: 0, take: 10) {
            items {
              name
            }
          }
      }
      """

      res = post_request(context, query, "filterPalyersByName")
      data = Enum.at(json_response(res, 200)["data"]["filterPalyersByName"]["items"], 0)

      assert data["name"] == "Adam Thielen"
    end
  end

  defp post_request(context, query, queryName) do
    context.conn
    |> post("/api/graphql", AbsintheHelpers.query_skeleton(query, queryName))
  end
end
