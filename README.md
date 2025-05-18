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

## Getting Started

### Clone the repo  
```bash
git clone https://github.com/emerdzhanov/react-python-docker-starter
.git
cd react-python-docker-starter
