#!/bin/bash

# Script to prepare files for Render.com deployment
# This will create a clean zip file with only the necessary files

echo "Creating deployment package for Render.com..."

# Create a temporary directory
TEMP_DIR="render_deploy"
mkdir -p $TEMP_DIR

# Copy essential files
echo "Copying essential files..."
cp -r templates $TEMP_DIR/
cp -r static $TEMP_DIR/
cp app.py $TEMP_DIR/
cp main.py $TEMP_DIR/
cp yahoo_scraper.py $TEMP_DIR/
cp alternative_api.py $TEMP_DIR/
cp render_requirements.txt $TEMP_DIR/
cp render.yaml $TEMP_DIR/
cp Procfile $TEMP_DIR/
cp RENDER_DEPLOY.md $TEMP_DIR/README.md

# Create a ZIP file
echo "Creating ZIP file..."
ZIP_FILE="yahoo_finance_scraper_render.zip"
cd $TEMP_DIR
zip -r ../$ZIP_FILE .
cd ..

# Clean up
echo "Cleaning up..."
rm -rf $TEMP_DIR

echo "Deployment package created: $ZIP_FILE"
echo "Upload this file to Render.com or follow the instructions in RENDER_DEPLOY.md"