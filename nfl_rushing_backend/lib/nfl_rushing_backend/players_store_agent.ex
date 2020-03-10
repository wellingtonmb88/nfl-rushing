defmodule NflRushingBackend.PlayersStoreAgent do
  use Agent
  alias NflRushingBackend.DataImporter

  def start_link(_ops) do
    Agent.start_link(fn ->
      DataImporter.get_decoded_players_list()
    end, name: __MODULE__)
  end

  def list_players() do
    Agent.get(__MODULE__, & &1)
  end
end
