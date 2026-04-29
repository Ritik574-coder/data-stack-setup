#!/bin/bash

# =============================================================================
# APACHE AIRFLOW - DOCKER COMMANDS CHEAT SHEET
# GitHub Codespaces / Development Environment
# =============================================================================

echo "========================================="
echo "  AIRFLOW DOCKER COMMANDS - FULL GUIDE"
echo "========================================="

# 1.1. Create folders for Airflow
mkdir airflow_init

# Create Required Directories
mkdir ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

# Fetch the Official Docker Compose File
curl -LfO https://airflow.apache.org/docs/apache-airflow/stable/docker-compose.yaml

# Initialize Airflow
docker compose up airflow-init

#  Start Airflow
docker compose up -d

## info 
# URL: http://localhost:8080
# Username: airflow
# Password: airflow

# Exit immediately if any command fails
set -e
# These folders store your DAGs, logs, plugins, and config files

mkdir -p ./dags ./logs ./plugins ./config

# 1.2. Create .env file (sets User ID to avoid permission issues)

# This command works on Linux/Mac

echo -e "AIRFLOW_UID=$(id -u)" > .env

# 1.3. Initialize Airflow database

# Run this only for the first time - it creates database tables

docker compose up airflow-init

# 1.4. Start Airflow (in background)

# -d flag runs in detached mode (background)

docker compose up -d

# =============================================================================

# 2. DOCKER COMPOSE UP/DOWN (Container Creation & Deletion)

# =============================================================================

# 2.1. START FRESH - Create and start containers (in background)

# Use this for first run or after docker compose down

docker compose up -d

# 2.2. START WITH LOGS - Create containers and view logs (foreground)

# Useful for debugging - press Ctrl+C to stop

docker compose up

# 2.3. STOP & REMOVE EVERYTHING - Remove containers but keep volumes safe

# Containers will be removed, but data (database, logs) will remain safe

docker compose down

# 2.4. STOP & REMOVE WITH VOLUMES - Delete everything (clean slate)

# WARNING: Entire database will also be deleted!

docker compose down -v

# =============================================================================

# 3. START/STOP/RESTART (For running containers)

# =============================================================================

# 3.1. STOP - Only stop containers (do not delete)

# Data remains safe, containers still exist but are stopped

docker compose stop

# 3.2. START - Restart previously stopped containers

# Use after docker compose stop

docker compose start

# 3.3. RESTART - Restart running containers

# Useful after config changes

docker compose restart

# 3.4. RESTART SPECIFIC SERVICE - Restart only one service

# Example: scheduler restart, webserver restart, etc.

docker compose restart airflow-webserver
docker compose restart airflow-scheduler

# =============================================================================

# 4. BUILDING IMAGES (For custom images)

# =============================================================================

# 4.1. Build images (if Dockerfile exists)

# Run whenever Dockerfile or requirements.txt changes

docker compose build

# 4.2. Build + Start together

docker compose up -d --build

# 4.3. Pull latest images

# Fetch latest version of official images

docker compose pull

# =============================================================================

# 5. MONITORING & LOGS (For monitoring)

# =============================================================================

# 5.1. Check status of all containers

docker compose ps

# 5.2. View live logs of all containers

# -f flag shows continuous logs (Ctrl+C to exit)

docker compose logs -f

# 5.3. View logs of specific service

docker compose logs -f airflow-webserver
docker compose logs -f airflow-scheduler
docker compose logs -f postgres

# 5.4. View last 100 lines of logs

docker compose logs --tail=100

# 5.5. Check container resource usage

docker stats

# =============================================================================

# 6. EXECUTE COMMANDS INSIDE CONTAINERS

# =============================================================================

# 6.1. Enter Airflow container (bash shell)

docker compose exec airflow-webserver bash

# 6.2. Run Airflow commands inside container

docker compose exec airflow-scheduler airflow dags list
docker compose exec airflow-scheduler airflow tasks list example_dag
docker compose exec airflow-scheduler airflow dags trigger example_dag

# 6.3. Enter database container

docker compose exec postgres bash

# =============================================================================

# 7. CLEANUP & MAINTENANCE

# =============================================================================

# 7.1. Remove unused containers, networks, images

docker system prune

# 7.2. Remove everything (containers, images, volumes, networks)

# WARNING: Entire system will be cleaned!

docker system prune -a --volumes

# 7.3. List volumes

docker volume ls

# 7.4. Delete specific volume

docker volume rm <volume_name>

# =============================================================================

# 8. QUICK RECOVERY COMMANDS

# =============================================================================

# If something goes wrong:

# 8.1. Fully clean and restart

docker compose down -v
docker compose build --no-cache
docker compose up -d

# 8.2. Reset only database

docker compose down
docker volume rm <project_name>_postgres-db-volume
docker compose up -d

# =============================================================================

# 9. CODESPACES SPECIFIC COMMANDS

# =============================================================================

# 9.1. Check Codespace resources

free -h
df -h
docker stats --no-stream

# 9.2. If port is not accessible

# Check in Ports tab or use:

docker compose port airflow-webserver 8080

# =============================================================================

# 10. PRODUCTION-LIKE COMMANDS

# =============================================================================

# 10.1. Start with specific profile (e.g., flower)

docker compose --profile flower up -d

# 10.2. Environment variable override

AIRFLOW_IMAGE_NAME=apache/airflow:2.9.0 docker compose up -d

# 10.3. Multiple compose files

docker compose -f docker-compose.yaml -f docker-compose.override.yaml up -d

# =============================================================================
# DAILY WORKFLOW SUMMARY
# =============================================================================

echo ""
echo "========================================="
echo "  TYPICAL DAILY WORKFLOW"
echo "========================================="
echo ""
echo "MORNING (Start work):"
echo "  docker compose start"
echo ""
echo "Add/Edit DAGs in ./dags folder"
echo "DAGs are auto-detected (every 30 seconds)"
echo ""
echo "EVENING (End work):"
echo "  docker compose stop"
echo ""
echo "DEBUGGING (If something goes wrong):"
echo "  docker compose logs -f"
echo "  docker compose restart"
echo ""
echo "CLEAN SLATE (Full reset):"
echo "  docker compose down -v"
echo "  docker compose up -d"
echo ""

