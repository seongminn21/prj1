# 2023 OSS Project 1 Bash Shell Programming

## 프로젝트 개요
+ 입력 파일을 처리하기 위한 스크립트 프로그램 만들기
+ 요구 사항
  + 'u.item'에서 특정 'movie id'로 식별된 영화 데이터 가져오기
  + 'u.item'에서 'action' 장르 영화 데이터 가져오기
  + 'u.data'에서 특정 'movie id'로 식별된 영화의 평균 'rating' 가져오기
  + 'u.item'에서 'IMDb URL' 삭제하기
  + 'u.user'에서 사용자에 대한 데이터 가져오기
  + 'u.item'에서 'release date' 형식 수정하기
  + 'u.data'에서 특정 'user id'가 평가한 영화의 데이터 가져오기
  + 20세에서 29세 사이의 'age'와 'occupation'이 'programmer'인 사용자가 평가한 영화의 평균 'rating' 가져오기
  + 나가기

## 입력 파일 (u.item)
+ 영화의 장르는 1로 표시
+ 1682줄
```
movie id | movie title | release date | video release date |IMDb URL |Genre…
unknown | Action | Adventure | Animation | Children's | Comedy | Crime | Documentary | Drama | Fantasy | Film-Noir | Horror | Musical | Mystery | Romance | Sci-Fi | Thriller | War | Western
```

## 입력 파일 (u.data, u.user)
+ u.data 100000 rows
```
user id | movie id | rating | timestamp
```
+ u.user 943 rows
```
user id | age | gender | occupation | zip code
```

## 1. 'u.item'에서 특정 'movie id'로 식별된 영화 데이터 가져오기
+ 'movie id'(1~1682) 입력
+ 입력된 'movie id'로 식별된 영화의 데이터 출력
```
$ ./test.sh u.item u.data u.user
--------------------------
User Name: fos
Student Number: 00000000
[ MENU ]
1. Get the data of the movie identified by a specific 'movie id' from 'u.item'
2. Get the data of action genre movies from 'u.item’
3. Get the average 'rating’ of the movie identified by specific 'movie id' from 'u.data’
4. Delete the ‘IMDb URL’ from ‘u.item
5. Get the data about users from 'u.user’
6. Modify the format of 'release date' in 'u.item’
7. Get the data of movies rated by a specific 'user id' from 'u.data'
8. Get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'
9. Exit
--------------------------
Enter your choice [ 1-9 ] 1
Please enter 'movie id'(1~1682):1
1|Toy Story (1995)|01-Jan-1995||http://us.imdb.com/M/title-exact?Toy%20Story%20(1995)|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0
Enter your choice [ 1-9 ]
```

## 2. 'u.item'에서 'action' 장르 영화 데이터 가져오기
+ 'u.item'에서 'action' 장르 영화의 데이터를 가져오시겠습니까? (y/n)
+ 'u.item'의 액션 장르 영화 데이터 10개 출력
+ 'movie id' 기준 오름차순 정렬
+ 출력 양식
  + 'movie id' 'movie title'
```
Enter your choice [ 1-9 ] 2
Do you want to get the data of ‘action’ genre movies 
from 'u.item’?(y/n):y
2 GoldenEye (1995)
4 Get Shorty (1995)
17 From Dusk Till Dawn (1996)
21 Muppet Treasure Island (1996)
22 Braveheart (1995)
24 Rumble in the Bronx (1995)
27 Bad Boys (1995)
28 Apollo 13 (1995)
29 Batman Forever (1995)
33 Desperado (1995)
Enter your choice [ 1-9 ] 
```

## 3. 'u.data'에서 특정 'movie id'로 식별된 영화의 평균 'rating' 가져오기
+ 'movie id'(1~1682) 입력
+ 'movie id'로 식별된 영화의 평균 'rating' 출력
+ 'rating'에 대한 데이터는 'u.user'에 있음
+ 'average rating'을 소수점 여섯 자리까지 반올림하여 소수점 다섯 자리까지 출력
  + Ex) 3.878318 -> 3,87832
+ 출력 양식
  + average rating of 'movie id': 'average rating'
```
Enter your choice [ 1-9 ] 3
Please enter the 'movie id’(1~1682):1
average rating of 1: 3.87832
```

