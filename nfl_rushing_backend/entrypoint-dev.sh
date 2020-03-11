#!/bin/bash
# Docker entrypoint script. 
 
 echo "STARTING ELIXIR DEVELOPMENT SERVER"
 exec elixir --no-halt -S mix phx.server
