-- Team Stats
-- Through individual stats, i would like to calculate and create the team statistics

-- Team Points 
select team,  sum(g*pts)/max(g) as team_pts
from playoff_stats
group by team
order by team_pts desc;

-- Team Assist
select team,  sum(g*ast)/max(g) as team_ast
from playoff_stats
group by team
order by team_ast desc;

-- Team Total Rebound
select team,  sum(g*trb)/max(g) as team_trb
from playoff_stats
group by team
order by team_trb desc;

-- Team Block 
select team,  sum(g*blk)/max(g) as team_blk
from playoff_stats
group by team
order by team_blk desc;

-- Team Steal
select team,  sum(g*stl)/max(g) as team_steal
from playoff_stats
group by team
order by team_steal desc;

-- Team three point made
select team,  round(sum(g*`3p`)) as team_three_point_made
from playoff_stats
group by team
order by team_three_point_made desc;

-- team field goal percentage 
select team, round(sum(g*fg)/sum(g*fga) * 100,2) as team_fg_perc
from playoff_stats
group by team
order by team_fg_perc desc;

-- team three point attempt 
select team, round(sum(g*`3pa`)) as team_3pa
from playoff_stats
group by team
order by team_3pa desc;

-- team three point percentage
select team, round(sum(g*`3p`)/sum(g*`3pa`) * 100,2) as team_3fg_perc
from playoff_stats
group by team
order by team_3fg_perc desc;

-- team free throw attempt 
select team, round(sum(g*`fta`)) as team_fta
from playoff_stats
group by team
order by team_fta desc;

-- team free throw percentage
select team, round(sum(g*`ft`)/sum(g*`fta`) * 100,2) as team_ft_perc
from playoff_stats
group by team
order by team_ft_perc desc;

select team, max(g) as game_played
from playoff_stats
group by team;

-- Full Table
drop table if exists team_stats;
create table team_stats as 
select 
    team,  
    max(g) as game_played,
    round(sum(g*pts)/max(g),2) as team_pts,
    round(sum(g*ast)/max(g),2) as team_ast,
    round(sum(g*trb)/max(g),2) as team_trb,
    round(sum(g*blk)/max(g),2) as team_blk,
    round(sum(g*stl)/max(g),2) as team_steal,
    round(sum(g*fg)/sum(g*fga) * 100,2) as team_fg_perc,
    round(sum(g*`3p`)) as team_three_point_made,
    round(sum(g*`3pa`)) as team_3pa,
    round(sum(g*`3p`)/sum(g*`3pa`) * 100,2) as team_3fg_perc,
    round(sum(g*`fta`)) as team_fta,
    round(sum(g*`ft`)/sum(g*`fta`) * 100,2) as team_ft_perc
from playoff_stats
group by team;

select *
from team_stats