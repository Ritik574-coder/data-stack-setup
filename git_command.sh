#!/bin/bash

##############################################################################
############################## GIT COMMAND GUIDE #############################
##############################################################################

# Exit immediately if any command fails

set -e

# python file execute command 

python weather_data_pipeline/api_request/insert_request.py
##############################################################################

# 1. INITIAL SETUP (RUN ONLY ONCE)

##############################################################################

# Set your Git username

git config --global user.name "Ritik"

# Set your Git email

git config --global user.email "[your-email@example.com](mailto:your-email@example.com)"

# Check Git configuration

git config --list

##############################################################################

# 2. CLONE REPOSITORY

##############################################################################

# Clone a repository from GitHub

git clone https://github.com/username/repo.git

# Move into project directory

cd repo

##############################################################################

# 3. CHECK STATUS & HISTORY

##############################################################################

# Check current status of files

git status

# View commit history

git log --oneline

##############################################################################

# 4. CREATE AND SWITCH BRANCH

##############################################################################

# Create a new branch and switch to it

git checkout -b feature-xyz

# Switch to existing branch

git checkout main

##############################################################################

# 5. ADD, COMMIT, PUSH CHANGES

##############################################################################

# Add all changed files

git add .

# Add specific file

git add filename.py

# Commit changes with message

git commit -m "Add new feature or fix bug"

# Push branch to remote repository

git push origin feature-xyz

##############################################################################

# 6. PULL LATEST CHANGES

##############################################################################

# Get latest changes from remote

git pull origin main

##############################################################################

# 7. MERGE BRANCH (LOCAL MERGE)

##############################################################################

# Switch to main branch

git checkout main

# Merge feature branch into main

git merge feature-xyz

# Push updated main branch

git push origin main

##############################################################################

# 8. DELETE BRANCH

##############################################################################

# Delete local branch

git branch -d feature-xyz

# Delete remote branch

git push origin --delete feature-xyz

##############################################################################

# 9. REMOTE MANAGEMENT

##############################################################################

# Check remote repositories

git remote -v

# Add upstream (original repo)

git remote add upstream https://github.com/original/repo.git

# Fetch upstream changes

git fetch upstream

# Merge upstream changes into main

git merge upstream/main

##############################################################################

# 10. STASH (SAVE TEMP WORK)

##############################################################################

# Save uncommitted changes

git stash

# Apply last stash

git stash apply

# List all stashes

git stash list

##############################################################################

# 11. GITHUB CLI (ISSUE MANAGEMENT)

##############################################################################

# Install GitHub CLI (if not installed)

sudo apt install gh

# Authenticate GitHub CLI

gh auth login

# Set default repository (important)

gh repo set-default username/repo

# Create a new issue

gh issue create 
--title "Issue title" 
--body "Describe the problem or feature request"

# List all issues

gh issue list

# View a specific issue

gh issue view 1

# Close an issue

gh issue close 1

##############################################################################

# 12. GITHUB CLI (PULL REQUEST AND BRANCH MANAGEMENT)

##############################################################################

gh pr create \
  --base main \
  --head Ritik574-coder:feature-xyz \
  --title "Add setup script for data engineering environment" \
  --body "Added fully commented setup_commands.sh for Docker, Python, and Java setup."


git checkout feature-xyz      # switch to correct branch
git pull origin feature-xyz  # latest le lo

# ab changes lao main se
git merge main

git push origin feature-xyz
##############################################################################

# END OF GIT + GITHUB COMMANDS

##############################################################################