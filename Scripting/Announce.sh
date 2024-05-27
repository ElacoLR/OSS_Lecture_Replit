hour=$(date +%H)
hour=$(( hour + 9 ))

if [ $hour -ge 0 ] && [ $hour -lt 9 ]
then
  echo 굿모닝
  exit 0
elif [ $hour -ge 9 ] && [ $hour -lt 17 ]
then
  echo 굿애프터눈
  exit 0
else
  echo 굿이브닝
  exit 0
fi
exit 1