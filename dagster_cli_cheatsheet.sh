#!/bin/bash

# =============================================================================
# DAGSTER - CLI COMMANDS CHEAT SHEET
# Scope: Dagster CLI only (no Docker, no setup)
# =============================================================================

echo "========================================="
echo "        DAGSTER CLI COMMANDS - FULL GUIDE"
echo "========================================="

# =============================================================================
# 1. PROJECT INITIALIZATION
# =============================================================================

# Create a new Dagster project
dagster project scaffold --name <project_name>

# Create example project
dagster project from-example --name <project_name> --example <example_name>

# =============================================================================
# 2. DEVELOPMENT SERVER
# =============================================================================

# Start Dagster development UI (Dagit)
dagster dev

# Start Dagster UI with specific file
dagster dev -f <file.py>

# Start with specific module
dagster dev -m <module_name>

# =============================================================================
# 3. JOB EXECUTION
# =============================================================================

# Execute a job
dagster job execute -f <file.py> -j <job_name>

# Execute job with config file
dagster job execute -f <file.py> -j <job_name> -c config.yaml

# List jobs
dagster job list -f <file.py>

# =============================================================================
# 4. ASSETS MANAGEMENT
# =============================================================================

# Materialize assets
dagster asset materialize -f <file.py>

# Materialize specific asset
dagster asset materialize -f <file.py> --select <asset_name>

# List assets
dagster asset list -f <file.py>

# =============================================================================
# 5. SCHEDULES & SENSORS
# =============================================================================

# List schedules
dagster schedule list -f <file.py>

# Start schedule
dagster schedule start <schedule_name>

# Stop schedule
dagster schedule stop <schedule_name>

# List sensors
dagster sensor list -f <file.py>

# Start sensor
dagster sensor start <sensor_name>

# Stop sensor
dagster sensor stop <sensor_name>

# =============================================================================
# 6. BACKFILL & RUNS
# =============================================================================

# Launch backfill
dagster job backfill -f <file.py> -j <job_name> 
--start <start_partition> --end <end_partition>

# List runs
dagster run list

# Delete run
dagster run delete <run_id>

# =============================================================================
# 7. DEBUGGING & LOGS
# =============================================================================

# Check Dagster environment info
dagster info

# Validate definitions
dagster definitions validate -f <file.py>

# Print config schema
dagster job print-config-schema -f <file.py> -j <job_name>

# =============================================================================
# 8. CONFIGURATION
# =============================================================================

# Run with environment variables
DAGSTER_HOME=~/dagster_home dagster dev

# =============================================================================
# 9. CLEANUP
# =============================================================================

# Wipe all runs (⚠ destructive)
dagster instance wipe

# =============================================================================
# DAILY WORKFLOW SUMMARY
# =============================================================================

echo ""
echo "========================================="
echo "        TYPICAL DAGSTER WORKFLOW"
echo "========================================="
echo ""
echo "Start development server:"
echo "  dagster dev"
echo ""
echo "Execute job:"
echo "  dagster job execute -f <file.py> -j <job_name>"
echo ""
echo "Materialize assets:"
echo "  dagster asset materialize -f <file.py>"
echo ""
echo "Check runs:"
echo "  dagster run list"
echo ""
echo "Debug:"
echo "  dagster info"
echo ""
