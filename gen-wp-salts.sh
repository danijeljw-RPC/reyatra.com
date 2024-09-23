#!/bin/bash

# Function to generate a random key with special characters
generate_key() {
  openssl rand -base64 48 | tr -d '\n' | sed "s/^/'/;s/\$/'/"
}

# Define the keys
AUTH_KEY="WORDPRESS_AUTH_KEY=$(generate_key)"
SECURE_AUTH_KEY="WORDPRESS_SECURE_AUTH_KEY=$(generate_key)"
LOGGED_IN_KEY="WORDPRESS_LOGGED_IN_KEY=$(generate_key)"
NONCE_KEY="WORDPRESS_NONCE_KEY=$(generate_key)"
AUTH_SALT="WORDPRESS_AUTH_SALT=$(generate_key)"
SECURE_AUTH_SALT="WORDPRESS_SECURE_AUTH_SALT=$(generate_key)"
LOGGED_IN_SALT="WORDPRESS_LOGGED_IN_SALT=$(generate_key)"
NONCE_SALT="WORDPRESS_NONCE_SALT=$(generate_key)"

# Append the generated keys to the file
ENV_FILE="./env/wordpress.env"

echo "$AUTH_KEY" >> "$ENV_FILE"
echo "$SECURE_AUTH_KEY" >> "$ENV_FILE"
echo "$LOGGED_IN_KEY" >> "$ENV_FILE"
echo "$NONCE_KEY" >> "$ENV_FILE"
echo "$AUTH_SALT" >> "$ENV_FILE"
echo "$SECURE_AUTH_SALT" >> "$ENV_FILE"
echo "$LOGGED_IN_SALT" >> "$ENV_FILE"
echo "$NONCE_SALT" >> "$ENV_FILE"

echo "Keys have been generated and appended to $ENV_FILE"
