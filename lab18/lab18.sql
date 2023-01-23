CREATE DATABASE ironhack_lab18;

USE ironhack_examples;

SELECT * FROM applestore2;


#1. What are the different genres?
SELECT prime_genre from applestore2
GROUP BY prime_genre;

#There a 22 different genres

#2. Which is the genre with the most apps rated?
SELECT prime_genre ,COUNT(user_rating) AS num_of_rating FROM applestore2
GROUP BY prime_genre order by num_of_rating desc;
#games one
#3. Which is the genre with most apps?
select prime_genre, count(track_name) as number_of_apps from applestore2
Group by prime_genre order by number_of_apps desc
limit 1;
#games one

#4. Which is the one with least?
select prime_genre, count(track_name) as number_of_apps from applestore2
Group by prime_genre order by number_of_apps asc
limit 1;
 #medical one
use ironhack_examples;
#5. Find the top 10 apps most rated.
select track_name, rating_count_tot from applestore2
order by rating_count_tot desc
limit 10;



#6. Find the top 10 apps best rated by users.
select track_name, user_rating from applestore2
order by user_rating desc
limit 10;


#7. Take a look at the data you retrieved in question 5. Give some insights.

#Facebook is an app who have the biggest amount of ratings from users, 



#8. Take a look at the data you retrieved in question 6. Give some insights.
#People who use workout body or mind app highly rate their experience.
#It turns out that spirituality is a thing, when we watch the dataset outcome

#9. Now compare the data from questions 5 and 6. What do you see?
#We can see that even though facebook is one of the apps who have biggest amount of comments, it does may not have the best ratings. However the Bible is in the top 10 here and in the case 5.

#10. How could you take the top 3 regarding both user ratings and number of votes?
USE ironhack_examples;
SELECT prime_genre, AVG(user_rating), SUM(rating_count_tot)
FROM applestore2
group by prime_genre
ORDER BY AVG(user_rating), SUM(rating_count_tot);

#11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
select prime_genre, avg(user_rating), avg(price), count(user_rating) AS num_of_rating from applestore2
group by prime_genre
order by avg(user_rating), num_of_rating desc
limit 15; 

#cheaper the app - more people use them, but also it does not mean that they will have higher rating