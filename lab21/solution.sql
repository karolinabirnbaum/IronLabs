use ppub;

select * from authors; #this table contains author_id (column au_id)
select * from publishers; #this table contains publisher name (column == pub_name)
select * from titles; #this table show you the title of the book,price,pubdate (column == title)
select * from employee; #this table shows you fname(first_name) and lname(last_name)
select * from sales;
#-------

# authors column & title_author column
#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TITLE - name of the published title
#PUBLISHER - name of the publisher where the title was published

#challenge 1
SELECT
a.au_id as AUTHOR_ID,
a.au_lname as LAST_NAME,
a.au_fname as FIRST_NAME,
b.title as TITLE,
p.pub_name as PUBLISHER

from authors a
join titleauthor t on a.au_id = t.au_id
join titles b on t.title_id = b.title_id
join publishers p on b.pub_id = p.pub_id;

#challenge 2
SELECT
a.au_id as AUTHOR_ID,
a.au_lname as LAST_NAME,
a.au_fname as FIRST_NAME,
p.pub_name as PUBLISHER,
count(distinct b.title) as TITLE_COUNT 


from authors a
join titleauthor t on a.au_id = t.au_id
join titles b on t.title_id = b.title_id
join publishers p on b.pub_id = p.pub_id

GROUP BY
a.au_id ,
a.au_lname ,
a.au_fname ,
p.pub_name; 

#challenge 3
SELECT
a.au_id as AUTHOR_ID,
a.au_lname as LAST_NAME,
a.au_fname as FIRST_NAME,
SUM(s.qty )as TOTAL

from authors a
join titleauthor t on a.au_id = t.au_id
join titles b on t.title_id = b.title_id
join sales s on b.title_id = s.title_id

GROUP BY
a.au_id ,
a.au_lname ,
a.au_fname 

order by total desc
limit 3;

#challenge 4
SELECT
a.au_id as AUTHOR_ID,
a.au_lname as LAST_NAME,
a.au_fname as FIRST_NAME,
SUM(CASE WHEN s.qty IS NULL THEN 0 ELSE s.qty END )as TOTAL

from authors a
left join titleauthor t on a.au_id = t.au_id
left join titles b on t.title_id = b.title_id
left join sales s on b.title_id = s.title_id

GROUP BY
a.au_id ,
a.au_lname ,
a.au_fname 

order by total desc
limit 23