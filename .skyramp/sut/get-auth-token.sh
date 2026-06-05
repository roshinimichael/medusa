#!/bin/bash
# Authenticates as the test admin user and prints the JWT token to stdout.
set -e

RESPONSE=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"password"}' \
  http://localhost:9000/auth/user/emailpass)

TOKEN=$(echo "$RESPONSE" | python3 -c "import sys, json; print(json.load(sys.stdin)['token'])")

if [ -z "$TOKEN" ]; then
  echo "ERROR: empty token. Response was: $RESPONSE" >&2
  exit 1
fi

echo "$TOKEN"
