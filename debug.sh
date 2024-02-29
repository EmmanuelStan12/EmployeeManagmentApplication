#!/bin/bash

# Start Spring Boot backend in debug mode
echo "Starting Java Spring Boot backend in debug mode..."
cd backend || exit
mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005" &

# Check if Maven build was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to start spring boot application."
    exit 1
fi

# Wait for backend to start
sleep 30

# Start React frontend
echo "Starting React frontend..."
cd ../frontend || exit
npm start

echo "Project started in debug mode."
