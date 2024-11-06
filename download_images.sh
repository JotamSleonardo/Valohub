#!/bin/bash

# API endpoint for Valorant agents
URL="https://valorant-api.com/v1/agents"

# Directory to save downloaded images
OUTPUT_DIR="./images"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Fetch the JSON response from the API
RESPONSE=$(curl -s $URL)

# Loop through each agent and download the images with a unique name
echo $RESPONSE | jq -c '.data[]' | while read -r AGENT; do
    # Extract necessary details for the filename
    DISPLAY_NAME=$(echo $AGENT | jq -r '.displayName' | tr ' ' '_') # Handle spaces
    UUID=$(echo $AGENT | jq -r '.uuid')
    IMAGE_URL=$(echo $AGENT | jq -r '.fullPortraitV2')

    # If the image URL exists, download the image
    if [[ ! -z "$IMAGE_URL" ]]; then
        # Save with a unique filename including display name and UUID
        FILENAME="${DISPLAY_NAME}.png"
        echo "Downloading $FILENAME..."
        curl -s -o "$OUTPUT_DIR/$FILENAME" "$IMAGE_URL"
    fi
done

echo "Images downloaded successfully."
