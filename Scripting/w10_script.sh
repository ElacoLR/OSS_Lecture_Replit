x=5

if [ $x -gt 0 -a $x -lt 10 ]
then
  echo yes
fi

name=""
file="script.sh"

if [ -z $name -o -r $file ]
then
  echo yes
fi