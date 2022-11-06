# CONTRIBUTOR=linkedart-snu
# str=$(cat "scheduler/2022/10/30/CONTRIBUTORS" | grep $CONTRIBUTOR | tr -d '[:space:]')

# if [[ $str == $CONTRIBUTOR ]]; then
#   echo "Trigger"
# else
#   echo "No"
# fi


PUBLIC_KEY_JSON=$(gh api \
  -H "Accept: application/vnd.github+json" \
  /repos/lucetre/beautify-github-contribution/actions/secrets/public-key)

PUBLIC_KEY_ID=$(jq '.key_id' <<<$PUBLIC_KEY_JSON | tr -d '"')
PUBLIC_KEY=$(jq '.key' <<<$PUBLIC_KEY_JSON)
ENCRYPTED_SECRET=`python3 tools/encrypt_github_secret.py $PUBLIC_KEY "hello"`

gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  /repos/lucetre/beautify-github-contribution/actions/secrets/TEST_SECRET \
  -f encrypted_value="$ENCRYPTED_SECRET" \
  -f key_id=$PUBLIC_KEY_ID | jq

gh api \
  -H "Accept: application/vnd.github+json" \
  /repos/lucetre/beautify-github-contribution/actions/secrets | jq
