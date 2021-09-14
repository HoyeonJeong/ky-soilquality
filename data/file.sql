drop table if exists
	hemp_project.soilq;
create table
	hemp_project.soilq
as
select
hemp_project.soil.id,
cast(hemp_project.soil.fips as varchar),
hemp_project.soil.avg_rate,
hemp_project.soil.acres,
hemp_project.soil.weight_rate,
hemp_project.soil.sd_rate

from
	hemp_project.soil;
	
drop table if exists
	hemp_project.soilquality;
create table
	hemp_project.soilquality
as
select
	hemp_project.soilq.id,
	hemp_hexgrid.ky_county.geom,
	hemp_hexgrid.ky_county.geoid,
	hemp_hexgrid.ky_county.name,
	hemp_hexgrid.ky_county.aland,
	hemp_hexgrid.ky_county.awater,
	hemp_project.soilq.county,
	hemp_project.soilq.fips,
	hemp_project.soilq.symbol,
	hemp_project.soilq.unit_name,
	hemp_project.soilq.acres,
	hemp_project.soilq.weight_acre,
	hemp_project.soilq.weight_rate
from 
	hemp_project.soilq
left join
	hemp_hexgrid.ky_county
on
	hemp_hexgrid.ky_county.geoid=hemp_project.soilq.fips;
	
alter table
	hemp_project.soilquality
add primary key (id);