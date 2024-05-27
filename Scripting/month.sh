num=$1

if [ $# -eq 0 ]
then
  exit 1
elif [ $# -ge 2 ]
then
  exit 2
else
  case $num
  in
    1) echo Jan
    ;;
    2) echo Feb
    ;; 
    3) echo Mar
    ;;
    4) echo Apr
    ;;
    5) echo May
    ;;
    6) echo Jun
    ;;
    7) echo Jul
    ;;
    8) echo Aug
    ;;
    9) echo Sep
    ;;
    10) echo Oct
    ;;
    11) echo Nov
    ;;
    12) echo Dec
    ;;
    * ) echo 유효하지 않은 값입니다
  esac
fi