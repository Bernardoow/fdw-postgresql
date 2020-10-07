https://www.postgresql.org/docs/12/sql-alterforeigntable.html


alter table country add active boolean not null default true;

ALTER FOREIGN TABLE country rename to country1;
ALTER FOREIGN TABLE country add column active smallint;
DROP FOREIGN TABLE subcountry1;
IMPORT FOREIGN SCHEMA "public" FROM SERVER hr INTO public;



## How connect to docker
docker-compose run postgre_12_ro bash

## How connect to postgres
PGPASSWORD=mysecretpassword psql -U secretuser -h postgre_12_ro -p 5432 -d ciclo