export SECRET_KEY_BASE := Y0uRvErYsecr3TANDL0ngStr1ng
export APP_PORT := 4000
export APP_HOSTNAME := localhost

.PHONY: all
start-dev-server:
	iex --no-halt -S mix phx.server

start-release-server:
	MIX_ENV=prod mix phx.digest
	MIX_ENV=prod mix release
	_build/prod/rel/nfl_rushing_backend/bin/nfl_rushing_backend start

build-and-start-dev-server:
	docker-compose -f docker-compose-dev.yml up --build

build-and-start-release-server:
	docker-compose -f docker-compose.yml up --build

build-release-image:
	MIX_ENV=prod mix phx.digest
	MIX_ENV=prod mix release
	docker build -t wellingtonmb88/nfl_rushing_backend .