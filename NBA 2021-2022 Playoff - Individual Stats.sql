-- Top Perfomer - General Statistics
-- Points (pts): Top 10 Scoring Leader 

select player, team, pts
from playoff_stats
order by pts desc
limit 10;

-- Top 10 Most Efficient scorer (FG%)
-- the minimum requirement to qualify for this leaderboard is player must played at least 125 minutes. 
-- and play at least 70% of the team total game played 
select player,team, mp as avg_minute_played, g as game, `fg%`
from playoff_stats ps 
where 
	mp*g > 125 and
    0.7 * (select max(g) from playoff_stats ps2 where ps.team = ps2.team group by team ) 
order by `fg%`desc
limit 10;

-- Assist Leader 
select player, team, g as game, ast 
from playoff_stats ps
where 
	mp*g > 125 and
    g > 0.7 * (select max(g) from playoff_stats ps2 where ps.team = ps2.team group by team) 
order by ast desc
limit 5;

-- Total Rebound 
select player, team, g as game, trb 
from playoff_stats ps
where 
	mp*g > 125 and
	g > 0.7 * (select max(g) from playoff_stats ps2 where ps.team = ps2.team group by team) 
order by trb desc
limit 5;

-- Total STL
select player, team, g as game, stl
from playoff_stats ps
where 
	mp*g > 125 and
    g > 0.7 * (select max(g) from playoff_stats ps2 where ps.team = ps2.team group by team) 
order by stl desc
limit 5;

-- Total Block 
select player, team, g as game, blk 
from playoff_stats ps
where 
	mp*g > 125 and 
    g > 0.7 * (select max(g) from playoff_stats ps2 where ps.team = ps2.team group by team)
order by blk desc
limit 5;

-- three point made
select player, team, g as game, round(`3p`* g) as three_point_made
from playoff_stats ps 
where 
	mp*g > 125 and 
    g > 0.7*(select max(g) from playoff_stats ps2 where ps2.team = ps.team group by team)
order by three_point_made desc
limit 5;

-- 3p%
select player, team, g as game,`3p`, `3p%` as three_point_perc
from playoff_stats ps 
where 
	`3p`*g > 15
order by `3p%` desc
limit 5;

-- free throw percentage
select player, team, g as game, `ft%` 
from playoff_stats ps 
where 
	ft*g > 22 
order by `ft%` desc
limit 5;