#!/bin/bash
set -e

PGPASSWORD=mysecretpassword psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -h "postgre_12_ro" --dbname "$POSTGRES_DB" <<-EOSQL
    create extension postgres_fdw;
    \dx postgres_fdw;

    grant usage on FOREIGN DATA WRAPPER postgres_fdw to secretuser;

    CREATE SERVER hr FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname 'iso_3166', host 'postgre_12_rw', port '5432');

    CREATE USER MAPPING for secretuser SERVER hr OPTIONS (user 'secretuser', password 'mysecretpassword');
    IMPORT FOREIGN SCHEMA "public" FROM SERVER hr INTO public;
EOSQL
