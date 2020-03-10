defmodule NflRushingBackend.DataImporterTest do
  use ExUnit.Case
  alias NflRushingBackend.DataImporter

  describe "DataImporter" do
    test "read_decode_json_file/0 returns a decoded json" do
      decoded_list = DataImporter.read_decode_json_file()
      assert length(decoded_list) > 1
      player = Enum.at(decoded_list, 0)
      assert player["Player"] == "Joe Banyard"
    end

    test "get_decoded_players_list/0 returns a decoded players list" do
      players_list = DataImporter.get_decoded_players_list()
      assert length(players_list) > 1
      player = Enum.at(players_list, 0)
      refute is_nil(player.name)
    end
  end
end
