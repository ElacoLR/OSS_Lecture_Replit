month=$1
day=$2
year=$3

if [ $# -ne 3 ]; then
  echo 입력값 오류
  exit 2
fi

isLeap=false

valid=true
reason=""

case $month
in
  "jan" | "january" | "1") month="Jan"
  ;;
  "feb" | "february" | "2") month="Feb"
  ;;
  "mar" | "march" | "3") month="Mar"
  ;;
  "apr" | "april" | "4") month="Apr"
  ;;
  "may" | "5") month="May"
  ;;
  "jun" | "june" | "6") month="Jun"
  ;;
  "jul" | "july" | "7") month="Jul"
  ;;
  "aug" | "august" | "8") month="Aug"
  ;;
  "sep" | "september" | "9") month="Sep"
  ;;
  "oct" | "october" | "10") month="Oct"
  ;;
  "nov" | "november" | "11") month="Nov"
  ;;
  "dec" | "december" | "12") month="Dec"
  ;;
  *) valid=false reason="이유 : 달의 입력이 옳지 않음"
esac

#if (( ($year % 4 = 0 && $year % 100 != 0) || ($year % 400 = 0) )); then
if [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]; then
  isLeap=true
fi

if [ $isLeap = false ] && [ $month = "Feb" ] && [ $day -gt 28 ]; then
  valid=false
  reason="이유 : 윤년이 아닌데 2월 29일 입력되었음"
fi

# 달 30일, 31일 결정하기

if [ $valid = true ]; then
  echo $month $day $year
else
  echo $reason + $month $day $year는 유효하지 않습니다
fi