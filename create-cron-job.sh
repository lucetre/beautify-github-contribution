ISSUE_BODY=$(cat sample-issue-body.md)

#echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Which/,$d' | sed '/### Customize/,$!d'
CUSTOM=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Which/,$d' | sed '1,/|--/d')

# echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Code/,$d' | sed '/### Which/,$!d'``
PATTERN=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Code/,$d' | sed '1,/### Which/d')

# echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '/### Code/,$!d'``
CODE_OF_CONDUCT=$(echo -e "$ISSUE_BODY" | sed '/^$/d' | sed '1,/### Code/d')

echo -e "$CUSTOM"
echo $PATTERN
echo $CODE_OF_CONDUCT

# $ISSUE_BODY | sed '/^$/d' | sed '/### Code/,$d' | sed '0,/^### Code$/d'

#echo "Hello: world" | cut -f1 -d":"
