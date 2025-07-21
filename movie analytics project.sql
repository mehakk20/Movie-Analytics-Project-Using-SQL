use movies;

-- What are the names of all the actors and total count of unique actors?
-- What are the names of all directors and total count of unique directors?

select actor from actors;
select count(distinct(actor)) as count_of_actors from actors ;

select director from directors;
select count(distinct(director)) as count_of_directors from directors ;

-- What is the language wise distribution of the movies in descending order?
select languages, count(movie_id) as count_of_movies
from movies_table
group by languages
order by 2 desc;

-- Which is the highest grossing movie?
select distinct*
from movies_table
where gross= (select max(gross) from movies_table); 

-- Which is the lowest budget English movie?
select distinct *
from movies_table
where budget=(select min(budget) from movies_table where languages="English" and budget>0);

-- Create a list of movie titles indicating whether their imdb ratings are above 7 or not.
select distinct(movie_title),
	case 
    when imdb_score > 7 then "Above 7"
    else "Below 7"
end as type
from movies_table;

-- Show the top 5 genres based on number of movies made in the last 3 years
select distinct(genres), count(*) as total
from movies_table
where title_year > (select max(title_year) from movies_table) - 5
group by genres
order by 2 desc
limit 5;


-- Create a list of movies made by those directors who have made more than 10 movies.
select distinct m.movie_title, d.director
from movies_table as m
join directors as d on d.d_id = m.director_ID
where m.director_ID in (
select director_ID
from movies_table
group by director_id
having count(*)>10)
order by d.director, m.movie_title;

-- Create a list of directors who have directed movies in at least 2 genres and have average imdb score above 6
select d.director, round(avg(imdb_score),2) as average_imdb_score, count(m.genres) as number_of_genres
from directors as d
join movies_table as m
on d.d_id = m.director_ID
group by d.director
having count(distinct m.genres )>=2 and  avg(m.imdb_score) >6 
order by 2 desc ;

-- Formulate a list of top 10 actors who have appeared in most movies and show their average imdb scores
select a.actor, count(distinct m.movie_id) as movie_count, round(avg(imdb_score),2) as average_imdb_score
from actors as a 
left join movies_table as m
on concat('|', m.actors ,'|') like concat('%|', a.actor,'|%')
group by a.actor
order by 2 desc
limit 10;

-- Find top 3 highest grossing movies for each year

with ranked_movie as (
	select movie_title,
    gross,
    title_year,
    dense_rank() over (partition by title_year order by gross desc) as gross_rank
    from movies_table
)
select title_year,
	max( case when gross_rank=1 then movie_title end )as Highest_grossing_movie,
    max(case when gross_rank=2 then movie_title end) as Second_highest_grossing_movie,
    max(case when gross_rank=3 then movie_title end) as Third_highest_grossing_movie
from ranked_movie
where gross_rank <=3
group by title_year
order by title_year desc;

-- Create a procedure which takes director's id as input and gives the average of their imdb scores

delimiter $$
create procedure avg_imdbscore( in d_id varchar(255), out avg_score int)
begin
	select avg(imdb_score)
    into avg_score
    from movies_table
    where director_ID=d_id;
end $$ 
delimiter ;
call avg_imdbscore('D1003', @result);
select @result;

-- For each director, list all of their movies and imdb scores, ranked according to imdb scores

select distinct director_ID, movie_title, imdb_score, 
	dense_rank() over (partition by director_ID order by imdb_score desc) as ranking
from movies_table
where imdb_score is not null
order by director_ID, imdb_score desc;












