#!/bin/bash

# =============================================================================

# APACHE AIRFLOW - CLI COMMANDS CHEAT SHEET

# Scope: Airflow CLI only (no Docker commands)

# =============================================================================

echo "========================================="
echo "   AIRFLOW CLI COMMANDS - FULL GUIDE"
echo "========================================="

# =============================================================================

# 1. DAG MANAGEMENT

# =============================================================================

# List all DAGs

airflow dags list

# Show details of a specific DAG

airflow dags show <dag_id>

# Trigger a DAG manually

airflow dags trigger <dag_id>

# Pause a DAG

airflow dags pause <dag_id>

# Unpause a DAG

airflow dags unpause <dag_id>

# Delete a DAG (removes metadata, not code)

airflow dags delete <dag_id>

# List DAG runs

airflow dags list-runs -d <dag_id>

# Backfill DAG (run for past dates)

airflow dags backfill <dag_id> -s <start_date> -e <end_date>

# =============================================================================

# 2. TASK MANAGEMENT

# =============================================================================

# List tasks in a DAG

airflow tasks list <dag_id>

# Show task details

airflow tasks state <dag_id> <task_id> <execution_date>

# Run a single task manually

airflow tasks run <dag_id> <task_id> <execution_date>

# Test a task (no state change)

airflow tasks test <dag_id> <task_id> <execution_date>

# Clear task instances (reset state)

airflow tasks clear <dag_id>

# =============================================================================

# 3. CONNECTIONS

# =============================================================================

# List all connections

airflow connections list

# Get connection details

airflow connections get <conn_id>

# Add a connection

airflow connections add <conn_id> 
--conn-type <type> 
--conn-host <host> 
--conn-login <user> 
--conn-password <password> 
--conn-port <port>

# Delete a connection

airflow connections delete <conn_id>

# =============================================================================

# 4. VARIABLES

# =============================================================================

# List variables

airflow variables list

# Get variable value

airflow variables get <key>

# Set variable

airflow variables set <key> <value>

# Delete variable

airflow variables delete <key>

# =============================================================================

# 5. USERS (RBAC)

# =============================================================================

# Create user

airflow users create 
--username <username> 
--firstname <first_name> 
--lastname <last_name> 
--role Admin 
--email <email> 
--password <password>

# List users

airflow users list

# Delete user

airflow users delete --username <username>

# =============================================================================

# 6. SCHEDULER & SERVICES

# =============================================================================

# Start scheduler

airflow scheduler

# Start webserver

airflow webserver

# Start worker (CeleryExecutor)

airflow celery worker

# Start flower (monitoring UI)

airflow celery flower

# =============================================================================

# 7. DATABASE

# =============================================================================

# Initialize database

airflow db init

# Upgrade database

airflow db upgrade

# Reset database (⚠ deletes all metadata)

airflow db reset

# Check database

airflow db check

# =============================================================================

# 8. CONFIGURATION

# =============================================================================

# Show current config

airflow config list

# Get specific config value

airflow config get-value <section> <key>

# =============================================================================

# 9. LOGS & DEBUGGING

# =============================================================================

# View task logs

airflow tasks logs <dag_id> <task_id> <execution_date>

# Show DAG structure (graph view in CLI)

airflow dags show <dag_id>

# =============================================================================

# 10. EXTENSIONS & INFO

# =============================================================================

# Show Airflow version

airflow version

# Show installed providers

airflow providers list

# Show info about environment

airflow info

# =============================================================================

# DAILY WORKFLOW SUMMARY

# =============================================================================

echo ""
echo "========================================="
echo "   TYPICAL AIRFLOW CLI WORKFLOW"
echo "========================================="
echo ""
echo "Trigger DAG:"
echo "  airflow dags trigger <dag_id>"
echo ""
echo "Check DAG runs:"
echo "  airflow dags list-runs -d <dag_id>"
echo ""
echo "Check task status:"
echo "  airflow tasks state <dag_id> <task_id> <execution_date>"
echo ""
echo "Debug task:"
echo "  airflow tasks test <dag_id> <task_id> <execution_date>"
echo ""
