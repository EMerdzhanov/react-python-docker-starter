# React + Python Docker Starter

A full-stack application starter template with React frontend, Python Flask backend, and PostgreSQL database, all containerized with Docker.

This script:

1. Creates all the necessary directories and files
2. Sets up a React frontend with connection status checking
3. Configures a Python Flask backend with a health endpoint
4. Creates Docker configuration for both services
5. Adds scripts for local setup and deployment
6. Includes VS Code settings for development
7. Adds a README with instructions

Once you run the setup script (`./scripts/local-setup.sh`), you'll have a fully working frontend and backend. The React app will automatically check the connection to the backend and display a success or error message accordingly.

## Features

- ⚛️ **React Frontend**: Modern frontend setup with live reloading
- 🐍 **Python Backend**: Flask API with automatic restart on code changes
- 🐘 **PostgreSQL Database**: Persistent data storage
- 🐳 **Docker Containers**: Fully containerized for easy development and deployment
- 🔄 **Hot Reloading**: Changes reflect immediately during development
- 🛠️ **Ready-to-use Structure**: Well-organized project structure

## Prerequisites

- [Docker](https://www.docker.com/get-started) (with Docker Compose)
- [Git](https://git-scm.com/downloads)

## Instructions
### 1. Download create_direcory.sh to your local machine
```
Navigate to the directory that has create_directory.sh. IMPORTANT: the script will create the new project in same folder.
```
### 2. Run the script - the scrip will create a folder called "my-web-app"
```
bash ./create_directory.sh
```
### 3. Navigate to "my-web-app":
```
cd my-web-app
```
### 4. Then run the local setup script that was created:
```
./scripts/local-setup.sh
```

Once everything is running, you can access:

Frontend: http://localhost:3000
Backend API health check: http://localhost:5000/api/health

The frontend should automatically check if it can connect to the backend and display a success message if everything is working properly.
