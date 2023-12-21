#!/bin/bash

# Find the process ID (PID) of the process containing "hello-application.war"
pid=$(pgrep -f hello-application.war)

if [ -n "$pid" ]; then
  echo "Found process ID: $pid"
  echo "Killing process..."
  kill "$pid"
  echo "Process killed successfully."
else
  echo "No process found with the specified name."
fi

# Change directory to the project
cd /home/joeun/workspace/HelloSpringBoot

# Pull the latest code from the repository
git pull

# Build the project in the background
./gradlew clean build &

# Save the PID of the background process
pid=$!

# Wait for the background process to complete
wait $pid

# Change directory to the build/libs
cd ./build/libs


# Run the application
nohup java -jar hello-application.war &
# java -jar hello-application.war &

