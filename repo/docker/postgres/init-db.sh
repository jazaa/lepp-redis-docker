#!/bin/sh
set -e

psql -e -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-END
	\timing
	CREATE USER webapp_dba WITH PASSWORD 'pass';
	CREATE DATABASE webapp_db OWNER webapp_dba;
	GRANT ALL PRIVILEGES ON DATABASE webapp_db TO webapp_dba;
	CREATE EXTENSION tablefunc;
END

export PGUSER=webapp_dba
export PGPASSWORD=pass