#!/bin/bash
set -e

# 创建业务库
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE SCHEMA IF NOT EXISTS app;
    GRANT ALL ON SCHEMA app TO PUBLIC;

    -- 可选：创建只读用户
    -- CREATE USER readonly WITH PASSWORD 'readonly_password';
    -- GRANT CONNECT ON DATABASE appdb TO readonly;
    -- GRANT USAGE ON SCHEMA app TO readonly;
    -- ALTER DEFAULT PRIVILEGES IN SCHEMA app GRANT SELECT ON TABLES TO readonly;
EOSQL
