- 정규표현식 ### 중요
- grep
- ed
- sed ### 중요 (5장)

#1. 정규표현식
- 와일드카드와 혼동하지 말것
  * ? ... chapter*.txt (2장)
- 패턴 매칭할 때 사용한다.
- 1 line 기준
- 가장 긴 문자열 매칭
  
  ##1. 마침표 (.)
  - any single character
  - r. # ro, rk, rc, ....
  - .x. # xxx, oxo, ....
  - [a-zA-Z]

  ##2. ^ (caret)
  - 라인의 처음
  - [^] # not
  - [^a-z] # 소문자가 아닌

  ##3. $ (dollar)
  - 라인의 끝
  - '^ $' # 빈 줄

  ##4. [리스트]
  - [a-z]
  - [a-np-z] # o를 제외한 모든 소문자
  - [a-n][p-z] # 2글자
  - grep '[Tt]he' animals.txt
  - grep -i 'the' animals.txt

  ##5. *
  - zero or more
  - x* # x......
  - 앞글자 한정
  - x 로 시작하는 단어
    x* (x)
    xx* (o)

  ##6. \+
  - 1개 이상
    x\+

  ##7. \?
  - zero or one

  ##8. \{i,j\}
  - j :
  - i,
  - ,j
  - x\{10\} # 10번
  - x\{1,10\} # 1번에서 10번까지
  - x\{10\,} # 10번 이

  ##9. \(regex\)
  - back referencing이 가능하다.
  - '^\(.\)\1' # 동일한 알파벳 2개로 시작하는 라인 *aaa.. ll...

  ##10. regex1 \| regex2
  - regex1 or regex2

# Q.
1) a-f 까지 매칭
2) b나 ab 매칭
3) 2번 + aaaaaab 매칭
4) 모든 글자 매칭
5) #으로 시작하는 문장 매칭
6) \로 끝나는 문장 매칭
7) 대문자로 시작하지 않는 문장 매칭
8) 빈줄이 아닌 모든 줄 매칭
9) cookie나 cake이 포함된 줄 매칭
10) w. 매칭