#!/bin/bash

#Run the script with sudo permissions

BACKEND_SERVER_LOCATION="/home/emmanuel-stanley/Downloads/apache-tomcat-9.0.84/webapps"
FRONTEND_SERVER_LOCATION="/var/www/html/"
# Build and package the backend Spring Boot application
echo "Building the spring application in a war..."
cd backend || exit
mvn clean package

if [ $? -ne 0 ]; then
    echo "Error: Failed to deploy spring application."
    exit 1
fi

# Deploy the WAR file to Tomcat
cp target/backend-0.0.1-SNAPSHOT.jar "$BACKEND_SERVER_LOCATION"

cd ..

echo "Building the react application for nginx..."
cd frontend || exit
# Build the frontend application
npm install
npm run build

if [ $? -ne 0 ]; then
    echo "Error: Failed to build react project."
    exit 1
fi

# Deploy the built files to the web server
sudo cp -r build/* "$FRONTEND_SERVER_LOCATION"

echo "Project successfully deployed."
