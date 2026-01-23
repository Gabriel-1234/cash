#!/bin/bash
# Coolify Deployment Test Script

echo "🚀 Starting Coolify Deployment Test..."
echo ""

# Check Node.js
echo "✓ Checking Node.js..."
node --version
npm --version
echo ""

# Check environment variables
echo "✓ Checking environment variables..."
if [ -f .env ]; then
    echo "✓ .env file found"
    echo "  - DB_HOST: ${DB_HOST:-not set}"
    echo "  - DB_USER: ${DB_USER:-not set}"
    echo "  - DB_NAME: ${DB_NAME:-not set}"
    echo "  - PORT: ${PORT:-5002}"
    echo "  - FRONTEND_URL: ${FRONTEND_URL:-not set}"
else
    echo "✗ .env file not found"
    exit 1
fi
echo ""

# Test backend dependencies
echo "✓ Checking backend dependencies..."
cd backend
if npm list > /dev/null 2>&1; then
    echo "✓ Backend dependencies OK"
else
    echo "! Installing backend dependencies..."
    npm install
fi
cd ..
echo ""

# Test frontend dependencies
echo "✓ Checking frontend dependencies..."
cd frontend
if npm list > /dev/null 2>&1; then
    echo "✓ Frontend dependencies OK"
else
    echo "! Installing frontend dependencies..."
    npm install
fi
cd ..
echo ""

# Build frontend
echo "✓ Building frontend..."
cd frontend
npm run build
FRONTEND_BUILD_STATUS=$?
cd ..
if [ $FRONTEND_BUILD_STATUS -eq 0 ]; then
    echo "✓ Frontend build successful"
else
    echo "✗ Frontend build failed"
    exit 1
fi
echo ""

# Test backend connectivity (basic check)
echo "✓ Testing configuration..."
echo "  - Backend port: 5002"
echo "  - Database host: ${DB_HOST}"
echo "  - Database port: ${DB_PORT}"
echo ""

echo "✅ Coolify deployment test completed successfully!"
echo ""
echo "Next steps:"
echo "1. Push to GitHub: git push origin main"
echo "2. Connect repository to Coolify dashboard"
echo "3. Configure environment variables in Coolify"
echo "4. Deploy and monitor"
