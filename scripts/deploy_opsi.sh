#!/bin/bash

# Read from environment (Azure DevOps injects them)
OPSI_USER="${OPSI_USER}"
OPSI_PASS="${OPSI_PASS}"
OPSI_HOST="${OPSI_HOST}"
PRODUCT_ID="${PRODUCT_ID}"
CLIENT_ID="${CLIENT_ID}"

# Create the JSON payload to instruct OpSi
cat <<EOF > opsi_payload.json
{
  "id": 1,
  "method": "setProductActionRequest",
  "params": ["$PRODUCT_ID", "$CLIENT_ID", "setup"]
}
EOF

# Send the API request to OpSi server
curl -X POST https://$OPSI_HOST:4447/rpc \
     -H "Content-Type: application/json" \
     -u "$OPSI_USER:$OPSI_PASS" \
     -d @opsi_payload.json -k -v

