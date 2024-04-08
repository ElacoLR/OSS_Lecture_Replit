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
      
    Q. runner에서 notes/b를 복사해서 가져오는 코드 작성하기
    runner (pwd)
    ㄴOSS
      ㄴnotes
        ㄴb