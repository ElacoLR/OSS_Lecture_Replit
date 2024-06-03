user=$1

if [ $# -ne 1 ]; then
  echo 인수가 1개 들어오지 않았습니다.
  exit 2
fi

while true
do
  if [ "$( who )" = "$user" ]; then
    echo "$user 로그인함!"
  fi
  sleep 60
done