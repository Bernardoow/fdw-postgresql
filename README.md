

# How prepare 
1. Conecta ao docker ro
docker-compose run postgre_12_ro bash

2. Rode o script
./ini_fdw.sh

3. Crie uma nova coluna no bd rw
alter table country add active boolean not null default true;

4. Faça query nos dois bds e veja a diferença.

5. Entre no bd replica
docker-compose run postgre_12_ro bash
PGPASSWORD=mysecretpassword psql -U secretuser -h postgre_12_ro -p 5432 -d iso_3166

6. Digite o comando
ALTER FOREIGN TABLE country add column active boolean;

7. Faça query nos dois bds e veja que estão iguais.



## Links
https://www.postgresql.org/docs/12/sql-alterforeigntable.html
https://www.postgresql.org/docs/12/sql-importforeignschema.html
https://www.percona.com/blog/2018/08/21/foreign-data-wrappers-postgresql-postgres_fdw/

## outros comandos

ALTER FOREIGN TABLE country rename to country1;
ALTER FOREIGN TABLE country add column active boolean;
DROP FOREIGN TABLE subcountry1;
IMPORT FOREIGN SCHEMA "public" FROM SERVER hr INTO public;

OR
IMPORT FOREIGN SCHEMA "public" limit to (country) FROM SERVER hr INTO public;

