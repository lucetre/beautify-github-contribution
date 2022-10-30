CONTRIBUTOR=linkedart-snu
str=$(cat "scheduler/2022/10/30/CONTRIBUTORS" | grep $CONTRIBUTOR | tr -d '[:space:]')

if [[ $str == $CONTRIBUTOR ]]; then
  echo "Trigger"
else
  echo "No"
fi
