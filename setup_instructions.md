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
### 4. Local development - run the local setup script (this will be alredy on you my-web-app directory):
```
./scripts/local-setup.sh
```

Once everything is running, you can access:

- Frontend: http://localhost:3000
- Backend API health check: http://localhost:5000/api/health

The frontend should automatically check if it can connect to the backend and display a success message if everything is working properly.
