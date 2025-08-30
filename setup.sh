#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Prompt the user for an API key
read -p "Enter your API key: " ABS_API_KEY

# Save the API key to .env (create or overwrite)
echo "ABS_API_KEY=$ABS_API_KEY" > .env
echo ".env file updated with your API key."

# Generate Prisma client
echo "Generating Prisma client..."
npx prisma generate

# Push database schema
echo "Pushing database schema..."
npx prisma db push

# Seed database with sample data
echo "Seeding database with sample data..."
npx prisma db seed

echo "Setup complete!"
