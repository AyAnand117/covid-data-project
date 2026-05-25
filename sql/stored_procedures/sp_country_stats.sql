-- STORED PROCEDURES --

create procedure sp_country_stats
@country_name varchar(100)
as begin
select *
from vw_daily_metrics
where country = @country_name;
end;

exec sp_country_stats 'India';

