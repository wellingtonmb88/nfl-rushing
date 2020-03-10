import React from 'react';

export type Order = 'asc' | 'desc';

export interface EnhancedTableHeadProps {
  numSelected: number;
  onRequestSort: (event: React.MouseEvent<unknown>, property: keyof Player) => void;
  onSelectAllClick: (event: React.ChangeEvent<HTMLInputElement>, checked: boolean) => void;
  order: Order;
  orderBy: string;
  rowCount: number;
  rowsPerPage: number;
}

export interface Player {
  name: string;
  team: string;
  position: string;
  longestRush: string;
  rushingAttempts: number;
  rushingAttemptsPerGame: number;
  totalRushingYards: number;
  rushingAvgYardsPerAttempt: number;
  rushingYardsPerGame: number;
  totalRushingTouchdowns: number;
  rushingFirstDowns: number;
  rushingFirstDownsPercentage: number;
  rushingTwentyPlusYeards: number;
  rushingFortyPlusYeards: number;
  rushingFumbles: number;
}

export interface HeadCell {
  disablePadding: boolean;
  id: keyof Player;
  label: string;
  numeric: boolean;
}

export interface EnhancedTableToolbarProps {
  numSelected: number;
}

export interface EnhancedTableProps {
  currentSearchName: string;
}

export interface TableRowsProps {
  row: Player;
  isItemSelected: boolean;
  labelId: string;
  handleClick: (player: Player) => void;
}
 
