# Simple Dockerfile for a Node.js application
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm ci
CMD ["npm", "start"]
