

start-backend-and-frontend:
	docker-compose up -d --build

start-backend:
	docker-compose -f ./nfl_rushing_backend/docker-compose-dev.yml up -d --build

run-backend-tests:
	cd nfl_rushing_backend && mix coveralls

run-frontend-tests:
	cd nfl_rushing_frontend && yarn test