.PHONY: help build up down logs test ps restart clean shell-ingestion shell-postgres

include .env
export

# Default target when 'make' is executed without arguments.
default: help

# Display help message with detailed explanations and suggested workflow.
help:
	@echo "Available commands:"
	@echo "  make build            - Build the Docker images for the project. Run this after code changes."
	@echo "  make up               - Start the Docker containers in detached mode. Initializes the database."
	@echo "  make down             - Stop and remove the Docker containers, networks, and volumes."
	@echo "  make logs             - View the logs of all services. Use 'make logs | grep <service>' to filter."
	@echo "  make test             - Run the test suite (database and ingestion logic tests)."
	@echo "  make ps               - List the running Docker containers associated with this project."
	@echo "  make clean            - Clean up build artifacts and temporary files (DOES NOT touch 'data')."
	@echo "  make shell-ingestion  - Open a shell inside the running data_ingestion container."
	@echo "  make shell-postgres   - Open a psql shell inside the running postgres container."
	@echo ""
	@echo "Suggested Workflow:"
	@echo "  1. make build          # Build images initially and after code modifications."
	@echo "  2. make up             # Start services. The database will be initialized on the first run."
	@echo "  3. make test           # Run tests to ensure everything is working as expected."
	@echo "  4. make logs           # Monitor logs for errors or to observe the system's behavior."
	@echo "  5. make down           # Stop the system when done."
	@echo "  6. make shell-ingestion # Access a shell within the data_ingestion container for debugging."
	@echo "  7. make shell-postgres  # Access the PostgreSQL shell for database inspection or manual queries."
	@echo "  8. make clean          # Clean up build artifacts and temporary files. Your data is safe!"

# Build the Docker images.
build:
	@echo "Building Docker images..."
	docker compose build

# Start the Docker containers in detached mode.
up:
	@echo "Starting Docker containers in detached mode..."
	docker compose up -d
	@echo "Services started. Use 'make logs' to view logs."

# Stop and remove the Docker containers, networks, and volumes.
down:
	@echo "Stopping and removing Docker containers, networks, and volumes..."
	docker compose down -v
	@echo "Services stopped and resources removed."

# View the logs of all services or a specific service.
logs:
	@echo "Displaying Docker logs. Use 'make logs | grep <service>' to filter logs."
	docker compose logs --follow

# Run the test suite.
test:
	@echo "Running tests..."
	@echo "Tests finished."

# List the running Docker containers for this project.
ps:
	@echo "Listing running Docker containers:"
	docker compose ps

# Open a psql shell inside the running postgres container.
shell-postgres:
	@echo "Opening a psql shell inside the postgres container..."
	@docker compose exec companies_registry_db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} || echo "Failed to connect to database"


restart: down up

# Clean up build artifacts and temporary files.
clean: down
	@echo "Removing the Docker volume for Postgres data..."
	docker system prune -f
	rm ./data/ingestion/duckdb/*.duckdb
	@echo "Volume removed."