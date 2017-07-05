# docker-mongo-auth
A Docker Image for MongoDB which makes it easy to create an Admin, a Database and a Database User when the container is first launched.

# Customization
The Dockerfile contains a number of enviroment variables which you can customize to set up Mongo.

```
// Auth Configuration. Modify as needed. 
// These environment variables can also be specified through command line or docker-compose configuration
# ENV AUTH yes

# ENV MONGODB_ADMIN_USER root
# ENV MONGODB_ADMIN_PASS password

# ENV MONGODB_APPLICATION_DATABASE your_db
# ENV MONGODB_APPLICATION_USER user
# ENV MONGODB_APPLICATION_PASS password
```

Find the image on Docker Cloud @ https://cloud.docker.com/swarm/aashreys/repository/docker/aashreys/mongo-auth
