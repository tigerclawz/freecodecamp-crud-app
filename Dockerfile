# Stage 1: Build the application
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --no-optional --prefer-offline
COPY . .
RUN npm run build

# Stage 2: Production image with minimal footprint
FROM node:18-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
RUN npm ci --production --no-optional --prefer-offline
USER node
CMD ["node", "dist/server.js"]
