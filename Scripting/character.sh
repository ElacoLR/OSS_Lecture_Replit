letter=$1

case $letter
in
  [0-9]) echo 숫자입니다
  ;;
  [A-Z]) echo 대문자입니다
  ;;
  [a-z]) echo 소문자입니다
  ;;
  *) echo 특수문자입니다
  ;;
esac