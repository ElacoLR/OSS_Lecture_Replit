# for loop
- for 명령
- 동일한 작업을 정해진 횟수만큼 반복할 때 사용한다.
- 구조:

```sh
for var in var1 var2 var3
do
  cmd1
  cmd2
  echo $var
  ...
done
```
- do - done 구간을 바디라고 부른다.
- 바디 구간은 var 개수만큼 반복이 되고, 마지막 var을 타고 종료가 된다.

### Q1. file1, file2, file3을 돌면서 파일 출력하기
```sh
for file in file[1-3]
do
  cat $file
done
```
### Q2. 현재 디렉토리의 모든 파일에 대해서 루프를 타고자 한다.
```sh
for file in *
do
  cat $file
done
```
### Q3. 파일 목록이 있고 filelist.txt에 저장되어 있다. 이 파일에 있는 모든 파일 리스트를 순회하는 코드
```sh
for files in $( cat filelist.txt )
```

```sh
filelist=$( cat "filelist.txt" )
for var in $filelist
```

## in이 없는 for loop
```sh
for file # 들어오는 모든 인수를 순회한다.
do
...
```

./sample.sh 1 2 3 4 5

## $* vs. $@
- 입력되는 모든 인수
- 따옴표가 있고 없을 때 차이점 비교

```sh
for var in $*
do
  echo $var
done

for var in "$*"
do
  echo $var
done

for var in $@
do
  echo $var
done

for var in "$@"
do
  echo $var
done
```

```sh
./sample.sh '1 2 3' 4
```

### $*
- 따옴표로 감싸면 모든 인수를 1개로 취급한다.

### $@
- 따옴표로 감싸면 입력되는 인수의 따옴표를 인지해서 개수를 취급한다.

# while loop
- 조건이 성립할 때 까지 순회하는 반복문에 사용한다.
- 구조:
```sh
while cmd # 참이면 바디를 순회함
do
  cmd1
  cmd2
  # cmd 변화 상태 [ 무한루프에 빠지지 않도록 주의! ]
done
```

### Q4. 1-5까지 출력하는 while loop
```sh
num=1

while [ $num -le 5 ]
do
  echo $num
  num=$(( num + 1 ))
done
```

# until loop
```sh
until cmd #nonzero, false
do
  cmd1
  cmd2
done
```

- 특정 이벤트가 일어나길 기다릴 때 많이 사용한다.

## break
- 원하는 조건에 의해서 루프를 빠져나오는 명령
```sh
while cmd
do 
  cmd1
  cmd2
  if ..
  then
    break n # 중첩된 순환문 만큼 멈춤
  fi
done
```

## 결과물 활용하기
```sh
for
do
  ...
done #####
```

- 파이프라인 연결하기
  ... done |

- 백그라운드 보내기
  ... done &

- 리다이렉션
  ... done > file.txt

## 한 줄로 작성하기
- 세미콜론으로 연결 가능
  for i in [1-5] ; do echo $i ; done
  - do 다음에 세미콜론 넣지 않은 것 주의

  ```sh
  if [ ] ; then
    ....
  fi
  ```
- 코드 짧을 때
- 가독성 위해 사용한다.

### Q5. 로그인된 유저 확인하는 스크립트 작성하기

who | 원하는 유저 이름 추출

- 인수는 1개 들어와야 함 ( 그렇지 않을 경우 종료코드 설정, 프린트 )
- 60초마다 확인하도록 프로그램 짠다.
  sleep 60
- "$user 로그인함"

### Q6. 