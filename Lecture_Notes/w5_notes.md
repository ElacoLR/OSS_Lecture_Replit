# 1. 총정리
## basic programs

- <프로그램> <옵션> <인수>
- -ch
- 디렉토리, 파일, ....
- ex) ls -l / /etc/passwd

1) date
2) who (replit 에서는 설정이 다르게 되어있어서 아무것도 안 뜨지만 원래 유저의 이름이 뜬다.)
3) echo - 공백 무시
4) ls
  - 조회
  - -l :
  - -a
  - 멀티컬럼으로 stdout
  - 인수가 디렉토리
  - 인수로 파일명 쓰면 이름 그대로 반환
5) cat
  - concatenate
  - 인수로 파일명
  - 파일 이어붙이기 가능 (컨텐츠 확장할 때 사용한다.)
6) wc
  - 라인, 단어, 글자 수 세기
  - -l, -w, -c
  - 인수가 없으면 stdin 으로 받는다.
7) cp
  - copy from to
  - 다른 디렉토리일 경우
    - 상대경로로 쓰는 게 편함.
    - 같은 파일명일 경우 이름 안 써도 됨
      ex) cp b ./notes
    - 여러 파일 복사 가능
      cp 1 2 3 4 5 6
      1-5 from . 6 to
      
### Q. runner에서 notes/b를 복사해서 가져오는 코드 작성하기
runner (pwd)
ㄴOSS
  ㄴnotes
    ㄴb

```sh
cp ./OSS/notes/b .
```
8) mv
  - move
  - mv fromA to B
mv 1 2 3 4 5 "6"
- 파일명 변경할 때
  mv a aa # a 사라지고 aa
- 디렉토리 A -> B
  sample -> notes

*** 기존에 존재하는 파일명일 경우, 덮어쓴다.

9) rm
  - remove
  - 파일명
    - empty
  - -r : 디렉토리
  - 여러개 지울 수 있다.
    rm a b c d
    rm *.txt
  - 확인하고 지울 것

## 디렉토리 관련 명령
1) pwd
   print working directory
   current directory

2) cd
   change directory
   ..
   .
   cd 만 치면 home 으로 간다.
   
3) mkdir
  - make directory

4) rmdir

5) ln
  - link files
  - ln fromA fromB
  - a, b
  - 메모리 효율, 항상 동기화됨
  - 다른 디렉토리에 동일한 파일을 위치시키고 싶을 때
  - ls -l 로 확인 가능함
  - 파일 하나를 삭제해도 다른 파일은 삭제되지 않음

## 패턴매칭
1. asterisk
   - "*"
   - zero or more
     cat * # 현재 디렉토리에 있는 모든 파일
     chapter* # chapter 로 시작하는 모든 파일

     Q. t가 들어있는 모든 파일
     A. *t*

2. ?
   - 한 개 매칭
     echo ? # 글자 1개로 된 파일 전부
     echo ?? # bb

3. [, ]
   - 특정 글자 1개 매칭되는 것 전부
   [abcd] # a or b or c or d
   [02468] # 짝수
   [0-9] # 모든 숫자
   [a-z]

   Q. o를 제외한 모든 소문자

      [a-np-z]
      [!o] # except o

4. escape letter
   - 공백, $, ...
   - \
     cat file_a file_b
     cat hello\ world : 파일 hello world 가 하나로 인식됨
     '', ""
   - echo는 예외

   Q. 'who are you?' 라는 디렉토리를 생성하고 목록 조회하는 코드
   - mkdir who\ are\ you?
   - mkdir 'who are you?'
   - mkdir "who are you?"

## 리다이렉션
- 입력 <, <<
- 출력 >
- 에러 2
  - "" > cp_pattern1

## 파이프라인
- |
- 표준 입출력을 이용하는 모든 프로그램은 파이프를 사용할 수 있다.
- A | B | ...
- "필터" : 파이프라인을 사용할 수 있는, 입출력값을 수정할 수 있는 프로그램
  - grep, cut, ...

##
- ; - 여러 명령 한 줄에 쓸 때
- date; pwd

- 오래 걸리는 명령 백그라운드로 보내기
  - <명령> &
    예: cat bigdat > file1 &
  - 다른 프로그램 동시에 수행 가능
  - stdin (조심)

- ps
  - 프로세스 정보 나타냄
  - PID : id
  - TIME : 프로세스가 돌아간 시간
  - TTY : 터미널 정보
  - CMD - 프로세스 이름

## 명령 2
1. cut
   - cut <> 파일명
   - -c, -f, -d
   - -c2,5,6
   - -f : tab 구분
   Q. 10번째 글자부터 끝까지
   A. cut -c10-

   - -d<구분자>
     - -d:
       cut -d: -f1 file # f default is tab

2. paste
   - cut 과 반대됨
   - 컬럼별로 데이터 붙임
   - 디폴트는 탭
   - -d<구분자> : 구분자 지정
   - -s : 같은 파일을 수정할 경우
   - ' ' -> \t
   - paste -s -d' ' file

3. grep
   - grep <패턴> <디렉토리>
   - 패턴에 매칭되는 문자열을 가진 라인 출력
   - 매칭 없으면 아무것도 출력되지 않는다.
     grep Linux * # 파일 내부의 텍스트
     .... | grep Linux # 출력에서 받은 입력값
     Q. 전체 파일에서 * 패턴 가진 것 찾기
     A. grep \* .
        grep \* *
        grep '*' *

     => 패턴은 ''를 사용하는 게 좋다.
     [a-z]
     ^, $
     ^[A-Z]*
     *.txt$

     -i : 대소문자 구분 안함
     -w : 정확한 매칭만
        the -> there (x)
     -v : 반대, 포함 안 되는
     -l : 해당 매칭이 있는 파일명

     Q. 해당 매칭이 있는 파일 개수
     A. grep -l 'A' * | wc -l

4. sort
   - 정렬
   - 라인별로, 오름차순 디폴트
   - -r
   - -n : 숫자로 인식
     - 셸은 모든 인수를 문자열로 인식한다.
       str : 1, 11, 2, 3
       int : 1, 2, 3, 11
   - 특수문자, 다른 언어 중에 특수 기호 사용하는 문자 정렬 순서 주의할 것
   - ' ' # 32, \
   - -u : sort + uniq
   - -o :
     - sort file > file1 (x)
     - 정렬된 결과물 같은 파일에 저장할때 쓴다

5. uniq
   - 중복 삭제
   - 인접한 것만 고려한다.
   - -d : 결과 중 중복된 것 삭제
   - -c : 중복된 횟수 카운트

6. tr
   - tr from_char to_char
   - tr e x < input
   - stdin 만 가능함
   - animals.txt e -> x : tr e x < animals.txt
   - 소문자 -> 대문자 : tr [a-z] [A-Z] < animals.txt
   - -d : 삭제
   - tr -d the