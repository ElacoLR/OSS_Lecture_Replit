# 조건문

```sh
if <조건문>
then
<수행문>
<...>
fi
```

- 들여쓰기 안 해도 인식은 가능하나 가독성 위해 들여쓰기 하기
- if의 종료 상태(exit status)가 0이 되면 then 구문을 탄다.
- 종료 코드
  - 0 : 성공
  - 1, 2, 3, ... : 실패 (오류 - 매뉴얼에서 확인 가능)
- 종료 상태 확인하기
  $?
- 파이프라인일 경우,
  프로그램 | 프로그램 | .... | 프로그램
  - 마지막 프로그램의 종료상태가 전체 파이프라인의 종료상태이다.

## 참/거짓을 판단하는 프로그램
test <True/False 비교문>
- true일 경우 종료 상태 0으로 반환
- 비교하는 인수는 항상 띄어쓰기 할 것!
- 같다 : = (다른 언어처럼 == 아님)
- 테스트로 판별한 인수, 변수 등은 모두 "" 감싼다.
  - null, 공백 등을 인식하지 못하는 오류가 생길 수 있기 때문에


## Q. 이름 변수에 할당하고 빈값인지 확인하는 조건문 작성해서 보내기.
```sh
name = ""

if test "$name" = ""
then
echo yes
fi
```

## 문자열 비교연산자
- 같다 =
- 다르다 !=
- str # null
  - if test "$name"
- -n # is not null / **n**onzero
- -z # is null / **z**ero

```sh
name=""

if test -z $name
then
echo 빈 값
fi
```

# test -> 표현식

```sh
if [ -z $ name ]
then
echo 빈 값
fi
```

- [] 로 감싼다. "test" 프로그램 돌리는 표현식
- 앞뒤로 공백 넣기

## Q. 표현식으로 바꾸고 종료상태 확인하는 코드 보내기

```sh
if [ -z $name ]
then
echo 빈 값
fi;echo $?
```

## 수치비교
num1, num2 <br>
-eq : equal <br>
-gt : greater than <br>
-lt : less than <br>
-ge : greater or equal <br>
-le : less or equal <br>
-ne : not equal <br>

```sh
[ num1 -eq num2 ]
```

## Q. count라는 변수에 원하는 숫자 넣고, 10 보다 작은지 판별하는 조건문 작성해서 보내기

```sh
count=5

if [ $count -lt 10]
then
echo yes
fi
```

## Q2. 스크립트 : count
전체 인수가 0이 아닐 때, "프로그램을 실행합니다"라는 문구 출력하는 조건문 작성하기.<br>
[스크립트]

# 종료 프로그램
exit n
- 셸 종료 코드 지정
- exit 프로그램을 사용하지 않으면 마지막 프로그램의 종료 상태가 반환된다.

```sh
count=4

if [ $count -gt 0 ] && [ $count -lt 10 ]
then
  echo 0~10사이 # 종료상태
  exit 0
else
  exit 1
fi
```

## else
```sh
if [ ]
then # True 무시
  cmd1
  cmd2
else # 무시 True
  cmd3
fi
```

## elif
```sh
if []
then
  cmd1
elif []
then
  cmd2
else
  cmd3
fi
```

# Q. 시간을 기준으로 인사하는 프로그램 만들기
0시~9시 굿모닝<br>
9시~5시 굿애프터눈<br>
5시~12시 굿이브닝<br>
+ 종료상태 결정

[정답]

# 파일 비교
- 파일의 형태, 빈 파일인지, 권한 등등 판별하는 연산자
- 구조 : <옵션> <디렉토리/파일>
- 종류 :
  -d tmp/ : tmp/가 디렉토리인가
    ```
    [ -d tmp/ ]
    ```
  -f : 파일 <br>
  -s : 파일이 비어있지 않은지 <br>
  -x : executable <br>
  -w : writable <br>
  -r : readable <br>
  -e : exists <br>

## 논리 부정 연산자
```sh
[ ! -x file ]
```

##
(조건1) and/or (조건2)
-a
-o
```sh
[ -r file -a 3 -eq 4 ]
```
- and에서 주의할 것!
  - 조건1이 False면 조건2까지 가지 않는다.

## Q1. 0 < x < 10
```sh
x=5

if [ $x -gt 0 -a $x -lt 10 ]
then
  echo yes
fi
```
## Q2. $name이 널값이 아니거나 $file이 읽기가능할 경우
```sh
name=""
file="script.sh"

if [ -z $name -o -r $file ]
then
  echo yes
fi
```

- 괄호는 이스케이프가 필요함
- 띄어쓰기 주의할 것
- A or (B and C) (and가 우선한다)

# case 표현식
- 여러 조건을 비교할 경우 사용한다.

1) jan
2) feb
3) ...
12) dec

dog) 개
cat) 고양이

```sh
case 값
in
  패턴 1) cmd
         cmd ;; # 패턴 1일 경우에 세미콜론 전 까지 명령 수행한다.
  패턴 2) ...
  * ) 그 외의 값
esac # case
```

- 매칭되는 패턴 없으면 아무것도 실행하지 않는다.

## Q. count 확장하기
- 인수가 없으면 오류로 종료
- 인수가 1개면 실행
  - 숫자를 달로 환산하기
    1 -> Jan
    2 -> Feb
    12 -> Dec
- 인수가 2개 이상이면 오류로 종료
- 예: 파일명 month

[정답 스크립트]

## Q. 숫자, 대문자, 소문자, 특수문자 판별하는 스크립트 만들기

[정답 스크립트2]

### 패턴이 여러 개일 경우
패턴1 | 패턴2 ) 명령문 ;;

## 시간으로 인사하기 => case로 바꿔보기

```sh
if []
then
  : # 아무것도 하지 않기
else
fi
```

## &&, ||
- 프로그램 && 프로그램 : 1이 성공하면 2를 실행하라.
- || : 1이 실패하면 2를 수행하라.

file을 정렬하고 file에 저장하라.
echo hello && mv file1 file2

```sh
if [ 판별1 && 판별2 ] # 1 and 2
&&
```

### Q. $file이 존재하지 않으면 /etc/passwd를 변수 $file에 할당하라.

[스크립트]: <https://github.com/ElacoLR/OSS_Lecture_Replit/blob/main/Scripting/count.sh>

[정답]:
<https://github.com/ElacoLR/OSS_Lecture_Replit/blob/main/Scripting/Announce.sh>

[정답 스크립트]: <https://github.com/ElacoLR/OSS_Lecture_Replit/blob/main/Scripting/month.sh>

[정답 스크립트2]: <https://github.com/ElacoLR/OSS_Lecture_Replit/blob/main/Scripting/character.sh>