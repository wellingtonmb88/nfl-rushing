defmodule NflRushingBackend.DataImporter do
  alias NflRushingBackend.Player

  def get_decoded_players_list() do
    read_decode_json_file()
    |> Flow.from_enumerable()
    |> Flow.partition()
    |> Flow.map(fn data ->
      %Player{
        name: data["Player"],
        team: data["Team"],
        position: data["Pos"],
        rushing_attempts: data["Att"],
        rushing_attempts_per_game: data["Att/G"],
        total_rushing_yards: data["Yds"],
        rushing_avg_yards_per_attempt: data["Avg"],
        rushing_yards_per_game: data["Yds/G"],
        total_rushing_touchdowns: data["TD"],
        longest_rush: data["Lng"],
        rushing_first_downs: data["1st"],
        rushing_first_downs_percentage: data["1st%"],
        rushing_twenty_plus_yeards: data["20+"],
        rushing_forty_plus_yeards: data["40+"],
        rushing_fumbles: data["FUM"]
      }
    end)
    |> Enum.sort_by(& &1.name)
    |> Enum.to_list()
  end

  def read_decode_json_file() do
    with {:ok, data} <- File.read("priv/data/rushing.json"),
         {:ok, decoded} <- Jason.decode(data) do
      decoded
    end
  end
end
