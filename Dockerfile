# Base image
FROM node:18-alpine

# Set working dir
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source
COPY . .

# Build project
RUN npm run build

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "dist/main"]


HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

