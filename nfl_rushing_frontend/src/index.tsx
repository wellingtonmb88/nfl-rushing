import React from 'react';
import ReactDOM from 'react-dom';
import { ApolloProvider } from '@apollo/react-hooks';
import * as serviceWorker from './serviceWorker';
import App from './App';
import AppProvider from './provider'
import { client } from './client'
import './styles/index.css';

ReactDOM.render(<ApolloProvider client={client}>
  <AppProvider><App /></AppProvider>
</ApolloProvider>, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
