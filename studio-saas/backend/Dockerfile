FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY server.js ./
COPY data/ ./data/

# Create data directory
RUN mkdir -p data

# Expose port
EXPOSE 3000

# Start server
CMD ["node", "server.js"]