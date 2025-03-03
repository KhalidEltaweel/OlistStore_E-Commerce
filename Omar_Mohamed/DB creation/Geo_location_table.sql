if exists ( select * 
			from sys.tables
			where name = 'Geo_locations'
			and 
			type= 'U')

drop table Geo_locations  

GO 

--Table Geo_locations

create table Geo_locations 
			(geolocation_zip_code_prefix int primary key,
			 geolocation_lat decimal (15,10),
			 geolocation_lng decimal (15,10),
			 geolocation_city varchar(50),
			 geolocation_state varchar(50))