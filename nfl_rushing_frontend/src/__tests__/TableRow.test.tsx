import React from "react";
import { create } from "react-test-renderer";
import TableRow from '../components/TableRow'
import { Player } from '../interfaces'

const player: Player = {
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
}

describe("TableRow component", () => {
  test("TableRow with Snapshot", () => {
    const component = create(<TableRow
      row={player}
      isItemSelected={false}
      labelId='labelId-TableRow'
      handleClick={() => { }}
    />);
    expect(component.toJSON()).toMatchSnapshot();
  });
});