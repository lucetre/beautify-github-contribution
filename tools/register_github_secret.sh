#!/bin/bash
# The script encrypts the custom secret value and uploads it to the current GitHub repository.
#
# Usage:
# bash tools/register_github_secret.sh
#   $SECRET_NAME: name of the repository secret to create or update
#   $SECRET_VALUE: value of the repository secret
#
# Related task: (@lucetre)

pip install pynacl

PUBLIC_KEY_JSON=$(gh api \
  -H "Accept: application/vnd.github+json" \
  /repos/lucetre/beautify-github-contribution/actions/secrets/public-key)

PUBLIC_KEY_ID=$(jq '.key_id' <<<$PUBLIC_KEY_JSON | tr -d '"')
PUBLIC_KEY=$(jq '.key' <<<$PUBLIC_KEY_JSON)
ENCRYPTED_SECRET=$(python tools/encrypt_github_secret.py $PUBLIC_KEY "$SECRET_VALUE")
echo $PUBLIC_KEY_ID $PUBLIC_KEY $ENCRYPTED_SECRET

gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  /repos/lucetre/beautify-github-contribution/actions/secrets/$SECRET_NAME \
  -f encrypted_value="$ENCRYPTED_SECRET" \
  -f key_id=$PUBLIC_KEY_ID | jq

gh api \
  -H "Accept: application/vnd.github+json" \
  /repos/lucetre/beautify-github-contribution/actions/secrets | jq
