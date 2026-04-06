select * from india
select * from india_2


---1. Counting the rows ---

select count(*) from india
select count(*) from india_2

---2.dataset for jharkhand and bihar

select * from india where state in ('Jharkhand','Bihar')

---3.population of India

select sum(population) total_pop from india_2

---4.-- avg growth 

select state, avg(growth) avg_growth from india group by state order  by avg_growth

select  avg(growth)*100 avg_growth from india 

---5. -- avg sex ratio ---

select * from india


select state, avg(sex_ratio) total_sex_ratio from india group by state

---6.avg literacy rate

select state, round(avg(literacy),0) as tot_lit from india group by state having round(avg(literacy),0) > 90 

---7. top 3 state showing highest growth ratio

 
 select top 3 state, avg(growth)*100 high_ratio from india group by state order by high_ratio desc 

 ---8. --bottom 3 state showing lowest sex ratio---

  select top 3 state, avg(sex_ratio)*100 high_ratio from india group by state order by high_ratio asc 

  ---9. top and bottom 3 states literacy rates ---

  create table top3 (
  state varchar(10),
  topstates float 
  );
 
insert into top3

select state, ROUND(avg(literacy),0) avg_literacy_ratio from india group by state order by avg_literacy_ratio desc

select * from top3


drop table if exists top3
CREATE TABLE top3 (
  state nVARCHAR(255),
  topstates FLOAT
)

INSERT INTO top3
SELECT  state, ROUND(AVG(literacy), 0) AS avg_literacy_ratio
FROM india
GROUP BY state
ORDER BY avg_literacy_ratio DESC

SELECT * FROM top3 order by top3.topstates desc





drop table if exists bot3
CREATE TABLE bot3 (
  state nVARCHAR(255),
  botstates FLOAT
)

INSERT INTO bot3
SELECT  state, ROUND(AVG(literacy), 0) AS avg_literacy_ratio
FROM india
GROUP BY state
ORDER BY avg_literacy_ratio DESC

SELECT * FROM bot3 order by bot3.botstates


select * from (
SELECT top 3 * FROM top3 order by top3.topstates desc) a

union

select * from (SELECT top 3 * FROM bot3 order by bot3.botstates asc) b


---10. States starting with a ---

select distinct state from india where lower(state)  like 'a%' or LOWER(state) like 'b%'


---11. States starting with a or ends with d---
select distinct state from india where lower(state)  like 'a%' or LOWER(state) like '%d'




---PART - 2 ---

-- joining both table

---12.total males and females

select * from  india
select * from  india_2



select d.state,sum(d.males) total_males,sum(d.females) toatl_females 
from (select c.district, c.state,round(c.population/(c.sex_ratio+1),0) males,round((c.population * c.sex_ratio)/(c.sex_ratio+1),0) females
from 
(select a.district, a.state, a.sex_ratio/1000 sex_ratio, b.population from india a inner join india_2 b 
on a.District = b.District)c)d
group by d.State

---13. -- total literacy rate

select d.state,sum(d.litarate_people) total_lit, sum(d.illtarate_people) total_ill from 

(select c.district,c.state, round(c.litarcay_ratio*c.population,0) litarate_people,round((1-c.litarcay_ratio) * c.population,0) illtarate_people 
from 

(select a.district, a.state, b.population,a.Literacy/100 litarcay_ratio from india a inner join india_2 b 
on a.District = b.District) c)d
group by d.state


---14. -- population in previous census ---

select * from india
select * from india_2


select sum(e.previous),sum(curent) from 
(select d.state, sum(d.previous_census_population) previous, sum(d.current_cenus_population) curent from

(select  c.district, c.state, round(c.population/(1+c.growth),0) previous_census_population, c. population current_cenus_population from 

(select a.district, a.state, a.growth, b.population from india a inner join india_2 b 
on a.District = b.District)c)d
group by d.state) e

---15. -- population vs area ---

--select * from india
--select * from india_2

select sum(area_km2) from india_2

select x.total_area/x.pre_pop reduced, x.total_area/x.cur_pop  incresed from 
(select q.*,r.total_area from

(select '1' as keyy,n.* from (select sum(e.previous) pre_pop ,sum(curent) cur_pop from 
(select d.state, sum(d.previous_census_population) previous, sum(d.current_cenus_population) curent from

(select  c.district, c.state, round(c.population/(1+c.growth),0) previous_census_population, c. population current_cenus_population from 

(select a.district, a.state, a.growth, b.population from india a inner join india_2 b 
on a.District = b.District)c)d
group by d.state) e)n) q inner join (


select '1' as keyy, z.* 
from( select sum(area_km2) total_area from india_2)z) r on q.keyy = r.keyy) x

---16. --window 

--- output top 3 districts from each state with highest literacy rate


select * from india
select * from india_2



select c.* from 
(select distinct district,state, Literacy , ROW_NUMBER() over(partition by state order by  literacy desc) top_3 from india )  c
where c.top_3 in (1,2,3) order by state, top_3

