# Index  
#### 001. [중복 제거하기](https://programmers.co.kr/learn/courses/30/lessons/59408)  
- [SQL](/sqls/001.sql)  
- [CSV](/csvs/aac_intakes.csv)  

#### 002. [상위 N개 레코드](https://programmers.co.kr/learn/courses/30/lessons/59405)  
- [SQL](/sqls/002.sql)  
- [CSV](/csvs/aac_intakes.csv)  
- [참고](https://pingukim.tistory.com/5)  

#### 003. [고양이와 개는 몇 마리 있을까](https://programmers.co.kr/learn/courses/30/lessons/59040)  
- [SQL](/sqls/003.sql)  
- [CSV](/csvs/aac_intakes.csv)  

#### 004. [동명 동물 수 찾기](https://programmers.co.kr/learn/courses/30/lessons/59041)  
- [SQL](/sqls/004.sql)  
- [CSV](/csvs/aac_intakes.csv)  
- [참고: Group by와 Having](http://www.gurubee.net/lecture/1032)  

#### 005. [입양 시각 구하기(1)](https://programmers.co.kr/learn/courses/30/lessons/59412)  
- [SQL](/sqls/005.sql)  
- [CSV](/csvs/aac_intakes.csv)  
- [참고: MySQL DateTime 포맷과 문자열 날짜값의 비교](https://apost.kr/483)  

#### 006. [입양 시각 구하기(2)](https://programmers.co.kr/learn/courses/30/lessons/59413)  
- [SQL](/sqls/006.sql)  
- [CSV](/csvs/aac_intakes.csv)  
- [참고: 재귀쿼리](https://github.com/yeoseon/tip-archive/issues/221)  

#### 007. [NULL 처리하기](https://programmers.co.kr/learn/courses/30/lessons/59410)  
- [SQL](/sqls/007.sql)  
- [CSV](/csvs/aac_intakes.csv)  
- [참고: Oracle - NVL](https://gent.tistory.com/189)  

#### 008. [없어진 기록 찾기](https://programmers.co.kr/learn/courses/30/lessons/59042)  
- [SQL](/sqls/008.sql)  
- [CSV](/csvs/aac_intakes.csv)  
- [참고: Join](https://doorbw.tistory.com/223)  
![image](https://user-images.githubusercontent.com/54384004/93741786-ff937780-fc27-11ea-94c7-ad34e8276f3e.png)

#### 009. [있었는데요 없었습니다](https://programmers.co.kr/learn/courses/30/lessons/59043)  
- [SQL](/sqls/009.sql)  
- [CSV](/csvs/aac_intakes.csv)  

#### 010. [오랜 기간 보호한 동물(1)](https://programmers.co.kr/learn/courses/30/lessons/59044)  
- [SQL](/sqls/010.sql)  
- [CSV](/csvs/aac_intakes.csv)  

#### 011. [보호소에서 중성화한 동물](https://programmers.co.kr/learn/courses/30/lessons/59045)  
- [SQL](/sqls/011.sql)  
- [CSV](/csvs/aac_intakes.csv)  


# 개념 정리  

## Group by ... Having  
- Where 절에서는 ```count(*)```와 같은 집계 함수를 사용할 수 없다.  

### 예시 (004. 동명 동물 수 찾기)  

#### 문제  
동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.

* 동물 이름이 두 번 이상 쓰인 이름만 조회한다.  
* 이름이 없는 동물은 집계에서 제외한다.  

#### 풀이

* 조건으로 넣어야 하는 부분
    1. 이름이 비어있지 않아야 한다.  
    2. count(name)이 1보다 큰 이름만 조회한다. 
* 1번 조건은 where 절로 해결 가능하지만, 집계함수인 count(name)같은 경우는 where 절에 오지 못한다.  
* 이 경우 Having 절을 사용해준다.  

```
select 
	name,
	count(name)
from aac_intakes
where name <> ''
group by name
having count(name) > 1
order by name asc;
```

## DateTime 포맷과 문자열 날짜 값의 비교

### 1. 문자열 -> 날짜 
```
str_to_date("문자열", "포맷문자열")
```  

### 2. 날짜 -> 문자열  

```aidl
date_format(datetime, '%H');
```

#### 예제 
문제: 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
* date_format을 통해 날짜로 formatting 하여 풀었다.  
```aidl
select
	date_format(datetime, '%H') as hour,
	count(datetime)
from aac_intakes
where date_format(datetime, '%H') < '20'
	and date_format(datetime, '%H') > '08'
GROUP by date_format(datetime, '%H')
order by date_format(datetime, '%H');
```

## CTE(Common Table Expression, 공통 테이블 식)  

[나의 TIL 참고](https://github.com/yeoseon/tip-archive/issues/221)  

## 다양한 단일행 함수 모음  
1. 문자 관련 단일행 함수
    - [SQL](https://github.com/yeoseon/sql-playground/blob/master/sqls/%EB%8B%A8%EC%9D%BC%ED%96%89%20%ED%95%A8%EC%88%98%20%EB%AA%A8%EC%9D%8C.sql)
    - 결과  
    ![image](https://user-images.githubusercontent.com/54384004/94105154-a15ad480-fe73-11ea-8bbf-40e1d8f40553.png)
    
2. 숫자 관련 단일행 함수
    - [SQL](https://github.com/yeoseon/sql-playground/blob/master/sqls/%EB%8B%A8%EC%9D%BC%ED%96%89%20%ED%95%A8%EC%88%98%20%EB%AA%A8%EC%9D%8C.sql)
    - 결과  
    
    |round(112.3456,1)|round(112.3456,2)|round(112.3456,-1)|truncate(112.3456,1)|truncate(112.3456,2)|truncate(112.3456,-1)|mod(26,3)|mod(10,9)|mod(4,2)|ceil(12.6)|ceil(11.5)|ceil(16.3)|floor(12.6)|floor(11.5)|floor(16.3)|
    |-----------------|-----------------|------------------|--------------------|--------------------|---------------------|---------|---------|--------|----------|----------|----------|-----------|-----------|-----------|
    |112.3|112.35|110|112.3|112.34|110|2|1|0|13|12|17|12|11|16|

3. 날짜 관련 함수  
    - [SQL](https://github.com/yeoseon/sql-playground/blob/master/sqls/%EB%8B%A8%EC%9D%BC%ED%96%89%20%ED%95%A8%EC%88%98%20%EB%AA%A8%EC%9D%8C.sql)
    
    1) 현재 날짜, 시간 
        - 결과  
        ![image](https://user-images.githubusercontent.com/54384004/94107322-2ba53780-fe78-11ea-9db8-88b6bfdffc78.png)

    2) 날짜나 시간에 따른 특정 정보  
        - 결과
        ![image](https://user-images.githubusercontent.com/54384004/94107705-fa793700-fe78-11ea-9e82-5e4510ed8b30.png)
    3) 날짜, 시간 연산  
        - 결과  
        
        |date_add('2020-12-31 23:59:59', INTERVAL 1 SECOND)|date_add('2020-12-31 23:59:59', interval 31 day)|date_add('2020-12-31 23:59:59', interval '1:1' MINUTE_SECOND)|date_add('2020-12-31 23:59:59', interval '-1 17' day_hour)|
        |--------------------------------------------------|------------------------------------------------|-------------------------------------------------------------|----------------------------------------------------------|
        |2021-01-01 00:00:00|2021-01-31 23:59:59|2021-01-01 00:01:00|2020-12-30 06:59:59|
        
    4) 시간/초 데이터 변환  
        - 결과  
        ![image](https://user-images.githubusercontent.com/54384004/94108198-d66a2580-fe79-11ea-9653-da46e9967d77.png)

    5) period_add, period_diff  
        - 결과  
        ![image](https://user-images.githubusercontent.com/54384004/94108467-542e3100-fe7a-11ea-857b-247e26cf2e4a.png)
       
    6) date_format 함수  
        - https://stricky.tistory.com/220 참고  

4. 형 변환 함수  
    - [SQL](https://github.com/yeoseon/sql-playground/blob/master/sqls/%EB%8B%A8%EC%9D%BC%ED%96%89%20%ED%95%A8%EC%88%98%20%EB%AA%A8%EC%9D%8C.sql)
    
    1) MySQL의 데이터 타입  
        - https://stricky.tistory.com/232 참고  
    
    2) 묵시적 형변환  
        - https://stricky.tistory.com/232 참고  
        
    3) CAST, CONVERT 함수  
        - ```
          CAST(표현할 값 AS 데이터 형식[(길이)]); 
          CONVERT(표현할 값, 데이터 형식[(길이)]);
          ```
        - 결과  
        ![image](https://user-images.githubusercontent.com/54384004/94396988-f4979480-019d-11eb-8ccf-467eb575e68f.png)
        ![image](https://user-images.githubusercontent.com/54384004/94397449-d2eadd00-019e-11eb-9bb8-1d76645d86ef.png)

5. 일반 함수  
    1) ifnull
    2) if(조건, 조건성립시 출력, 미성립시 출력)  
    3) case
    ```
    select 
        name,
        case when dept = 'A' then '경영지원부' 
             when dept = 'B' then '영업부' 
             else '회계팀' end as dept,
        salary,
        bonus 
    from class.salary;
    ```
    
## 다양한 복수행 함수 (window, 그룹 함수)  

복수행 함수 : 한번에 여러 데이터에 대한 결과를 출력하는 함수  
복수행 함수는 컬럼 값에 null이 있다면, 제외하고 결과가 나온다.  
따라서 null일 경우의 값을 세팅하고 작성해야 한다.  
(5개 컬럼 중 2개가 null인데, 5개 컬럼의 avg를 구할 때, 3으로 나뉘어짐.)

### 1. 많이 쓰이는 기본 함수

1) count 함수  
2) sum 함수  
3) avg 함수  
4) max, min 
5) stddev
    * 표준 편차를 구하는 함수  
6) variance 
    * 분산을 구하는 함수  
7) group by 
    * [SQL](https://github.com/yeoseon/sql-playground/blob/master/sqls/groupby.sql)  
    * 
        
