ISSUE_BODY=$(cat tools/contribution/sample-issue.md)

# #echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Which/,$d' | sed '/### Customize/,$!d'
# CUSTOM=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Which/,$d' | sed '1,/|--/d')

PATTERN=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '1,/```/d' | sed '/```/,$d')
echo -e "$PATTERN"

# # echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Code/,$!d'``
# CODE_OF_CONDUCT=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '1,/### Code/d')

# echo -e "$CUSTOM" | tr '⚪' '0' | sed -r 's/[0]+/0/g' | tr '🟢' '1' | sed -r 's/[1]+/1/g' | sed -r 's/[|]+//g'
# # echo $PATTERN
# # echo $CODE_OF_CONDUCT


# contribution_graph=`cat tools/contribution/graph.md | sed '$ ! s/$/\\n/' | tr -d '\n'`
# echo "$contribution_graph"
