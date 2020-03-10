import React from 'react';
import _ from 'lodash';
import Table from './components/Table'
import TextField from '@material-ui/core/TextField';
import AppContext from './context';
import CSVButtons from './components/CSVButtons'
import './styles/App.css';

function App() {
  const search = _.debounce((value: string, func: (text: string) => void) => {
    func(value);
  }, 200);

  return (
    <AppContext.Consumer>
      {({ searchPlayersByName, currentSearch }) => (
        <div className="App">
          <TextField id="standard-basic" label="Player Name"
            onChange={(props) => {
              const { value } = props.target;
              search(value, (text) => {
                searchPlayersByName(text, 0, 0);
              });
            }
            } />
          <CSVButtons />
          <Table currentSearchName={currentSearch} />
        </div>)
      }
    </AppContext.Consumer>
  );
}


export default App;
