# CONTRIBUTOR=linkedart-snu
# str=$(cat "scheduler/2022/10/30/CONTRIBUTORS" | grep $CONTRIBUTOR | tr -d '[:space:]')

# if [[ $str == $CONTRIBUTOR ]]; then
#   echo "Trigger"
# else
#   echo "No"
# fi

# gh workflow run register-github-secrets.yaml -f SECRET_NAME=scully -f SECRET_VALUE=hello

text='''
fdsafs\nPATTERN-1\nFirst line of unimportant text\nSecond line of unimportant text\nPATTERN-2\nSome more texts (may/ maynt be important!)\ndskfl\nfds
'''
new_text=$(echo -e "$text" | sed '/PATTERN-1/,/PATTERN-2/d')
echo -e "$text"
echo "$new_text"
