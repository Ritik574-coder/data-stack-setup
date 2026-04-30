#!/bin/bash

# =============================================================================
# DBT (DATA BUILD TOOL) - CLI COMMANDS CHEAT SHEET
# Supports: PostgreSQL / SQL Server (via adapters)
# Scope: dbt CLI only (no setup, no Docker)
# =============================================================================

echo "========================================="
echo "        DBT CLI COMMANDS - FULL GUIDE"
echo "========================================="

# =============================================================================
# 1. INITIALIZATION
# =============================================================================

# Initialize new dbt project
dbt init <project_name>

# Initialize profiles (interactive setup)
dbt debug

# Check connection to database
dbt debug

# =============================================================================
# 2. PROJECT EXECUTION
# =============================================================================

# Run all models
dbt run

# Run specific model
dbt run --select <model_name>

# Run models with tag
dbt run --select tag:<tag_name>

# Exclude models
dbt run --exclude <model_name>

# Run with full refresh (rebuild tables)
dbt run --full-refresh

# =============================================================================
# 3. TESTING
# =============================================================================

# Run all tests
dbt test

# Run tests for specific model
dbt test --select <model_name>

# =============================================================================
# 4. SEEDS (STATIC DATA)
# =============================================================================

# Load CSV files into database
dbt seed

# Seed specific file
dbt seed --select <seed_name>

# =============================================================================
# 5. SNAPSHOTS (SCD TYPE 2)
# =============================================================================

# Run snapshots
dbt snapshot

# =============================================================================
# 6. DOCUMENTATION
# =============================================================================

# Generate documentation
dbt docs generate

# Serve documentation locally
dbt docs serve

# =============================================================================
# 7. CLEAN & BUILD
# =============================================================================

# Clean compiled files
dbt clean

# Compile SQL without running
dbt compile

# Build (run + test + snapshot)
dbt build

# Build specific model
dbt build --select <model_name>

# =============================================================================
# 8. DEBUGGING & LOGGING
# =============================================================================

# Debug project issues
dbt debug

# Show logs (default path: logs/dbt.log)
cat logs/dbt.log

# Run with verbose logs
dbt run --debug

# =============================================================================
# 9. MODEL SELECTION ADVANCED
# =============================================================================

# Run model + downstream
dbt run --select <model_name>+

# Run model + upstream
dbt run --select +<model_name>

# Run multiple models
dbt run --select model1 model2

# Run by path
dbt run --select path:models/staging

# =============================================================================
# 10. ADAPTER NOTES (PostgreSQL / SQL Server)
# =============================================================================

# PostgreSQL adapter

# pip install dbt-postgres

# SQL Server adapter

# pip install dbt-sqlserver

# NOTE:

# Connections are configured in profiles.yml, not via CLI commands

# =============================================================================
# DAILY WORKFLOW SUMMARY
# =============================================================================

echo ""
echo "========================================="
echo "       TYPICAL DBT WORKFLOW"
echo "========================================="
echo ""
echo "Run models:"
echo "  dbt run"
echo ""
echo "Test models:"
echo "  dbt test"
echo ""
echo "Build everything:"
echo "  dbt build"
echo ""
echo "Debug issues:"
echo "  dbt debug"
echo ""
echo "View docs:"
echo "  dbt docs serve"
echo ""
