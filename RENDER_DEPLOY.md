# Deploying to Render.com - Troubleshooting Guide

If you're experiencing the "Bad Gateway" error when deploying to Render.com, follow these steps to resolve the issue:

## Option 1: Manual Deployment (Recommended)

1. **Create a New Web Service**
   - Log into Render.com
   - Click "New" and select "Web Service"
   - Connect your GitHub repository or use "Deploy from existing repository"

2. **Configure the Service**
   - **Name**: `yahoo-finance-scraper` (or any name you prefer)
   - **Region**: Select a region close to your location
   - **Branch**: `main` (or your main branch)
   - **Root Directory**: Leave empty
   - **Runtime**: `Python 3`
   - **Build Command**: `pip install -r render_requirements.txt`
   - **Start Command**: `gunicorn --bind 0.0.0.0:$PORT --reuse-port main:app`

3. **Environment Variables**
   - Add `SESSION_SECRET` with a secure random string (use the "Generate" button)
   - Add `FLASK_ENV` with value `production`

4. **Click "Create Web Service"**

## Option 2: Using Blueprint (render.yaml)

1. **Push the render.yaml to your repository**
   - The render.yaml file in this project configures the deployment automatically

2. **Create a New Blueprint Instance on Render.com**
   - Log into Render.com
   - Click "New" and select "Blueprint"
   - Connect to the repository containing your render.yaml file
   - Follow the prompts to deploy

## Troubleshooting Common Issues

1. **Bad Gateway Errors**
   - Check the service logs in Render dashboard
   - Look for Python exceptions or startup errors
   - Verify your start command is correct
   - Ensure all required packages are in render_requirements.txt

2. **Application Errors**
   - If the application starts but shows errors:
     - Verify environment variables are set correctly
     - Check if Yahoo Finance is blocking requests from Render.com IPs
     - Try using the yfinance API fallback

3. **Slow First Load**
   - On free tier, Render spins down services after inactivity
   - First request after inactivity will be slow (30-60 seconds)
   - Upgrade to a paid plan to avoid spin-down

## Important Files for Deployment

- `render_requirements.txt`: Contains all required Python packages
- `main.py`: Entry point for gunicorn
- `Procfile`: Alternative way to specify start command
- `render.yaml`: Blueprint configuration

If issues persist, contact Render.com support with your specific error logs.