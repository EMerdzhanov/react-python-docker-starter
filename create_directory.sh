#!/bin/bash

# Project name
PROJECT_NAME="my-web-app"

echo "🚀 Creating project: $PROJECT_NAME"

# Create the main project directory
mkdir -p $PROJECT_NAME

# Create frontend structure
mkdir -p $PROJECT_NAME/frontend/public/{images,css}
mkdir -p $PROJECT_NAME/frontend/src/{components,pages}

# Create backend structure
mkdir -p $PROJECT_NAME/backend/src/{controllers,models,routes,middleware,utils,config}
mkdir -p $PROJECT_NAME/backend/tests

# Create db structure
mkdir -p $PROJECT_NAME/db/{migrations,seeds}

# Create docker structure
mkdir -p $PROJECT_NAME/docker

# Create infrastructure structure
mkdir -p $PROJECT_NAME/infrastructure/aws/cloudformation
mkdir -p $PROJECT_NAME/infrastructure/aws/terraform
mkdir -p $PROJECT_NAME/infrastructure/nginx

# Create scripts
mkdir -p $PROJECT_NAME/scripts

# ===== Frontend Configuration =====
echo "📦 Setting up React frontend..."

# package.json
cat > $PROJECT_NAME/frontend/package.json << 'EOF'
{
  "name": "frontend",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@testing-library/jest-dom": "^5.16.5",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "axios": "^1.4.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "web-vitals": "^2.1.4"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "proxy": "http://backend:5000"
}
EOF

# index.html
cat > $PROJECT_NAME/frontend/public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web app created with React and Python"
    />
    <title>React + Python App</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
EOF

# index.js
cat > $PROJECT_NAME/frontend/src/index.js << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

# index.css
cat > $PROJECT_NAME/frontend/src/index.css << 'EOF'
body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.app-container {
  padding: 2rem;
  max-width: 800px;
  margin: 0 auto;
}

.connection-status {
  margin-top: 2rem;
  padding: 1rem;
  border-radius: 4px;
}

.success {
  background-color: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.error {
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
}

.loading {
  background-color: #cce5ff;
  color: #004085;
  border: 1px solid #b8daff;
}
EOF

# App.js
cat > $PROJECT_NAME/frontend/src/App.js << 'EOF'
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './index.css';

function App() {
  const [connectionStatus, setConnectionStatus] = useState('loading');
  const [message, setMessage] = useState('Checking connection to backend...');

  useEffect(() => {
    const checkBackendConnection = async () => {
      try {
        const response = await axios.get('/api/health');
        if (response.data.status === 'ok') {
          setConnectionStatus('success');
          setMessage(`Backend connected successfully! Message: ${response.data.message}`);
        } else {
          setConnectionStatus('error');
          setMessage('Backend connection established but returned an error status.');
        }
      } catch (error) {
        console.error('Backend connection failed:', error);
        setConnectionStatus('error');
        setMessage('Failed to connect to backend. Make sure the backend service is running.');
      }
    };

    checkBackendConnection();
  }, []);

  return (
    <div className="app-container">
      <h1>React + Python Starter App</h1>
      <p>This is a starter template for a React frontend with a Python backend.</p>
      
      <div className={`connection-status ${connectionStatus}`}>
        <h2>Backend Connection Status</h2>
        <p>{message}</p>
      </div>
    </div>
  );
}

export default App;
EOF

# .env files
cat > $PROJECT_NAME/frontend/.env.development << 'EOF'
REACT_APP_API_URL=http://localhost:5000
EOF

cat > $PROJECT_NAME/frontend/.env.production << 'EOF'
REACT_APP_API_URL=/api
EOF

# ===== Backend Configuration =====
echo "🐍 Setting up Python backend..."

# requirements.txt
cat > $PROJECT_NAME/backend/requirements.txt << 'EOF'
flask==2.3.2
flask-cors==4.0.0
gunicorn==20.1.0
python-dotenv==1.0.0
EOF

# Pipfile
cat > $PROJECT_NAME/backend/Pipfile << 'EOF'
[[source]]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[packages]
flask = "==2.3.2"
flask-cors = "==4.0.0"
gunicorn = "==20.1.0"
python-dotenv = "==1.0.0"

[dev-packages]
pytest = "*"

[requires]
python_version = "3.9"
EOF

# main.py
cat > $PROJECT_NAME/backend/src/main.py << 'EOF'
from flask import Flask, jsonify
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)

@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({
        'status': 'ok',
        'message': 'Hello from the Python backend!'
    })

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
EOF

# .env files
cat > $PROJECT_NAME/backend/.env.development << 'EOF'
DEBUG=True
PORT=5000
DATABASE_URL=sqlite:///dev.db
EOF

