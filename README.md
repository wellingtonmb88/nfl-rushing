# nfl-rushing
We have sets of records representing football players' rushing statistics. 

# Technology 
  - Elixir
  - Phoenix
  - Phoenix LiveView
  - Flow
  - Absinthe GraphQl
  - ExUnit
  - ExCoveralls
  - Credo 
  - ReactJs
  - Typescript
  - Appolo
  - Material UI
  - Jest

All records have the following attributes:

* Player (Player's name)
* Team (Player's team abbreviation)
* Pos (Player's postion)
* Att/G (Rushing Attempts Per Game Average)
* Att (Rushing Attempts)
* Yds (Total Rushing Yards)
* Avg (Rushing Average Yards Per Attempt)
* Yds/G (Rushing Yards Per Game)
* TD (Total Rushing Touchdowns)
* Lng (Longest Rush -- a T represents a touchdown occurred)
* 1st (Rushing First Downs)
* 1st% (Rushing First Down Percentage)
* 20+ (Rushing 20+ Yards Each)
* 40+ (Rushing 40+ Yards Each)
* FUM (Rushing Fumbles)

# Challenge Requirements

#### Create a web app. This must be able to do the following steps

* Create a webpage which displays a table with the contents of rushing.json
* The user should be able to sort the players by 
* Total Rushing Yards, Longest Rush and Total Rushing Touchdowns
* The user should be able to filter by the player's name
* The user should be able to download the sorted data as a CSV, as well as a filtered subset

# Installation and running this solution

** Dev Environment **
1) Starting Backend and Frontend with docker:
   - `make start-backend-and-frontend`

2) Starting Backend with docker:
   - `make start-backend`

### Endpoints:

- The Frontend WebApp was built with `ReactJs` + `Typescript`.
  - You can access it from `http://localhost:3000/`


- The Frontend SSR(Server Side Rendering) was built with Phoenix LiveView.
  - You can access it from `http://localhost:4000/live/players`

- The Backend GraphQL API Playground.
  - You can access the from `http://localhost:4000/api/graphiql`
