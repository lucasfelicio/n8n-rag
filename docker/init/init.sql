DO
$do$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'n8n_rag') THEN
      PERFORM pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = current_database();
      CREATE DATABASE n8n_rag;
   END IF;
END
$do$;

ALTER DATABASE n8n_rag OWNER TO {{POSTGRES_USER}};

CREATE EXTENSION IF NOT EXISTS vector;
