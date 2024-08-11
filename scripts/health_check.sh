#!/bin/bash

# Health check script for Ecolaura

# Configuration
BACKEND_URL="http://localhost:8000/health"
FRONTEND_URL="http://localhost:80"
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="ecolaura"
DB_USER="ecolaura_user"

# Check backend health
check_backend() {
    if curl -f -s -o /dev/null "$BACKEND_URL"; then
        echo "Backend is healthy"
    else
        echo "Backend health check failed"
    fi
}

# Check frontend health
check_frontend() {
    if curl -f -s -o /dev/null "$FRONTEND_URL"; then
        echo "Frontend is healthy"
    else
        echo "Frontend health check failed"
    fi
}

# Check database health
check_database() {
    if pg_isready -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER; then
        echo "Database is healthy"
    else
        echo "Database health check failed"
    fi
}

# Run all checks
check_backend
check_frontend
check_database