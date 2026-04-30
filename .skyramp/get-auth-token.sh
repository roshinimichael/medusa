#!/bin/sh
# Fetches a short-lived admin Bearer token from the Medusa auth endpoint.
# Used by the Skyramp Testbot as authTokenCommand.
#
# Medusa v2 returns the JWT directly under `.token`.
# Usage: .skyramp/get-auth-token.sh

BASE_URL="${MEDUSA_BASE_URL:-http://localhost:9000}"

curl -sf -X POST "${BASE_URL}/auth/user/emailpass" \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@testbot.com","password":"supersecret"}' \
  | jq -r '.token'
