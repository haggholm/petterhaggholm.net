DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id serial not null primary key,
  email character varying not null unique,
  password character varying(64), -- 32 byte (256 bit) PBKDF2 hash
  salt character varying(64),
  last_login timestamp with time zone,
  last_login_attempt timestamp with time zone
);

INSERT INTO users (email) VALUES ('petter@petterhaggholm.net');


DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
  sid character varying not null primary key,
  sess json NOT NULL,
  expired timestamp(6) without time zone
) WITH ( OIDS=FALSE );
CREATE INDEX ON sessions (expired ASC NULLS LAST);


DROP TABLE IF EXISTS reset_tokens;
CREATE TABLE reset_tokens (
  token uuid not null primary key,
  user_id integer not null references users(id),
  expired timestamp(6) without time zone not null
);
CREATE INDEX ON sessions (expired ASC);



DROP TABLE IF EXISTS artwork;
CREATE TABLE artwork (
  id serial primary key,
  filename character varying(256) not null,
  thumbnail character varying(512) not null,
  title character varying(256) not null,
  caption text not null,
  details character varying
);
