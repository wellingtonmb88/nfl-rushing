import React, { useState } from 'react';
import AppContext from '../context';
import { Player } from '../interfaces'
import { useApolloClient } from '@apollo/react-hooks';
import { FILTER_PLAYERS_BY_NAME, ALL_PLAYERS } from '../graphql';

export default (props: any) => {
  const [currentSearch, setCurrentSearch] = useState('');
  const [total, setTotal] = useState(0);
  const [selectedPlayers, setSelectedPlayers] = useState<Player[]>([]);
  const [allPlayers, setAllPlayers] = useState<Player[]>([]);
  const [players, setPlayers] = useState<Player[]>([]);

  const apolloClient = useApolloClient();

  const handleSelectAllPlayers = (checked: boolean) => {
    if (checked) {
      setSelectedPlayers(players);
      return;
    }
    setSelectedPlayers([]);
  };

  const handlePlayerSelected = (player: Player) => {
    let newPlayerSelected: Player[] = [];

    if (selectedPlayers.includes(player)) {
      newPlayerSelected = selectedPlayers.filter(p => p.name !== player.name);
    } else {
      newPlayerSelected = [...selectedPlayers, player];
    }
    setSelectedPlayers(newPlayerSelected);
  };

  const searchPlayersByName = async (search: string, skip: number, take: number) => {
    
    if (search.length > 0) {
      skip = 0;
      take = 0;
    }
    const { data } = await apolloClient.query({
      query: FILTER_PLAYERS_BY_NAME,
      variables: { name: search, skip, take },
    });

    let { filterPalyersByName: { total, items } } = data;
    if (search.length > 0) {
      total = items.length
    }
    if (search !== currentSearch) { 
      setCurrentSearch(search);
    }
    setTotal(total);
    setPlayers(items);
  }

  if (players.length < 1 && currentSearch === '') {
    searchPlayersByName(currentSearch, 0, 5);
  }

  return (
    <AppContext.Provider
      value={{
        currentSearch,
        total,
        players,
        allPlayers,
        selectedPlayers,
        handlePlayerSelected,
        handleSelectAllPlayers,
        searchPlayersByName,
        getAllPlayers: async () => {
          const { data: { players: { items } } } = await apolloClient.query({
            query: ALL_PLAYERS
          });
          setAllPlayers(items);
        }
      }}
    >
      {props.children}
    </AppContext.Provider>
  );

};