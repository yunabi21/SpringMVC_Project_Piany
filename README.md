# 프로젝트 기획안
> #### 작성일: 2022. 06. 02
> #### 작성자: 서선주

## 프로젝트 명
> #### Piany

## 기획 의도
> #### 스프링 프레임워크를 기반으로 하는 쇼핑몰 웹사이트 입니다.
> #### 언젠가 만들어 보고자 했던 쇼핑몰과 REST API에 대한 심화 공부를 하고자 프로젝트를 개발하게 되었습니다.

## 벤치 마킹
> #### 지마켓의 헤더 부분을 참고했습니다.
> #### 아이콘으로 직관성을 높인 것이 장점이라고 생각합니다.

## 주요 기능
> #### **1. 회원**
>> #### 1.1 회원가입
>>> 1.1.1 아이디 중복체크
>>> 1.1.2 정규 표현식을 활용하여 사용자의 입력 패턴 제한
>> #### 1.2 로그인
>>> 1.2.1 세션에 회원번호와 회원의 아이디를 담음
>> #### 1.3 아이디 찾기
>>> 1.3.1 회원의 이메일을 확인 후 일치하면 아이디 출력
>> #### 1.4 비밀번호 찾기
>>> 1.4.1 회원의 아이디와 이메일을 확인 후 일치하면 비밀번호 출력
>> #### 1.5 회원탈퇴
>>> 1.5.1 회원의 비밀번호를 입력받아서 일치하면 탈퇴 처리
>> #### 1.6 로그아웃
>>> 1.6.1 세션에 있는 정보를 삭제
>> #### 1.7 장바구니
>> #### 1.8 상품 구매
>>> 1.8.1 카카오페이 API 활용

> #### **2. 상품**
>> #### 2.1 상품 등록
>>> 2.1.1 관리자만 사용 가능
>> #### 2.2 상품 삭제
>>> 2.2.1 관리자만 사용 가능

> #### **3. 게시판**
>> #### 3.1 글 목록 조회
>>> 3.1.1 페이지네이션
>>>> 3.1.1.1 한 페이지에 글 10개씩 조회
>> #### 3.2 글 작성
>> #### 3.3 글 수정
>>> 3.3.1 글 작성자와 세션에 담긴 로그인아이디가 일치해야 수정 버튼이 보임
>> #### 3.4 글 삭제
>>> 3.4.1 글 작성자와 세션에 담긴 로그인아이디가 일치해야 삭제 버튼이 보임

> #### **4. 댓글**
>> #### 4.1 댓글 작성
>> #### 4.2 댓글 수정
>>> 4.2.1 댓글 작성자와 세션에 담긴 로그인아이디가 일치해야 수정 버튼이 보임
>> #### 4.3 댓글 삭제
>>> 4.3.1 댓글 작성자와 세션에 담긴 로그인아이디가 일치해야 삭제 버튼이 보임

> #### **5. 장바구니**
>> #### 5.1 장바구니에 담긴 상품 리스트 출력
>> #### 5.2 장바구니에 상품 등록
>> #### 5.3 장바구니의 상품 삭제

## 기타
> #### HTML, CSS, JavaScript, Ajax, Spring Framework