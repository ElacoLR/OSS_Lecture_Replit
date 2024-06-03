user=$1

if [ $# -ne 1 ]; then
  echo 인수가 1개 들어오지 않았습니다.
  exit 2
fi

logged=false

while [ $logged = false ]
do
  if [ "$( who )" = "$user" ]; then
    echo "$user 로그인함!"
    logged=true
  fi
  sleep 60
done