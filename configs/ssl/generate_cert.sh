#!/bin/bash

# Script to generate SSL certificate using Let's Encrypt

# Configuration
DOMAIN="ecolaura.com"
EMAIL="admin@ecolaura.com"

# Check if certbot is installed
if ! command -v certbot &> /dev/null
then
    echo "certbot could not be found. Please install it first."
    exit 1
fi

# Generate certificate
certbot certonly --standalone \
    -d $DOMAIN \
    -d www.$DOMAIN \
    --email $EMAIL \
    --agree-tos \
    --no-eff-email \
    --force-renewal

# Check if certificate generation was successful
if [ $? -eq 0 ]; then
    echo "SSL certificate for $DOMAIN has been successfully generated/renewed."

    # Reload Nginx to apply the new certificate
    if command -v nginx &> /dev/null; then
        nginx -s reload
        echo "Nginx has been reloaded."
    else
        echo "Nginx not found. Please reload your web server manually."
    fi
else
    echo "Failed to generate/renew SSL certificate for $DOMAIN."
    exit 1
fi