cat > $PROJECT_NAME/backend/.env.production << 'EOF'
DEBUG=False
PORT=5000
DATABASE_URL=sqlite:///prod.db
EOF

# ===== Docker Configuration =====
echo "🐳 Configuring Docker..."

# Dockerfile.frontend
cat > $PROJECT_NAME/docker/Dockerfile.frontend << 'EOF'
FROM node:18-alpine

WORKDIR /app

COPY frontend/package.json ./

# Change from npm ci to npm install
RUN npm install

COPY frontend/ ./

EXPOSE 3000

CMD ["npm", "start"]
EOF

# Dockerfile.backend
cat > $PROJECT_NAME/docker/Dockerfile.backend << 'EOF'
FROM python:3.9-slim

WORKDIR /app

COPY backend/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY backend/ .

EXPOSE 5000

CMD ["python", "src/main.py"]
EOF

# docker-compose.yml
cat > $PROJECT_NAME/docker/docker-compose.yml << 'EOF'
version: '3.8'

services:
  frontend:
    build:
      context: ..
      dockerfile: docker/Dockerfile.frontend
    ports:
      - "3000:3000"
    volumes:
      - ../frontend:/app
      - /app/node_modules
    environment:
      - NODE_ENV=development
      - CHOKIDAR_USEPOLLING=true
    depends_on:
      - backend

  backend:
    build:
      context: ..
      dockerfile: docker/Dockerfile.backend
    ports:
      - "5000:5000"
    volumes:
      - ../backend:/app
    environment:
      - FLASK_ENV=development
      - FLASK_APP=src/main.py
      - FLASK_DEBUG=1

networks:
  default:
    driver: bridge
EOF

# ===== DB Configuration =====
cat > $PROJECT_NAME/db/init.sql << 'EOF'
-- Initialize your database schema here
CREATE TABLE IF NOT EXISTS example (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add some sample data
INSERT INTO example (name) VALUES ('Sample Item 1');
INSERT INTO example (name) VALUES ('Sample Item 2');
EOF

# ===== Nginx Configuration =====
cat > $PROJECT_NAME/infrastructure/nginx/app.conf << 'EOF'
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://frontend:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api {
        proxy_pass http://backend:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

# ===== Script Configuration =====
cat > $PROJECT_NAME/scripts/local-setup.sh << 'EOF'
#!/bin/bash

echo "Setting up local development environment..."

# Navigate to the docker directory
cd $(dirname "$0")/../docker

# Start the Docker containers
docker-compose up -d

echo "🚀 Services are starting..."
echo "⏳ Waiting for services to be ready..."
sleep 5

echo "✅ Frontend is running at: http://localhost:3000"
echo "✅ Backend is running at: http://localhost:5000/api/health"
echo "✅ All services are up and running!"
EOF
chmod +x $PROJECT_NAME/scripts/local-setup.sh

cat > $PROJECT_NAME/scripts/deploy.sh << 'EOF'
#!/bin/bash

echo "Deploying application..."
echo "This is a placeholder script. Customize for your deployment process."

# Example deployment steps:
# 1. Build frontend
# 2. Build backend
# 3. Push Docker images to registry
# 4. Deploy to infrastructure using Terraform or CloudFormation
EOF
chmod +x $PROJECT_NAME/scripts/deploy.sh

cat > $PROJECT_NAME/scripts/db_seed.py << 'EOF'
#!/usr/bin/env python3
"""
Database seeding script.
Run this to populate your database with initial data.
"""
import sqlite3
import os
import sys

# Add parent directory to path to allow imports from backend
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# This is just an example - modify based on your actual database setup
def seed_database():
    print("Seeding database...")
    
    # Create a database connection
    conn = sqlite3.connect('../db/dev.db')
    cursor = conn.cursor()
    
    # Read and execute SQL from init.sql
    with open('../db/init.sql', 'r') as sql_file:
        sql_script = sql_file.read()
        cursor.executescript(sql_script)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print("Database seeded successfully!")

if __name__ == "__main__":
    seed_database()
EOF
chmod +x $PROJECT_NAME/scripts/db_seed.py

# ===== Root Configuration =====
cat > $PROJECT_NAME/.gitignore << 'EOF'
# dependencies
node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
*.egg-info/
.installed.cfg
*.egg

# Virtualenv
venv/
ENV/

# Database
*.db
*.sqlite3

# VSCode
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
*.code-workspace
.history/
EOF

cat > $PROJECT_NAME/README.md << 'EOF'
# React + Python Full Stack Starter

A starter template for building a full-stack application with React frontend and Python Flask backend.

## Structure
