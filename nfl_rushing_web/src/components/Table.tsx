import React, { useState, useEffect } from 'react';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableContainer from '@material-ui/core/TableContainer';
import TablePagination from '@material-ui/core/TablePagination';
import Paper from '@material-ui/core/Paper';
import TableHeader from './TableHeader'
import TableToolbar from './TableToolbar'
import TableRow from './TableRow'
import AppContext from '../context';
import { Player, Order, EnhancedTableProps } from '../interfaces'
import { useStyles } from '../styles'
import { stableSort, getComparator } from '../utils'

export default function EnhancedTable(props: EnhancedTableProps) {
  const { currentSearchName } = props;
  const classes = useStyles();
  const [order, setOrder] = useState<Order>('asc');
  const [orderBy, setOrderBy] = useState<keyof Player>('totalRushingYards');
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(5);

  const handleRequestSort = (event: React.MouseEvent<unknown>, property: keyof Player) => {
    const isAsc = orderBy === property && order === 'asc';
    setOrder(isAsc ? 'desc' : 'asc');
    setOrderBy(property);
  };

  useEffect(() => {
    setPage(0);
  }, [currentSearchName])

  return (
    <AppContext.Consumer>
      {({total, players, selectedPlayers,
        handleSelectAllPlayers, handlePlayerSelected, searchPlayersByName }) => {

        let sortedPlayers = stableSort(players, getComparator(order, orderBy))

        if (sortedPlayers.length > rowsPerPage) {
          sortedPlayers = sortedPlayers.slice(page * rowsPerPage, (page * rowsPerPage) + rowsPerPage)
        }

        return (
          <div className={classes.root}>
            <Paper className={classes.paper}>
              <TableToolbar numSelected={selectedPlayers.length} />
              <TableContainer>
                <Table
                  className={classes.table}
                  aria-labelledby="tableTitle"
                  aria-label="enhanced table"
                >
                  <TableHeader
                    numSelected={selectedPlayers.length}
                    order={order}
                    orderBy={orderBy}
                    onSelectAllClick={(event) => { handleSelectAllPlayers(event.target.checked) }}
                    onRequestSort={handleRequestSort}
                    rowCount={total}
                    rowsPerPage={rowsPerPage}
                  />
                  <TableBody>
                    {sortedPlayers.map((row, index) => {
                      return (
                        <TableRow
                          key={index}
                          row={row}
                          handleClick={handlePlayerSelected}
                          isItemSelected={selectedPlayers.includes(row)}
                          labelId={`enhanced-table-checkbox-${index}`}
                        />
                      );
                    })}
                  </TableBody>
                </Table>
              </TableContainer>
              <TablePagination
                rowsPerPageOptions={[5, 10, 25]}
                component="div"
                count={total}
                rowsPerPage={rowsPerPage}
                page={page}
                onChangePage={(event: unknown, newPage: number) => {
                  searchPlayersByName(currentSearchName, (newPage * rowsPerPage), rowsPerPage);
                  setPage(newPage);
                }}
                onChangeRowsPerPage={(event: React.ChangeEvent<HTMLInputElement>) => {
                  const rowsPerPage = parseInt(event.target.value, 10);
                  searchPlayersByName(currentSearchName, 0, rowsPerPage);
                  setRowsPerPage(rowsPerPage);
                  setPage(0);
                }}
              />
            </Paper>

          </div >

        )
      }}
    </AppContext.Consumer>
  );
}