## 4. 'u.item'에서 'IMDb URL' 삭제하기
+ 'u.item'에서 'IMDb URL'을 삭제하시겠습니까? (y/n)
+ 'u.item'에서 데이터를 가져온 후, 'IMDb URL'을 삭제한 후 출력
+ 10줄만 출력
```
Enter your choice [ 1-9 ] 4
Do you want to delete the ‘IMDb URL’ from ‘u.item’?(y/n):y
1|Toy Story (1995)|01-Jan-1995|||0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0
2|GoldenEye (1995)|01-Jan-1995|||0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0
3|Four Rooms (1995)|01-Jan-1995|||0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0
4|Get Shorty (1995)|01-Jan-1995|||0|1|0|0|0|1|0|0|1|0|0|0|0|0|0|0|0|0|0
5|Copycat (1995)|01-Jan-1995|||0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|0|1|0|0
6|Shanghai Triad (Yao a yao yao dao waipo qiao) (1995)|01-Jan1995|||0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
7|Twelve Monkeys (1995)|01-Jan-1995|||0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|1|0|0|0
8|Babe (1995)|01-Jan-1995|||0|0|0|0|1|1|0|0|1|0|0|0|0|0|0|0|0|0|0
9|Dead Man Walking (1995)|01-Jan-1995|||0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
10|Richard III (1995)|22-Jan-1996|||0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|1|0
```

## 5. 'u.user'에서 사용자에 대한 데이터 가져오기
+ 'u.user'에서 사용자에 대한 데이터를 가져오시겠습니까? (y/n)
+ 'u.user'에서 사용자에 대한 데이터 출력
+ 출력 양식
  + user ‘user id’ is ‘age’ years old ‘gender’ ‘occupation’
+ 10줄만 인쇄
```
Enter your choice [ 1-9 ] 5
Do you want to get the data about users from 
‘u.user’?(y/n):y
user 1 is 24 years old male technician
user 2 is 53 years old female other
user 3 is 23 years old male writer
user 4 is 24 years old male technician
user 5 is 33 years old female other
user 6 is 42 years old male executive
user 7 is 57 years old male administrator
user 8 is 36 years old male administrator
user 9 is 29 years old male student
user 10 is 53 years old male lawyer
```

## 6. 'u.item'에서 'release date' 형식 수정하기
+ 'u.item'의 'release data' 형식을 수정하시겠습니까? (y/n)
+ 'u.item'에서 데이터를 가져오고, 'u.item'의 동영상 공개일 형식을 YYYYMMDD로 수정한 후 출력
+ Ex) 01-Jan-1995 -> 19950101
+ 마지막 10줄만 인쇄(movie id: 1673 ~ 1682)
```
Enter your choice [ 1-9 ] 6
Do you want to Modify the format of ‘release data’ in ‘u.item’?(y/n):y
1673|Mirage (1995)|19950101||http://us.imdb.com/M/title-exact?Mirage%20(1995)|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0
1674|Mamma Roma (1962)|19620101||http://us.imdb.com/M/title-exact?Mamma%20Roma%20(1962)|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
1675|Sunchaser, The (1996)|19961025||http://us.imdb.com/M/title-exact?Sunchaser,%20The%20(1996)|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
1676|War at Home, The (1996)|19960101||http://us.imdb.com/M/title-exact?War%20at%20Home%2C%20The%20%281996%29|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
1677|Sweet Nothing (1995)|19960920||http://us.imdb.com/M/title-exact?Sweet%20Nothing%20(1995)|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
1678|Mat' i syn (1997)|19980206||http://us.imdb.com/M/title-exact?Mat%27+i+syn+(1997)|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
1679|B. Monkey (1998)|19980206||http://us.imdb.com/M/title-exact?B%2E+Monkey+(1998)|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0
1680|Sliding Doors (1998)|19980101||http://us.imdb.com/Title?Sliding+Doors+(1998)|0|0|0|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0
1681|You So Crazy (1994)|19940101||http://us.imdb.com/M/title-exact?You%20So%20Crazy%20(1994)|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0
1682|Scream of Stone (Schrei aus Stein) (1991)|19960308||http://us.imdb.com/M/titleexact?Schrei%20aus%20Stein%20(1991)|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0
```

