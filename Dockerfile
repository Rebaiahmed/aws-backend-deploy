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
