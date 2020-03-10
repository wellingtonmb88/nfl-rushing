import React from 'react';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import TableSortLabel from '@material-ui/core/TableSortLabel';
import Checkbox from '@material-ui/core/Checkbox';
import { useStyles } from '../styles'

import { Player, HeadCell, EnhancedTableHeadProps } from '../interfaces'

const headCells: HeadCell[] = [
  { id: 'name', numeric: false, disablePadding: true, label: 'Player' },
  { id: 'team', numeric: false, disablePadding: false, label: 'Team' },
  { id: 'position', numeric: false, disablePadding: false, label: 'Pos' },
  { id: 'longestRush', numeric: true, disablePadding: false, label: 'Lng' },
  { id: 'rushingAttempts', numeric: true, disablePadding: false, label: 'Att' },
  { id: 'rushingAttemptsPerGame', numeric: true, disablePadding: false, label: 'Att/G' },
  { id: 'totalRushingYards', numeric: true, disablePadding: false, label: 'Yds' },
  { id: 'rushingAvgYardsPerAttempt', numeric: true, disablePadding: false, label: 'Avg' },
  { id: 'rushingYardsPerGame', numeric: true, disablePadding: false, label: 'Yds/G' },
  { id: 'totalRushingTouchdowns', numeric: true, disablePadding: false, label: 'TD' },
  { id: 'rushingFirstDowns', numeric: true, disablePadding: false, label: '1st' },
  { id: 'rushingFirstDownsPercentage', numeric: true, disablePadding: false, label: '1st%' },
  { id: 'rushingTwentyPlusYeards', numeric: true, disablePadding: false, label: '20+' },
  { id: 'rushingFortyPlusYeards', numeric: true, disablePadding: false, label: '40+' },
  { id: 'rushingFumbles', numeric: true, disablePadding: false, label: 'FUM' },
];

export default function EnhancedTableHead(props: EnhancedTableHeadProps) {
  const { onSelectAllClick, order, orderBy, numSelected, rowCount, rowsPerPage, onRequestSort } = props;
  const classes = useStyles();
  const createSortHandler = (property: keyof Player) => (event: React.MouseEvent<unknown>) => {
    onRequestSort(event, property);
  };

  return (
    <TableHead>
      <TableRow>
        <TableCell padding="checkbox">
          <Checkbox
            indeterminate={numSelected > 0 && numSelected < rowCount}
            checked={rowCount > 0 && (numSelected === rowsPerPage || numSelected === rowCount)}
            onChange={onSelectAllClick}
            inputProps={{ 'aria-label': 'select all players' }}
          />
        </TableCell>
        {headCells.map(headCell => (
          <TableCell
            key={headCell.id}
            align={headCell.numeric ? 'right' : 'left'}
            padding={headCell.disablePadding ? 'none' : 'default'}
            sortDirection={orderBy === headCell.id ? order : false}
          >
            {headCell.id === "longestRush" ||
              headCell.id === "totalRushingYards" ||
              headCell.id === "totalRushingTouchdowns" ?
              (<TableSortLabel
                active={orderBy === headCell.id}
                direction={orderBy === headCell.id ? order : 'asc'}
                onClick={createSortHandler(headCell.id)}
              >
                {headCell.label}
                {orderBy === headCell.id ? (
                  <span className={classes.visuallyHidden}>
                    {order === 'desc' ? 'sorted descending' : 'sorted ascending'}
                  </span>
                ) : null}
              </TableSortLabel>) : headCell.label}

          </TableCell>
        ))}
      </TableRow>
    </TableHead>
  );
}