## 7. 'u.data'에서 특정 'user id'가 평가한 영화의 데이터 가져오기
+ 'user id'(1~943) 입력
+ 'user id'로 식별된 사용자가 평가한 영화의 데이터 출력
+ 출력 양식
  + 'user id'로 식별된 사용자가 평가한 모든 영화의 'movie id' 출력
  + 'movie id' 기준 오름차순 정렬
    + 'movie id' | 'movie id' | 'movie id' | 'movie id'...
  + 'user id'로 식별된 사용자가 평가한 10개의 'movie id'와 'title' 출력
  + 'movie id' 기준 오름차순 정렬
    + 'movie id' | 'movie title'
```
Enter your choice [ 1-9 ] 7
Please enter the ‘user id’(1~943):12
4|15|28|50|69|71|82|88|96|97|98|127|132|133|143|15
7|159|161|168|170|172|174|191|195|196|200|202|203|
204|215|216|228|238|242|276|282|300|318|328|381|39
2|402|416|471|480|591|684|708|735|753|754
4|Get Shorty (1995)
15|Mr. Holland's Opus (1995)
28|Apollo 13 (1995)
50|Star Wars (1977)
69|Forrest Gump (1994)
71|Lion King, The (1994)
82|Jurassic Park (1993)
88|Sleepless in Seattle (1993)
96|Terminator 2: Judgment Day (1991)
97|Dances with Wolves (1990)
```

## 8. 20세에서 29세 사이의 'age'와 'occupation'이 'programmer'인 사용자가 평가한 영화의 평균 'rating' 가져오기
+ 20세에서 29세 사이의 'age'와 'occupation'이 'programmer'인 사용자가 평가한 영화의 평균 'rating'을 얻으시겠습니까? (y/n)
+ 20대(20~29세) 프로그래머가 평가한 영화의 평균 평점 모두 출력
+ 20대 프로그래머(20~29세)의 평점만을 기준으로 평균 'rating' 산출
+ 'average rating'을 소수점 여섯 자리까지 반올림하여 소수점 다섯 자리까지 출력
+ 출력 양식
  + 'movie id' 기준 오름차순으로 모두 출력
  + 'movie id' 'average rating'
```
Enter your choice [ 1-9 ] 8 
Do you want to get the average 'rating' of 
movies rated by users with 'age' between 20 and 
29 and 'occupation' as 'programmer'?(y/n):y
1 4.29412
2 3
3 3.5
4 3.7
5 3.25
7 4.22222
8 3.5
9 4.1
10 4
11 4.3125
.
.
.
1512 3
1513 2
1518 4
1531 3
1552 2
1597 1
1600 4
1621 1
1655 2
```

## 9. 나가기
+ 옵션 9를 선택할 때까지 메뉴 선택 계속 반복
+ 옵션 9인 'Exit'를 선택하면 'Bye!'가 출력되고 프로그램 종료
```
$ ./test.sh u.item u.data u.user
--------------------------
User Name: fos
Student Number: 00000000
[ MENU ]
1. Get the data of the movie identified by a 
specific 'movie id' from 'u.item'
2. Get the data of action genre movies from 
'u.item’
3. Get the average 'rating’ of the movie 
identified by specific 'movie id' from 'u.data’
4. Delete the ‘IMDb URL’ from ‘u.item
5. Get the data about users from 'u.user’
6. Modify the format of 'release date' in 'u.item’
7. Get the data of movies rated by a specific 
'user id' from 'u.data'
8. Get the average 'rating' of movies rated by 
users with 'age' between 20 and 29 and 
'occupation' as 'programmer'
9. Exit
--------------------------
Enter your choice [ 1-9 ] 1
Please enter 'movie id'(1~1682):1
1|Toy Story (1995)|01-Jan1995||http://us.imdb.com/M/titleexact?Toy%20Story%20(1995)|0|0|0|1|1|1|0|0|0|0|0|0
|0|0|0|0|0|0|0
Enter your choice [ 1-9 ] 3
Please enter the 'movie id’(1~1682):1
average rating of 1: 3.87832
Enter your choice [ 1-9 ] 9
Bye!
```
