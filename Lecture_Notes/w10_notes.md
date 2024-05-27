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
num1, num2
-eq : equal
-gt : greater than
-lt : less than
-ge : greater or equal
-le : less or equal
-ne : not equal

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

[스크립트]: <https://github.com/ElacoLR/OSS_Lecture_Replit/blob/main/Scripting/count.sh>