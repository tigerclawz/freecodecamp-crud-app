# Simple Dockerfile for a Node.js application
FROM node:18-alpine  # Use Alpine for a smaller base image
WORKDIR /app         # Set working directory
COPY . .             # Copy all files to container
RUN npm ci           # Install dependencies (clean install)
CMD ["npm", "start"] # Start the application
