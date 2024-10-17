-- Simple Advance Analytics
-- Player who score more than average on their team
select player, team, pts
from playoff_stats ps
where pts > 
	(select avg(pts) from playoff_stats ps2 where ps.team = ps2.team group by team)
order by team, pts desc;

-- Total Contribution on Team Scoring - GSW Team
select ps.player, round(pts/team_pts*100,2) as percentage
from playoff_stats ps
join 
team_stats ts on ps.team = ts.team
where ps.team = 'gsw'
order by percentage desc