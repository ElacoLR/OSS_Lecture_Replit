# git

git status <br>
git add file.txt <br>
git commit -m "commit 1" <br>

## 상태 짧게 확인하기
git status -s
- status code <br>
  XY
  - x : staging area의 상태
  - y : 현재 디렉토리의 상태
- ?? : untracked
- A : added
- M : modified
- D : deleted
- MM 
- AM : 
- !! : ignored <br>
  --ignored : 보이지 않는 파일의 상태까지 나타냄
- "" : clean

파일 1개 생성 -> 스테이징 -> 수정 -> 커밋 -> <br>
파일 옮기기 (D -> R) <br>
파일 삭제하기 (D)

## 파일 무시하기
- git으로 관리할 필요가 없는 파일을 관리하는 파일
- .gitignore
- 이 파일은 최상위 디렉터리에 두고, 파일 내부에 관리할 파일의 패턴을 명시한다.
- 예 : 로그파일, 대용량 파일, 데이터, 등등 버전 관리가 필요없는 파일들
- 패턴 : glob 패턴 사용

### glob pattern
* : 0개 이상
[abc] : a or b or c
? : 한 글자
[0-9] : - : range, 모든 숫자

- 디렉토리 명시하는 방법
  tmp/
- 현재 디렉토리에만 적용할 때
  /a.txt (o)
  /tmp/a.txt (x)
  /notes/tmp/a.txt (x)
- !로 시작하는 디렉토리는 적용하지 않는다.
  !tmp/a.txt
- ** : 디렉토리 내의 모든 디렉토리 적용
  tmp/**/notes

### 문제 : 무시할 파일 패턴으로 명시하기
1. 확장자가 .a 인 파일
2. 1번 + lib.a는 제외
3. 현재 디렉토리에 있는 TODO 파일은 적용하되, subdir/TODO 등 하위 디렉토리 파일은 적용하지 않도록
4. build 디렉토리에 있는 모든 파일 적용
5. doc/notes.txt 파일은 적용하고, doc/server/arch.txt 파일은 적용하지 않기
6. doc 디렉토리 아래 모든 .pdf 파일 적용하기

1 : *.a <br>
2 : *.a <br>
    !lib.a <br>
3 : /TODO <br>
    !subdir/TODO <br>
4 : build/ <br>
5 : doc/notes.txt <br>
    !doc/server/arch.txt <br>
6 : doc/**/*.pdf <br>

리눅스 =/= 깃

## 깃에서 파일 삭제하기
1. 현재 디렉토리에서 삭제 -> 커밋
   rm file
   git commit
2. 깃에서 바로 삭제하기 (unstaging의 의미)
   git rm file
   git commit
- 커밋해야 함
- 삭제하는 행위는 되돌릴 수 없음
- 커밋 -> 수정 -> 삭제 (오류)
  - git rm -f file (오류 나지 않음) (-force)

3. 언스테이징만 하고 파일은 가지고 있고 싶을 경우
   git rm --cached file
   git rm --cached .gitignore

4. 패턴 인식됨
   git rm *.log

## 파일 이름 변경하기
  git mv file1 file2

  mv file1 file2
  git rm file1
  git add file2

## 커밋 히스토리 조회하기

### 조회 방법
git log
q로 빠져나옴

#### 조건 설정해서 조회하는 방법
1. n개 조회
   git log -3
2. 커밋마다 어떤 차이가 있는지 확인(diff) : -p
3. --since --until
   git log --since=2.days --until=3.minutes
4. -S
   특정 텍스트가 포함된 커밋
   git log -S tmp

5. git log -- tmp/ notes/
6. 통계 조회하기
   git log --stat
7. 사용자 지정 출력 형식으로 보기
   git log --pretty
    short, oneline, full, fuller

   git log --pretty=format:"%h - %an, *ar : %s"

h : 커밋해시
an : author name
ar : author relative time
s : summary

### Q. 다음을 만족하는 커밋 히스토리를 검색하시오.
"커밋 해시 - 요약"
2008-10-1부터 2008-11-01까지
t/ 경로에 대해서

git log --pretty=format:"%h - %s" --since="2008-10-01" --until="2008-11-01" -- t/

## 되돌리기
- 작업 도중 어떤 것을 되돌리기
- 되돌리면 복구 안됌

  1) 추가 커밋
  git commit --amend
  - 이전 커밋을 수정하는 역할
  - f