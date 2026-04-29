####################################################################################
# PROJECT SETUP: requirement tools for data pipeline (Docker + Python + SQL Server)
# Author: Ritik
# Purpose: Setup virtual environment, install dependencies, configure database
#          credentials, and run the pipeline script.
####################################################################################



################################################################################
################### DOCKER INSTRALLITION AND SETUP #############################
################################################################################
#Install dependencies
sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release

#Adding Docker official GPG key
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Adding Docker repository
echo \
"deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Starting and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

#Fixing permission
sudo usermod -aG docker $USER

# Verify versions
docker --version
docker compose version

################################################################################
################### MSSQL INSTRALLITION AND SETUP ##############################
################################################################################
# Pulling SQL Server image
docker pull mcr.microsoft.com/mssql/server:2022-latest

# creting and running container
docker run -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=Ritik@843313" \
    -p 1433:1433 \
    --name sqlserver \
    -v sql_data:/var/opt/mssql \
    -d mcr.microsoft.com/mssql/server:2022-latest

# Check running containers
docker ps

# Check all containers 
docker ps -a

# Check downloaded images
docker images

# Check Docker volumes 
docker volume ls

# Start container 
docker start sqlserver

# Stop container
docker stop sqlserver

# Access container terminal
docker exec -it -u root sqlserver bash


# Add Microsoft repo
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

# Update
sudo apt update

# Install ODBC Driver 18 
sudo ACCEPT_EULA=Y apt install msodbcsql18

# Optional but useful tools
sudo apt install unixodbc-dev

# This opens SQL CLI (sqlcmd)
docker exec -it sqlserver /opt/mssql-tools/bin/sqlcmd 
-S localhost -U sa -P "Ritik@843313"

################################################################################
######################## DATABASE AND PYTHON SETUP #############################
################################################################################

# creating python virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install pyodbc for SQL Server connection
pip install pyodbc

# Set environment variables for database connection
nano ~/.bashrc

# Add the following lines at the end of the file
export DB_USER=sa
export DB_PASSWORD=Ritik@843313

# Load variables from ~/.bashrc
source ~/.bashrc

# Verify environment variables
echo $DB_USER
echo $DB_PASSWORD

################################################################################
########################### AIRFLOW AND DAGS SETUP #############################
################################################################################
# Creating a filder for airflow 
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

# user for stoping docker compose
docker compose stop

# Use for starring docker compose
docker compose start
