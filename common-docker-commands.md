# Start the application
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the application
docker-compose down

# Rebuild containers
docker-compose build

# Reset everything (including database)
docker-compose down -v
