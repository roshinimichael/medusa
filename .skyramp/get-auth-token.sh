#!/bin/sh
# Fetches a publishable API key from Medusa and outputs its token.
# The testbot sends this as x-publishable-api-key on every store request,
# satisfying the store middleware without requiring framework changes.
#
# Usage: .skyramp/get-auth-token.sh

set -e

BASE_URL="${MEDUSA_BASE_URL:-http://localhost:9000}"

# 1. Authenticate as admin to get a short-lived bearer token
BEARER=$(curl -sf -X POST "${BASE_URL}/auth/user/emailpass" \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@testbot.com","password":"supersecret"}' \
  | jq -r '.token')

# 2. Create a publishable API key and output its token
curl -sf -X POST "${BASE_URL}/admin/api-keys" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${BEARER}" \
  -d '{"title":"Testbot Key","type":"publishable"}' \
  | jq -r '.api_key.token'
