# 변수
- 선언
  var="contents"
  var=kim : 공백 없을때는 따옴표 필요 X
  var="var contents" 공백 있을때는 따옴표 필요
  - 데이터 타입이 없음. 모두 문자열로 인식된다.
- 사용
  echo $var
  - 셸이 값을 치환한다. (프로그램 구동 시)
  echo $var -> echo kim -> kim 출력
- [a-zA-Z_0-9]*

## 할당
- 프로그램 이름도 변수로 받을 수 있다.
  command=wc
  op=-c
  $command $op animals.txt = wc -c animals.txt

- 다른 변수도 새 변수로 할당할 수 있다.
  var2=$var
  echo $var2 = echo var

- 선언하지 않은 변수 : null 값이 설정됨 (오류가 나지 않음)
  - 명령 라인에 넣어도 무시됨
    ex) wc -c $var3 ./data/animals.txt : var3 아예 건너뛰고 ./data/animals.txt 를 인수로 받아 실행함
    
## null
var=
var=""
var=''

var=' ' # 공백 1개

# 변수 활용하기
- file=grades 이때 file 변수를 grades에서 grades1 으로 재할당 하고 싶다
- '${변수}' 구조
- ${file}1

  Q. grades -> grades1 파일명 변경하기
  A. mv $file ${file}1

## substring 추출하기
- animals.txt -> animals.md
- ${var:start:size}
- ${var:10:4} # start:end

## $(( 변수 )) 구조 (표현식)
- 수학 연산을 가능하게 하는 구조
- 4 + 8 : echo $(( 4 + 8 ))
- 숫자인 문자열이 들어왔을 때, 숫자로 인식함

  Q. 5를 변수에 담고 활용해서 15를 변수에 담아보기.
  A. five=5
     fifteen=$(( five + 10 ))

  - $(( ten = ten + 1 ))
  - 선언하지 않은 변수를 이렇게 활용 시 1 출력됨(따라서 변수의 초깃값은 0인것을 알 수 있다.)

  - 비교 연산
    $(( ten > 0 )) # true 면 1, false 면 0 출력

  Q. 임의의 수 num이 2의 배수인지 확인하는 코드 작성하기
  A. echo $(( num % 2 == 0 ))

## $( ) 표현
- 명령의 결과값을 변수에 담고 싶을 때
  result=$( cat /etc/passwd | cut -d: -f1 )

# 스크립트 파일 작성하기
- 파일 확장자는 .sh or none
- 1) 파일을 실행가능한 상태로 바꾼다.
  2) 실행하기
- shebang 달기

## 위치 인수
- $n (9까지 만)
- 외부에서 인수를 받아와서 사용할 때
- 10 이상부터는 ${10} 으로 묶어서 사용

## $#
- 총 인수 개수
- 큰 따옴표로 인수 감싸는 습관 들여야 함

Q. 디렉토리를 인수로 받아서, 파일과 디렉토리 개수를 세는 스크립트 짜기

```sh
파일명: count

-출력-
현재 위치: ...
파일 ...개, 폴더 ....개입니다.
```

<ls . vs ls *>
test case 1: .
test case 2: *

```sh
#!/bin/bash

ls="ls ."
pwd=$( pwd )

directs=$( ls -l | grep ^d | wc -l)
files=$( ls -l | cut -c 1 | grep -v "d" | wc -l )

files=$(( $files - 1 ))

echo "현재 위치: $pwd"
echo "파일: $files개, 폴더: $directs개입니다."
```

## $*
- 모든 인수를 출력해주는 변수

# 전화번호부 관리 스크립트 만들기
1) 검색
   ./book.sh 이름
   
2) 추가
   이름, 번호를 인수로 넣어 추가하기

3) 삭제
   이름으로 검색해서 이름, 번호를 삭제하기