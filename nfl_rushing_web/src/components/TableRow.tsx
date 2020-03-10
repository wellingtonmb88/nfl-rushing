import React from 'react';
import TableCell from '@material-ui/core/TableCell';
import TableRow from '@material-ui/core/TableRow';
import Checkbox from '@material-ui/core/Checkbox';

import { TableRowsProps } from '../interfaces'

export default (props: TableRowsProps) => {
  const { row, handleClick, isItemSelected, labelId } = props; 
  return (
    <TableRow
      hover
      onClick={event => handleClick(row)}
      role="checkbox"
      aria-checked={isItemSelected}
      tabIndex={-1}
      key={row.name}
      selected={isItemSelected}
    >
      <TableCell padding="checkbox">
        <Checkbox
          checked={isItemSelected}
          inputProps={{ 'aria-labelledby': labelId }}
        />
      </TableCell>
      <TableCell component="th" id={labelId} scope="row" padding="none">
        {row.name}
      </TableCell>
      <TableCell align="left">{row.team}</TableCell>
      <TableCell align="left">{row.position}</TableCell>
      <TableCell align="right">{row.longestRush}</TableCell>
      <TableCell align="right">{row.rushingAttempts}</TableCell>
      <TableCell align="right">{row.rushingAttemptsPerGame}</TableCell>
      <TableCell align="right">{row.totalRushingYards}</TableCell>
      <TableCell align="right">{row.rushingAvgYardsPerAttempt}</TableCell>
      <TableCell align="right">{row.rushingYardsPerGame}</TableCell>
      <TableCell align="right">{row.totalRushingTouchdowns}</TableCell>
      <TableCell align="right">{row.rushingFirstDowns}</TableCell>
      <TableCell align="right">{row.rushingFirstDownsPercentage}</TableCell>
      <TableCell align="right">{row.rushingTwentyPlusYeards}</TableCell>
      <TableCell align="right">{row.rushingFortyPlusYeards}</TableCell>
      <TableCell align="right">{row.rushingFumbles}</TableCell>
    </TableRow>
  );
}