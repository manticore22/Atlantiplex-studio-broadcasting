#!/bin/bash

# Atlantiplex Studio SaaS - Deployment Script
# Usage: ./deploy.sh

set -e

echo "🚀 Deploying Atlantiplex Studio SaaS..."

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if .env exists
if [ ! -f backend/.env ]; then
    echo -e "${RED}Error: backend/.env not found${NC}"
    echo "Please copy backend/.env.example to backend/.env and configure it"
    exit 1
fi

# Create necessary directories
echo -e "${BLUE}Creating directories...${NC}"
mkdir -p backend/data
mkdir -p backend/uploads/{avatars,scenes,streams}
mkdir -p nginx/ssl

# Build and start containers
echo -e "${BLUE}Building and starting containers...${NC}"
docker-compose down 2>/dev/null || true
docker-compose build --no-cache
docker-compose up -d

# Wait for services to be ready
echo -e "${BLUE}Waiting for services to start...${NC}"
sleep 5

# Check if services are running
echo -e "${BLUE}Checking service status...${NC}"
if docker-compose ps | grep -q "Up"; then
    echo -e "${GREEN}✅ All services are running!${NC}"
else
    echo -e "${RED}❌ Some services failed to start${NC}"
    docker-compose logs
    exit 1
fi

echo ""
echo -e "${GREEN}🎉 Deployment complete!${NC}"
echo ""
echo "Studio is available at:"
echo "  https://studio.verilysovereign.online"
echo ""
echo "View logs: docker-compose logs -f"
echo "Stop: docker-compose down"
echo "Restart: docker-compose restart"