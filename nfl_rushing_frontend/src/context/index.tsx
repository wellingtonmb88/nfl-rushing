import React from 'react';

import { Player } from '../interfaces'

interface Data {
  currentSearch: string,
  total: number;
  players: Player[];
  selectedPlayers: Player[];
  allPlayers: Player[];
  handlePlayerSelected: (player: Player) => void,
  handleSelectAllPlayers: (checked: boolean) => void,
  searchPlayersByName: (search: string, skip: number, take: number) => void;
  getAllPlayers: () => void,
}

const props: Data = {
  currentSearch: '',
  total: 0,
  players: [],
  selectedPlayers: [],
  allPlayers: [],
  handlePlayerSelected: () => { },
  handleSelectAllPlayers: () => { },
  searchPlayersByName: () => { },
  getAllPlayers: () => { },
}

const AppContext = React.createContext(props);

export default AppContext;