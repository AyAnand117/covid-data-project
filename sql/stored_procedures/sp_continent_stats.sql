-- STORED PROCEDURE FOR COVID SUMMARY DATA 

create procedure sp_continent_summary
@continent_name varchar(100)
as
begin
select
*
from vw_summary_metrics
where continent = @continent_name;
end;

exec sp_continent_summary 'Asia';

