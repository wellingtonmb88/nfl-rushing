import React, { useState } from 'react';
import Button from '@material-ui/core/Button';
import ButtonGroup from '@material-ui/core/ButtonGroup';
import { useStyles } from '../styles'
import AppContext from '../context';

import { CSVDownload } from "react-csv";

export default function CSVButtons() {
  const classes = useStyles();
  const [downloadSelectedPlayers, setDownloadSelectedPlayers] = useState(false);
  const [downloadAllPlayers, setDownloadAllPlayers] = useState(false);
  const [downloadCurrentPlayers, setDownloadCurrentPlayers] = useState(false);

  return (
    <AppContext.Consumer>
      {({ players, selectedPlayers, allPlayers, getAllPlayers }) => (
        <div className={classes.buttonGroup}>
          <ButtonGroup variant="text" color="primary" aria-label="text primary button group">
            <Button disabled={selectedPlayers.length < 1} onClick={() => {
              setDownloadSelectedPlayers(true);
              setTimeout(() => {
                setDownloadSelectedPlayers(false);
              }, 200);
            }}>Export CSV (Selected Items)</Button>
            <Button disabled={players.length < 1} onClick={() => {
              setDownloadCurrentPlayers(true);
              setTimeout(() => {
                setDownloadCurrentPlayers(false);
              }, 200);
            }}>Export CSV (Current Page)</Button>
            <Button onClick={() => {
              getAllPlayers();
              setDownloadAllPlayers(true);
              setTimeout(() => {
                setDownloadAllPlayers(false);
              }, 500);
            }}>Export CSV (All Players Data)</Button>
          </ButtonGroup>

          {downloadCurrentPlayers ? <CSVDownload data={players} /> : null}
          {downloadSelectedPlayers ? <CSVDownload data={selectedPlayers} /> : null}
          {allPlayers.length > 0 && downloadAllPlayers ? <CSVDownload data={allPlayers} /> : null}
        </div>
      )
      }
    </AppContext.Consumer>
  );
}