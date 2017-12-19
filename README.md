# docker-mongo-auth
A Docker Image for MongoDB which extends the default MongoDB docker image.
It facilitates adding a Database and a DB Owner username and password when the container is first launched.

# Customization
There are a number of environment variables which you can specify to customize the username and passwords of your users. 

- With Dockerfile
  ```
  // Auth Configuration.
  // Environment variables may be specified through command line or docker-compose

  // These environment variables are from the base docker image entry-point script. 
  # ENV MONGO_INITDB_ROOT_USERNAME root
  # ENV MONGO_INITDB_ROOT_PASSWORD password

  // These environment variables are used in the derived docker image. 
  # ENV MONGO_APPDB_NAME your_db
  # ENV MONGO_APPDB_USERNAME user
  # ENV MONGO_APPDB_PASSWORD password
  ```
  
- With docker-compose.yml
  ```
  services:
    db:
      image: Alpha-health/docker-mongo-auth:latest
      environment:
        - MONGO_INITDB_ROOT_USERNAME=admin
        - MONGO_INITDB_ROOT_PASSWORD=admin123
        - MONGO_APPDB_NAME=sample
        - MONGO_APPDB_USERNAME=aashrey
        - MONGO_APPDB_PASSWORD=admin123
      ports:
        - "27017:27017"
  // more configuration
  ```

- With command line
  ```
  docker run -it \
    -e AUTH=yes \
    -e MONGO_INITDB_ROOT_USERNAME=admin \
    -e MONGO_INITDB_ROOT_PASSWORD=adminpass \
    -e MONGO_APPDB_NAME=mytestdatabase \
    -e MONGO_APPDB_USERNAME=testuser \
    -e MONGO_APPDB_PASSWORD=testpass \
    -p 27017:27017 Alpha-health/docker-mongo-auth:latest
  ```

