# React + Python Docker Starter

A full-stack application starter template with React frontend, Python Flask backend, and PostgreSQL database, all containerized with Docker.

├── my-web-app
│   ├── frontend
│   │   ├── public
│   │   │   ├── index.html
│   │   │   ├── images/
│   │   │   ├── css/
│   │   ├── src
│   │   │   ├── components/
│   │   │   ├── pages/
│   │   │   ├── App.js
│   │   │   ├── index.js
│   │   ├── package.json
│   │   ├── .env.development
│   │   ├── .env.production
│   ├── backend
│   │   ├── src
│   │   │   ├── controllers/
│   │   │   ├── models/
│   │   │   ├── routes/
│   │   │   ├── middleware/
│   │   │   ├── utils/
│   │   │   ├── config/
│   │   │   ├── main.py
│   │   ├── requirements.txt
│   │   ├── Pipfile
│   │   ├── .env.development
│   │   ├── .env.production
│   │   ├── tests/
│   ├── db
│   │   ├── migrations/
│   │   ├── seeds/
│   │   ├── init.sql
│   ├── docker
│   │   ├── Dockerfile.frontend
│   │   ├── Dockerfile.backend
│   │   ├── docker-compose.yml
│   ├── infrastructure
│   │   ├── aws
│   │   │   ├── cloudformation
│   │   │   │   ├── template.yaml
│   │   │   ├── terraform
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   ├── nginx
│   │   │   ├── app.conf
│   ├── scripts
│   │   ├── deploy.sh
│   │   ├── local-setup.sh
│   │   ├── db_seed.py
│   ├── .gitignore
│   ├── README.md

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
