# ISSUE_BODY=$(cat sample-issue-body.md)

# #echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Which/,$d' | sed '/### Customize/,$!d'
# CUSTOM=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Which/,$d' | sed '1,/|--/d')

# # echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Code/,$d' | sed '/### Which/,$!d'``
# PATTERN=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Code/,$d' | sed '1,/### Which/d')

# # echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Code/,$!d'``
# CODE_OF_CONDUCT=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '1,/### Code/d')

# echo -e "$CUSTOM" | tr '⚪' '0' | sed -r 's/[0]+/0/g' | tr '🟢' '1' | sed -r 's/[1]+/1/g' | sed -r 's/[|]+//g'
# # echo $PATTERN
# # echo $CODE_OF_CONDUCT

BODY="test"

BODY="$BODY\n$(cat tools/contribution/graph.md)"

echo -e "$BODY"

# contribution_graph=`cat tools/contribution/graph.md | sed '$ ! s/$/\\n/' | tr -d '\n'`
# echo "$contribution_graph"
