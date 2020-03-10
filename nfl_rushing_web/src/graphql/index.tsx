
import { gql } from 'apollo-boost';


export const FILTER_PLAYERS_BY_NAME = gql`
  query FilterPalyersByName($name: String, $skip: Int, $take: Int) {
    filterPalyersByName(name: $name, skip: $skip, take: $take) {
      total
      items {
      name
      team
      position
      longestRush
      rushingAttempts
      rushingAttemptsPerGame
      rushingAvgYardsPerAttempt
      rushingFirstDowns
      rushingFirstDownsPercentage
      rushingFortyPlusYeards
      rushingFumbles
      rushingTwentyPlusYeards
      rushingYardsPerGame
      totalRushingTouchdowns
      totalRushingYards
      }
   }
 }
`;

export const ALL_PLAYERS = gql`
  query Players {
    players {
      total
      items {
      name
      team
      position
      longestRush
      rushingAttempts
      rushingAttemptsPerGame
      rushingAvgYardsPerAttempt
      rushingFirstDowns
      rushingFirstDownsPercentage
      rushingFortyPlusYeards
      rushingFumbles
      rushingTwentyPlusYeards
      rushingYardsPerGame
      totalRushingTouchdowns
      totalRushingYards
      }
   }
 }
`;