# CONTRIBUTOR=linkedart-snu
# str=$(cat "scheduler/2022/10/30/CONTRIBUTORS" | grep $CONTRIBUTOR | tr -d '[:space:]')

# if [[ $str == $CONTRIBUTOR ]]; then
#   echo "Trigger"
# else
#   echo "No"
# fi

gh workflow run register-github-secrets.yaml -f SECRET_NAME=scully -f SECRET_VALUE=hello
