#!/bin/bash

set -e  # Exit if any something fails

ARTIFACT="meteorite-scripts.zip"
DEPLOY_DIR="/tmp/meteorite-app"

echo "Starting..."
echo "Creating folder at $DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"

echo "Copying $ARTIFACT to $DEPLOY_DIR"
cp "$ARTIFACT" "$DEPLOY_DIR"

echo "Unzipping artifact..."
unzip -o "$DEPLOY_DIR/$ARTIFACT" -d "$DEPLOY_DIR"

echo "Deployment successfull. Files should be available at $DEPLOY_DIR"
