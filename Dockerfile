# Stage 1: Build the application
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --no-optional --prefer-offline  # Faster, skips optional deps
COPY . .
RUN npm run build

# Stage 2: Production image with minimal footprint
FROM node:18-alpine
WORKDIR /app
ENV NODE_ENV=production  # Ensure production mode
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
RUN npm ci --production --no-optional --prefer-offline
USER node  # Run as non-root for security
CMD ["node", "dist/server.js"]
