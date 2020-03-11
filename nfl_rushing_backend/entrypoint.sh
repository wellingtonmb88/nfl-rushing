#!/bin/bash
# Docker entrypoint script.
 
 echo "STARTING ELIXIR RELEASE SERVER" 
 ./_build/prod/rel/nfl_rushing_backend/bin/nfl_rushing_backend start
