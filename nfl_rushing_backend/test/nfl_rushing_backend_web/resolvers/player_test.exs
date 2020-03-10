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

    test "sortPalyersByTotalRushingYards/3 returns a list of players sorted by total rushing yards descending",
         context do
      query = """
      {
        sortPalyersByTotalRushingYards(skip: 0, take: 2, isDesc: true) {
            items{
              name
              totalRushingYards
            }
          }
      }
      """

      res = post_request(context, query, "sortPalyersByTotalRushingYards")
      json_resp = json_response(res, 200)["data"]["sortPalyersByTotalRushingYards"]["items"]
      first_player = Enum.at(json_resp, 0)
      second_player = Enum.at(json_resp, 1)

      assert first_player["name"] == "Aaron Rodgers"
      assert first_player["totalRushingYards"] == 369
      assert second_player["name"] == "Aaron Ripkowski"
      assert second_player["totalRushingYards"] == 150
    end

    test "sortPalyersByTotalRushingYards/3 returns a list of players sorted by total rushing yards ascending",
         context do
      query = """
      {
        sortPalyersByTotalRushingYards(skip: 0, take: 2, isDesc: false) {
            items{
              name
              totalRushingYards
            }
          }
      }
      """

      res = post_request(context, query, "sortPalyersByTotalRushingYards")
      json_resp = json_response(res, 200)["data"]["sortPalyersByTotalRushingYards"]["items"]
      first_player = Enum.at(json_resp, 0)
      second_player = Enum.at(json_resp, 1)

      assert first_player["name"] == "Aaron Ripkowski"
      assert first_player["totalRushingYards"] == 150
      assert second_player["name"] == "Aaron Rodgers"
      assert second_player["totalRushingYards"] == 369
    end

    test "sortPalyersByLongestRush/3 returns a list of players sorted by palyers by longest rush",
         context do
      query = """
      {
        sortPalyersByLongestRush(skip: 0, take: 1, isDesc: false) {
            items {
              name
              longestRush
            }
          }
      }
      """

      res = post_request(context, query, "sortPalyersByLongestRush")
      player = Enum.at(json_response(res, 200)["data"]["sortPalyersByLongestRush"]["items"], 0)

      assert player["name"] == "Aaron Ripkowski"
      assert player["longestRush"] == "15"
    end

    test "sortPalyersByTotalRushingTouchdowns/3 returns a list of players sorted by palyers by total rushing touchdowns",
         context do
      query = """
      {
       sortPalyersByTotalRushingTouchdowns(skip: 0, take: 1, isDesc: false) {
          items{
            name
            totalRushingTouchdowns
          }
          }
      }
      """

      res = post_request(context, query, "sortPalyersByTotalRushingTouchdowns")
      data = json_response(res, 200)["data"]["sortPalyersByTotalRushingTouchdowns"]
      player = Enum.at(data["items"], 0)

      assert player["name"] == "Aaron Ripkowski"
      assert player["totalRushingTouchdowns"] == 2
    end
  end

  defp post_request(context, query, queryName) do
    context.conn
    |> post("/api/graphql", AbsintheHelpers.query_skeleton(query, queryName))
  end
end
