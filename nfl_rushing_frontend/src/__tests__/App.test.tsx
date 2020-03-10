import React from 'react';
import { create } from 'react-test-renderer';
import App from '../App';
import { MockedProvider } from "@apollo/react-testing";
import { FILTER_PLAYERS_BY_NAME } from '../graphql';


const mocks = [
  {
    request: {
      query: FILTER_PLAYERS_BY_NAME,
      variables: { name: "Adam", skip: 0, take: 5}
    },
    result: {
      "data": {
        "filterPalyersByName": {
          "items": [
            {
              "longestRush": "11",
              "name": "Adam Thielen",
              "position": "WR",
              "rushingAttempts": 2,
              "rushingAttemptsPerGame": 0.1,
              "rushingAvgYardsPerAttempt": 7.5,
              "rushingFirstDowns": 1,
              "rushingFirstDownsPercentage": 50,
              "rushingFortyPlusYeards": 0,
              "rushingFumbles": 0,
              "rushingTwentyPlusYeards": 0,
              "rushingYardsPerGame": 0.9,
              "team": "MIN",
              "totalRushingTouchdowns": 0,
              "totalRushingYards": 15
            },
            {
              "longestRush": "8",
              "name": "Adam Humphries",
              "position": "WR",
              "rushingAttempts": 5,
              "rushingAttemptsPerGame": 0.3,
              "rushingAvgYardsPerAttempt": 3.6,
              "rushingFirstDowns": 0,
              "rushingFirstDownsPercentage": 0,
              "rushingFortyPlusYeards": 0,
              "rushingFumbles": 0,
              "rushingTwentyPlusYeards": 0,
              "rushingYardsPerGame": 1.2,
              "team": "TB",
              "totalRushingTouchdowns": 0,
              "totalRushingYards": 18
            }
          ],
          "total": 326
        }
      }
    }
  }
]

test('renders App', () => {
  const component = create(<MockedProvider mocks={mocks}><App /></MockedProvider>);
  expect(component.toJSON()).toMatchSnapshot();
});
