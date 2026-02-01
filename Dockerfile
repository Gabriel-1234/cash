# Multi-stage build for the complete application

# Stage 1: Build frontend
FROM node:18-alpine as frontend-builder
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
RUN chmod +x node_modules/.bin/vite
COPY frontend/ .
RUN npm run build

# Stage 2: Setup backend
FROM node:18-alpine as backend-builder
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm install

# Stage 3: Final image
FROM node:18-alpine
WORKDIR /app

# Install PM2 globally for process management
RUN npm install -g pm2

# Copy backend
COPY --from=backend-builder /app/backend /app/backend
COPY backend/ /app/backend/

# Copy built frontend to public folder for serving
RUN mkdir -p /app/public
COPY --from=frontend-builder /app/frontend/dist /app/public

# Copy environment file
COPY .env /app/

EXPOSE 5002

# Set working directory to backend
WORKDIR /app/backend

# Start the backend server
CMD ["node", "server.js"]
