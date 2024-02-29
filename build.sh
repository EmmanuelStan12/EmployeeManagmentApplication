#!/bin/bash

# Clean and build Java Spring Boot project with Maven
echo "Cleaning and building Java Spring Boot project..."
cd backend || exit
mvn clean install

# Check if Maven build was successful
if [ $? -ne 0 ]; then
    echo "Error: Maven build failed."
    exit 1
fi

# Move back to the main project directory
cd ..

# Install dependencies for the frontend, the project was ran using node v21.4.0, however any version from v14 should work
echo "Installing dependencies for React frontend..."
cd frontend || exit
npm install

# Check if npm install was successful
if [ $? -ne 0 ]; then
    echo "Error: npm install failed."
    exit 1
fi

# Move back to the main project directory
cd ..

echo "Project setup complete."
