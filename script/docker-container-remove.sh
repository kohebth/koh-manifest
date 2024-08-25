#!/usr/bin/env bash

# Check if a container name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <container_name>"
  exit 1
fi

CONTAINER_NAME="$1"

# Check if the container exists
if [ "$(docker ps -q -f name="$CONTAINER_NAME")" ]; then
  echo "Stopping container '$CONTAINER_NAME'..."
  docker stop "$CONTAINER_NAME"
fi

# Remove the container
if [ "$(docker ps -a -q -f name="$CONTAINER_NAME")" ]; then
  echo "Removing container '$CONTAINER_NAME'..."
  docker rm "$CONTAINER_NAME"
else
  echo "Container '$CONTAINER_NAME' does not exist."
fi

