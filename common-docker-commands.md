## Common Docker Commands

### Start the docker application

```
docker-compose up -d
```

### View logs for the running docler 
```
docker-compose logs -f
```

### Stop the stop application
```
docker-compose down
```

### Rebuild containers
```
docker-compose build
```

### Reset everything (including database)
```
docker-compose down -v
```

## A Few More Handy Commands

### Check running services:
```
docker-compose ps
```
### Run a one-off command in a container:

```
docker-compose exec backend bash
```

### Prune unused Docker objects (containers, images, networks):

```
docker system prune
```

###Remove only stopped containers:

```
docker container prune
```