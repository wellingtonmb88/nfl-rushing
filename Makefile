

start-backend-and-frontend:
	docker-compose up -d

start-backend:
	docker-compose -f ./nfl_rushing_backend/docker-compose-dev.yml up -d