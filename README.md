# nfl-rushing
We have sets of records representing football players' rushing statistics. 

# Technology 
  - Elixir [1.10.2](https://hexdocs.pm/elixir)
  - Phoenix [1.4.13](https://hexdocs.pm/phoenix/overview.html)
  - [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)
  - [Agent](https://hexdocs.pm/elixir/Agent.html)
  - [Flow](https://hexdocs.pm/flow/Flow.html)
  - [Absinthe-GraphQl](http://absinthe-graphql.org/)
  - [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html)
  - [ExCoveralls](https://hexdocs.pm/excoveralls/api-reference.html)
  - [Credo](https://hexdocs.pm/credo/Credo.html)
  - ReactJs [16.13.0](https://reactjs.org/)
  - [React Context](https://reactjs.org/docs/context.html)
  - [React Hooks](https://reactjs.org/docs/hooks-intro.html)
  - [Typescript](https://www.typescriptlang.org/)
  - [Apollo-Client](https://www.apollographql.com/docs/react/)
  - [Material-UI](https://material-ui.com/)
  - [Jest](https://jestjs.io/)
  - [Docker](https://www.docker.com/)
  - [Docker Compose](https://docs.docker.com/compose/)

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

## Running Tests

- Backend:
  - `make run-backend-tests`
  
- Frontend:
  - `make run-frontend-tests`