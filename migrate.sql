--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: htpage; Type: SCHEMA; Schema: -; Owner: phnet
--

CREATE SCHEMA htpage;


ALTER SCHEMA htpage OWNER TO phnet;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = htpage, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: db_update; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE db_update (
    name character varying(255) NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE htpage.db_update OWNER TO phnet;

--
-- Name: group; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE "group" (
    id integer NOT NULL,
    group_name character varying(255) NOT NULL
);


ALTER TABLE htpage."group" OWNER TO phnet;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: htpage; Owner: phnet
--

CREATE SEQUENCE group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE htpage.group_id_seq OWNER TO phnet;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: htpage; Owner: phnet
--

ALTER SEQUENCE group_id_seq OWNED BY "group".id;


--
-- Name: group_permission; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE group_permission (
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE htpage.group_permission OWNER TO phnet;

--
-- Name: menu_item; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE menu_item (
    id integer NOT NULL,
    name character varying(255),
    title character varying(128),
    page_class character varying(64),
    sort_order integer,
    parent_id integer,
    module character varying(64),
    permission character varying(64),
    icon character varying(64)
);


ALTER TABLE htpage.menu_item OWNER TO phnet;

--
-- Name: menuitem_id_seq; Type: SEQUENCE; Schema: htpage; Owner: phnet
--

CREATE SEQUENCE menuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE htpage.menuitem_id_seq OWNER TO phnet;

--
-- Name: menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: htpage; Owner: phnet
--

ALTER SEQUENCE menuitem_id_seq OWNED BY menu_item.id;


--
-- Name: permission; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE permission (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE htpage.permission OWNER TO phnet;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: htpage; Owner: phnet
--

CREATE SEQUENCE permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE htpage.permission_id_seq OWNER TO phnet;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: htpage; Owner: phnet
--

ALTER SEQUENCE permission_id_seq OWNED BY permission.id;


--
-- Name: session; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE session (
    id integer NOT NULL,
    user_id integer,
    ctime timestamp without time zone NOT NULL,
    key character(64) NOT NULL,
    atime timestamp without time zone NOT NULL,
    token character(32) NOT NULL,
    pkey character(32) NOT NULL
);


ALTER TABLE htpage.session OWNER TO phnet;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: htpage; Owner: phnet
--

CREATE SEQUENCE session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE htpage.session_id_seq OWNER TO phnet;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: htpage; Owner: phnet
--

ALTER SEQUENCE session_id_seq OWNED BY session.id;


--
-- Name: user; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    passwd character(64) NOT NULL,
    passwd_salt character(32) NOT NULL,
    last_login_attempt timestamp without time zone
);


ALTER TABLE htpage."user" OWNER TO phnet;

--
-- Name: user_group; Type: TABLE; Schema: htpage; Owner: phnet; Tablespace: 
--

CREATE TABLE user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE htpage.user_group OWNER TO phnet;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: htpage; Owner: phnet
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE htpage.user_id_seq OWNER TO phnet;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: htpage; Owner: phnet
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


SET search_path = public, pg_catalog;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO phnet;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO phnet;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO phnet;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO phnet;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO phnet;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO phnet;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO phnet;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO phnet;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO phnet;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO phnet;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO phnet;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO phnet;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO phnet;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO phnet;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE authors (
    author integer NOT NULL,
    book integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.authors OWNER TO phnet;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO phnet;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(1024) NOT NULL,
    english_title character varying(1024) NOT NULL,
    read_original boolean,
    language_id integer NOT NULL,
    notes text,
    isbn character varying(17),
    oclc bigint,
    sort_title character varying(1024),
    rating integer,
    review text,
    review_date timestamp without time zone,
    owned boolean DEFAULT false NOT NULL
);


ALTER TABLE public.books OWNER TO phnet;

--
-- Name: people; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    first_name character varying(32),
    middle_names character varying(32),
    last_name character varying(32),
    nickname character varying(32),
    list_name character varying(64),
    full_name character varying(128)
);


ALTER TABLE public.people OWNER TO phnet;

--
-- Name: series; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE series (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    sort_title character varying(128),
    notes text,
    review text,
    review_date timestamp without time zone
);


ALTER TABLE public.series OWNER TO phnet;

--
-- Name: volumes; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE volumes (
    series integer NOT NULL,
    book integer NOT NULL,
    volume integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.volumes OWNER TO phnet;

--
-- Name: book_info; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW book_info AS
 SELECT books.id,
    books.title,
    books.english_title,
    books.sort_title,
    books.rating,
    ((books.review IS NOT NULL) OR (series.review IS NOT NULL)) AS has_review,
    array_agg(((people.id || ':'::text) || (people.list_name)::text)) AS author_info,
    array_agg(((people.id || ':'::text) || (people.full_name)::text)) AS author_desc,
    series.id AS series_id,
    series.title AS series_title,
    volumes.volume
   FROM ((((books
     LEFT JOIN authors authors ON ((books.id = authors.book)))
     LEFT JOIN people people ON ((people.id = authors.author)))
     LEFT JOIN volumes volumes ON ((books.id = volumes.book)))
     LEFT JOIN series series ON ((series.id = volumes.series)))
  GROUP BY books.id, books.title, books.sort_title, books.english_title, books.rating, books.review, series.review, series.id, series.title, volumes.volume;


ALTER TABLE public.book_info OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO phnet;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO phnet;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO phnet;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO phnet;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO phnet;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO phnet;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO phnet;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO phnet;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE languages (
    name text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.languages OWNER TO phnet;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO phnet;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO phnet;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_id_seq OWNER TO phnet;

--
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE series_id_seq OWNED BY series.id;


--
-- Name: tg_group; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE tg_group (
    group_id integer NOT NULL,
    group_name character varying(16) NOT NULL,
    display_name character varying(255),
    created timestamp without time zone
);


ALTER TABLE public.tg_group OWNER TO phnet;

--
-- Name: tg_group_group_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE tg_group_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tg_group_group_id_seq OWNER TO phnet;

--
-- Name: tg_group_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE tg_group_group_id_seq OWNED BY tg_group.group_id;


--
-- Name: tg_group_permission; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE tg_group_permission (
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.tg_group_permission OWNER TO phnet;

--
-- Name: tg_permission; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE tg_permission (
    permission_id integer NOT NULL,
    permission_name character varying(63) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.tg_permission OWNER TO phnet;

--
-- Name: tg_permission_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE tg_permission_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tg_permission_permission_id_seq OWNER TO phnet;

--
-- Name: tg_permission_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE tg_permission_permission_id_seq OWNED BY tg_permission.permission_id;


--
-- Name: tg_user; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE tg_user (
    user_id integer NOT NULL,
    user_name character varying(16) NOT NULL,
    email_address character varying(255) NOT NULL,
    display_name character varying(255),
    password character varying(80),
    created timestamp without time zone
);


ALTER TABLE public.tg_user OWNER TO phnet;

--
-- Name: tg_user_group; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE tg_user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.tg_user_group OWNER TO phnet;

--
-- Name: tg_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE tg_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tg_user_user_id_seq OWNER TO phnet;

--
-- Name: tg_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE tg_user_user_id_seq OWNED BY tg_user.user_id;


--
-- Name: translations; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE translations (
    id integer NOT NULL,
    book integer,
    title character varying(1024),
    language_id integer,
    isbn character varying(17)
);


ALTER TABLE public.translations OWNER TO phnet;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO phnet;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE translations_id_seq OWNED BY translations.id;


--
-- Name: translators; Type: TABLE; Schema: public; Owner: phnet; Tablespace: 
--

CREATE TABLE translators (
    translation integer,
    person integer,
    id integer NOT NULL
);


ALTER TABLE public.translators OWNER TO phnet;

--
-- Name: translators_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE translators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translators_id_seq OWNER TO phnet;

--
-- Name: translators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE translators_id_seq OWNED BY translators.id;


--
-- Name: volumes_id_seq; Type: SEQUENCE; Schema: public; Owner: phnet
--

CREATE SEQUENCE volumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volumes_id_seq OWNER TO phnet;

--
-- Name: volumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phnet
--

ALTER SEQUENCE volumes_id_seq OWNED BY volumes.id;


SET search_path = htpage, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY "group" ALTER COLUMN id SET DEFAULT nextval('group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY menu_item ALTER COLUMN id SET DEFAULT nextval('menuitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY permission ALTER COLUMN id SET DEFAULT nextval('permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY session ALTER COLUMN id SET DEFAULT nextval('session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY series ALTER COLUMN id SET DEFAULT nextval('series_id_seq'::regclass);


--
-- Name: group_id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY tg_group ALTER COLUMN group_id SET DEFAULT nextval('tg_group_group_id_seq'::regclass);


--
-- Name: permission_id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY tg_permission ALTER COLUMN permission_id SET DEFAULT nextval('tg_permission_permission_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY tg_user ALTER COLUMN user_id SET DEFAULT nextval('tg_user_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY translations ALTER COLUMN id SET DEFAULT nextval('translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY translators ALTER COLUMN id SET DEFAULT nextval('translators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY volumes ALTER COLUMN id SET DEFAULT nextval('volumes_id_seq'::regclass);


SET search_path = htpage, pg_catalog;

--
-- Data for Name: db_update; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY db_update (name, "time") FROM stdin;
htdoc/_000_test.py	2009-04-19 16:54:06.326901
app/_000_test.py	2009-04-19 16:54:06.363415
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY "group" (id, group_name) FROM stdin;
\.


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: htpage; Owner: phnet
--

SELECT pg_catalog.setval('group_id_seq', 1, false);


--
-- Data for Name: group_permission; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY group_permission (group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: menu_item; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY menu_item (id, name, title, page_class, sort_order, parent_id, module, permission, icon) FROM stdin;
47	blog#footnote	Footnote	\N	\N	1	\N	\N	\N
48	essays#index	The essays	\N	\N	2	\N	\N	\N
49	essays#introduction	Note	\N	\N	2	\N	\N	\N
50	links#web_development	Web development	\N	\N	3	\N	\N	\N
51	links#programming	Programming	\N	\N	3	\N	\N	\N
52	links#misc	Miscellaneous	\N	\N	3	\N	\N	\N
53	links#comics	Webcomics	\N	\N	3	\N	\N	\N
54	links#blogs	Blogs	\N	\N	3	\N	\N	\N
55	links#friends	My friends	\N	\N	3	\N	\N	\N
56	links#mine	My sites	\N	\N	3	\N	\N	\N
57	aboutme#resume	Résumé	\N	\N	5	\N	\N	\N
58	aboutme#education	Education	\N	\N	5	\N	\N	\N
59	aboutme#pgp	PGP key	\N	\N	5	\N	\N	\N
60	aboutme#geeky	Geeky bits	\N	\N	5	\N	\N	\N
61	aboutme#personal	Personal	\N	\N	5	\N	\N	\N
62	booklist#list	The List	\N	\N	7	\N	\N	\N
63	booklist#footnote	Footnote	\N	\N	7	\N	\N	\N
6	index	Home	\N	0	\N	\N	\N	home.png
5	aboutme	About me	\N	1	\N	\N	\N	aboutme.png
7	booklist	Books I’ve read	\N	2	\N	\N	\N	book.png
11	my_code	Code	\N	3	\N	\N	\N	code-icon.jpeg
4	art_gallery	Art gallery	\N	4	\N	\N	\N	drawing.png
3	links	Links	\N	5	\N	\N	\N	link.png
2	essays	Essays	\N	6	\N	\N	\N	writing.png
1	blog	Blog	\N	7	\N	\N	\N	livejournal.png
10	rtsync	rtsync	\N	\N	11	\N	\N	\N
67	&#109;&#097;&#105;&#108;&#116;&#111;&#058;petter&#064;petterhaggholm&#046;net	Email me	\N	999	\N	\N	\N	email.png
68	sqlobject_inherit	SQLObjectInherit	\N	\N	11	\N	\N	\N
9	taglibdemo	taglib	\N	\N	11	\N	\N	\N
\.


--
-- Name: menuitem_id_seq; Type: SEQUENCE SET; Schema: htpage; Owner: phnet
--

SELECT pg_catalog.setval('menuitem_id_seq', 68, true);


--
-- Data for Name: permission; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY permission (id, name) FROM stdin;
\.


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: htpage; Owner: phnet
--

SELECT pg_catalog.setval('permission_id_seq', 1, false);


--
-- Data for Name: session; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY session (id, user_id, ctime, key, atime, token, pkey) FROM stdin;
647	\N	2009-09-05 13:14:10	180fbce6ea76161101bfc43848b69999e86d2279eedb55b92cd8cbe394fed233	2009-09-11 00:02:08	0027966054e6309efcbb48209b105ca7	9880df0da2707400e54c226233848ad2
\.


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: htpage; Owner: phnet
--

SELECT pg_catalog.setval('session_id_seq', 647, true);


--
-- Data for Name: user; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY "user" (id, username, email, passwd, passwd_salt, last_login_attempt) FROM stdin;
1	admin	petter@petterhaggholm.net	8709dd9e4f8ad9401a66e28711294cec66d5f4aff982c49390235b4523f15354	12b67d75260442ffb3e88813bc085fd4	\N
\.


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: htpage; Owner: phnet
--

COPY user_group (user_id, group_id) FROM stdin;
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: htpage; Owner: phnet
--

SELECT pg_catalog.setval('user_id_seq', 1, true);


SET search_path = public, pg_catalog;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('auth_message_id_seq', 632, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add message	4	add_message
11	Can change message	4	change_message
12	Can delete message	4	delete_message
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add log entry	8	add_logentry
23	Can change log entry	8	change_logentry
24	Can delete log entry	8	delete_logentry
25	Can add author	9	add_author
26	Can change author	9	change_author
27	Can delete author	9	delete_author
28	Can add book	10	add_book
29	Can change book	10	change_book
30	Can delete book	10	delete_book
31	Can add person	11	add_person
32	Can change person	11	change_person
33	Can delete person	11	delete_person
34	Can add series	12	add_series
35	Can change series	12	change_series
36	Can delete series	12	delete_series
37	Can add volume	13	add_volume
38	Can change volume	13	change_volume
39	Can delete volume	13	delete_volume
40	Can add translator	14	add_translator
41	Can change translator	14	change_translator
42	Can delete translator	14	delete_translator
43	Can add language	15	add_language
44	Can change language	15	change_language
45	Can delete language	15	delete_language
46	Can add translation	16	add_translation
47	Can change translation	16	change_translation
48	Can delete translation	16	delete_translation
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	petter	Petter	Häggholm	petter@petterhaggholm.net	pbkdf2_sha256$10000$ZhL8GJ7NAhlN$k4JGoUCR/nbBf/iPzV0M0hv5mnj2JcTZCmyGmj+DH4A=	t	t	t	2013-05-20 03:05:00.223004+00	2010-01-31 21:29:43+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY authors (author, book, id) FROM stdin;
1	1	1
3	2	2
4	3	3
4	4	4
4	5	5
5	6	6
4	7	7
4	8	8
4	9	9
4	10	10
7	12	11
8	13	12
9	14	13
10	15	14
10	16	15
10	17	16
10	18	17
11	19	18
11	20	19
11	21	20
11	22	21
11	23	22
11	24	23
11	25	24
11	26	25
11	27	26
11	28	27
11	29	28
11	30	29
12	31	30
12	32	31
12	33	32
12	34	33
12	35	34
12	36	35
12	37	36
12	38	37
12	39	38
12	40	39
12	41	40
12	42	41
13	44	42
14	45	43
14	46	44
15	47	45
16	48	46
17	49	47
18	50	48
18	51	49
18	52	50
18	53	51
18	54	52
18	55	53
18	56	54
18	57	55
18	58	56
18	59	57
18	60	58
18	61	59
18	62	60
18	63	61
18	64	62
18	65	63
18	66	64
18	67	65
18	68	66
18	69	67
18	70	68
19	71	69
20	72	70
20	73	71
20	74	72
21	75	73
21	76	74
21	77	75
21	78	76
21	79	77
21	80	78
21	81	79
21	82	80
22	83	81
22	84	82
22	85	83
22	86	84
22	87	85
23	88	86
23	89	87
23	90	88
23	91	89
23	92	90
23	93	91
23	94	92
23	95	93
24	96	94
24	97	95
24	98	96
24	99	97
24	100	98
24	101	99
24	102	100
24	103	101
24	104	102
24	105	103
24	106	104
25	107	105
25	108	106
25	109	107
25	110	108
25	111	109
25	112	110
25	113	111
26	114	112
26	115	113
26	116	114
26	117	115
26	118	116
26	119	117
26	120	118
27	121	119
27	122	120
27	123	121
27	124	122
28	125	123
29	126	124
29	127	125
30	128	126
30	129	127
31	130	128
32	131	129
29	132	130
33	133	131
33	134	132
33	135	133
33	136	134
33	137	135
33	138	136
33	139	137
33	140	138
33	141	139
34	142	140
1	144	141
2	144	142
1	145	143
35	143	144
36	146	145
37	147	146
38	156	147
38	157	148
38	158	149
38	159	150
38	160	151
38	161	152
38	162	153
38	163	154
41	165	155
42	165	156
44	166	157
26	167	158
26	168	159
26	169	160
26	170	161
26	171	162
26	172	163
45	173	164
46	174	165
47	175	166
47	176	167
48	177	168
49	178	169
50	179	170
50	180	171
51	181	172
52	182	173
52	183	174
52	184	175
52	185	176
53	186	177
53	187	178
53	188	179
54	189	180
54	190	181
55	191	182
55	192	183
55	193	184
55	194	185
55	195	186
56	196	187
57	197	188
58	198	189
58	199	190
58	200	191
59	201	192
59	202	193
60	203	194
61	204	195
61	205	196
61	206	197
61	207	198
61	209	199
61	210	200
61	211	201
61	212	202
62	213	203
46	213	204
63	214	205
64	215	206
26	216	207
65	217	208
65	218	209
65	219	210
66	220	211
66	221	212
66	222	213
67	223	214
68	224	215
69	225	216
70	226	217
71	227	218
72	228	219
72	229	220
73	230	221
74	230	222
75	231	223
75	232	224
75	233	225
2	234	226
2	235	227
2	236	228
2	237	229
2	238	230
2	239	231
2	240	232
2	241	233
76	242	234
77	243	235
78	244	236
79	245	237
80	246	238
12	247	239
81	248	240
81	249	241
81	250	242
81	251	243
81	252	244
81	253	245
82	254	246
83	255	247
83	256	248
84	257	249
84	258	250
84	259	251
84	260	252
85	261	253
86	262	254
87	263	255
88	264	256
89	265	257
89	266	258
90	267	259
91	268	260
91	269	261
91	270	262
91	271	263
91	272	264
91	273	265
92	274	266
93	274	267
94	275	268
95	276	269
96	277	270
96	278	271
97	279	272
97	280	273
97	281	274
97	282	275
97	283	276
97	284	277
98	285	278
92	286	279
93	286	280
92	287	281
93	287	282
1	288	283
99	302	284
99	303	285
99	304	286
99	305	287
99	306	288
99	307	289
99	308	290
99	309	291
99	310	292
99	311	293
99	312	294
99	313	295
99	314	296
99	315	297
100	316	298
100	317	299
101	318	300
101	319	301
66	320	302
26	321	303
102	322	304
81	323	305
103	324	306
104	325	307
105	326	308
106	327	309
107	327	310
108	327	311
109	328	312
110	329	313
111	330	314
112	331	315
113	332	316
113	333	317
114	334	318
115	334	319
97	335	320
116	336	321
117	337	322
82	338	323
82	339	324
98	340	325
118	341	326
119	342	327
98	343	328
98	344	329
98	345	330
98	346	331
120	347	332
121	348	333
122	349	334
123	349	335
124	350	336
98	351	337
125	352	338
98	353	339
119	354	340
26	355	341
26	356	342
126	357	343
127	357	344
126	358	345
127	358	346
126	359	347
127	359	348
126	360	349
127	360	350
89	361	351
49	362	352
128	363	353
129	364	354
130	365	355
131	366	356
132	367	357
132	368	358
132	369	359
133	370	360
134	371	361
135	372	362
136	373	363
137	374	364
133	375	365
138	376	366
139	377	367
140	378	368
141	379	369
142	380	370
143	381	371
133	382	372
145	384	373
146	385	374
147	386	375
148	387	376
150	389	377
152	390	378
153	391	379
154	392	380
22	393	381
155	394	382
156	395	383
157	396	384
158	397	385
159	398	386
160	398	387
161	398	388
137	399	389
162	400	390
163	401	391
164	402	392
163	403	393
165	404	394
166	404	395
167	405	396
167	406	397
168	408	399
169	409	400
170	410	401
171	411	402
171	412	403
172	413	404
173	414	405
155	415	406
174	416	407
175	417	408
175	418	409
175	419	410
175	420	411
175	421	412
175	422	413
175	423	414
175	424	415
175	425	416
175	426	417
175	427	418
175	428	419
175	429	420
175	430	421
9	431	422
176	432	423
177	433	424
26	434	425
178	435	426
94	436	427
24	437	428
9	438	429
179	439	430
9	440	431
180	441	432
26	442	433
29	443	434
9	444	435
181	445	436
182	446	437
183	447	438
184	448	439
185	449	440
186	450	441
187	451	442
188	452	443
188	453	444
185	454	445
189	455	446
12	456	447
185	457	448
191	459	449
12	460	450
192	461	451
36	462	452
72	463	453
72	464	454
193	465	455
195	467	456
34	468	457
72	469	458
197	470	459
80	471	460
198	471	461
197	472	462
182	473	463
201	476	464
203	477	465
206	478	466
207	479	467
208	480	468
35	481	469
209	482	470
210	482	471
17	483	472
17	484	473
17	485	474
9	486	475
21	487	476
211	487	477
22	488	478
208	489	479
207	489	480
208	490	481
207	490	482
21	491	483
211	491	484
22	492	485
212	493	486
214	495	487
65	496	488
20	497	489
216	498	490
217	499	491
218	501	492
81	502	493
219	503	494
221	504	495
222	505	496
167	506	497
9	507	498
223	508	499
9	509	500
178	510	501
5	511	502
227	512	503
228	513	504
229	514	505
230	515	506
4	516	507
228	517	508
228	518	509
228	519	510
228	520	511
9	521	512
228	522	513
228	523	514
231	524	515
232	525	516
233	525	517
234	526	518
235	526	519
236	526	520
237	526	521
22	527	522
197	528	523
75	529	524
227	530	525
75	531	526
238	532	527
17	533	528
239	534	529
240	535	530
241	536	531
242	538	532
243	539	533
77	540	534
244	542	535
247	543	536
248	544	537
203	545	538
250	546	539
251	547	540
231	548	541
252	549	542
253	549	543
231	550	544
124	551	545
243	552	546
254	553	547
29	554	548
18	555	549
255	556	550
178	557	551
23	558	552
254	559	553
251	560	554
256	560	555
192	561	556
61	562	557
11	563	558
257	564	559
258	565	560
259	566	561
260	567	562
257	568	563
258	569	564
261	570	565
262	570	566
263	571	567
244	572	568
264	573	569
264	574	570
264	575	571
264	576	572
265	577	573
265	578	574
266	579	575
267	580	576
223	581	577
23	582	578
268	582	579
269	583	580
271	585	581
273	586	582
274	587	583
275	587	584
104	588	585
82	589	586
12	590	587
276	591	588
277	592	589
279	594	590
281	595	591
282	596	592
12	597	593
283	36	594
283	37	595
283	590	596
283	597	597
2	598	598
86	599	599
22	600	600
22	601	601
12	602	602
283	602	603
284	603	604
285	604	605
12	605	606
283	605	607
12	606	608
283	606	609
286	607	610
287	608	611
288	609	612
289	609	613
259	610	614
290	611	615
291	612	616
75	613	617
292	614	618
293	614	619
294	615	620
295	616	621
296	617	622
297	618	623
298	619	624
231	620	625
299	621	626
298	622	627
238	623	628
300	624	629
301	625	630
302	626	631
303	627	632
304	627	633
305	628	634
306	629	635
307	630	636
46	631	637
22	632	638
309	633	639
310	634	640
120	635	641
311	636	642
312	636	643
313	637	644
11	638	645
314	639	646
315	640	647
22	641	648
316	642	649
12	643	650
317	643	651
46	644	652
7	645	653
318	645	654
319	646	655
7	647	656
265	648	657
320	649	658
78	650	659
321	651	660
322	652	661
328	653	662
329	654	663
330	655	664
331	656	665
331	657	666
331	658	667
332	659	668
333	660	669
334	662	670
94	661	671
257	663	672
191	664	673
191	665	674
335	666	675
336	666	676
337	666	677
338	667	678
339	668	679
340	669	680
341	670	681
338	671	682
338	672	683
167	673	684
342	674	685
344	676	687
345	677	688
223	678	689
184	679	690
4	680	691
9	681	692
346	682	693
347	683	694
348	684	695
238	685	696
349	686	697
2	688	699
2	689	700
351	691	702
182	692	703
182	693	704
2	694	705
2	695	706
352	696	707
352	697	708
182	698	709
191	699	710
353	700	711
354	701	712
355	702	713
356	703	714
182	704	715
357	705	716
358	706	717
359	707	718
360	708	719
75	709	720
352	710	721
361	711	722
361	712	723
360	713	724
351	714	725
352	715	726
362	716	727
362	717	728
363	718	729
330	719	730
24	720	731
364	720	732
365	721	733
7	722	734
366	723	735
366	724	736
366	725	737
368	726	738
371	727	739
380	729	740
381	729	741
258	687	698
61	730	742
61	731	743
61	732	744
386	733	745
387	734	746
25	735	747
75	736	748
75	737	749
391	738	750
392	739	751
393	739	752
394	739	753
395	739	754
396	739	755
397	740	756
397	741	757
75	742	758
398	743	759
400	744	760
26	745	761
401	746	762
402	747	763
26	407	398
33	407	764
89	407	765
405	407	766
22	407	767
406	407	768
407	748	769
408	749	770
408	750	771
409	751	772
409	752	773
409	753	774
97	754	775
231	755	776
231	756	777
410	757	778
360	758	779
411	759	780
412	760	781
413	761	782
414	762	783
415	762	784
416	763	785
417	764	786
418	764	787
178	765	788
419	765	789
420	766	790
178	767	791
10	768	792
34	769	793
421	770	794
422	771	795
423	772	796
2	773	797
2	774	798
2	775	799
424	776	800
425	777	801
426	777	802
427	779	803
428	780	804
429	781	805
430	781	806
431	781	807
432	782	808
427	783	809
427	784	810
352	785	811
12	786	812
433	787	813
21	787	814
434	788	815
11	789	816
11	790	817
86	791	818
417	792	819
436	793	820
352	795	821
352	796	822
352	797	823
437	798	824
250	794	825
405	799	826
352	800	827
4	801	828
438	802	829
2	803	830
315	804	831
352	805	832
437	806	833
401	807	834
352	808	835
364	809	836
364	810	837
364	812	839
75	813	840
319	814	841
2	815	842
2	816	843
2	817	844
439	818	845
440	819	846
441	819	847
2	820	848
352	821	849
98	822	850
229	823	851
2	824	852
32	825	853
442	826	854
443	827	855
444	828	856
445	829	857
446	830	858
447	831	859
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('authors_id_seq', 859, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY books (id, title, english_title, read_original, language_id, notes, isbn, oclc, sort_title, rating, review, review_date, owned) FROM stdin;
157	Ronja Rövardotter	Ronja the Robber’s Daughter	t	3	\N	91-29-54877-2	\N	Ronja the Robber’s Daughter	10	\N	\N	f
163	Assar Bubbla	Assar Bubble	t	3	\N	91-29-58194-X	\N	Assar Bubble	\N	\N	\N	f
390	När människorna kom...	When Man arrived...	t	3	\N	91-29-57640-7	\N	When Man arrived...	\N	\N	\N	f
19	The Illearth War	The Illearth War	t	1	\N	\N	\N	Illearth War	9	\N	\N	t
39	Farmer Giles of Ham	Farmer Giles of Ham	t	1	\N	\N	\N	Farmer Giles of Ham	\N	\N	\N	t
263	The Life and Adventures of Buffalo Bill	The Life and Adventures of Buffalo Bill	f	1	\N	\N	\N	Life and Adventures of Buffalo Bill	\N	\N	\N	t
378	Boken om morfar prosten	The book about grandpa the parson	t	3	\N	91-48-51728-3	\N	book about grandpa the parson	\N	\N	\N	f
389	Aisopos fabler (Swedish title)	The Fables of Aesop	f	2	\N	91-0-040619-8	\N	Fables of Aesop	\N	\N	\N	f
107	The Lion, the Witch and the Wardrobe	The Lion, the Witch and the Wardrobe	t	1	\N	\N	\N	Lion, the Witch and the Wardrobe	6	\N	\N	f
124	The Da Vinci Code	The Da Vinci Code	t	1	\N	\N	\N	Da Vinci Code	5	\N	\N	f
200	Le Comte de Monte-Cristo	The Count of Monte Cristo	f	4	\N	\N	\N	Count of Monte Cristo	\N	\N	\N	f
111	The Horse and His Boy	The Horse and His Boy	t	1	\N	\N	\N	Horse and His Boy	3	\N	\N	f
229	The Door into Summer	The Door into Summer	f	1	\N	\N	\N	Door into Summer	\N	\N	\N	f
113	The Last Battle	The Last Battle	t	1	\N	\N	\N	Last Battle	4	\N	\N	f
343	Vendetta	Vendetta	t	3	\N	\N	\N	Vendetta	\N	\N	\N	f
176	Animal Farm	Animal Farm	t	1	\N	\N	\N	Animal Farm	\N	\N	\N	f
414	Bomba the Jungle Boy in the Land of Burning Lava	Bomba the Jungle Boy in the Land of Burning Lava	f	1	\N	\N	\N	Bomba the Jungle Boy in the Land of Burning Lava	\N	\N	\N	f
280	Hundarna i Riga	The Dogs of Riga	t	3	\N	\N	\N	Dogs of Riga	\N	\N	\N	f
306	Biggles and the Black Mask	Biggles and the Black Mask	f	1	\N	\N	\N	Biggles and the Black Mask	\N	\N	\N	t
305	Biggles on the home front	Biggles on the home front	f	1	\N	\N	\N	Biggles on the home front	\N	\N	\N	t
284	Den femte kvinnan	The Fifth Woman	t	3	\N	\N	\N	Fifth Woman	\N	\N	\N	f
170	Firestarter	Firestarter	f	1	\N	\N	\N	Firestarter	\N	\N	\N	f
128	Foundation	Foundation	t	1	\N	\N	\N	Foundation	\N	\N	\N	f
203	Candide, ou l'Optimisme	Candide	f	4	\N	\N	\N	Candide	7	\N	\N	t
108	Prince Caspian	Prince Caspian	t	1	\N	\N	\N	Prince Caspian	6	\N	\N	f
234	The Colour of Magic	The Colour of Magic	t	1	I own a signed copy of this! (Though it’s a different edition from the one I have read; specifically ISBN 0-06-102071-0.)	0-552-12475-3	\N	Colour of Magic	\N	\N	\N	t
129	I, Robot	I, Robot	t	1	\N	\N	\N	I, Robot	\N	\N	\N	f
759	Charlotte’s Web	Charlotte’s Web	t	1	\N	0-06-440055-7	\N	Charlotte’s Web	\N	\N	\N	f
763	The Eighth Day of Creation: The Makers of the Revolution in Biology	The Eighth Day of Creation: The Makers of the Revolution in Biology	t	1	\N	0-671-22540-5	\N	Eighth Day of Creation: The Makers of the Revolution in Biology	\N	\N	\N	f
122	Deception Point	Deception Point	t	1	\N	\N	\N	Deception Point	3	\N	\N	f
156	Madicken	Madicken	t	3	\N	\N	\N	Madicken	\N	\N	\N	f
112	The Magician's Nephew	The Magician's Nephew	t	1	\N	\N	\N	Magician's Nephew	4	\N	\N	f
282	Mannen som log	The Man Who Smiled	t	3	\N	\N	\N	Man Who Smiled	\N	\N	\N	f
180	Mindbond	Mindbond	t	1	\N	\N	\N	Mindbond	\N	\N	\N	f
197	Maigret et le clochard	Maigret and the Bum	t	4	\N	\N	\N	Maigret and the Bum	\N	\N	\N	f
171	Pet Sematary	Pet Sematary	f	1	\N	\N	\N	Pet Sematary	\N	\N	\N	f
161	När Emil skulle dra ut Linas tand	Emil and the Bad Tooth	t	3	\N	\N	\N	Emil and the Bad Tooth	\N	\N	\N	f
178	The Riddle-Master of Hed	The Riddle-Master of Hed	f	1	\N	\N	\N	Riddle-Master of Hed	7	\N	\N	f
183	Royal Assassin	Royal Assassin	f	1	\N	\N	\N	Royal Assassin	\N	\N	\N	f
110	The Silver Chair	The Silver Chair	t	1	\N	\N	\N	Silver Chair	5	\N	\N	f
181	Singer from the Sea	Singer from the Sea	t	1	\N	\N	\N	Singer from the Sea	\N	\N	\N	f
142	Snow Crash	Snow Crash	t	1	\N	\N	\N	Snow Crash	\N	\N	\N	f
199	Vingt Ans Après	Twenty Years After	f	4	\N	\N	\N	Twenty Years After	\N	\N	\N	f
109	The Voyage of the Dawn Treader	The Voyage of the Dawn Treader	t	1	\N	\N	\N	Voyage of the Dawn Treader	5	\N	\N	f
281	Den vita lejoninnan	The White Lioness	t	3	\N	\N	\N	White Lioness	\N	\N	\N	f
123	Angels and Demons	Angels and Demons	t	1	\N	\N	\N	Angels and Demons	5	\N	\N	f
182	Assassin's Apprentice	Assassin's Apprentice	f	1	\N	\N	\N	Assassin's Apprentice	\N	\N	\N	f
224	The Call of the Wild	The Call of the Wild	f	1	\N	\N	\N	Call of the Wild	\N	\N	\N	f
168	Carrie	Carrie	f	1	\N	\N	\N	Carrie	\N	\N	\N	f
169	Cujo	Cujo	f	1	\N	\N	\N	Cujo	\N	\N	\N	f
167	The Dark Half	The Dark Half	f	1	\N	\N	\N	Dark Half	\N	\N	\N	f
338	The Guns of Avalon	The Guns of Avalon	f	1	\N	\N	\N	Guns of Avalon	\N	\N	\N	f
160	Karlsson på taket	Karlsson-on-the-Roof	t	3	\N	\N	\N	Karlsson-on-the-Roof	7	\N	\N	f
158	Mio, min Mio	Mio, my Mio	t	3	\N	\N	\N	Mio, my Mio	10	\N	\N	f
349	Night Watch	Night Watch	f	1	\N	\N	\N	Night Watch	9	\N	\N	f
395	Brutt kontakt	Broken contact	f	7	\N	\N	\N	Broken contact	\N	\N	\N	f
402	The Case of the Missing Masterpieces	The Case of the Missing Masterpieces	f	1	\N	\N	\N	Case of the Missing Masterpieces	\N	\N	\N	f
363	Barn av Andromeda	Children of Andromeda	t	3	\N	\N	\N	Children of Andromeda	\N	\N	\N	f
312	Biggles in Africa	Biggles in Africa	f	1	\N	\N	\N	Biggles in Africa	\N	\N	\N	t
270	Circus of the Damned	Circus of the Damned	t	1	\N	\N	\N	Circus of the Damned	\N	\N	\N	f
351	Coq Rouge	Coq Rouge	t	3	\N	\N	\N	Coq Rouge	\N	\N	\N	f
302	Biggles Learns to Fly	Biggles Learns to Fly	f	1	\N	\N	\N	Biggles Learns to Fly	\N	\N	\N	t
228	Have Space Suit: Will Travel	Have Space Suit: Will Travel	f	1	\N	\N	\N	Have Space Suit: Will Travel	\N	\N	\N	f
335	Hunden som sprang mot en stjärna	The dog that ran for a star	t	3	\N	\N	\N	dog that ran for a star	\N	\N	\N	f
425	Dubbelgångar-mysteriet	The Doppelganger Mystery	t	3	\N	\N	\N	Doppelganger Mystery	\N	\N	\N	f
308	No rest for Biggles	No rest for Biggles	f	1	\N	\N	\N	No rest for Biggles	\N	\N	\N	t
265	Ender's Game	Ender's Game	t	1	\N	\N	\N	Ender's Game	\N	\N	\N	f
307	Biggles' Chinese Puzzle	Biggles' Chinese Puzzle	f	1	\N	\N	\N	Biggles' Chinese Puzzle	\N	\N	\N	t
342	The Evening News	The Evening News	f	1	\N	\N	\N	Evening News	\N	\N	\N	f
285	Ondskan	Evil	t	3	\N	\N	\N	Evil	\N	\N	\N	f
554	Eye	Eye	t	1	\N	\N	\N	Eye	\N	\N	\N	f
603	Firefly	Firefly	t	1	\N	\N	\N	Firefly	2	Only read this if you feel that pædophilia is defensible. If so, never talk to me.	2011-01-23 19:18:58.157578	f
422	Tefats-mysteriet	The Flying Saucer Mystery	t	3	\N	\N	\N	Flying Saucer Mystery	\N	\N	\N	f
336	Vendredi ou la vie sauvage	Friday	f	4	\N	\N	\N	Friday	\N	\N	\N	f
303	Biggles & Co	Biggles & Co	f	1	\N	\N	\N	Biggles & Co	\N	\N	\N	t
268	Guilty Pleasures	Guilty Pleasures	t	1	\N	\N	\N	Guilty Pleasures	\N	\N	\N	f
346	Hamlon	Hamlon	t	3	\N	\N	\N	Hamlon	\N	\N	\N	f
364	Invasion från universum	Invasion from the Universe	t	3	\N	\N	\N	Invasion from the Universe	\N	\N	\N	f
243	Ivanhoe	Ivanhoe	f	1	\N	\N	\N	Ivanhoe	\N	\N	\N	f
273	The Killing Dance	The Killing Dance	t	1	\N	\N	\N	Killing Dance	\N	\N	\N	f
146	Karate-dō Kyōhan	Karate-Do Kyohan: The Master Text	f	6	\N	\N	\N	Karate-Do Kyohan: The Master Text	\N	\N	\N	t
259	Kim	Kim	f	1	\N	\N	\N	Kim	\N	\N	\N	t
421	Mysteriet med Lejonbrunnen	The Mystery of the Lion Well	t	3	\N	\N	\N	Mystery of the Lion Well	\N	\N	\N	f
245	Things Fall Apart	Things Fall Apart	t	1	\N	\N	\N	Things Fall Apart	\N	\N	\N	f
267	Peter Pan	Peter Pan	t	1	\N	\N	\N	Peter Pan	\N	\N	\N	f
272	Bloody Bones	Bloody Bones	t	1	\N	\N	\N	Bloody Bones	\N	\N	\N	f
324	Gula brigadens hjältar	Heroes of the Yellow Brigade	t	3	\N	\N	\N	Heroes of the Yellow Brigade	9	\N	\N	t
327	Myst: The Book of Atrus	Myst: The Book of Atrus	t	1	\N	\N	\N	Myst: The Book of Atrus	5	\N	\N	f
330	The War for the Lot	The War for the Lot	f	1	\N	\N	\N	War for the Lot	\N	\N	\N	t
276	Le Fantôme de l'Opéra	The Phantom of the Opera	f	4	\N	\N	\N	Phantom of the Opera	\N	\N	\N	f
424	Raket-mysteriet	The Rocket Mystery	t	3	\N	\N	\N	Rocket Mystery	\N	\N	\N	f
735	Mere Christianity	Mere Christianity	t	1	\N	\N	\N	Mere Christianity	4	<p>\n<i>[This review was originally a <a href="http://petter-haggholm.livejournal.com/175221.html">blog post, here</a>. Feel free to go thither to comment.]</i>\n</p>\n\n<p>\nOver the course of many a fruitless religious debate, one book that my ‘opponents’ have often urged me to read is <cite>Mere Christianity</cite> by C.S. Lewis. I had never done so, but when I found out that the whole thing was available online (<a href="http://www.philosophyforlife.com/mctoc.htm">here</a>), I went ahead and read it—in stolen snippets of two days, at that; it’s short and a light read. My very brief conclusion is that C.S. Lewis is an entirely different brand of apologist from the raucous, idiot, Ray Comfort kind to which I have previously been exposed. I get every impression that he was being quite sincere and honest. He may also very well have been intelligent. —I say “may” because this book provides no evidence that he <em>was</em>, but nor do I think that it provides strong evidence that he <em>wasn’t</em>.\n</p>\n\n<p>\nThat said, in the early chapters of <cite>Mere Christianity</cite>, comes off as honest, sincere, quite possibly intelligent, and completely unconvincing and to all appearances dead wrong. (This review originally contained a part explaining why I consider it coherent to be intelligent, honest, and completely wrong; that aside grew into <a href="http://petter-haggholm.livejournal.com/175038.html">this</a>.) So unconvincing and so wrong, in fact, that while I consider it entirely possible that <em>he</em> was intelligent, and while some of his fans may very well be very intelligent (with the same rationale), anyone who was <em>convinced</em> by it must have had their critical thinking faculties shut off for the day. Much as a palæontologist accepts a single fossil or a physicist a single relativistic experiment, you may accept <cite>Mere Christianity</cite> as fitting into a worldview, but it is no more <em>sufficient</em> to build a complete theory upon. Unlike fossils and physical experiments, however, <cite>Mere Christianity</cite> attempts logical arguments, and—well, we shall see how it succeeded.\n</p>\n\n<p>\nThe book is written in a compelling way—easy, conversational language, and a structure where each chapter builds directly and explicitly on the one before it. Thus, he starts off by establishing a universal moral law; shows that the universal law must reflect some underlying reality; shows that this underlying reality must be an Intelligence; shows that it must be an Intelligence rather like the Christian God—and so forth. He is not mealy-mouthed, nor needlessly offensive, nor does he sound insincere. All of this gives me a rather favourable view of him as a person.\n</p>\n\n<p>\nAs a logician and persuader, however, I can’t give him much respect. My initial reaction to the first few chapters was that, with some minor restructuring, they could easily be retitled according to which logical fallacy he built each chapter’s claim upon. Thus one early chapter took St. Anselm’s failed Ontological Argument and applied it to moral law: <q>We can conceive of a moral law better than our own; therefore there must be a Perfect moral law.</q> (Not true: We might have and fully grasp the ultimate moral law but fail to recognise that it’s perfect.) Another was based on Equivocation (descriptive natural laws with prescriptive moral laws). Another, while not a formal fallacy that I’m aware of, was based on equivocating percepts with objects: That is, he went from <q>All humans feel that there is something rather like <var>X</var></q> to <q>Therefore, there exists an <var>X</var> with some sort of independent reaction</q>. (Nonsense! If we find that <q>all humans feel <var>X</var></q> we have indeed discovered a fact, but it’s a fact about <em>human brains</em>, not about the world outside them.) These percepts, once reified, were deified in short order.\n</p>\n\n<p>\nUnfortunately, the book went rather downhill from this point. In the early chapters, I can really respect what Lewis was trying to do. Of course, I find that his arguments were not in fact valid, but he clearly believed the premises were true, he obviously believed in his conclusion, and as I have said before and will gladly repeat, it is often <em>very</em> difficult to find flaws in your own inferences when they make a path whereby, as far as you can tell, you get from the right starting point to the right end point. And in these early chapters, I am inclined to agree that if his arguments <em>had</em> been valid and sound, as he believed, then he had some very right and very valuable things to say; and he does lay out his arguments, however flawed, clearly and lucidly.\n</p>\n\n<p>\nBut this, alas, was not to last. Having once established (in his mind) that there must be a deity that shares some important, basic traits with the god of Judeo-Christian mythology, he went on to implicitly assume a whole slew of Christian dogma, and he did it so suddenly and unselfconsciously that it took me a chapter or two before I went <q>Hang on a minute&hellip;!</q> It is as though, once you accept a good, omnipotent creator deity, Moses, the Ten Commandments, Jesus, Judas, and the whole cabaret just followed naturally. This was a huge disappointment—he didn’t even <em>try</em> to show his work in this part of the examination.\n</p>\n\n<p>\nThe redeeming aspect of this part of the work was that <em>if</em> you once accept his assumptions, a lot of the things he says are very cogent and sensible. But that is not much help if you haven’t accepted those assumptions! He also argues an awful lot by metaphor. This is fine—he manages to explain a number of very weird things in Christian dogma in a way that made a lot of sense to me. So far, so good. However, a critical feature of an explanation by metaphor is that you have to be able to show how it reduces back to the real issue. Again, Lewis doesn’t <em>fail</em> to do this—he never even attempts it. It felt very much as if it never occurred to him that this had to be explained.\n</p>\n\n<p>\nAnd I found this very peculiar, because <em>C.S. Lewis was by all accounts an atheist</em>, and he was <em>brought</em> to believe in all these things. How did this happen? I feel as though he <em>must</em> have had more of a story to tell, because the argument he lays out is completely insufficient to take an intelligent person from atheism to Christianity. Even if his initial arguments had been sound, there just wasn’t a chain of logic available to bring an atheist any further than a sort of nebulous proto-Judeo-Christian monotheism with no specifics of ritual or dogma, let alone such esoteric notions as the Trinity (which, by the way, he explains in lucid, wonderful metaphor that he completely neglects to show to be equivalent to any underlying reality). I supppose Lewis, if he was an atheist before, must not have reached that point by skepticism so much as more specific disappointment with points of dogma.\n</p>\n\n<p>\nThe part of the entire book that I found the most rewarding to read was, and this might surprise you, the two chapters on Faith. Now, I make it no secret that I regard the concept of faith with derision and contempt—faith, as I generally see it used and defined, refers to belief without evidence, and in some circles (particularly US fundamentalists) even belief <em>in spite of</em> evidence, which is lunacy and the least ethical and virtuous thing you can possibly do without involving others. However, C.S. Lewis defines faith very differently. I can do the concept no better justice than to quote him:\n</p>\n\n<blockquote>\n<p>\nRoughly speaking, the word Faith seems to be used by Christians in two senses or on two levels, and I will take them in turn. In the first sense it means simply Belief—accepting or regarding as true the doctrines of Christianity. That is fairly simple. But what does puzzle people-at least it used to puzzle me—is the fact that Christians regard faith in this sense as a virtue. I used to ask how on earth it can be a virtue—what is there moral or immoral about believing or not believing a set of statements? Obviously, I used to say, a sane man accepts or rejects any statement, not because he wants to or does not want to, but because the evidence seems to him good or bad. If he were mistaken about the goodness or badness of the evidence that would not mean he was a bad man, but only that he was not very clever. And if he thought the evidence bad but tried to force himself to believe in spite of it, that would be merely stupid.\n</p>\n<p>\nWell, I think I still take that view. But what I did not see then—and a good many people do not see still—was this. I was assuming that if the human mind once accepts a thing as true it will automatically go on regarding it as true, until some real reason for reconsidering it turns up. In fact, I was assuming that the human mind is completely ruled by reason. But that is not so. For example, my reason is perfectly convinced by good evidence that anaesthetics do not smother me and that properly trained surgeons do not start operating until I am unconscious. But that does not alter the fact that when they have me down on the table and clap their horrible mask over my face, a mere childish panic begins inside me. I start thinking I am going to choke, and I am afraid they will start cutting me up before I am properly under. In other words, I lose my faith in anaesthetics. It is not reason that is taking away my faith: on the contrary, my faith is based on reason. It is my imagination and emotions. The battle is between faith and reason on one side and emotion and imagination on the other.\n</p>\n</blockquote>\n\n<p>\nWith this second definition of the word faith, it actually <em>makes sense</em>. What this teaches me is that when I next meet someone extolling the virtues of faith, I need to explicitly establish what, precisely, this person means, because he or she may not be referring to it in the sense that I am used to encountering it. If someone believes in the virtues of faith¹, they are beneath being reasoned with. Faith², on the other hand, is in fact a positive thing! I do not need to be <em>persuaded</em> of its virtue; I agree with it! On the other hand, faith² is not a way in which religion can be <em>reached</em>. If somebody tells me that <q>You won’t find God by evidence; you just have to have faith</q>, they are using faith¹ and I will continue to dismiss them. If they take offence at this, I can now not only explain why, but also point out that C.S. Lewis regarded that claim as <q>stupid</q>.\n</p>	2011-01-23 19:18:58.772786	f
749	Le Morte D’Arthur, volume 1	Le Morte D’Arthur, volume 1	t	1	\N	0-14-043-043-1	\N	Le Morte D’Arthur, volume 1	\N	\N	\N	f
266	Seventh Son	Seventh Son	f	1	\N	\N	\N	Seventh Son	\N	\N	\N	f
760	The Sun Also Rises	The Sun Also Rises	t	1	\N	0-684-80071-3	\N	Sun Also Rises	7	\N	\N	f
283	Villospår	Sidetracked	t	3	\N	\N	\N	Sidetracked	\N	\N	\N	f
347	Ten little niggers	Ten little niggers	f	1	\N	\N	\N	Ten little niggers	\N	\N	\N	f
354	Airport	Airport	f	1	\N	\N	\N	Airport	\N	\N	\N	f
398	Back to the Future II	Back to the Future II	f	1	\N	\N	\N	Back to the Future II	\N	\N	\N	f
379	Power of Three	Power of Three	f	1	\N	\N	\N	Power of Three	\N	\N	\N	f
498	The Catcher in the Rye	The Catcher in the Rye	t	1	\N	\N	\N	Catcher in the Rye	7	\N	\N	f
478	Designing with web standards	Designing with web standards	t	1	\N	\N	\N	Designing with web standards	\N	\N	\N	f
496	Hannibal Rising	Hannibal Rising	t	1	\N	\N	\N	Hannibal Rising	7	\N	\N	f
358	Polismördaren	Cop Killer	t	3	\N	\N	\N	Cop Killer	\N	\N	\N	f
237	Mort	Mort	t	1	\N	0-552-13106-7	\N	Mort	\N	\N	\N	t
258	The Second Jungle Book	The Second Jungle Book	t	1	\N	\N	\N	Second Jungle Book	8	\N	\N	t
423	Dubbeldäckar-mysteriet	The Double-Decker Mystery	t	3	\N	\N	\N	Double-Decker Mystery	\N	\N	\N	f
344	Fiendens fiende	Enemy's Enemy	t	3	\N	\N	\N	Enemy's Enemy	\N	\N	\N	f
370	Här kommer Petter	Here comes Petter	t	3	\N	\N	\N	Here comes Petter	\N	\N	\N	f
451	Expert C Programming: Deep C Secrets	Expert C Programming: Deep C Secrets	t	1	\N	\N	\N	Expert C Programming: Deep C Secrets	\N	\N	\N	f
750	Le Morte D’Arthur, volume 2	Le Morte D’Arthur, volume 2	t	1	\N	978-0-14-043044-8	\N	Le Morte D’Arthur, volume 2	\N	\N	\N	f
461	Fahrenheit 451	Fahrenheit 451	t	1	\N	\N	\N	Fahrenheit 451	\N	\N	\N	f
604	Flatland	Flatland	t	1	\N	\N	\N	Flatland	\N	\N	\N	f
408	Kemlo and the crazy planet	Kemlo and the crazy planet	f	1	\N	\N	\N	Kemlo and the crazy planet	\N	\N	\N	f
429	Trav-mysteriet	The Horse Racing Mystery	t	3	\N	\N	\N	Horse Racing Mystery	\N	\N	\N	f
362	Heir of Sea and Fire	Heir of Sea and Fire	f	1	\N	\N	\N	Heir of Sea and Fire	\N	\N	\N	f
419	Hockey-mysteriet	The Hockey Mystery	t	3	\N	\N	\N	Hockey Mystery	\N	\N	\N	f
387	Indianpojken och hans vita vän	The Indian boy and his white friend	t	3	\N	\N	\N	Indian boy and his white friend	\N	\N	\N	f
165	Dragons of Autumn Twilight	Dragons of Autumn Twilight	t	1	\N	\N	\N	Dragons of Autumn Twilight	4	\N	\N	f
427	Tavel-mysteriet	The Painting Mystery	t	3	\N	\N	\N	Painting Mystery	\N	\N	\N	f
416	Spöket på Losjö	The ghost of Losjö	t	3	\N	\N	\N	ghost of Losjö	\N	\N	\N	f
397	Lad, a Dog	Lad, a Dog	f	1	\N	\N	\N	Lad, a Dog	\N	\N	\N	f
415	Gasen i botten, Dante	Pedal to the metal, Dante	t	3	\N	\N	\N	Pedal to the metal, Dante	\N	\N	\N	f
412	The Pentagon Spy	The Pentagon Spy	f	1	\N	\N	\N	Pentagon Spy	\N	\N	\N	f
382	Petter kommer igen	Petter is back	t	3	\N	\N	\N	Petter is back	\N	\N	\N	f
361	Red Prophet	Red Prophet	f	1	\N	\N	\N	Red Prophet	\N	\N	\N	f
450	The Road Less Travelled	The Road Less Travelled	t	1	\N	\N	\N	Road Less Travelled	\N	\N	\N	f
356	Salem's Lot	Salem's Lot	f	1	\N	\N	\N	Salem's Lot	\N	\N	\N	f
385	Sinuhe egyptiläinen	Sinuhe the Egyptian	f	10	\N	\N	\N	Sinuhe the Egyptian	\N	\N	\N	f
443	Soul Catcher	Soul Catcher	t	1	\N	\N	\N	Soul Catcher	\N	\N	\N	f
371	Därvarns resa	Spoiler's Journey	t	3	\N	\N	\N	Spoiler's Journey	\N	\N	\N	f
357	Terroristerna	The Terrorists	t	3	\N	\N	\N	Terrorists	\N	\N	\N	f
426	Tåg-mysteriet	The Train Mystery	t	3	\N	\N	\N	Train Mystery	\N	\N	\N	f
392	Uncle Tom's Cabin	Uncle Tom's Cabin	f	1	\N	\N	\N	Uncle Tom's Cabin	\N	\N	\N	f
417	Varulvs-mysteriet	The Werewolf Mystery	t	3	\N	\N	\N	Werewolf Mystery	\N	\N	\N	f
441	West of Eden	West of Eden	t	1	\N	\N	\N	West of Eden	\N	\N	\N	f
393	The Word for World is Forest	The Word for World is Forest	f	1	\N	\N	\N	Word for World is Forest	\N	\N	\N	f
455	The Black Swan	The Black Swan	t	1	\N	\N	\N	Black Swan	5	\N	\N	f
418	Boxer-mysteriet	The Boxer Mystery	t	3	\N	\N	\N	Boxer Mystery	\N	\N	\N	f
544	Consciousness: An Introduction	Consciousness: An Introduction	t	1	\N	\N	\N	Consciousness: An Introduction	\N	\N	\N	f
578	Contact	Contact	t	1	\N	\N	\N	Contact	\N	\N	\N	f
579	Eclectus Parrots	Eclectus Parrots	t	1	\N	\N	\N	Eclectus Parrots	\N	\N	\N	f
432	Segel av sten	Sails of Stone	t	3	\N	91-7001-071-4	\N	Sails of Stone	\N	\N	\N	t
462	Karate-dō: My way of life	Karate-dō: My way of life	f	6	\N	\N	\N	Karate-dō: My way of life	\N	\N	\N	t
452	Exceptional C++	Exceptional C++	t	1	\N	\N	\N	Exceptional C++	9	\N	\N	f
598	Going Postal	Going Postal	t	1	\N	\N	\N	Going Postal	\N	\N	\N	f
566	Guns, Germs, and Steel	Guns, Germs, and Steel	t	1	\N	\N	\N	Guns, Germs, and Steel	8	\N	\N	f
747	Kald mig Prinsesse	Call me Princess	f	9	\N		\N	Call me Princess	\N	\N	\N	t
751	Another Fine Myth	Another Fine Myth	t	1	\N	0-441-02361-4	\N	Another Fine Myth	\N	\N	\N	f
762	This Mitchell and Webb Book	This Mitchell and Webb Book	t	1	\N	978-0-00-728019-3	\N	This Mitchell and Webb Book	\N	\N	\N	f
345	I nationens intresse	In the interest of the nation	t	3	\N	\N	\N	In the interest of the nation	\N	\N	\N	f
576	Lady Slings the Booze	Lady Slings the Booze	t	1	\N	\N	\N	Lady Slings the Booze	\N	\N	\N	f
538	Leviathan	Leviathan	t	1	\N	\N	\N	Leviathan	\N	\N	\N	f
479	Red Dwarf: Last Human	Red Dwarf: Last Human	t	1	\N	\N	\N	Red Dwarf: Last Human	\N	\N	\N	f
574	Callahan's Lady	Callahan's Lady	t	1	\N	\N	\N	Callahan's Lady	\N	\N	\N	f
600	City of Illusions	City of Illusions	t	1	\N	\N	\N	City of Illusions	\N	\N	\N	f
589	Lord of Light	Lord of Light	t	1	\N	\N	\N	Lord of Light	\N	\N	\N	f
360	Polis, polis, potatismos!	Murder at the Savoy	t	3	\N	\N	\N	Murder at the Savoy	\N	\N	\N	f
463	The Number of the Beast	The Number of the Beast	t	1	\N	\N	\N	Number of the Beast	5	\N	\N	f
536	Of Mice and Men	Of Mice and Men	t	1	\N	\N	\N	Of Mice and Men	\N	\N	\N	f
553	Ossian's Ride	Ossian's Ride	t	1	\N	\N	\N	Ossian's Ride	\N	\N	\N	f
599	Pirates of Venus	Pirates of Venus	t	1	\N	\N	\N	Pirates of Venus	6	\N	\N	f
582	Polar City Nightmare	Polar City Nightmare	t	1	\N	\N	\N	Polar City Nightmare	\N	\N	\N	f
489	Red Dwarf	Red Dwarf	t	1	\N	\N	\N	Red Dwarf	\N	\N	\N	f
490	Red Dwarf: Better Than Life	Red Dwarf: Better Than Life	t	1	\N	\N	\N	Red Dwarf: Better Than Life	\N	\N	\N	f
601	Rocannon's World	Rocannon's World	t	1	\N	\N	\N	Rocannon's World	\N	\N	\N	f
539	Science Friction	Science Friction	t	1	\N	\N	\N	Science Friction	\N	\N	\N	f
558	Snare	Snare	t	1	\N	\N	\N	Snare	\N	\N	\N	f
561	Something Wicked This Way Comes	Something Wicked This Way Comes	t	1	\N	\N	\N	Something Wicked This Way Comes	\N	\N	\N	f
573	Very Bad Deaths	Very Bad Deaths	t	1	\N	\N	\N	Very Bad Deaths	\N	\N	\N	f
588	ANSI Common Lisp	ANSI Common Lisp	t	1	\N	\N	\N	ANSI Common Lisp	\N	\N	\N	f
380	Benrimon är inte död	Benrimon is not dead	t	3	\N	\N	\N	Benrimon is not dead	\N	\N	\N	f
583	Black Holes, Wormholes & Time Machines	Black Holes, Wormholes & Time Machines	t	1	\N	\N	\N	Black Holes, Wormholes & Time Machines	\N	\N	\N	f
633	Catspaw	Catspaw	t	1	\N	\N	\N	Catspaw	\N	\N	\N	f
629	The Chrysalids	The Chrysalids	t	1	\N	\N	\N	Chrysalids	\N	\N	\N	f
656	The Dragonbone Chair	The Dragonbone Chair	t	1	\N	\N	\N	Dragonbone Chair	7	\N	\N	f
631	The Dunwich Horror and others	The Dunwich Horror and others	t	1	\N	\N	\N	Dunwich Horror and others	\N	\N	\N	f
555	The Elder Gods	The Elder Gods	t	1	\N	\N	\N	Elder Gods	6	\N	\N	f
524	Evolution: The triumph of an idea	Evolution: The triumph of an idea	t	1	\N	\N	\N	Evolution: The triumph of an idea	\N	\N	\N	f
602	The Lost Road	The Lost Road	t	1	\N	0-00-714915-8	\N	Lost Road	\N	\N	\N	t
614	Extreme Programming in Practice	Extreme Programming in Practice	t	1	\N	\N	\N	Extreme Programming in Practice	\N	\N	\N	f
331	A Light in the Black	A Light in the Black	f	1	\N	\N	\N	A Light in the Black	\N	\N	\N	t
247	The Father Christmas Letters	The Father Christmas Letters	f	1	\N	\N	\N	Father Christmas Letters	\N	\N	\N	f
591	Forever Man	Forever Man	t	1	\N	\N	\N	Forever Man	6	\N	\N	f
641	Four Ways to Forgiveness	Four Ways to Forgiveness	t	1	\N	\N	\N	Four Ways to Forgiveness	\N	\N	\N	f
575	The Free Lunch	The Free Lunch	t	1	\N	\N	\N	Free Lunch	\N	\N	\N	f
613	Mindstar Rising	Mindstar Rising	t	1	\N	\N	\N	Mindstar Rising	\N	\N	\N	f
652	How to Win Friends & Influence People	How to Win Friends & Influence People	t	1	\N	\N	\N	How to Win Friends & Influence People	7	\N	\N	f
594	Black Fly Season	Black Fly Season	f	1	\N	\N	\N	Black Fly Season	\N	\N	\N	t
679	Island	Island	t	1	\N	\N	\N	Island	\N	\N	\N	t
628	Jumper	Jumper	t	1	\N	\N	\N	Jumper	\N	\N	\N	f
752	Myth Conceptions	Myth Conceptions	t	1	\N	0-441-55521-7	\N	Myth Conceptions	\N	\N	\N	f
635	Lord Edgware Dies	Lord Edgware Dies	t	1	\N	\N	\N	Lord Edgware Dies	\N	\N	\N	f
352	Lord of the Flies	Lord of the Flies	t	1	\N	\N	\N	Lord of the Flies	\N	\N	\N	f
654	Manifold Origin	Manifold Origin	t	1	\N	\N	\N	Manifold Origin	\N	\N	\N	f
612	No More Mr. Nice Guy	No More Mr. Nice Guy	t	1	\N	\N	\N	No More Mr. Nice Guy	5	\N	\N	f
639	Catch-22	Catch-22	t	1	\N	\N	\N	Catch-22	\N	\N	\N	f
611	Cat's Cradle	Cat's Cradle	t	1	\N	\N	\N	Cat's Cradle	\N	\N	\N	f
650	Gulliver's Travels and Other Writings	Gulliver's Travels and Other Writings	t	1	\N	\N	\N	Gulliver's Travels and Other Writings	\N	\N	\N	f
618	Jonathan Strange & Mr. Norrell	Jonathan Strange & Mr. Norrell	t	1	\N	\N	\N	Jonathan Strange & Mr. Norrell	9	\N	\N	f
653	Paradise Lost	Paradise Lost	t	1	\N	\N	\N	Paradise Lost	\N	\N	\N	f
585	Il Principe	The Prince	f	12	\N	\N	\N	Prince	\N	\N	\N	f
636	Principia Discordia	Principia Discordia	t	1	\N	\N	\N	Principia Discordia	\N	\N	\N	f
626	Recursion	Recursion	t	1	\N	\N	\N	Recursion	\N	\N	\N	f
662	The Secret Life of Sharks	The Secret Life of Sharks	t	1	\N	\N	\N	Secret Life of Sharks	8	\N	\N	f
568	Six Not So Easy Pieces	Six Not So Easy Pieces	t	1	\N	\N	\N	Six Not So Easy Pieces	\N	\N	\N	f
657	Stone of Farewell	Stone of Farewell	t	1	\N	\N	\N	Stone of Farewell	8	\N	\N	f
632	The Telling	The Telling	t	1	\N	\N	\N	Telling	\N	\N	\N	f
608	The Theory of Poker	The Theory of Poker	t	1	\N	\N	\N	Theory of Poker	\N	\N	\N	f
658	To Green Angel Tower	To Green Angel Tower	t	1	\N	\N	\N	To Green Angel Tower	7	\N	\N	f
625	Watership Down	Watership Down	t	1	\N	\N	\N	Watership Down	9	\N	\N	f
661	A Tale of Two Cities	A Tale of Two Cities	t	1	\N	\N	\N	A Tale of Two Cities	\N	\N	\N	f
477	Bratia Karamazovy (Братья Карамазовы)	The Brothers Karamazov	f	13	\N	\N	\N	Brothers Karamazov	\N	\N	\N	f
683	Autism’s False Prophets	Autism’s False Prophets	t	1	\N	\N	\N	Autism’s False Prophets	\N	\N	\N	f
311	Another job for Biggles	Another job for Biggles	f	1	\N	\N	\N	Another job for Biggles	\N	\N	\N	t
697	The Inimitable Jeeves	The Inimitable Jeeves	t	1	\N	\N	\N	Inimitable Jeeves	\N	\N	\N	t
704	From Russia, with love	From Russia, with love	t	1	\N	\N	\N	From Russia, with love	\N	\N	\N	t
219	Hannibal	Hannibal	t	1	\N	0-434-00905-9	\N	Hannibal	7	\N	\N	t
753	Myth Directions	Myth Directions	t	1	\N	0-441-55529-2	\N	Myth Directions	\N	\N	\N	f
686	Me of Little Faith	Me of Little Faith	t	1	\N	\N	\N	Me of Little Faith	6	\N	\N	f
689	Small Gods	Small Gods	t	1	\N	\N	\N	Small Gods	\N	\N	\N	f
548	At the Water's Edge: Macroevolution and the Transformation of Life	At the Water's Edge: Macroevolution and the Transformation of Life	t	1	\N	\N	\N	At the Water's Edge: Macroevolution and the Transformation of Life	\N	\N	\N	f
275	A Christmas Carol	A Christmas Carol	t	1	\N	\N	\N	A Christmas Carol	\N	\N	\N	f
366	Falkpatrullens äventyr (Swedish title)	Adventures of the Falcon Troop	f	7	\N	\N	\N	Adventures of the Falcon Troop	\N	\N	\N	f
173	A Long Way Down	A Long Way Down	t	1	\N	\N	\N	A Long Way Down	\N	\N	\N	f
562	Armageddon's Children	Armageddon's Children	t	1	\N	\N	\N	Armageddon's Children	\N	\N	\N	f
545	Prestuplenie i nakazanie (Преступление и наказание)	Crime and Punishment	f	13	\N	\N	\N	Crime and Punishment	\N	\N	\N	f
547	Death by Black Hole: And other cosmic quandaries	Death by Black Hole: And other cosmic quandaries	t	1	\N	\N	\N	Death by Black Hole: And other cosmic quandaries	\N	\N	\N	f
141	Debt of Bones	Debt of Bones	t	1	\N	\N	\N	Debt of Bones	\N	\N	\N	f
304	Biggles looks back	Biggles looks back	f	1	\N	\N	\N	Biggles looks back	\N	\N	\N	t
493	Designing the Obvious: A common sense approach to web application design	Designing the Obvious: A common sense approach to web application design	t	1	\N	\N	\N	Designing the Obvious: A common sense approach to web application design	\N	\N	\N	f
313	Biggles and the Little Green God	Biggles and the Little Green God	f	1	\N	\N	\N	Biggles and the Little Green God	\N	\N	\N	t
127	Dune Messiah	Dune Messiah	t	1	\N	\N	\N	Dune Messiah	\N	\N	\N	f
162	Emil och soppskålen	Emil in the Soup Toureen	t	3	\N	\N	\N	Emil in the Soup Toureen	\N	\N	\N	f
184	Assassin's Quest	Assassin's Quest	f	1	\N	\N	\N	Assassin's Quest	\N	\N	\N	f
279	Mördare utan ansikte	Faceless Killers	t	3	\N	\N	\N	Faceless Killers	\N	\N	\N	f
465	Fight Club	Fight Club	t	1	\N	\N	\N	Fight Club	\N	\N	\N	f
314	Biggles fails to return	Biggles fails to return	f	1	\N	\N	\N	Biggles fails to return	\N	\N	\N	t
201	De la terre à la lune	From the Earth to the Moon	f	4	\N	\N	\N	From the Earth to the Moon	\N	\N	\N	f
315	Gimlet lends a hand	Gimlet lends a hand	f	1	\N	\N	\N	Gimlet lends a hand	\N	\N	\N	f
309	Biggles and the Plot that failed	Biggles and the Plot that failed	f	1	\N	\N	\N	Biggles and the Plot that failed	\N	\N	\N	t
323	The Exploits of Brigadier Gerard	The Exploits of Brigadier Gerard	f	1	\N	\N	\N	Exploits of Brigadier Gerard	\N	\N	\N	t
754	Kinesen	The Chinese Man	t	3	\N	978-91-7343-254-2	\N	Chinese Man	\N	\N	\N	f
376	Hoppentott i Vänliga Skogen	Hoppentot in the Friendly Forest	t	3	\N	\N	\N	Hoppentot in the Friendly Forest	\N	\N	\N	f
47	Infinite Ascent: A Short History of Mathematics	Infinite Ascent: A Short History of Mathematics	t	1	\N	\N	\N	Infinite Ascent: A Short History of Mathematics	9	\N	\N	f
334	E.T. The Extra-Terrestrial	E.T. The Extra-Terrestrial	f	1	\N	\N	\N	E.T. The Extra-Terrestrial	\N	\N	\N	f
501	Kitchen Confidential: Adventures in the Culinary Underbelly	Kitchen Confidential: Adventures in the Culinary Underbelly	t	1	\N	\N	\N	Kitchen Confidential: Adventures in the Culinary Underbelly	\N	\N	\N	f
409	Alfred Hitchcock and the Three Investigators in The Mystery of the Creep-Show Crooks	Alfred Hitchcock and the Three Investigators in The Mystery of the Creep-Show Crooks	f	1	\N	\N	\N	Alfred Hitchcock and the Three Investigators in The Mystery of the Creep-Show Crooks	\N	\N	\N	f
384	Die schwarzen Brüder	The Black Brothers	f	5	\N	\N	\N	Black Brothers	\N	\N	\N	f
317	Bombi Bitt och Nick Carter	Bombi Bitt and Nick Carter	t	3	\N	\N	\N	Bombi Bitt and Nick Carter	\N	\N	\N	f
570	How & Why Species Multiply: The Radiation of Darwin’s Finches	How & Why Species Multiply: The Radiation of Darwin’s Finches	t	1	\N	\N	\N	How & Why Species Multiply: The Radiation of Darwin’s Finches	\N	\N	\N	f
615	Life As It Is: Biology for the public sphere	Life As It Is: Biology for the public sphere	t	1	\N	\N	\N	Life As It Is: Biology for the public sphere	\N	\N	\N	f
556	Life at the Limits: Organisms in extreme environments	Life at the Limits: Organisms in extreme environments	t	1	\N	\N	\N	Life at the Limits: Organisms in extreme environments	\N	\N	\N	f
179	Madbond	Madbond	t	1	\N	\N	\N	Madbond	\N	\N	\N	f
207	Magic Kingdom For Sale -- SOLD!	Magic Kingdom For Sale -- SOLD!	t	1	\N	\N	\N	Magic Kingdom For Sale -- SOLD!	\N	\N	\N	f
341	Musen Malle	Malla the Mouse	f	9	\N	\N	\N	Malla the Mouse	\N	\N	\N	f
620	Microcosm: E. coli and the New Science of Life	Microcosm: E. coli and the New Science of Life	t	1	\N	\N	\N	Microcosm: E. coli and the New Science of Life	\N	\N	\N	f
700	Misquoting Jesus: The Story Behind Who Changed the Bible and Why	Misquoting Jesus: The Story Behind Who Changed the Bible and Why	t	1	\N	\N	\N	Misquoting Jesus: The Story Behind Who Changed the Bible and Why	\N	\N	\N	f
310	Sergeant Bigglesworth C.I.D	Sergeant Bigglesworth C.I.D	f	1	\N	\N	\N	Sergeant Bigglesworth C.I.D	\N	\N	\N	t
715	Right Ho, Jeeves!	Right Ho, Jeeves!	t	1	\N	\N	\N	Right Ho, Jeeves!	\N	\N	\N	t
755	Soul Made Flesh	Soul Made Flesh	t	1	\N	0-7432-7205-6	\N	Soul Made Flesh	\N	\N	\N	f
177	One Flew Over the Cuckoo's Nest	One Flew Over the Cuckoo's Nest	t	1	\N	\N	\N	One Flew Over the Cuckoo's Nest	\N	\N	\N	f
512	The End of Faith	The End of Faith	t	1	\N	\N	\N	End of Faith	\N	\N	\N	f
640	god is not Great: How religion poisons everything	god is not Great: How religion poisons everything	t	1	\N	\N	\N	god is not Great: How religion poisons everything	\N	\N	\N	f
254	Nine Princes in Amber	Nine Princes in Amber	f	1	\N	\N	\N	Nine Princes in Amber	6	\N	\N	f
175	Nineteen Eighty-Four	Nineteen Eighty-Four	t	1	\N	\N	\N	Nineteen Eighty-Four	9	\N	\N	f
377	Satan und Ischariot (vol. I)	Old Shatterhand and the Yuma Indians	f	5	\N	\N	\N	Old Shatterhand and the Yuma Indians	\N	\N	\N	f
560	Origins: Fourteen billion years of cosmic evolution	Origins: Fourteen billion years of cosmic evolution	t	1	\N	\N	\N	Origins: Fourteen billion years of cosmic evolution	\N	\N	\N	f
375	Petter klarar allt	Petter can handle anything	t	3	\N	\N	\N	Petter can handle anything	\N	\N	\N	f
480	Red Dwarf: Backwards	Red Dwarf: Backwards	t	1	\N	\N	\N	Red Dwarf: Backwards	\N	\N	\N	f
82	The Salmon of Doubt	The Salmon of Doubt	t	1	\N	0-330-32312-1	\N	Salmon of Doubt	\N	\N	\N	t
607	Refactoring: Improving the Design of Existing Code	Refactoring: Improving the Design of Existing Code	t	1	\N	\N	\N	Refactoring: Improving the Design of Existing Code	\N	\N	\N	f
394	Smack i smöret, Dante	Right in the butter, Dante	t	3	\N	\N	\N	Right in the butter, Dante	\N	\N	\N	f
476	Jenseits von Gut und Böse: Vorspiel einer Philosophie der Zukunft	Beyond Good and Evil: Prelude to a Philosophy of the Future	f	5	\N	\N	\N	Beyond Good and Evil: Prelude to a Philosophy of the Future	\N	\N	\N	f
227	The Children's Bible in 365 stories	The Children's Bible in 365 stories	f	1	\N	\N	\N	Children's Bible in 365 stories	\N	\N	\N	f
269	The Laughing Corpse	The Laughing Corpse	t	1	\N	\N	\N	Laughing Corpse	\N	\N	\N	f
271	The Lunatic Cafe	The Lunatic Cafe	t	1	\N	\N	\N	Lunatic Cafe	\N	\N	\N	f
430	Film-mysteriet	The Movie Mystery	t	3	\N	\N	\N	Movie Mystery	\N	\N	\N	f
471	The Nature of Space and Time	The Nature of Space and Time	t	1	\N	\N	\N	Nature of Space and Time	\N	\N	\N	f
667	The Plot Thickens: 8 Ways to Bring Fiction to Life	The Plot Thickens: 8 Ways to Bring Fiction to Life	t	1	\N	\N	\N	Plot Thickens: 8 Ways to Bring Fiction to Life	\N	\N	\N	f
428	Frimärks-mysteriet på Loberga	The Postage Stamp Mystery at Loberga	t	3	\N	\N	\N	Postage Stamp Mystery at Loberga	\N	\N	\N	f
564	Six Easy Pieces: Essentials of Physics Explained by Its Most Brilliant Teacher	Six Easy Pieces: Essentials of Physics Explained by Its Most Brilliant Teacher	t	1	\N	\N	\N	Six Easy Pieces: Essentials of Physics Explained by Its Most Brilliant Teacher	\N	\N	\N	f
40	Smith of Wootton Major and Leaf by Niggle	Smith of Wootton Major and Leaf by Niggle	t	1	\N	\N	\N	Smith of Wootton Major and Leaf by Niggle	\N	\N	\N	t
353	Den hedervärde mördaren	The honourable killer	t	3	\N	\N	\N	honourable killer	\N	\N	\N	f
329	The Haunting of Hiram C. Hopgood	The Haunting of Hiram C. Hopgood	f	1	\N	\N	\N	Haunting of Hiram C. Hopgood	\N	\N	\N	t
372	The Nargun and the Stars	The Nargun and the Stars	f	1	\N	\N	\N	Nargun and the Stars	\N	\N	\N	f
215	The Noonday Demon: An Atlas of Depression	The Noonday Demon: An Atlas of Depression	t	1	\N	\N	\N	Noonday Demon: An Atlas of Depression	\N	\N	\N	f
445	Bokhandleren i Kabul: et familiedrama	The Bookseller of Kabul	f	7	\N	\N	\N	Bookseller of Kabul	\N	\N	\N	t
743	Wellensittiche richtig pflegen und verstehen	Understanding and caring for budgies	f	5	\N	\N	\N	Understanding and caring for budgies	\N	\N	\N	t
567	The Sex Contract: The Evolution of Human Behavior	The Sex Contract: The Evolution of Human Behavior	t	1	\N	\N	\N	Sex Contract: The Evolution of Human Behavior	\N	\N	\N	f
756	A Planet of Viruses	A Planet of Viruses	t	1	\N	978-0-226-98335-6	\N	A Planet of Viruses	\N	\N	\N	f
339	Sign of the Unicorn	Sign of the Unicorn	f	1	\N	\N	\N	Sign of the Unicorn	\N	\N	\N	f
355	Skeleton Crew	Skeleton Crew	f	1	\N	\N	\N	Skeleton Crew	\N	\N	\N	f
469	Stranger in a Strange Land	Stranger in a Strange Land	t	1	\N	\N	\N	Stranger in a Strange Land	6	\N	\N	f
391	Sven-Ali och pappas Oskar	Sven-Ali and dad's Oskar	t	3	\N	\N	\N	Sven-Ali and dad's Oskar	\N	\N	\N	f
262	Tarzan of the Apes	Tarzan of the Apes	f	1	\N	\N	\N	Tarzan of the Apes	\N	\N	\N	f
373	Der Denker greift ein	The Thinker takes action	f	5	\N	\N	\N	Thinker takes action	\N	\N	\N	f
172	Thinner	Thinner	f	1	\N	\N	\N	Thinner	\N	\N	\N	f
420	Långtradar-mysteriet	The Tractor Truck Mystery	t	3	\N	\N	\N	Tractor Truck Mystery	\N	\N	\N	f
264	Nils Holgerssons underbara resa genom Sverige	The Wonderful Adventures of Nils	t	3	\N	\N	\N	Wonderful Adventures of Nils	\N	\N	\N	f
413	The camp in the mountains	The camp in the mountains	f	1	\N	\N	\N	camp in the mountains	\N	\N	\N	f
118	The Green Mile	The Green Mile	t	1	\N	\N	\N	Green Mile	\N	\N	\N	f
472	The Invisible Man	The Invisible Man	t	1	\N	\N	\N	Invisible Man	\N	\N	\N	f
359	Den skrattande polisen	The Laughing Policeman	t	3	\N	\N	\N	Laughing Policeman	\N	\N	\N	f
671	A Dash of Style: The art and mastery of punctuation	A Dash of Style: The art and mastery of punctuation	t	1	\N	\N	\N	A Dash of Style: The art and mastery of punctuation	\N	\N	\N	f
411	The Secret of the Caves	The Secret of the Caves	f	1	\N	\N	\N	Secret of the Caves	\N	\N	\N	f
45	The Strange Case of Dr. Jekyll and Mr. Hyde	The Strange Case of Dr. Jekyll and Mr. Hyde	t	1	\N	\N	\N	Strange Case of Dr. Jekyll and Mr. Hyde	\N	\N	\N	f
248	The Sign of Four	The Sign of Four	t	1	\N	0-553-21241-9	\N	Sign of Four	\N	\N	\N	t
260	Stalky & Co.	Stalky & Co.	f	1	My Swedish copy (‘Fiffikus &amp; Co.’) is an 1899 print in good condition, though I’m pretty sure the cover is not the original.		\N	Stalky & Co.	\N	\N	\N	t
244	Gulliver's Travels (Travels into Several Remote Nations of the World)	Gulliver's Travels (Travels into Several Remote Nations of the World)	f	1	\N	\N	\N	Gulliver's Travels (Travels into Several Remote Nations of the World)	\N	\N	\N	f
225	The Last of the Mohicans: A narrative of 1757	The Last of the Mohicans: A narrative of 1757	f	1	\N	\N	\N	Last of the Mohicans: A narrative of 1757	\N	\N	\N	f
624	The Mythical Man-Month: Essays on Software Engineering	The Mythical Man-Month: Essays on Software Engineering	t	1	\N	\N	\N	Mythical Man-Month: Essays on Software Engineering	\N	\N	\N	f
627	The Superorganism: The Beauty, Elegance, and Strangeness of Insect Societies	The Superorganism: The Beauty, Elegance, and Strangeness of Insect Societies	t	1	\N	\N	\N	Superorganism: The Beauty, Elegance, and Strangeness of Insect Societies	\N	\N	\N	f
499	The Way of Karate: Beyond Technique	The Way of Karate: Beyond Technique	t	1	\N	\N	\N	Way of Karate: Beyond Technique	\N	\N	\N	t
198	Les Trois Mousquetaires	The Three Musketeers	f	4	\N	\N	\N	Three Musketeers	\N	\N	\N	f
645	Trick or Treatment: The undeniable facts about alternative medicine	Trick or Treatment: The undeniable facts about alternative medicine	t	1	\N	\N	\N	Trick or Treatment: The undeniable facts about alternative medicine	9	\N	\N	f
757	Sommardöden	Death in the summer	t	3	\N	978-91-85625-94-9	\N	Death in the summer	\N	\N	\N	f
202	Vingt mille lieues sous le mers	Twenty Thousand Leagues Under the Sea	f	4	\N	\N	\N	Twenty Thousand Leagues Under the Sea	\N	\N	\N	f
396	The Two-Thousand-Pound Goldfish	The Two-Thousand-Pound Goldfish	f	1	\N	\N	\N	Two-Thousand-Pound Goldfish	6	\N	\N	f
365	War Horse	War Horse	f	1	\N	\N	\N	War Horse	\N	\N	\N	f
337	When Hitler Stole Pink Rabbit	When Hitler Stole Pink Rabbit	f	1	\N	\N	\N	When Hitler Stole Pink Rabbit	\N	\N	\N	f
552	Why People Believe Weird Things: Pseudoscience, Superstition, and Other Confusions of Our Time	Why People Believe Weird Things: Pseudoscience, Superstition, and Other Confusions of Our Time	t	1	\N	\N	\N	Why People Believe Weird Things: Pseudoscience, Superstition, and Other Confusions of Our Time	\N	\N	\N	f
64	The Sapphire Rose	The Sapphire Rose	t	1	\N	0-586-20374-5	\N	Sapphire Rose	8	\N	\N	t
504	Wicked: The Life and Times of the Wicked Witch of the West	Wicked: The Life and Times of the Wicked Witch of the West	t	1	\N	\N	\N	Wicked: The Life and Times of the Wicked Witch of the West	\N	\N	\N	f
543	A Clockwork Orange	A Clockwork Orange	t	1	\N	\N	\N	A Clockwork Orange	8	\N	\N	f
439	Le avventure di Pinocchio	The Adventures of Pinocchio	f	12	\N	\N	\N	Adventures of Pinocchio	\N	\N	\N	f
559	The Black Cloud	The Black Cloud	t	1	\N	\N	\N	Black Cloud	7	\N	\N	f
565	Why I Am Not a Christian and Other Essays on Religion and Related Subjects	Why I Am Not a Christian and Other Essays on Religion and Related Subjects	t	1	\N	\N	\N	Why I Am Not a Christian and Other Essays on Religion and Related Subjects	\N	\N	\N	f
542	The Last Days of Socrates: Euthypro, The Apology, Phaidon/Φαίδων/Phaedo, Crito	The Last Days of Socrates: Euthypro, The Apology, Phaedo, Crito	f	2	\N	\N	\N	Last Days of Socrates: Euthypro, The Apology, Phaedo, Crito	\N	\N	\N	f
482	Defensive Design for the Web: How to Improve Error Messages, Help, Forms, and Other Crisis Points	Defensive Design for the Web: How to Improve Error Messages, Help, Forms, and Other Crisis Points	t	1	\N	\N	\N	Defensive Design for the Web: How to Improve Error Messages, Help, Forms, and Other Crisis Points	\N	\N	\N	f
672	The First Five Pages: A Writer’s Guide to Staying Out of the Rejection Pile	The First Five Pages: A Writer’s Guide to Staying Out of the Rejection Pile	t	1	\N	\N	\N	First Five Pages: A Writer’s Guide to Staying Out of the Rejection Pile	\N	\N	\N	f
453	More Exceptional C++	More Exceptional C++	t	1	\N	\N	\N	More Exceptional C++	9	\N	\N	f
563	Reave the Just and Other Tales	Reave the Just and Other Tales	t	1	\N	\N	\N	Reave the Just and Other Tales	\N	\N	\N	f
642	Snake Oil Science: The Truth About Complementary and Alternative Medicine	Snake Oil Science: The Truth About Complementary and Alternative Medicine	t	1	\N	\N	\N	Snake Oil Science: The Truth About Complementary and Alternative Medicine	\N	\N	\N	f
682	Take the Bully by the Horns: Stop Unethical, Uncooperative, or Unpleasant People from Running and Ruining Your Life	Take the Bully by the Horns: Stop Unethical, Uncooperative, or Unpleasant People from Running and Ruining Your Life	t	1	\N	\N	\N	Take the Bully by the Horns: Stop Unethical, Uncooperative, or Unpleasant People from Running and Ruining Your Life	\N	\N	\N	f
571	Your Inner Fish: A Journey into the 3.5-Billion-Year History of the Human Body	Your Inner Fish: A Journey into the 3.5-Billion-Year History of the Human Body	t	1	\N	\N	\N	Your Inner Fish: A Journey into the 3.5-Billion-Year History of the Human Body	\N	\N	\N	f
1	American Gods	American Gods	t	1	\N	978-0-7553-2281-7	\N	American Gods	9	\N	\N	t
758	Titus Alone	Titus Alone	t	1	\N	14-00-3091-3	\N	Titus Alone	\N	\N	\N	f
586	The Discovery of Anti-matter: The autobiography of Carl David Anderson, the youngest man to win the Nobel prize	The Discovery of Anti-matter: The autobiography of Carl David Anderson, the youngest man to win the Nobel prize	t	1	\N	\N	\N	Discovery of Anti-matter: The autobiography of Carl David Anderson, the youngest man to win the Nobel prize	\N	\N	\N	f
348	Barnens Ö	The Island of the Children	t	3	\N	\N	\N	Island of the Children	\N	\N	\N	f
189	Die unendliche Geschichte	The Neverending Story	f	5	\N	\N	\N	Neverending Story	8	\N	\N	f
381	I Falkpatrullens spår (Swedish title)	On the trail of the Falcon Troop	f	7	\N	\N	\N	On the trail of the Falcon Troop	\N	\N	\N	f
551	2010: Odyssey Two	2010: Odyssey Two	t	1	\N	\N	\N	2010: Odyssey Two	\N	\N	\N	f
644	At the Mountains of Madness	At the Mountains of Madness	t	1	\N	\N	\N	At the Mountains of Madness	\N	\N	\N	f
634	Dark Banquet: Blood and the curious lives of blood-feeding creatures	Dark Banquet: Blood and the curious lives of blood-feeding creatures	t	1	\N	\N	\N	Dark Banquet: Blood and the curious lives of blood-feeding creatures	\N	\N	\N	f
506	Richard Dawkins: How a scientist changed the way we think	Richard Dawkins: How a scientist changed the way we think	t	1	\N	\N	\N	Richard Dawkins: How a scientist changed the way we think	\N	\N	\N	f
410	Alfred Hitchcock and the Three Investigators in The Mystery of the Green Ghost	Alfred Hitchcock and the Three Investigators in The Mystery of the Green Ghost	f	1	\N	\N	\N	Alfred Hitchcock and the Three Investigators in The Mystery of the Green Ghost	\N	\N	\N	f
403	Alfred Hitchcock and the Three Investigators in The Mystery of the Moaning Cave	Alfred Hitchcock and the Three Investigators in The Mystery of the Moaning Cave	f	1	\N	\N	\N	Alfred Hitchcock and the Three Investigators in The Mystery of the Moaning Cave	\N	\N	\N	f
401	Alfred Hitchcock and the Three Investigators in The Secret of Phantom Lake	Alfred Hitchcock and the Three Investigators in The Secret of Phantom Lake	f	1	\N	\N	\N	Alfred Hitchcock and the Three Investigators in The Secret of Phantom Lake	\N	\N	\N	f
457	Atlas Shrugged	Atlas Shrugged	t	1	\N	\N	\N	Atlas Shrugged	6	I don’t dislike Ayn Rand as so many people do: Much as I may <em>disagree</em> with many of her points, I nonetheless found it constructively thought-provoking to consider them, and I am glad to have read <cite>The Fountainhead</cite>. However, <cite>Atlas Shrugged</cite> is not merely as long-winded as reputation would have it: It is also tediously preachy, making the same predictable points over and over and over again.\n\nWhen she wrote <cite>We the Living</cite>, Ayn Rand was still learning her trade and how to embed her message in a story; <cite>The Fountainhead</cite> rests at an equilibrium; <cite>Atlas Shrugged</cite> has tipped the scales far in the other direction.	2011-01-23 19:18:57.427626	t
316	Bombi Bitt och jag	Bombi Bitt and I	t	3	My copy, which reached me via my grandfather, was signed by actor Stellan Skarsgård, who played the eponymous character of Bombi Bitt as a child in the 1968 TV adaptation. (It has no ISBN, being printed in 1967.)		\N	Bombi Bitt and I	\N	\N	\N	f
467	Go Rin No Sho (五輪書)	The Book of Five Rings	f	6	\N	\N	\N	Book of Five Rings	\N	\N	\N	t
277	The Adventures of Tom Sawyer	The Adventures of Tom Sawyer	f	1	\N	\N	\N	Adventures of Tom Sawyer	\N	\N	\N	f
748	Beej’s Guide to Network Programming Using Internet Sockets	Beej’s Guide to Network Programming Using Internet Sockets	t	1	\N		\N	Beej’s Guide to Network Programming Using Internet Sockets	9	Originally an internet tutorial, now available in print via <a href="http://www.lulu.com/product/paperback/beejs-guide-to-network-programming/4386755">Lulu</a>, Beej’s Guide is clear, concise, easy to read, easy to follow, and all around great. Obviously the scope is very narrow (it teaches you BSD/POSIX socket programming in C, der), but if that’s what you need to learn or brush up on, I can’t think of a better source.	2011-02-26 02:13:39.931241	t
546	The Alex Studies: Cognitive and Communicative Abilities of Grey Parrots	The Alex Studies: Cognitive and Communicative Abilities of Grey Parrots	t	1	\N	\N	\N	Alex Studies: Cognitive and Communicative Abilities of Grey Parrots	\N	\N	\N	f
549	Freakonomics: A Rogue Economist Explores the Hidden Side of Everything	Freakonomics: A Rogue Economist Explores the Hidden Side of Everything	t	1	\N	\N	\N	Freakonomics: A Rogue Economist Explores the Hidden Side of Everything	8	\N	\N	f
727	The Scarlet Pimpernel	The Scarlet Pimpernel	f	1	\N	91-38-90355-5	\N	Scarlet Pimpernel	\N	\N	\N	t
96	The Eye of the World	The Eye of the World	t	1	\N	0-812-51181-6	\N	Eye of the World	\N	\N	\N	t
100	The Fires of Heaven	The Fires of Heaven	t	1	\N	0-812-55030-7	\N	Fires of Heaven	\N	\N	\N	t
48	The Godfather	The Godfather	t	1	\N	0-451-16771-6	\N	Godfather	7	\N	\N	t
58	Sorceress of Darshiva	Sorceress of Darshiva	t	1	\N	0-552-13020-6	\N	Sorceress of Darshiva	6	\N	\N	t
121	Digital Fortress	Digital Fortress	t	1	\N	\N	\N	Digital Fortress	4	Dan Brown’s limited competence as a writer is of course well known—somewhat awkward prose, obnoxiously blatant Mary Sue (or ‘Gary Stu’ if you prefer), and so on. <cite>Digital Fortress</cite>, however, holds a special place in my heart, as this is where he places ignorance and sloppiness in an area where <em>I</em> have some knowledge front and centre.\n\nWe can quickly gloss over such errors as conflating bits and bytes. Much more interesting is the fact that a concept central to the plot is the so-called <q>Bergofsky principle</q>, which according to Brown states <q>that if a computer tried enough keys, it was mathematically guaranteed to find the right one</q>. What makes this so interesting is that a man named Gilbert Vernam invented a technique, called the One-time Pad (or Vernam One-time Pad), which has been proven mathematically impossible to break. This mathematically perfect cryptosystem is not a novel and obscure thing, but a well-known system in practical use that was invented in 1917. (Its usefulness is <em>limited</em>, however, because it is very awkward to use.) There are many other technical errors, but this one is the most glaring and the most amusing, because the plot revolves around the question of “What if this cryptosystem is practically unbreakable?”, when in fact the world has dealt with that reality for almost a century.	2011-01-23 19:18:57.912527	f
72	Macbeth	Macbeth	t	1	\N	0-486-27802-6	\N	Macbeth	\N	\N	\N	t
29	The Gap into Ruin: This Day All Gods Die	The Gap into Ruin: This Day All Gods Die	t	1	\N	0-553-57328-4	\N	Gap into Ruin: This Day All Gods Die	9	\N	\N	t
30	Lord Foul's Bane	Lord Foul's Bane	t	1	\N	0-345-34865-6	\N	Lord Foul's Bane	9	\N	\N	t
33	The Two Towers	The Two Towers	t	1	\N	0-261-10236-2	\N	Two Towers	10	\N	\N	t
65	Domes of Fire	Domes of Fire	t	1	\N	0-586-21313-9	\N	Domes of Fire	6	\N	\N	t
99	The Shadow Rising	The Shadow Rising	t	1	\N	0-812-51373-8	\N	Shadow Rising	\N	\N	\N	t
55	Guardians of the West	Guardians of the West	t	1	\N	0-552-13017-6	\N	Guardians of the West	6	\N	\N	t
74	Hamlet	Hamlet	t	1	\N	0-14-062058-3	\N	Hamlet	\N	\N	\N	t
10	The Wilding	The Wilding	t	1	\N	0-7564-0202-6	\N	Wilding	7	\N	\N	t
71	Notes on Training	Notes on Training	t	1	\N	0-937663-32-8	\N	Notes on Training	\N	\N	\N	t
287	Leviathan	Leviathan	t	1	\N	0-440-53981-1	\N	Leviathan	\N	\N	\N	t
7	Black Sun Rising	Black Sun Rising	t	1	\N	0-88677-527-2	\N	Black Sun Rising	9	\N	\N	t
261	The Wonderful Wizard of Oz	The Wonderful Wizard of Oz	t	1	\N	1-85326-112-2	\N	Wonderful Wizard of Oz	\N	\N	\N	t
24	The Runes of the Earth	The Runes of the Earth	t	1	\N	0-441-01304-X	\N	Runes of the Earth	7	\N	\N	t
192	The Dark Is Rising	The Dark Is Rising	t	1	\N	978-0-689-82983-3	\N	Dark Is Rising	8	\N	\N	t
62	The Diamond Throne	The Diamond Throne	t	1	\N	0-586-20372-9	\N	Diamond Throne	8	\N	\N	t
97	The Great Hunt	The Great Hunt	t	1	\N	0-812-51772-5	\N	Great Hunt	\N	\N	\N	t
101	Lord of Chaos	Lord of Chaos	t	1	\N	0-812-51375-4	\N	Lord of Chaos	\N	\N	\N	t
14	The Selfish Gene	The Selfish Gene	t	1	\N	0-19-929115-2	\N	Selfish Gene	10	\N	\N	t
20	The Power that Preserves	The Power that Preserves	t	1	\N	0-345-29658-3	\N	Power that Preserves	9	\N	\N	t
49	Tigana	Tigana	t	1	\N	0-451-45115-5	\N	Tigana	9	\N	\N	t
69	The Losers	The Losers	t	1	\N	0-586-21759-2	\N	Losers	\N	\N	\N	t
726	Die Verwandlung	Metamorphosis	f	5	\N	978-1-84837-202-3	\N	Metamorphosis	7	\N	\N	t
79	Mostly Harmless	Mostly Harmless	t	1	\N	0-434-00348-4	\N	Mostly Harmless	\N	\N	\N	t
12	The Code Book	The Code Book	t	1	\N	978-0-385-49532-5	\N	Code Book	9	\N	\N	t
23	White Gold Wielder	White Gold Wielder	t	1	\N	0-00-647330-X	\N	White Gold Wielder	8	\N	\N	t
725	Paradiso	Paradiso	f	12	\N	978-0-451-20863-7	\N	Paradiso	\N	\N	\N	t
21	The Wounded Land	The Wounded Land	t	1	\N	0-00-647330-X	\N	Wounded Land	8	\N	\N	t
724	Purgatorio	Purgatorio	f	12	\N	978-0-451-20863-7	\N	Purgatorio	\N	\N	\N	t
51	Queen of Sorcery	Queen of Sorcery	t	1	\N	0-552-12348-X	\N	Queen of Sorcery	8	\N	\N	t
218	Red Dragon	Red Dragon	t	1	\N	0-434-00905-9	\N	Red Dragon	8	\N	\N	t
35	The Silmarillion	The Silmarillion	t	1	\N	0-261-10273-7	\N	Silmarillion	10	\N	\N	t
63	The Ruby Knight	The Ruby Knight	t	1	\N	0-586-20373-7	\N	Ruby Knight	8	\N	\N	t
4	In Conquest Born	In Conquest Born	t	1	\N	0-7564-0043-0	\N	In Conquest Born	10	\N	\N	t
87	The Left Hand of Darkness	The Left Hand of Darkness	t	1	\N	0-441-47812-3	\N	Left Hand of Darkness	10	\N	\N	t
84	The Tombs of Atuan	The Tombs of Atuan	t	1	\N	0-14-015427-2	\N	Tombs of Atuan	8	\N	\N	t
86	Tehanu	Tehanu	t	1	\N	0-14-015427-2	\N	Tehanu	8	\N	\N	t
46	Treasure Island	Treasure Island	t	1	\N	0-486-27559-0	\N	Treasure Island	\N	\N	\N	t
34	The Return of the King	The Return of the King	t	1	\N	0-261-10237-0	\N	Return of the King	10	\N	\N	t
5	The Madness Season	The Madness Season	t	1	\N	0-88677-444-6	\N	Madness Season	8	\N	\N	t
115	It	It	t	1	\N	0-451-16951-4	\N	It	\N	\N	\N	t
22	The One Tree	The One Tree	t	1	\N	0-00-647330-X	\N	One Tree	8	\N	\N	t
26	The Gap into Vision: Forbidden Knowledge	The Gap into Vision: Forbidden Knowledge	t	1	\N	0-553-29760-0	\N	Gap into Vision: Forbidden Knowledge	9	\N	\N	t
60	Belgarath the Sorcerer	Belgarath the Sorcerer	t	1	\N	0-586-21315-5	\N	Belgarath the Sorcerer	8	\N	\N	t
32	The Fellowship of the Ring	The Fellowship of the Ring	t	1	\N	0-261-10235-4	\N	Fellowship of the Ring	10	\N	\N	t
90	The Bristling Wood	The Bristling Wood	t	1	\N	0-586-20741-4	24750450	Bristling Wood	9	\N	\N	t
53	Castle of Wizardry	Castle of Wizardry	t	1	\N	0-552-12435-4	\N	Castle of Wizardry	8	\N	\N	t
89	Darkspell	Darkspell	t	1	\N	0-553-56888-4	31870053	Darkspell	9	\N	\N	t
440	The Ancestor's Tale	The Ancestor's Tale	t	1	\N	978-0-618-61916-0	\N	Ancestor's Tale	10	\N	\N	t
666	Foundations of Security: What Every Programmer Needs To Know	Foundations of Security: What Every Programmer Needs To Know	t	1	\N	978-1-59059-784-2	\N	Foundations of Security: What Every Programmer Needs To Know	\N	\N	\N	t
143	Neuromancer	Neuromancer	t	1	\N	0-586-06645-4	\N	Neuromancer	9	\N	\N	t
138	Faith of the Fallen	Faith of the Fallen	t	1	\N	0-812-57639-X	\N	Faith of the Fallen	6	\N	\N	t
209	The Scions of Shannara	The Scions of Shannara	t	1	\N	91-37-10339-3	\N	Scions of Shannara	\N	\N	\N	t
235	The Light Fantastic	The Light Fantastic	t	1	\N	0-552-12848-1	\N	Light Fantastic	\N	\N	\N	t
140	Naked Empire	Naked Empire	t	1	\N	0-765-34430-0	\N	Naked Empire	6	\N	\N	t
145	Neverwhere	Neverwhere	t	1	\N	0-380-78901-9	\N	Neverwhere	9	\N	\N	t
742	The Evolutionary Void	The Evolutionary Void	t	1	\N	978-0-345-49657-7	\N	Evolutionary Void	\N	\N	\N	t
187	The Subtle Knife	The Subtle Knife	t	1	\N	0-345-41336-9	\N	Subtle Knife	10	\N	\N	t
196	Life of Pi	Life of Pi	t	1	\N	1-84195-425-X	\N	Life of Pi	8	\N	\N	t
274	The Eye in the Pyramid	The Eye in the Pyramid	t	1	\N	0-440-53981-1	\N	Eye in the Pyramid	\N	\N	\N	t
126	Dune	Dune	t	1	\N	0-441-17271-7	\N	Dune	9	\N	\N	t
318	Other Lands	Other Lands	t	1	\N	1-85723-364-6	\N	Other Lands	\N	\N	\N	t
104	Winter’s Heart	Winter’s Heart	t	1	\N	0-812-57558-X	\N	Winter’s Heart	\N	\N	\N	t
745	The Gunslinger	The Gunslinger	t	1	\N	0-451-16052-5	\N	Gunslinger	\N	\N	\N	t
139	The Pillars of Creation	The Pillars of Creation	t	1	\N	0-765-34074-7	\N	Pillars of Creation	6	\N	\N	t
117	Rose Madder	Rose Madder	t	1	\N	0-670-85869-2	\N	Rose Madder	\N	\N	\N	t
120	The Stand	The Stand	t	1	\N	0-451-16953-0	\N	Stand	9	\N	\N	t
134	Stone of Tears	Stone of Tears	t	1	\N	0-812-54809-4	\N	Stone of Tears	9	\N	\N	t
186	Northern Lights (The Golden Compass)	Northern Lights (The Golden Compass)	t	1	\N	0-440-23813-7	\N	Northern Lights (The Golden Compass)	10	\N	\N	t
728	Körkortsboken	The Swedish driving licence manual	t	3	19th edition (1999)	91-86874-22-5	\N	Swedish driving licence manual	\N	\N	\N	t
166	Weaveworld	Weaveworld	t	1	\N	0-00-617489-2	\N	Weaveworld	\N	\N	\N	t
18	A Feast for Crows	A Feast for Crows	t	1	\N	0-553-58202-X	\N	A Feast for Crows	9	\N	\N	t
736	The Dreaming Void	The Dreaming Void	t	1	\N	978-0-330-44302-9	\N	Dreaming Void	7	\N	\N	t
144	Good Omens	Good Omens	t	1	\N	978-0-06-085398-3	\N	Good Omens	8	\N	\N	t
103	The Path of Daggers	The Path of Daggers	t	1	\N	0-812-55029-3	\N	Path of Daggers	\N	\N	\N	t
6	Odusseia (Ὀδύσσεια)	The Odyssey	f	2	\N	978-04-8640654-1	\N	Odyssey	\N	\N	\N	t
125	Dracula	Dracula	t	1	\N	978-1-84837-329-7	\N	Dracula	9	\N	\N	t
206	Angel Fire East	Angel Fire East	t	1	\N	0-345-43798-5	\N	Angel Fire East	7	\N	\N	t
220	A Time to Kill	A Time to Kill	t	1	\N	0-440-21172-7	\N	A Time to Kill	\N	\N	\N	t
57	Demon Lord of Karanda	Demon Lord of Karanda	t	1	\N	0-345-36331-0	\N	Demon Lord of Karanda	6	\N	\N	t
119	Dreamcatcher	Dreamcatcher	t	1	\N	0-7434-6752-3	\N	Dreamcatcher	\N	\N	\N	t
221	The Firm	The Firm	t	1	\N	0-09-983000-0	\N	Firm	\N	\N	\N	t
216	On Writing	On Writing	t	1	\N	0-340-76998-X	\N	On Writing	9	\N	\N	t
322	The Cider House Rules	The Cider House Rules	t	1	\N	0-345-38765-1	\N	Cider House Rules	\N	\N	\N	t
319	Dark Fire	Dark Fire	t	1	\N	0-552-13978-5	\N	Dark Fire	\N	\N	\N	t
211	The Elf Queen of Shannara	The Elf Queen of Shannara	f	1	\N	91-37-10631-7	\N	Elf Queen of Shannara	\N	\N	\N	t
236	Equal Rites	Equal Rites	t	1	\N	0-552-13105-9	\N	Equal Rites	\N	\N	\N	t
433	Stenhuggaren	The Stonecutter	t	3	\N	91-7001-369-1	\N	Stonecutter	\N	\N	\N	t
230	So, You Want to Be Canadian	So, You Want to Be Canadian	t	1	\N	0-8118-4535-4	\N	So, You Want to Be Canadian	\N	\N	\N	t
367	The Moon in the Cloud	The Moon in the Cloud	f	1	\N	91-502-1055-6	\N	Moon in the Cloud	\N	\N	\N	t
406	Modern Classics of Fantasy	Modern Classics of Fantasy	t	1	\N	0-312-16931-0	\N	Modern Classics of Fantasy	\N	\N	\N	t
232	The Neutronium Alchemist	The Neutronium Alchemist	t	1	\N	978-0-316-02181-4	\N	Neutronium Alchemist	9	\N	\N	t
400	The Rockingdown Mystery	The Rockingdown Mystery	f	1	\N	91-7674-050-1	\N	Rockingdown Mystery	\N	\N	\N	t
256	The Sailor on the Seas of Fate	The Sailor on the Seas of Fate	t	1	\N	0-441-74863-5	\N	Sailor on the Seas of Fate	\N	\N	\N	t
368	The Shadow on the Sun	The Shadow on the Sun	f	1	\N	91-502-1056-4	\N	Shadow on the Sun	\N	\N	\N	t
238	Sourcery	Sourcery	t	1	\N	0-552-13107-5	\N	Sourcery	8	\N	\N	t
233	The Naked God	The Naked God	t	1	\N	978-0-330-35145-4	\N	Naked God	8	\N	\N	t
325	Hackers & painters	Hackers & painters	t	1	\N	0-596-00662-4	\N	Hackers & painters	\N	\N	\N	t
241	Thief of Time	Thief of Time	t	1	\N	0-552-14840-7	\N	Thief of Time	\N	\N	\N	t
729	Tim Burton (Pocket Essentials)	Tim Burton (Pocket Essentials)	t	1	\N	1-903047-62-5	\N	Tim Burton (Pocket Essentials)	\N	\N	\N	t
239	Wyrd Sisters	Wyrd Sisters	t	1	\N	0-552-13460-0	\N	Wyrd Sisters	\N	\N	\N	t
737	The Temporal Void	The Temporal Void	t	1	\N	978-0-330-44303-6	\N	Temporal Void	8	\N	\N	t
288	Anansi Boys	Anansi Boys	t	1	\N	0-06-051519-8	\N	Anansi Boys	7	\N	\N	t
437	Knife of Dreams	Knife of Dreams	t	1	\N	0-812-57756-6	\N	Knife of Dreams	\N	\N	\N	t
434	Bag of Bones	Bag of Bones	t	1	\N	978-0-671-02423-9	\N	Bag of Bones	\N	\N	\N	t
286	The Golden Apple	The Golden Apple	t	1	\N	0-440-53981-1	\N	Golden Apple	\N	\N	\N	t
473	Casino Royale	Casino Royale	t	1	\N	0-14-303766-8	\N	Casino Royale	\N	\N	\N	t
194	The Grey King	The Grey King	t	1	\N	978-0-689-82984-0	\N	Grey King	8	\N	\N	t
438	The Blind Watchmaker	The Blind Watchmaker	t	1	\N	0-141-02616-2	\N	Blind Watchmaker	9	\N	\N	t
460	The Children of Húrin	The Children of Húrin	t	1	\N	978-0-00-724622-9	\N	Children of Húrin	9	\N	\N	t
497	The Winter’s Tale	The Winter’s Tale	t	1	\N	0-451-52714-3	\N	Winter’s Tale	\N	\N	\N	t
511	Iliad (Ἰλιάς)	The Iliad	f	2	\N	978-0-14-044794-1	\N	Iliad	\N	\N	\N	t
193	Greenwitch	Greenwitch	t	1	\N	978-0-689-84034-0	\N	Greenwitch	8	\N	\N	t
483	The Summer Tree	The Summer Tree	t	1	\N	978-0-00-647950-5	\N	Summer Tree	9	\N	\N	t
16	A Clash of Kings	A Clash of Kings	t	1	\N	0-553-57990-8	\N	A Clash of Kings	10	\N	\N	t
491	The Deeper Meaning of Liff	The Deeper Meaning of Liff	t	1	\N	0-330-32220-6	\N	Deeper Meaning of Liff	9	\N	\N	t
495	Il nome della rosa	The Name of the Rose	f	12	\N	0-15-600131-4	\N	Name of the Rose	\N	\N	\N	t
369	The Bright and Morning Star	The Bright and Morning Star	f	1	\N	91-502-1057-2	\N	Bright and Morning Star	\N	\N	\N	t
448	Brave New World	Brave New World	t	1	\N	0-06-080983-3	\N	Brave New World	9	\N	\N	t
516	Feast of Souls	Feast of Souls	t	1	\N	978-0-7564-0432-1	\N	Feast of Souls	8	\N	\N	t
250	A Study in Scarlet	A Study in Scarlet	t	1	\N	0-553-21241-9	\N	A Study in Scarlet	\N	\N	\N	t
340	Gudarnas berg	Mountain of the Gods	t	3	\N	91-1-905142-5	\N	Mountain of the Gods	9	\N	\N	t
446	Diamonds Are Forever	Diamonds Are Forever	t	1	\N	0-586-04490-6	\N	Diamonds Are Forever	\N	\N	\N	t
449	The Fountainhead	The Fountainhead	t	1	\N	0-451-17512-3	\N	Fountainhead	8	\N	\N	t
444	The Extended Phenotype	The Extended Phenotype	t	1	\N	0-19-288051-9	\N	Extended Phenotype	10	\N	\N	t
470	The War of the Worlds	The War of the Worlds	t	1	\N	0-14-102418-6	\N	War of the Worlds	\N	\N	\N	t
484	The Wandering Fire	The Wandering Fire	t	1	\N	978-0-00-647950-5	\N	Wandering Fire	9	\N	\N	t
730	The Sword of Shannara	The Sword of Shannara	f	1	\N	91-37-10875-1	\N	Sword of Shannara	\N	\N	\N	t
488	The Dispossessed	The Dispossessed	t	1	\N	0-06-105488-7	\N	Dispossessed	\N	\N	\N	t
515	The Parrot Companion	The Parrot Companion	t	1	\N	978-1-55407-199-9	\N	Parrot Companion	\N	\N	\N	t
746	The Once And Future King	The Once And Future King	t	1	\N	0-00-615310-0	\N	Once And Future King	\N	\N	\N	t
487	The Meaning of Liff	The Meaning of Liff	t	1	\N	0-330-28121-6	\N	Meaning of Liff	10	\N	\N	t
502	The Case-Book of Sherlock Holmes	The Case-Book of Sherlock Holmes	t	1	\N	1-85326-070-3	\N	Case-Book of Sherlock Holmes	\N	\N	\N	t
404	Den stora boken om djurens värld	The Big Book of the Animal World	t	3	\N	91-570-0491-9	\N	Big Book of the Animal World	\N	\N	\N	t
252	The Memoirs of Sherlock Holmes	The Memoirs of Sherlock Holmes	t	1	\N	978-0-89009-057-2	\N	Memoirs of Sherlock Holmes	\N	\N	\N	t
530	Letter to a Christian Nation	Letter to a Christian Nation	t	1	\N	0-307-26577-3	\N	Letter to a Christian Nation	\N	\N	\N	t
447	To Kill A Mockingbird	To Kill A Mockingbird	t	1	\N	0-446-31049-2	\N	To Kill A Mockingbird	\N	\N	\N	t
454	We the Living	We the Living	t	1	\N	0-451-15860-1	\N	We the Living	6	\N	\N	t
595	Himmelsöga	Eye in the Sky	t	3	\N	978-91-7001-603-5	\N	Eye in the Sky	\N	\N	\N	t
464	Starship Troopers	Starship Troopers	t	1	\N	0-441-78358-9	\N	Starship Troopers	8	\N	\N	t
522	Harry Potter and the Half-Blood Prince	Harry Potter and the Half-Blood Prince	t	1	\N	978-1-55192-918-7	\N	Harry Potter and the Half-Blood Prince	8	\N	\N	t
513	Harry Potter and the Philosopher’s Stone	Harry Potter and the Philosopher’s Stone	t	1	\N	1-55192-398-X	\N	Harry Potter and the Philosopher’s Stone	8	\N	\N	t
519	Harry Potter and the Goblet of Fire	Harry Potter and the Goblet of Fire	t	1	\N	1-55192-706-3	\N	Harry Potter and the Goblet of Fire	8	\N	\N	t
505	Moby-Dick	Moby-Dick	t	1	\N	0-553-21311-3	\N	Moby-Dick	\N	\N	\N	t
533	The Last Light of the Sun	The Last Light of the Sun	t	1	\N	0-14-305148-2	\N	Last Light of the Sun	\N	\N	\N	t
529	Pandora's Star	Pandora's Star	t	1	\N	0-345-47921-1	\N	Pandora's Star	9	\N	\N	t
468	Cryptonomicon	Cryptonomicon	t	1	\N	0-06-051280-6	\N	Cryptonomicon	9	\N	\N	t
257	The Jungle Book	The Jungle Book	t	1	\N	0-19-281650-0	9835121	Jungle Book	8	\N	\N	t
577	Cosmos	Cosmos	t	1	\N	0-345-33135-4	\N	Cosmos	\N	\N	\N	t
523	Harry Potter and the Deathly Hallows	Harry Potter and the Deathly Hallows	t	1	\N	978-1-55192-976-7	\N	Harry Potter and the Deathly Hallows	8	\N	\N	t
532	How the Mind Works	How the Mind Works	t	1	\N	978-0-393-31848-7	\N	How the Mind Works	\N	\N	\N	t
13	On the Origin of Species	On the Origin of Species	t	1	\N	0-375-75146-7	\N	On the Origin of Species	9	\N	\N	t
731	The Elfstones of Shannara	The Elfstones of Shannara	f	1	\N	91-37-11190-6	\N	Elfstones of Shannara	\N	\N	\N	t
527	Tales from Earthsea	Tales from Earthsea	t	1	\N	0-441-01124-1	\N	Tales from Earthsea	\N	\N	\N	t
531	Judas Unchained	Judas Unchained	t	1	\N	978-0-345-46167-4	\N	Judas Unchained	9	\N	\N	t
540	Rob Roy	Rob Roy	t	1	\N	1-85326-253-6	\N	Rob Roy	\N	\N	\N	t
481	Mona Lisa Overdrive	Mona Lisa Overdrive	t	1	\N	0-553-28174-7	\N	Mona Lisa Overdrive	\N	\N	\N	t
587	The Ethical Slut	The Ethical Slut	t	1	\N	1-890159-01-8	\N	Ethical Slut	\N	\N	\N	t
507	Climbing Mount Improbable	Climbing Mount Improbable	t	1	\N	978-0-393-31682-7	\N	Climbing Mount Improbable	9	\N	\N	t
525	The Elements of Style	The Elements of Style	t	1	\N	0-02-418200-1	\N	Elements of Style	\N	\N	\N	t
188	The Amber Spyglass	The Amber Spyglass	t	1	\N	0-440-23815-3	\N	Amber Spyglass	10	\N	\N	t
195	Silver on the Tree	Silver on the Tree	t	1	\N	978-0-689-84033-3	\N	Silver on the Tree	7	\N	\N	t
509	River out of Eden	River out of Eden	t	1	\N	978-0-465-06990-3	\N	River out of Eden	8	\N	\N	t
459	Nochnoy Dozor (Ночной дозор)	The Night Watch	f	13	\N	978-0-099-48992-4	\N	Night Watch	\N	\N	\N	t
590	The Lays of Beleriand	The Lays of Beleriand	t	1	\N	0-00-714915-8	\N	Lays of Beleriand	\N	\N	\N	t
580	Caiques	Caiques	t	1	\N	978-0-7641-3446-3	\N	Caiques	\N	\N	\N	t
92	A Time of Exile	A Time of Exile	t	1	\N	0-553-29813-5	26293919	A Time of Exile	\N	\N	\N	t
609	The Pragmatic Programmer: From Journeyman to Master	The Pragmatic Programmer: From Journeyman to Master	t	1	\N	978-0-201-61622-4	\N	Pragmatic Programmer: From Journeyman to Master	\N	\N	\N	t
655	The Lies of Locke Lamora	The Lies of Locke Lamora	t	1	\N	978-0-553-58894-1	\N	Lies of Locke Lamora	9	\N	\N	t
680	Wings of Wrath	Wings of Wrath	t	1	\N	978-0-7564-0535-9	\N	Wings of Wrath	8	\N	\N	t
677	The Picture of Dorian Gray	The Picture of Dorian Gray	t	1	\N	978-1-84837-331-0	\N	Picture of Dorian Gray	8	\N	\N	t
596	I denna ljuva sommartid	In This Sweet Summertime	t	3	\N	978-91-0-011943-0	\N	In This Sweet Summertime	\N	\N	\N	t
669	A Short History of Nearly Everything	A Short History of Nearly Everything	t	1	\N	0-385-66004-9	\N	A Short History of Nearly Everything	\N	\N	\N	t
623	The Language Instinct	The Language Instinct	t	1	\N	978-0-06-133646-1	\N	Language Instinct	\N	\N	\N	t
616	The Sexual Spectrum	The Sexual Spectrum	t	1	\N	1-55192-681-4	\N	Sexual Spectrum	\N	\N	\N	t
622	Tricks... To please a woman	Tricks... To please a woman	t	1	\N	978-1-890159-40-5	\N	Tricks... To please a woman	\N	\N	\N	t
637	The People of the Black Circle	The People of the Black Circle	t	1	\N	978-1-85798-996-0	\N	People of the Black Circle	4	\N	\N	t
676	Spirits of the Dead: Tales and Poems	Spirits of the Dead: Tales and Poems	t	1	\N	0-14-062239-X	\N	Spirits of the Dead: Tales and Poems	\N	\N	\N	t
407	Legends	Legends	t	1	Collection of short stories.	0-00-648393-3	\N	Legends	\N	\N	\N	t
606	The Treason of Isengard	The Treason of Isengard	t	1	\N	0-00-714916-6	\N	Treason of Isengard	\N	\N	\N	t
605	The Return of the Shadow	The Return of the Shadow	t	1	\N	0-00-714916-6	\N	Return of the Shadow	\N	\N	\N	t
399	Skjut kungen!	Shoot the king!	t	3	\N	91-20-10107-4	\N	Shoot the king!	\N	\N	\N	t
660	Why Evolution Is True	Why Evolution Is True	t	1	\N	978-0-14-311664-6	\N	Why Evolution Is True	9	\N	\N	t
535	Den kinesiska trädgården	The Chinese Garden	t	3	\N	978-91-7001-527-4	\N	Chinese Garden	\N	\N	\N	t
675	Beowulf	Beowulf	f	15	\N	978-0-393-32097-8	\N	Beowulf	\N	\N	\N	t
664	Дневной дозор (Dnevnoy dozor)	Day Watch	f	13	\N	978-0-0994-8993-1	\N	Day Watch	\N	\N	\N	t
534	Vi som aldrig sa hora	We who never said whore	t	3	\N	978-91-46-21672-8	\N	We who never said whore	\N	\N	\N	t
649	I Am Legend	I Am Legend	t	1	\N	978-0-7653-5715-1	\N	I Am Legend	\N	\N	\N	t
597	The Shaping of Middle-earth	The Shaping of Middle-earth	t	1	\N	0-00-714915-8	\N	Shaping of Middle-earth	\N	\N	\N	t
732	The Wishsong of Shannara	The Wishsong of Shannara	f	1	\N	91-37-11036-5	\N	Wishsong of Shannara	\N	\N	\N	t
638	Fatal Revenant	Fatal Revenant	t	1	\N	978-0-575-08239-7	\N	Fatal Revenant	\N	\N	\N	t
670	The Special Theory of Relativity	The Special Theory of Relativity	t	1	\N	0-415-40425-8	\N	Special Theory of Relativity	\N	\N	\N	t
610	The Third Chimpanzee	The Third Chimpanzee	t	1	\N	978-0-06-084550-6	\N	Third Chimpanzee	\N	\N	\N	t
716	Alice’s Adventures in Wonderland	Alice’s Adventures in Wonderland	t	1	\N	978-0-307-29087-8	\N	Alice’s Adventures in Wonderland	7	\N	\N	t
722	Fermat’s Enigma	Fermat’s Enigma	t	1	\N	0-14-026869-3	\N	Fermat’s Enigma	8	\N	\N	t
717	Through the Looking-Glass	Through the Looking-Glass	t	1	\N	978-0-307-29087-8	\N	Through the Looking-Glass	7	\N	\N	t
135	Blood of the Fold	Blood of the Fold	t	1	\N	0-812-55147-8	\N	Blood of the Fold	9	\N	\N	t
721	Nonsense On Stilts	Nonsense On Stilts	t	1	\N	978-0-226-66786-7	\N	Nonsense On Stilts	\N	\N	\N	t
674	Bonk: The Curious Coupling of Science and Sex	Bonk: The Curious Coupling of Science and Sex	t	1	\N	978-0-393-06464-3	\N	Bonk: The Curious Coupling of Science and Sex	\N	\N	\N	t
705	The Hunt for Red October	The Hunt for Red October	t	1	\N	0-425-13351-6	\N	Hunt for Red October	\N	\N	\N	t
240	Carpe Jugulum	Carpe Jugulum	t	1	\N	0-552-14615-3	\N	Carpe Jugulum	\N	\N	\N	t
94	Days of Blood and Fire (A Time of War)	Days of Blood and Fire (A Time of War)	t	1	\N	0-586-21197-7	59816069	Days of Blood and Fire (A Time of War)	\N	\N	\N	t
684	Moll Flanders	Moll Flanders	t	1	\N	978-1-84837-316-7	\N	Moll Flanders	\N	\N	\N	t
693	Doctor No	Doctor No	t	1	\N	978-0-14-102827-9	\N	Doctor No	\N	\N	\N	t
255	Elric of Melniboné	Elric of Melniboné	t	1	\N	0-441-20398-1	\N	Elric of Melniboné	\N	\N	\N	t
691	The Red Queen	The Red Queen	t	1	\N	978-0-06-055657-0	\N	Red Queen	\N	\N	\N	t
695	Eric	Eric	t	1	\N	978-0-380-82121-1	\N	Eric	\N	\N	\N	t
709	Fallen Dragon	Fallen Dragon	t	1	\N	0-446-61263-4	\N	Fallen Dragon	9	\N	\N	t
91	The Dragon Revenant	The Dragon Revenant	t	1	\N	0-586-20787-2	29470965	Dragon Revenant	\N	\N	\N	t
694	Guards! Guards!	Guards! Guards!	t	1	\N	978-0-06-102064-3	\N	Guards! Guards!	\N	\N	\N	t
699	Последний дозор (Posledniy Dozor)	The Last Watch	f	13	\N	978-0-385-66399-1	\N	Last Watch	\N	\N	\N	t
723	Inferno	Inferno	f	12	\N	978-0-451-20863-7	\N	Inferno	\N	\N	\N	t
703	Effective C++	Effective C++	t	1	\N	978-0-321-33487-9	\N	Effective C++	\N	\N	\N	t
707	Infidel	Infidel	t	1	\N	978-0-7432-8969-6	\N	Infidel	10	\N	\N	t
15	A Game of Thrones	A Game of Thrones	t	1	\N	0-553-57340-3	\N	A Game of Thrones	10	\N	\N	t
712	The Big Sleep	The Big Sleep	t	1	\N	0-394-72631-6	\N	Big Sleep	7	\N	\N	t
569	An Outline of Philosophy	An Outline of Philosophy	t	1	\N	0-529-02153-6	\N	An Outline of Philosophy	\N	\N	\N	t
688	Pyramids	Pyramids	t	1	\N	978-0-552-13461-3	\N	Pyramids	\N	\N	\N	t
621	Code Complete: A Practical Handbook of Software Construction	Code Complete: A Practical Handbook of Software Construction	t	1	\N	978-0-7356-1967-8	\N	Code Complete: A Practical Handbook of Software Construction	7	\N	\N	t
333	Shiva: An Adventure of the Ice Age	Shiva: An Adventure of the Ice Age	f	1	\N	91-7270-633-3	\N	Shiva: An Adventure of the Ice Age	\N	\N	\N	t
718	Bad Science	Bad Science	t	1	\N	978-0-7710-3578-4	\N	Bad Science	8	\N	\N	t
714	Genome	Genome	t	1	\N	978-0-06-089408-5	\N	Genome	\N	\N	\N	t
659	Poisons: From Hemlock to Botox and the Killer Bean of Calabar	Poisons: From Hemlock to Botox and the Killer Bean of Calabar	t	1	\N	1-55970-810-7	\N	Poisons: From Hemlock to Botox and the Killer Bean of Calabar	9	\N	\N	t
706	The Poisoner’s Handbook	The Poisoner’s Handbook	t	1	\N	978-1-59420-243-8	\N	Poisoner’s Handbook	7	\N	\N	t
88	Daggerspell	Daggerspell	t	1	\N	0-006-48224-4	34974326	Daggerspell	9	\N	\N	t
185	Fool’s Errand	Fool’s Errand	t	1	\N	0-00-648601-0	\N	Fool’s Errand	\N	\N	\N	t
719	Red Seas Under Red Skies	Red Seas Under Red Skies	t	1	\N	978-0-553-58895-8	\N	Red Seas Under Red Skies	7	\N	\N	t
102	A Crown of Swords	A Crown of Swords	t	1	\N	0-812-55028-5	\N	A Crown of Swords	\N	\N	\N	t
701	The Structure of Scientific Revolutions	The Structure of Scientific Revolutions	t	1	\N	0-226-45804-0	\N	Structure of Scientific Revolutions	7	\N	\N	t
739	Världens största konspirationer	The World’s Greatest Conspiracies	t	3	The cover blurb makes it look as though this book were written credulously; I was prepared to be horrified and aggravated. This was not the case.\r\n\r\nThe book is a collection of essays: hence the large number of authors.	978-91-7232-056-7	\N	World’s Greatest Conspiracies	7	\N	\N	t
685	The Stuff of Thought	The Stuff of Thought	t	1	\N	978-0-670-06327-7	\N	Stuff of Thought	\N	\N	\N	t
17	A Storm of Swords	A Storm of Swords	t	1	\N	0-553-57342-X	\N	A Storm of Swords	10	\N	\N	t
720	The Gathering Storm	The Gathering Storm	t	1	\N	978-0-7653-4153-2	\N	Gathering Storm	\N	\N	\N	t
205	A Knight of the Word	A Knight of the Word	t	1	\N	0-345-42464-6	\N	A Knight of the Word	8	\N	\N	t
508	Elbow Room: The varieties of free will worth wanting	Elbow Room: The varieties of free will worth wanting	t	1	\N	0-262-54042-8	\N	Elbow Room: The varieties of free will worth wanting	9	\N	\N	t
130	Do Androids Dream of Electric Sheep?	Do Androids Dream of Electric Sheep?	t	1	\N	0-345-30129-3	\N	Do Androids Dream of Electric Sheep?	\N	\N	\N	t
514	Guide to a well-behaved parrot	Guide to a well-behaved parrot	t	1	\N	978-0-7641-3667-2	\N	Guide to a well-behaved parrot	\N	\N	\N	t
740	Heart of Darkness	Heart of Darkness	t	1	\N	0-553-21214-1	\N	Heart of Darkness	\N	\N	\N	t
242	J.R.R. Tolkien: A Biography	J.R.R. Tolkien: A Biography	t	1	\N	0-00-713284-0	\N	J.R.R. Tolkien: A Biography	8	This is the definitive, authorative biography on Tolkien. Having read it, it somewhat puzzles me that anyone ever felt inclined to write another.	2011-01-23 19:18:58.535653	t
95	Days of Air and Darkness (A Time of Justice)	Days of Air and Darkness (A Time of Justice)	t	1	\N	0-00-647859-X	60224991	Days of Air and Darkness (A Time of Justice)	\N	\N	\N	t
9	Crown of Shadows	Crown of Shadows	t	1	\N	0-88677-717-8	\N	Crown of Shadows	8	\N	\N	t
105	Crossroads of Twilight	Crossroads of Twilight	t	1	\N	0-812-57133-9	\N	Crossroads of Twilight	\N	\N	\N	t
80	Dirk Gently's Holistic Detective Agency	Dirk Gently's Holistic Detective Agency	t	1	\N	0-330-30162-4	\N	Dirk Gently's Holistic Detective Agency	\N	\N	\N	t
435	In Search of Schrödinger's Cat: Quantum Physics And Reality	In Search of Schrödinger's Cat: Quantum Physics And Reality	t	1	\N	0-553-34253-3	\N	In Search of Schrödinger's Cat: Quantum Physics And Reality	9	\N	\N	t
619	Jay Wiseman's Erotic Bondage Handbook	Jay Wiseman's Erotic Bondage Handbook	t	1	\N	978-1-890159-13-9	\N	Jay Wiseman's Erotic Bondage Handbook	\N	\N	\N	t
713	Gormenghast	Gormenghast	t	1	\N	0-14-002890-0	\N	Gormenghast	7	\N	\N	t
83	A Wizard of Earthsea	A Wizard of Earthsea	t	1	\N	0-14-015427-2	\N	A Wizard of Earthsea	9	\N	\N	t
518	Harry Potter and the Prisoner of Azkaban	Harry Potter and the Prisoner of Azkaban	t	1	\N	0-439-98948-5	\N	Harry Potter and the Prisoner of Azkaban	9	\N	\N	t
517	Harry Potter and the Chamber of Secrets	Harry Potter and the Chamber of Secrets	t	1	\N	0-7475-3848-4	\N	Harry Potter and the Chamber of Secrets	9	\N	\N	t
70	High Hunt	High Hunt	t	1	\N	0-00-647593-0	\N	High Hunt	\N	\N	\N	t
581	Breaking the Spell: Religion as a Natural Phenomenon	Breaking the Spell: Religion as a Natural Phenomenon	t	1	\N	0-670-03472-X	\N	Breaking the Spell: Religion as a Natural Phenomenon	\N	\N	\N	t
510	Deep Simplicity: Bringing Order to Chaos and Complexity	Deep Simplicity: Bringing Order to Chaos and Complexity	t	1	\N	1-4000-6256-X	\N	Deep Simplicity: Bringing Order to Chaos and Complexity	\N	\N	\N	t
44	Frankenstein	Frankenstein	t	1	\N	0-486-28211-2	\N	Frankenstein	\N	\N	\N	t
131	Jurassic Park	Jurassic Park	t	1	\N	0-345-37077-5	\N	Jurassic Park	8	\N	\N	t
436	Great Expectations	Great Expectations	t	1	\N	0-14-043003-2	\N	Great Expectations	\N	\N	\N	t
52	Magician's Gambit	Magician's Gambit	t	1	\N	0-552-12382-X	\N	Magician's Gambit	8	\N	\N	t
646	Death from the Skies!: These are the ways the world will end...	Death from the Skies!: These are the ways the world will end...	t	1	\N	978-0-670-01997-7	\N	Death from the Skies!: These are the ways the world will end...	9	\N	\N	t
710	Joy in the Morning	Joy in the Morning	t	1	\N	978-0-14-028117-0	\N	Joy in the Morning	\N	\N	\N	t
520	Harry Potter and the Order of the Phoenix	Harry Potter and the Order of the Phoenix	t	1	\N	978-1-55192-724-4	\N	Harry Potter and the Order of the Phoenix	8	\N	\N	t
61	Polgara the Sorceress	Polgara the Sorceress	t	1	\N	0-246-13844-0	\N	Polgara the Sorceress	6	\N	\N	t
687	History of Western Philosophy	History of Western Philosophy	t	1	\N	0-04-109009-8	\N	History of Western Philosophy	\N	\N	\N	t
73	Othello	Othello	t	1	\N	0-451-52685-6	\N	Othello	\N	\N	\N	t
485	The Darkest Road	The Darkest Road	t	1	\N	978-0-00-647950-5	\N	Darkest Road	9	\N	\N	t
190	Momo	Momo	f	5	\N	91-502-0905-1	\N	Momo	10	\N	\N	t
114	The Dead Zone	The Dead Zone	t	1	\N	0-451-15575-0	\N	Dead Zone	\N	\N	\N	t
214	Sagan om Karl-Bertil Jonssons julafton	The Christmas Eve of Karl-Bertil Jonsson	t	3	\N	91-46-17781-7	\N	Christmas Eve of Karl-Bertil Jonsson	\N	\N	\N	t
77	Life, the Universe, and Everything	Life, the Universe, and Everything	t	1	\N	0-434-00348-4	\N	Life, the Universe, and Everything	\N	\N	\N	t
116	Needful Things	Needful Things	t	1	\N	0-451-17281-7	\N	Needful Things	\N	\N	\N	t
374	Mor är ingen häxa	Mother is not a witch	t	3	\N	91-7904-024-1	\N	Mother is not a witch	\N	\N	\N	f
210	The Druid of Shannara	The Druid of Shannara	f	1	\N	91-37-10499-3	\N	Druid of Shannara	\N	\N	\N	t
442	The Eyes of the Dragon	The Eyes of the Dragon	t	1	\N	0-451-16658-2	\N	Eyes of the Dragon	\N	\N	\N	t
98	The Dragon Reborn	The Dragon Reborn	t	1	\N	0-812-51371-1	\N	Dragon Reborn	\N	\N	\N	t
191	Over Sea, Under Stone	Over Sea, Under Stone	t	1	\N	978-0-689-84035-7	\N	Over Sea, Under Stone	8	\N	\N	t
617	Partners in Power: Living in a kinky relationship	Partners in Power: Living in a kinky relationship	t	1	\N	1-890159-50-6	\N	Partners in Power: Living in a kinky relationship	\N	\N	\N	t
692	On Her Majesty’s Secret Service	On Her Majesty’s Secret Service	t	1	\N	978-0-14-102835-4	\N	On Her Majesty’s Secret Service	\N	\N	\N	t
106	New Spring	New Spring	t	1	\N	0-765-34545-5	\N	New Spring	\N	\N	\N	t
550	Parasite Rex: Inside the Bizarre World of Nature's Most Dangerous Creatures	Parasite Rex: Inside the Bizarre World of Nature's Most Dangerous Creatures	t	1	\N	978-0-7432-0011-0	\N	Parasite Rex: Inside the Bizarre World of Nature's Most Dangerous Creatures	9	\N	\N	t
204	Running with the Demon	Running with the Demon	t	1	\N	0-345-42258-9	\N	Running with the Demon	8	\N	\N	t
557	Schrödingers Kittens and the Search for Reality: Solving the Quantum Mysteries	Schrödingers Kittens and the Search for Reality: Solving the Quantum Mysteries	t	1	\N	978-0-316-32819-7	\N	Schrödingers Kittens and the Search for Reality: Solving the Quantum Mysteries	7	\N	\N	t
137	Soul of the Fire	Soul of the Fire	t	1	\N	0-812-55149-4	\N	Soul of the Fire	6	\N	\N	t
136	Temple of the Winds	Temple of the Winds	t	1	\N	0-812-55148-6	\N	Temple of the Winds	9	\N	\N	t
503	Über die spezielle und die allgemeine Relativitätstheorie	Relativity: The Special and the General Theory	f	5	\N	0-517-88441-0	\N	Relativity: The Special and the General Theory	\N	\N	\N	t
648	The Demon-Haunted World: Science as a candle in the dark	The Demon-Haunted World: Science as a candle in the dark	t	1	\N	978-0-345-40946-1	\N	Demon-Haunted World: Science as a candle in the dark	\N	\N	\N	t
741	The Secret Sharer	The Secret Sharer	t	1	\N	0-553-21214-1	\N	Secret Sharer	\N	\N	\N	t
492	Orsinian Tales	Orsinian Tales	t	1	\N	0-553-24791-3	\N	Orsinian Tales	\N	\N	\N	t
81	The Long Dark Tea-Time of the Soul	The Long Dark Tea-Time of the Soul	t	1	\N	0-330-30955-2	\N	Long Dark Tea-Time of the Soul	\N	\N	\N	t
213	The Lurker at the Threshold	The Lurker at the Threshold	t	1	\N	0-345-25077-X	\N	Lurker at the Threshold	\N	\N	\N	t
320	The Pelican Brief	The Pelican Brief	t	1	\N	0-440-21404-1	\N	Pelican Brief	\N	\N	\N	t
68	The Redemption of Althalus	The Redemption of Althalus	t	1	\N	0-00-710352-2	\N	Redemption of Althalus	6	\N	\N	t
698	The Spy Who Loved Me	The Spy Who Loved Me	t	1	\N	978-0-14-102822-4	\N	Spy Who Loved Me	\N	\N	\N	t
668	The Little Black Book of Beer	The Little Black Book of Beer	t	1	<p>\r\nDid you know that beer is really, really old—in fact by far the oldest alcoholic beverage? Around 3000 BCE, a Sumerian wrote a poem that quoth\r\n</p>\r\n\r\n<blockquote>\r\n<p>\r\nI feel wonderful drinking beer; in a blissful mood, with joy in my heart and a happy liver.\r\n</p>\r\n</blockquote>\r\n\r\n<p>\r\nBeer is much older still, though, than a mere 5000 years—it dates back possibly to 9500 BCE, the early Neolithic. Not only is it older than the Universe according to Young Earth Creationist data—since it far, far predates Judaism, it is in fact older than God.\r\n</p>	978-1-59359-959-1	\N	Little Black Book of Beer	\N	\N	\N	t
174	The Call of Cthulhu and Other Weird Stories	The Call of Cthulhu and Other Weird Stories	t	1	\N	0-14-118234-2	\N	Call of Cthulhu and Other Weird Stories	9	\N	\N	t
572	Πολιτεία (Politeía)	The Republic	f	2	\N	14-044048-8	\N	Republic	\N	\N	\N	t
67	The Hidden City	The Hidden City	t	1	\N	0-586-21317-1	\N	Hidden City	6	\N	\N	t
350	2001: A Space Odyssey	2001: A Space Odyssey	t	1	\N	0-451-45799-4	\N	2001: A Space Odyssey	\N	\N	\N	t
222	The Runaway Jury	The Runaway Jury	t	1	\N	0-440-22441-1	\N	Runaway Jury	8	\N	\N	t
59	The Seeress of Kell	The Seeress of Kell	t	1	\N	0-345-37759-1	\N	Seeress of Kell	6	\N	\N	t
630	La Sombra del Viento	The Shadow of the Wind	f	14	\N	978-91-7263-756-6	\N	Shadow of the Wind	7	\N	\N	t
66	The Shining Ones	The Shining Ones	t	1	\N	0-586-21316-3	\N	Shining Ones	6	\N	\N	t
75	The Hitchhiker's Guide to the Galaxy	The Hitchhiker's Guide to the Galaxy	t	1	\N	0-434-00348-4	\N	Hitchhiker's Guide to the Galaxy	\N	\N	\N	t
217	The Silence of the Lambs	The Silence of the Lambs	t	1	\N	0-434-00905-9	\N	Silence of the Lambs	8	\N	\N	t
41	Roverandom	Roverandom	t	1	\N	0-00-714911-5	\N	Roverandom	\N	\N	\N	t
212	The Talismans of Shannara	The Talismans of Shannara	t	1	\N	91-37-10693-7	\N	Talismans of Shannara	\N	\N	\N	t
42	Tales from the Perilous Realm	Tales from the Perilous Realm	t	1	\N	0-00-714912-3	\N	Tales from the Perilous Realm	\N	\N	\N	t
37	The Book of Lost Tales, Part 2	The Book of Lost Tales, Part 2	t	1	\N	0-00-714915-8	\N	Book of Lost Tales, Part 2	\N	\N	\N	t
431	The God Delusion	The God Delusion	t	1	\N	978-0-618-68000-9	\N	God Delusion	\N	\N	\N	t
253	The Return of Sherlock Holmes	The Return of Sherlock Holmes	t	1	\N	978-0-89009-057-2	\N	Return of Sherlock Holmes	\N	\N	\N	t
386	Hazār-o Yak Šab (هزار و یک شب)	The Book of One Thousand and One Nights (selection)	f	11	\N	91-48-51476-4	\N	Book of One Thousand and One Nights (selection)	\N	\N	\N	t
226	Skriket fra jungelen	The Cry from the Jungle	f	7	\N	91-20-10100-7	\N	Cry from the Jungle	9	\N	\N	t
663	Surely you're joking, Mr. Feynman!	Surely you're joking, Mr. Feynman!	t	1	\N	978-0-393-31604-9	\N	Surely you're joking, Mr. Feynman!	\N	\N	\N	t
332	The Crone: An Adventure of the Ice Age	The Crone: An Adventure of the Ice Age	f	1	\N	91-7270-651-1	\N	Crone: An Adventure of the Ice Age	\N	\N	\N	t
249	The Hound of the Baskervilles	The Hound of the Baskervilles	t	1	\N	978-0-89009-057-2	\N	Hound of the Baskervilles	\N	\N	\N	t
76	The Restaurant at the End of the Universe	The Restaurant at the End of the Universe	t	1	\N	0-434-00348-4	\N	Restaurant at the End of the Universe	\N	\N	\N	t
8	When True Night Falls	When True Night Falls	t	1	\N	0-88677-615-5	\N	When True Night Falls	8	\N	\N	t
733	The Burning Stone	The Burning Stone	t	1	\N	0-7088-8253-6	\N	Burning Stone	5	\N	\N	t
159	Bröderna Lejonhjärta	The Brothers Lionheart	t	3	\N	91-29-40865-2	\N	Brothers Lionheart	10	\N	\N	f
133	Wizard’s First Rule	Wizard’s First Rule	t	1	\N	0-812-54805-1	\N	Wizard’s First Rule	9	\N	\N	t
326	Däggdjur: Alla Europas arter	Mammals: All the species of Europe	t	3	\N	91-46-14896-5	\N	Mammals: All the species of Europe	\N	\N	\N	t
521	Unweaving the Rainbow	Unweaving the Rainbow	t	1	\N	978-0-618-05673-6	\N	Unweaving the Rainbow	\N	\N	\N	t
665	Сумеречный Дозор (Sumerechniy Dozor)	Twilight Watch	f	13	\N	978-0-0994-8994-8	\N	Twilight Watch	\N	\N	\N	t
85	The Farthest Shore	The Farthest Shore	t	1	\N	0-14-015427-2	\N	Farthest Shore	8	\N	\N	t
528	The Island of Dr. Moreau	The Island of Dr. Moreau	t	1	\N	978-0-141-02915-3	\N	Island of Dr. Moreau	\N	\N	\N	t
696	The Man With Two Left Feet and other stories	The Man With Two Left Feet and other stories	t	1	\N	0-14-001601-5	\N	Man With Two Left Feet and other stories	\N	\N	\N	t
38	Unfinished Tales	Unfinished Tales	t	1	\N	0-261-10362-8	\N	Unfinished Tales	\N	\N	\N	t
231	The Reality Dysfunction	The Reality Dysfunction	t	1	\N	978-0-330-34032-8	\N	Reality Dysfunction	9	\N	\N	t
36	The Book of Lost Tales, Part 1	The Book of Lost Tales, Part 1	t	1	\N	0-00-714915-8	\N	Book of Lost Tales, Part 1	\N	\N	\N	t
651	The Elegant Universe: Superstrings, Hidden Dimensions, and the Quest for the Ultimate Theory	The Elegant Universe: Superstrings, Hidden Dimensions, and the Quest for the Ultimate Theory	t	1	\N	978-0-375-70811-4	\N	Elegant Universe: Superstrings, Hidden Dimensions, and the Quest for the Ultimate Theory	\N	\N	\N	t
3	This Alien Shore	This Alien Shore	t	1	\N	0-88677-799-2	\N	This Alien Shore	9	\N	\N	t
681	The Greatest Show on Earth: The evidence for evolution	The Greatest Show on Earth: The evidence for evolution	t	1	\N	978-1-4165-9478-9	\N	Greatest Show on Earth: The evidence for evolution	7	\N	\N	t
25	The Gap into Conflict: The Real Story	The Gap into Conflict: The Real Story	t	1	\N	0-553-29509-8	\N	Gap into Conflict: The Real Story	9	\N	\N	t
278	Adventures of Huckleberry Finn	Adventures of Huckleberry Finn	f	1	\N	91-550-2486-6	\N	Adventures of Huckleberry Finn	\N	\N	\N	t
456	The Letters of J.R.R. Tolkien	The Letters of J.R.R. Tolkien	t	1	\N	0-04-440664-9	\N	Letters of J.R.R. Tolkien	\N	\N	\N	t
711	Trouble Is My Business	Trouble Is My Business	t	1	\N	978-0-394-75764-3	\N	Trouble Is My Business	8	\N	\N	t
54	Enchanters' End Game	Enchanters' End Game	t	1	\N	0-552-12447-8	\N	Enchanters' End Game	8	\N	\N	t
56	King of the Murgos	King of the Murgos	t	1	\N	0-552-13018-4	\N	King of the Murgos	6	\N	\N	t
78	So Long, and Thanks For All The Fish	So Long, and Thanks For All The Fish	t	1	\N	0-434-00348-4	\N	So Long, and Thanks For All The Fish	\N	\N	\N	t
678	Sweet Dreams: Philosophical Obstacles to a Science of Consciousness	Sweet Dreams: Philosophical Obstacles to a Science of Consciousness	t	1	\N	978-0-262-54191-6	\N	Sweet Dreams: Philosophical Obstacles to a Science of Consciousness	\N	\N	\N	t
321	Everything's Eventual	Everything's Eventual	t	1	\N	0-340-77074-0	\N	Everything's Eventual	\N	\N	\N	t
405	The Mammoth Book of Comic Fantasy	The Mammoth Book of Comic Fantasy	t	1	\N	1-85487-530-2	\N	Mammoth Book of Comic Fantasy	\N	\N	\N	t
50	Pawn of Prophecy	Pawn of Prophecy	t	1	\N	0-552-12284-X	\N	Pawn of Prophecy	8	\N	\N	t
132	The White Plague	The White Plague	t	1	\N	0-399-12721-6	\N	White Plague	9	<cite>Dune</cite> is a very good book, but I have long felt that Frank Herbert deserves <em>more</em> accolades for <cite>The White Plague</cite>. I haven’t read it in a while, and memory is of course very fallible, but I retain an impression of a book that manages to be both suspenseful and intelligent. And, of course, a true thriller in that the thrill is real—the threat of this sort of thing is increasingly real (though I doubt the technology is within practical reach for decades yet, fortunately!).	2011-01-23 19:18:59.69877	t
27	The Gap into Power: A Dark and Hungry God Arises	The Gap into Power: A Dark and Hungry God Arises	t	1	\N	0-553-56260-6	\N	Gap into Power: A Dark and Hungry God Arises	9	\N	\N	t
28	The Gap into Madness: Chaos and Order	The Gap into Madness: Chaos and Order	t	1	\N	0-553-57253-9	\N	Gap into Madness: Chaos and Order	9	\N	\N	t
673	The Oxford Book of Modern Science Writing	The Oxford Book of Modern Science Writing	t	1	\N	978-0-19-921680-2	\N	Oxford Book of Modern Science Writing	\N	\N	\N	t
223	Ootah's Lucky Day	Ootah's Lucky Day	f	1	When I was quite little, this was my favourite book. The copy I still own was a present on my fifth birthday (in 1987), by which point I had already read it an awful lot of times.	91-510-0890-4	\N	Ootah's Lucky Day	\N	\N	\N	t
734	J.R.R. Tolkien: The man who created The Lord of the Rings	J.R.R. Tolkien: The man who created The Lord of the Rings	t	1	\N	0-7737-3287-X	\N	J.R.R. Tolkien: The man who created The Lord of the Rings	5	This is by far the second best biography of J.R.R. Tolkien I have ever read; I have read two. Of course, the other—Humphrey Carpenter’s—is generally held to be authorative and largely definitive, so the comparison may seem somewhat unfair, but having read that book, one frankly wonders why anyone felt that this one needed to be written.\r\n\r\nI have no quibbles with accuracy. In part this is because I lack the knowledge to offer criticism, and in part because it does seem to agree with Carpenter’s authorative work in every essential. However, what it fails to lack in accuracy it makes up for in obnoxious style. Not only is it a far less substantial work, but the language is oddly facile, with a number of subjective asides that do not so much provide an authorial voice as stand out as distractingly peculiar. Then, too, there are the occasional remarks—the ones that brought the word “facile” to mind earlier—where Coren finds it necessary to inform his readers that real Christians don’t hate and murder each other (even across Protestant/Catholic divides), that the Great War was in fact bad, and so on. One wonders why he felt these remarks needed to be made, or why his editor felt they should be included.\r\n\r\nI have probably given the impression that I felt the book was terrible. This is unfair: It isn’t in fact a terrible book, but rather a middling biography with some odd (and unappealing) stylistic quirks. However, standing as it does in the shadow of Humphrey Carpenter’s biography, it is profoundly unnecessary and offers nothing new except its novel weaknesses. If you’ve read that, this book will fail to impress you. If you haven’t read Carpenter, this one probably won’t strike you as bad at all, but why not pick up the superior work instead?	2011-01-23 19:18:58.538431	t
246	A Brief History of Time	A Brief History of Time	t	1	\N	0-553-38016-8	\N	A Brief History of Time	7	Hawking is undoubtedly a very brilliant man, but I’ve yet to read a book he’s written and like it. His more technical material is, no surprise at all, far too advanced for me: I know; I’ve looked; I’ve been very puzzled. <cite>A Brief History of Time</cite>, on the other hand, goes much too far in the opposite direction. While the <em>facts</em> it delivers may be remarkable, it does not seem to so much as <em>attempt</em> to make the reader understand how they are known, and I am left with a sense that I am supposed to swallow what Hawking has to say <i>ex cathedra</i>. This is bad in any book of learning; it is inimical to good science.\r\n\r\nIt’s not a terrible book by any stretch of the imagination; it certainly has interesting things to say; and it is certainly accessible. Nevertheless, there are many superior books on cosmology accessible to the layman, that actually tell you about the <em>science</em> and not merely the scientific <em>facts</em>.	2011-01-23 19:18:57.121162	t
251	The Adventures of Sherlock Holmes	The Adventures of Sherlock Holmes	t	1	\N	978-0-89009-057-2	\N	Adventures of Sherlock Holmes	\N	\N	\N	t
592	En helt annan historia	A Completely Different Story	t	3	\N	978-91-7001-589-2	\N	A Completely Different Story	\N	\N	\N	t
643	The Annotated Hobbit	The Annotated Hobbit	t	1	This book contains parts of the older <cite>Hobbit</cite>, before Tolkien ever wrote <cite>The Lord of the Rings</cite>. If you’re a Tolkien fan like me, you have surely wanted to know what <cite>Riddles in the Dark</cite> was like before the ring became <em>the Ring</em>? <cite>The Annotated Hobbit</cite> will satisfy your curiosity at last.	978-0-618-13470-0	\N	Annotated Hobbit	10	\N	\N	t
486	A Devil's Chaplain: Reflections on Hope, Lies, Science, and Love	A Devil's Chaplain: Reflections on Hope, Lies, Science, and Love	t	1	\N	978-0-618-48539-0	\N	A Devil's Chaplain: Reflections on Hope, Lies, Science, and Love	\N	\N	\N	t
744	The C++ Programming Language	The C++ Programming Language	t	1	\N	0-201-88954-4	\N	C++ Programming Language	\N	\N	\N	t
708	Titus Groan	Titus Groan	t	1	\N	0-14-002762-9	\N	Titus Groan	9	A book in which very few events actually transpire, but which manages to transfix me nonetheless. It works almost entirely in terms of baroque characterisation and atmosphere, and it does so very, very well. It occurs to me that the best analogy may not be to describe it to other authors so much as to make an analogy with visual art: Peake does not paint a picture of flawless realism, but works in a medium where the brush strokes can be plainly seen: The words aren’t awkward, but certainly ponderous enough not to be overlooked. Gouache is the medium that most readily springs to mind, but the words of Peake do not paint a Zorn, but rather a Black Painting of Goya.	2011-01-23 19:18:59.564387	t
93	A Time of Omens	A Time of Omens	t	1	\N	0-553-29011-8	28600254	A Time of Omens	\N	\N	\N	t
647	Big Bang: The most important scientific discovery of all time and why you need to know about it	Big Bang: The most important scientific discovery of all time and why you need to know about it	t	1	\N	0-00-715252-3	\N	Big Bang: The most important scientific discovery of all time and why you need to know about it	\N	\N	\N	t
328	A Hero Born	A Hero Born	t	1	\N	0-06-105680-4	\N	A Hero Born	4	\N	\N	t
31	The Hobbit	The Hobbit	t	1	\N	0-261-10221-4	\N	Hobbit	10	I first read <cite>The Hobbit</cite> when I was nine. I read it for the second time when I was nine, and I think a third time. Since then, I’ve read it another thirty or forty times or more, most recently last week at the time of writing (January 1, 2011). As you may well gather from this, I’m inordinately fond of this book. Not only is it a great children’s book of that rare kind still enjoyable to adults, not only is it the precursor and gateway to <cite>The Lord of the Rings</cite>, it’s also what had me devouring fantasy novels for the next decade and more. (I still read fantasy, but no longer with anything like that exclusivity.)	2011-01-23 19:18:58.40502	t
526	Design Patterns: Elements of Reusable Object-Oriented Software	Design Patterns: Elements of Reusable Object-Oriented Software	t	1	This is the famous Gang-of-Four book. If you’re a programmer, surely you’ve read it?	0-201-63361-2	\N	Design Patterns: Elements of Reusable Object-Oriented Software	\N	\N	\N	t
147	Röde Orm	The Long Ships	t	3	\N	91-7642-225-9	\N	Long Ships	10	Unfortunately, <cite>Röde Orm</cite> is one of those books that are difficult to imagine in any kind of translation. Frans G. Bengtsson’s language combines the drolly laconic with the casually archaic in a manner that flows beautifully and is a joy to read, while putting the reader firmly in a mindset of times gone by—in an eminently Swedish manner, to boot. How can such a book be translated, when the texture of its prose is so large a part of it?\r\n\r\nNot only is it dubious whether this can <em>ever</em> be done satisfactorily, but to make matters worse, the one person I know who’s read the book in translation informed me that the translation was in fact pretty bad. Still, she managed to quite enjoy the book in spite thereof. Worth checking out, and if you can read Swedish, this is a must-read.	2011-01-23 19:18:58.687128	t
738	Äldst, yngst, eller mittemellan	Oldest, youngest, or in between	t	3	\N	978-91-7232-200-4	\N	Oldest, youngest, or in between	5	This is a book that easily <em>could</em> have been incredibly interesting to just about anyone: It deals with the role birth order and our place among our siblings plays in shaping our psychology. Certainly, it throws out a lot of tidbits. Unfortunately, it does so in a manner that feels haphazard and unconvincing.\r\n\r\nSo why was I unimpressed? In part, I found the book confusing. Some of this may be intrinsic to the scope and subject matter: Whether you deal first with single children, then pairs of sibling, then larger families; or with eldest children, then middle children, then younger ones, you still have to repeat yourself to cover all the combinations.\r\n\r\nAnother problem that may just be in the nature of the beast is that sometimes I felt that the author said very little, though in many words: She would describe what such-and-such siblings are generally like, then turn around and say they might on the other hand be like <em>this</em>, or yet again, entirely different. But, as before, this may just be the way it is: It’s not the author’s fault, after all, if human psychology is complicated and full of exceptions!\r\n\r\nOn to the third and by far most grievous problem (and its adjuvants): The book just was not convincing to me. There were a scant few nods to statistics, and even in these rare cases there was often little context: what does it really mean to say that 60% of practitioners of a certain profession have no brothers, without mentioning what one should expect by chance, or how large the sample size is, or whether it’s statistically significant? But most statements had not even this. Some were bald assertions; others, even worse, were ‘supported’ by statements like <q>in my experience</q> or <q>in my practice</q>, and if you know anything at all about biases and confounders, this should raise your eyebrow Spockishly. Perhaps the most common support of all was also the most aggravating: Specific examples of celebrities that affirm the author’s position! (Hilary Clinton and Margaret Thatcher were made to serve as examples, for instance, though most were Swedish politicians or musicians.) Many explanations of putative causation read like Just So stories, and I have no idea whether they are true.\r\n\r\nUltimately, I suppose the problem is that I approached this in the hope and belief that I was about to read a layman’s book on science. There were certainly assertions of scientific <em>fact</em>, but there was no science to be found.	2011-02-01 23:04:06.789218	t
2	Canterbury Tales	Canterbury Tales	t	1	I really like this edition (ISBN 0-460-11307-0), for two reasons: First, it contains the original language and spelling, though harmonised (that is, words are spelled in an archaic manner, but each word will be spelled in <em>one</em> archaic manner throughout). Second, it is laid out in a manner that I find very pleasant and convenient: Single word explanations (translations, if you will) are given in marginal notes, where necessary; longer explanations (a sentence or two of context) are given in footnotes—not chapter endnotes, mind you, but proper footnotes. This means that very brief explanations are found at the ends of lines in the marginal, where your eye naturally travels anyway, and the longer ones are still accessible without the incessant flipping back and forth between text and endnotes that some books necessitate.	0-460-11307-0	\N	Canterbury Tales	\N	\N	\N	t
702	Judo Unleashed	Judo Unleashed	t	1	\N	0-07-147534-6	\N	Judo Unleashed	8	This is a very excellent book by what I gather is a very excellent teacher. The only problem, from my point of view, is that it is perhaps a little <em>too</em> comprehensive—at least, in order to take so wide a scope, it should have been larger in format. The explanations are wonderfully succinct, the “key points” for each <i>waza</i> are extremely helpful, the illustrations—ah, the illustrations. They are all very sharp and excellent photos with <i>tori</i> and <i>uke</i> in differently coloured <i>judogi</i> so the limbs don’t visually blend together. Every photo is great—and there are three of them for every throw, which just doesn’t seem to be enough for someone at my very low and limited level; I’d say on average I’d have liked to see five pictures per throw, instead.\r\n\r\nOf course, Ohlenkamp may have been addressing a more skilled audience who do not feel the want of those intermediate steps as sorely as I do, but still—surely any <i>judoka</i>, no matter how skilled, will want to look at the pictures for as many salient points as possible. Else why have pictures at all?\r\n\r\nThat aside, it truly is an excellent catalogue of techniques, and I particularly like the tables where each technique has a list of setup and follow-up techniques, helping you build a game around your <i>tokuiwaza</i>. Even as a true judo incompetent, the explanation and organisation around the Kodokan classifications alone helps me better understand the principles behind different kinds of techniques.	2011-02-24 23:59:18.10328	t
764	Phantoms in the Brain: Probing the mysteries of the human mind	Phantoms in the Brain: Probing the mysteries of the human mind	t	1	\N	978-0-688-17217-6	\N	Phantoms in the Brain: Probing the mysteries of the human mind	8	<p>\r\nI find books and essays on neuropathology intensely fascinating. The human brain is an almost inconceivably complicated organ, and until recently (and to large degree still) the only way we have of gaining insights into how it works is to study what happens when it fails. What happens when there is an injury to Broca’s area, or Wernicke’s; the thalamus or hypothalamus?\r\n</p>\r\n<p>\r\nV.S. Ramachandran, no slouch in the diagnosis and treatment of brain injuries (inasmuch as anyone can), has written a truly fascinating book which starts with stories of patients and their ailments and proceeds to describe the insight this gives us into the working human brain by looking at the intimate specifics of the particular failures resulting from different types of injuries.\r\n</p>\r\n<p>\r\nVery highly recommended.\r\n</p>	2011-08-14 11:37:33.634379	f
761	Head Cases: Stories of Brain Injury and Its Aftermath	Head Cases: Stories of Brain Injury and Its Aftermath	t	1	\N	978-0-374-53195-9	\N	Head Cases: Stories of Brain Injury and Its Aftermath	4	<p>\r\nWhen I picked up <cite>Head Cases</cite>, I was expecting a book on the <em>science</em> of brain injury: The terrible but fascinating aphasias resulting from damage to Broca’s or Wernicke’s area, or injuries inducing conditions like prosopagnosia: Things that have helped neuroscientists understand the functioning of the brain by looking at what goes wrong when it gets damaged in specific locations. This is not the kind of book <cite>Head Cases</cite> is, or attempts to be, so my disappointment was in part because I got the wrong book. (The book I really wanted was Ramachandran’s <cite>Phantoms in the Brain</cite>, <i>q.v.</i>.) Rather, it’s about the <em>people</em> who have suffered brain injuries, and the difficulties they face. There’s nothing wrong with stories about people, or raising awareness: It just wasn’t what I was looking to read.\r\n</p>\r\n<p>\r\nStill, as a book about the people, how does it rate? I’m afraid I didn’t much like it, for an array of reasons. The largest and most pervasive reason was that it was just trying much, much too hard. Talking about, say, a patient whose short-term memory is so utterly destroyed that she can remember no more than a minute or so into the past, or someone who blanks out and loses large chunks of his life, should inspire sympathy if you simply tell the tale honestly: After all their conditions <em>are</em> genuinely tragic. Mason is not quite content, though, and makes sure to tell every story in a voice that fairly drips with sympathy. It’s too much, and ends up almost parodic.\r\n</p>\r\n<p>\r\nThe style also bears witness to an author with little experience, or perhaps an editor with a tin ear. Having introduced a boy with a brain injury, his brother, and his parents, Mason goes on to describe the mother,\r\n</p>\r\n<blockquote>\r\n<p>\r\nKathy, who in her blue jeans and comfortable sweatshirt looks like the mother of two boys.\r\n</p>\r\n</blockquote>\r\n<p>\r\nApart from the fact that I don’t find that particularly descriptive—what distinguishes a mother of two boys from a mother of a boy and a girl, for instance?—it seems rather inane and redundant to describe the mother of two boys as <em>looking</em> like a mother of two boys.\r\n</p>\r\n<p>\r\nBy far the most aggravating thing about the book, however, is the negative picture it paints—grotesquely and gratuitously hateful—of doctors. The author is an advocate and case manager for brain injury cases. It’s his job to help when medical providers or the medical system fails to serve brain injury patients. Of course he will be frustrated with them, and of course his job will put him in contact selectively with bad ones—brain injury patients with <em>good</em> doctors will have no need for people like Michael Mason. This is to his credit—I’m sure he does a great job.\r\n</p>\r\n<p>\r\nBut this does not mean that all doctors are monsters, and that’s the picture he paints. Doctors are people, not monsters; and their job is to help people. It is certainly true that doctors are often rushed (because of the way healthcare systems work, not their own choices), that they may be impatient and exhausted, and of course that just like members of other professions, some of them just aren’t nice people. But I find it difficult to <em>believe</em> Mason when his book is full of anecdotes like this one:\r\n</p>\r\n<blockquote>\r\n<p>\r\nThe neurosurgeon…told the [parents] that Rob was going to be okay, that he would recuperate well, and that <q>the sky’s the limit for your boy.</q> It sounded like great news to Kathy, so she probed the surgeon more.\r\n</p>\r\n<p><q>You mean he’s not going to be a quadriplegic?</q> she asked.</p>\r\n<p><q>I didn’t say that.</q> The surgeon grimaced. he closed the chart and excused himself.</p>\r\n</blockquote>\r\n<p>I’m supposed to believe that a surgeon tells a set of parents that their child will likely become a paraplegic, then just grimaces and walks away without so much as a single word of sympathy? Or how about this: A patient is told that he has a scar on his brain and will suffer various horrible consequences. The patient, of course, buries his face in his hands and cries:</p>\r\n<blockquote>\r\n<p>\r\nThe doctor rolls his eyes and looks at Cheyenne as if he were something that had just been scraped off his shoe. He mumbles a few things about putting Cheyenne on an anticonvulsant, which may or may not help, who knows. Then the doctor shoves the films under his arm and closes the door behind him.\r\n</p>\r\n</blockquote>\r\n<p>\r\nAnd I am omitting all kinds of doctors callous, dismissive, or delivering bad news while hardly glancing at the victims’ parents. Note that these horrifying stories of astonishingly poor bedside manners are not presented as at all unusual. Rather, to hear Mason, that seems to be the way doctors treat patients. I have no doubt that there are unpleasant doctors, and that Mason’s line of work puts him in touch with particularly bad ones, but this beggars belief.\r\n</p>\r\n<p>\r\nI’m also tempted to point out a certain hypocrisy: He is fond of complaining how there is no room for brain injury patients anywhere, but amidst lavish words of praise for the hospital where he works admits that it only has a few dozen beds and virtually no one is admitted. Brave parents are lauded for their hard work, even when they fall terribly short: Doctors are demonised for every failure and every sign of stress. Failure to accommodate brain injury patients with institutional space is criticised—so is lack of time, energy, and resources spent on each patient, with no mention of the fact that these are conflicting requirements, and only <em>massive</em> increases in spending can fix it. I think those increases should be made, mind, but it all forms another part of the picture Mason paints of doctors as the enemy—rather than, say, the funding of the medical system, or the amount of time a doctor is given to work with each patient.\r\n</p>\r\n<p>\r\nAll that said, it’s by no means a <em>terrible</em> book. Mason sets out to illustrate the plight of brain injury patients, and how insufficiently they are cared for, and he does achieve these goals, even if I dislike his tone and the way he slanders doctors as a group. Brain injury patients <em>deserve</em> better care. I just can’t help but think that they also deserve better books to raise awareness.\r\n</p>	2011-05-07 22:49:48.537776	f
794	Alex and me	Alex and me	t	1	\N	978-0-06-167398-6	\N	Alex and me	8	<p>\r\nI’m an enormous fan of Dr. Pepperberg’s work, in part because I love parrots; in part because I am fascinated by nonhuman intelligence. In terms of <em>scientific work</em>, this book presents more conclusions than it does evidence—but this is not a flaw: This is the “human side”, as it were, to the much more rigorous <cite>The Alex Studies</cite>, which (I believe) essentially summarises the even more rigorous scientific papers she has published. Still it was far from a dull read, and it exposed more of Alex’s intelligence than the earlier book had—some of a speculative nature, but presented honestly and credibly. I also found the contrast of Pepperberg’s adoption of model/rival training to Skinnerian behaviorist methods illuminating (and slightly horrifying, when I learned more about the latter training!).\r\n</p>	2012-02-12 22:08:26.351609	f
765	The Matter Myth: Dramatic Discoveries That Challenge Our Understanding of Physical Reality	The Matter Myth: Dramatic Discoveries That Challenge Our Understanding of Physical Reality	t	1	\N	978-0-7432-9091-3	\N	Matter Myth: Dramatic Discoveries That Challenge Our Understanding of Physical Reality	6	<p>\r\nPerhaps I would have been warned off from this book had I known beforehand that Gribbin’s co-author, Paul Davies, is a recipient of the dubious Templeton Award, given by the odious and eponymous Foundation to a scientist who blurs the borders between science and its antithesis, religion. I’ve greatly enjoyed some of <em>Gribbin’s</em> other books, where he explains cosmology and quantum physics with colourful metaphors and ample cautions and warnings to the reader lest they come away thinking that the nature of reality is more comprehensible than it truly is—echoes of Feynman (maybe apochryphal, but very much in style): <q>If you think you understand quantum physics, you don’t understand quantum physics.</q>\r\n</p>\r\n<p>\r\n<cite>The Matter Myth</cite>, though, feels on some level like it’s trying harder to mystify than to explain. It’s not a <em>terrible</em> book, but you’ll get better explanations (and plenty of genuine mystery and wonder) if you skip it and read some other books—maybe some of Gribbin’s own, earlier works; maybe some Hawking or Greene.\r\n</p>	2011-08-14 11:49:37.551012	f
766	Politically Correct Bedtime Stories	Politically Correct Bedtime Stories	t	1	\N	0-02-542730-x	\N	Politically Correct Bedtime Stories	5	<p>\r\nWorth a chuckle, maybe, but no more; it tries too hard and comes off as too forced.\r\n</p>	2011-08-14 11:51:06.178012	f
767	In Search of the Multiverse	In Search of the Multiverse	t	1	\N	978-1-846-14113-3	\N	In Search of the Multiverse	6	<p>\r\nGribbin has written rather evocatively about the Multiverse idea in earlier books (one of the <i>Schrödinger</i>-titled ones, I’m fairly sure), and I picked this one up eagerly. Unfortunately, I didn’t like it half as much (and with my similar feelings about <cite>The Matter Myth</cite>, I may be about ready to give up on Gribbin—alas, for I loved some of his earlier works). In characteristic style it is full of colourful metaphors, but somehow they feel disconnected, and some of them leave me more puzzled than I was without them: For instance the suggestion that a “many similar books” view of the Multiverse is <em>analagous</em> to an Everett-style “branching” view is mystifying to me, since only the latter gives any hint of <em>why</em> worlds should be “related” and so be in any kind of position to interfere. Of course this is the danger of analogy—one may communicate to one person what it fails to communicate to others; one size does not fit all—but when his past books have seemed so useful to me, the failure of this one is disturbing.\r\n</p>\r\n<p>\r\nIt also comes off as a great deal more speculative than previous works, though it is perhaps difficult to identify precisely why: QM interpretations are, after all, pretty much all speculative in some regard! Maybe it is that they sound less like <em>interpretations</em> this time around than gospel truths (and for all I get from the explanations, they may as well be gospel—that is, unsubstantiated).\r\n</p>\r\n<p>\r\nIf you want an <em>overview</em> of Multiverse models, this may well be a good book for you (though maybe a sample of its bibliography would be better). If you want an <em>explanation</em> of QM and the Everett model, I can recommend Gribbin’s own earlier work, <cite>In Search of Schrödinger’s Cat</cite>. If you want explanations of other models, I don’t know what to recommend; perhaps not this one.\r\n</p>	2011-08-14 11:59:49.171149	f
768	A Dance with Dragons	A Dance with Dragons	t	1	\N	978-0-553-80147-7	\N	A Dance with Dragons	8	<p>\r\nThe series continues, and it is still very good—though it seems to be slowing down; perhaps events are beginning to gather up for a cataclysmic conclusion, or perhaps it’s just another catastrophe, or more general gathering. If the series ends with book six or seven, then this book is a worthy part. If the series grows longer than that, then this will either be “the slow one in the middle” or where the series started to flag.\r\n</p>	2011-08-14 12:03:14.986973	f
769	Zodiac	Zodiac	t	1	\N	978-0-8021-4315-0	\N	Zodiac	8	\N	\N	f
770	The Windup Girl	The Windup Girl	t	1	\N	978-1-59780-158-4	\N	Windup Girl	9	\N	\N	f
771	59 seconds: Change your life in under a minute	59 seconds: Change your life in under a minute	t	1	\N	978-0-307-35812-7	\N	59 seconds: Change your life in under a minute	7	\N	\N	f
772	He’s a stud, she’s a slut: And 49 other double standards every woman should know	He’s a stud, she’s a slut: And 49 other double standards every woman should know	t	1	\N	978-1-58005-245-0	\N	He’s a stud, she’s a slut: And 49 other double standards every woman should know	6	\N	\N	f
773	Maskerade	Maskerade	t	1	\N	0-552-14236-0	\N	Maskerade	8	\N	\N	f
774	Night Watch	Night Watch	t	1	\N	978-0-552-14899-3	\N	Night Watch	8	\N	\N	f
775	Lords and Ladies	Lords and Ladies	t	1	\N	0-552-13891-6	\N	Lords and Ladies	8	\N	\N	f
776	Flim-flam!	Flim-flam!	t	1	My copy is signed by James Randi (“To Petter”)	978-087975198-2	\N	Flim-flam!	8	\N	\N	f
777	Mastering Jujitsu	Mastering Jujitsu	t	1	\N	978-0-7360-4404-2	\N	Mastering Jujitsu	7	\N	\N	f
778	Bitchfest	Bitchfest	t	1	\N	978-0-374-11343-8	\N	Bitchfest	7	\N	\N	f
780	This is your brain on music	This is your brain on music	t	1	\N	978-0-452-28852-2	\N	This is your brain on music	7	\N	\N	f
781	The Bernese Mountain Dog	The Bernese Mountain Dog	t	1	\N	1-58245-162-1	\N	Bernese Mountain Dog	4	My girlfriend’s dream breed of dog, I read this mostly out of curiosity (though, well, I do like dogs, and maybe some day—). The book was kind of grating, though, chiefly in that the author seemed more concerned with singing the dog’s praises than actually conveying facts: not that the latter were lacking, but that they were tasty currants in an otherwise over-sweet and not very appetising cake. Sadly this seems pretty common in pet guides: The people who care enough to write them are so emotional about their pets in question that they appear constitutionally incapable of avoiding bubbling over with it.\r\n\r\nThe training chapter (written by Dr. Ian Dunbar) is great; the rest of the book I could take or leave, including the “guest chapters” by Bardi McLennan.	2011-12-11 20:16:35.964118	f
779	Red Mars	Red Mars	t	1	\N	0-553-56073-5	\N	Red Mars	9	\N	\N	f
782	Man-Eaters of Kumaon	Man-Eaters of Kumaon	t	1	\N		\N	Man-Eaters of Kumaon	9	<p>\r\nA truly engrossing book by a truly engrossing man. Jim Corbett was an ‘Englishman’ born and raised in India, and after gaining some fame and experience as a hunter, gradually came to earn a reputation (as he put it) of being more likely to photograph animals than to kill them—except for man-eaters and wounded or infirm animals whose proximity to humans and reliance on livestock made them likely to become such.\r\n</p>\r\n<p>\r\nCorbett speaks eloquently on how it’s never malice or cruelty that causes tigers and leopards to take to killing people, and often emphasises the injuries, commonly human-caused, that drive them to such easy prey. Nonetheless he did what he saw had to be done, and over the course of some thirty-odd years, he killed 33 man-eating animals; 19 tigers and 14 leopards. The Champawat Tiger alone had killed 436 people (436 documented deaths, that is). These he would go after, often alone—maintaining throughout his book that he felt it would be <em>too dangerous</em> to have other people around, as the presence of multiple guns made accidents too likely, and preferring instead to stalk man-eating tigers through the jungle all by himself (or, sometimes, accompanied by a smallish dog called Robin). He shot many of them at what sounds to me like a shockingly close range; I guess an Indian jungle does not afford very great lines of sight, but the notion of shooting man-eating tigers from well within leaping distance is kind of discombobulating.\r\n</p>\r\n<p>\r\nI’ve probably made it clear that Corbett was <em>brave</em> and that he had stories to tell; moreover, he could tell them. The style is elegant and succinct—another reviewer used the phrase “economy of language”, and I cannot do better than to repeat it. He also writes with a sense of humour, a sense of compassion and respect for the animals, and perhaps more notably from a white hunter in Imperial British India, respect for the native people, treating their fear of ravaging tigers as understandable and mentioning their religious practices in passing as quite natural, rather than sounding patronising.\r\n</p>\r\n<p>\r\nHighly recommended, and full of moments of <q>He did <em>what?</em></q> that I could not help but read out loud to the nearest person.\r\n</p>	2011-12-15 20:19:22.691423	f
783	Green Mars	Green Mars	t	1	\N	0-553-57239-3	\N	Green Mars	9	\N	\N	f
784	Blue Mars	Blue Mars	t	1	\N	0-553-57335-7	\N	Blue Mars	9	\N	\N	f
785	The Code of the Woosters	The Code of the Woosters	t	1	\N	1-4000-7959-4	\N	Code of the Woosters	8	\N	\N	f
786	Letters from Father Christmas	Letters from Father Christmas	t	1	\N	978-0-00-728049-0	\N	Letters from Father Christmas	8	\N	\N	f
787	Starship Titanic	Starship Titanic	t	1	Based on a computer game written by Douglas Adams; Adams didn’t actually write the book, but that background makes me want to list him as co-author. (I wish he had written the book, too: Jones’s prose struck me as a bit unpolished.)	978-0-345-36843-0	\N	Starship Titanic	7	\N	\N	f
788	Aeneis	The Aeneid	f	16	\N	978-0-14-310513-8	\N	Aeneid	8	<p>\r\nI’ve heard some people say that the <cite>Aeneid</cite> is more remote, less down-to-earth and human, than the <cite>Oddyssey</cite>. Perhaps it’s Virgil’s authorship, perhaps it’s just Robert Fagles shining as a translator—at any rate I got nothing of this impression. On the contrary, the <cite>Aeneid</cite> stood out for me as remarkably human: Whereas both works, of course, tell of epic journeys and trials, and the interventions of gods, the <cite>Aeneid</cite> seems to leave more space for the characters to flex and become fleshed out as characters, and more breathing room to do rather than merely have divinely done for them. I enjoyed both works, but perhaps I will seek out a Fagles translation the next time I read Homer.\r\n</p>\r\n<p>\r\nOne thing that struck me as humorous was that, apparently, the Roman gods were remarkably incompetent at disguise. Time after another, a god would take on the form of some human to speak to some hero or other; the hero would immediately recognise that he was speaking to a god. One exception was the Fury who successfully disguised herself as an old crone, but upon being addressed as though she were an old crone reacted, well, furiously, casting off her disguise. There may have been an example of successful impersonation somewhere, but it seems hubris usually got in the way.\r\n</p>	2012-01-13 08:36:57.343835	f
789	The Man Who Fought Alone	The Man Who Fought Alone	t	1	\N	0-765-34124-7	\N	Man Who Fought Alone	6	\N	\N	f
790	The Man Who Risked His Partner	The Man Who Risked His Partner	t	1	\N	0-765-34126-3	\N	Man Who Risked His Partner	7	\N	\N	f
791	The Land that Time Forgot	The Land that Time Forgot	t	1	\N	9780441470259	\N	Land that Time Forgot	6	\N	\N	f
792	The Tell-Tale Brain	The Tell-Tale Brain	t	1	\N	978-0-393-34062-4	\N	Tell-Tale Brain	6	<p>\r\nHaving read and tremendously enjoyed Ramachandran’s <cite>Phantoms in the Brain</cite>, I expected something like more of the same: More weird brain injuries, and more light cast by these tragedies on how the brain works by studying how specific injuries cause it to malfunction. Well, there was some of that, and there was some recapitulation of such cases from earlier works (such as the one I had already read). However, much of the book was a great deal more speculative. Ramachandran is very up front about the speculative nature of some of his ideas, and further argues persuasively that such speculation—and scientists prone thereto, such as himself—are a vital part of scientific progress: Some people have to come up with the wild ideas while others stick to hard data. Still, while he is honest about it, that kind of speculation wasn’t really what I thought I was signing up for.\r\n</p>\r\n<p>\r\nRamachandran also goes on to discuss the <em>evolution</em> of the human brain and its function, the human mind, and discusses what makes us uniquely human as opposed to “mere” animals. Here is where Dr. Ramachandran and I must part ways, because he starts to make a lot of assertions that don’t appear to be supported by anything much at all. I’m sure he’s a very great expert on the human brain, its functioning, and its malfunctioning; but to explain what differentiates us from other animals he must of course compare us to other animals, <i>en masse</i> as it were. Unfortunately, most of the time he draws a comparison by explaining how the human brain accomplishes a task and then simply <em>asserting</em> that no other animal is capable thereof.\r\n</p>\r\n<blockquote><p>\r\n…The self is aware of itself; it can contemplate its own existence and (alas!) its mortality. No nonhuman creature can do this.\r\n</p></blockquote>\r\n<p>Indeed? How do you know; how can you possibly know this?</p>\r\n<blockquote><p>Despite the enormous number of distinct events punctuating your life, you feel a sense of continuity of identity through time—moment to moment, decade to decade. And as Endel Tulving has noted, you can engage in mental “time travel,” starting from early childhood and projecting yourself into the future, sliding to and fro effortlessly. This Proustian virtuosity is unique to humans.</p></blockquote>\r\n<p>Again, bald assertion: I have no idea how this could ever possibly be tested (short of communicating via full-fledged language, which we cannnot and may not ever be able to do with any other animal).</p>\r\n<blockquote><p>Vital to the human sense of self is a person’s feeling of inhabiting his own body and owning his body parts. Although a cat has an implicit body image of sorts (it doesn’t try to squeeze into a rat hole), it can’t go on a diet seeing that it is obese or contemplate its paw and wish it weren’t there.</p></blockquote>\r\n<p>\r\nAnd how on Earth can Ramachandran possibly know that this is true? Unless he has some evidence, obtained perhaps via some sophisticated cat scan, that he doesn’t bother to cite or provide, this again seems like a mere assertion. How can we ever know what’s going on in the mind of a cat?\r\n</p>\r\n<p>\r\nThis, to me, just won’t do. We’ve learned over the past few decades that non-human animals can do a vast array of things that we used to think our province alone: Tool use has been observed and documented in chiimpanzees, various birds, dolphins, and elephants; great apes can learn rudiments of sign language; parrots can learn a great variety of conceptual tasks as demonstrated by Dr. Irene Pepperberg (cf. <cite>The Alex Studies</cite>), and corvids can perform many tasks involving tool use, including some tool <em>manufacture</em> (figuring out how to bend a wire to make a hook) and combination (using a tool to obtain another tool to solve a problem).\r\n</p>\r\n<p>\r\nDr. Pepperberg in particular has pointed out (<cite>Alex and me</cite>) that classical animal cognitive studies, carried out in a behavioristic framework, are very limited. The classical Skinnerian pigeon in a box is starved to 80% of optimum body mass (to maximise the attraction of food rewards) and expected to solve particular tasks in highly isolated conditions—for experimental purity, no doubt, but it’s still absurd in a way. Place a human child in the same situation—isolated, starved, placed in an artificial puzzle—and I have no doubt but that you should end up with a profoundly retarded child.  Humans, we know, require an appropriate social environment to develop properly. Other social animals, presumably, do likewise.  Thus, I think it’s fairly safe to assume that Skinnerian methods profoundly limit the cognitive development of animal test subjects. Even in more human environments and modern training methods, such as the model/rival training adopted by Pepperberg in training Alex and her other parrots, how can we know whether it’s <em>optimal</em>? Moreover, I think it is always a bit perilous to judge a non-human animal’s cognitive abilities based on its ability to perform tasks specified by humans. We humans should have a great deal of difficulty learning to behave like intelligent whales, after all, or crows!\r\n</p>\r\n<p>\r\nThis is not to say that I believe that crows, parrots, whales, elephants, or any other non-human animal really is as smart as humans are (although with cetaceans I think it’s particularly hard to judge). Rather, I think it is perilous to simply <em>assume</em> that no animal can perform a certain task merely because we have yet to devise a training method and test to demonstrate it. I’m very sure that there are lots of mental task that no other species on Earth can master, but <em>which</em> ones, and to what degree?\r\n</p>\r\n<p>\r\nYet here Ramachandran seems quite happy to simply <em>assert</em>, apparently on the assumption that his claims don’t even need justification. (They do.) If these were mere asides, this would be very irritating but harmless. As it is, though, he also uses these assertions to speculate on the evolution of the human brain: We humans can perform task <var>A</var>; we use brain region <var>B</var> to do so; other great apes cannot do <var>A</var> and lack the specialised structure <var>B</var>, ergo some inference regarding hominin brain evolution. This is very problematic, because without actual <em>evidence</em> that the ability is unique to humans, the evolutionary scenario is unsupported. Keep in mind that the same function may be solved using different structures: Feathers and skin flaps do the same job (in birds and bats respectively); a talking bird uses a ‘whistling’ syrinx to approximate sounds that we humans produce using larynx and tongue and vocal cords; there’s even evidence (I <em>think</em> in <cite>The Alex Studies</cite>?) that birds may solve problems using quite different brain regions than mammals would for the same tasks.\r\n</p>\r\n<p>\r\nIn the areas of the book dealing strictly with the human brain, its functioning, its malfunctioning, and thus our comprehension of its structural functionality, Ramachandran is once again stellar, and I have learned some more fascinating things. However, his anthrocentric chauvinism reduces many of his speculations on evolution from fruitful hypothesising to mere speculation based on a combination of observed fact (with regards to the human brain) and mere authorial assertion. Had he either stuck to his area of expertise, or broadened it, the book could have been stellar. As it is, its flaws (peculiarly tailored to annoy me in particular as a reader) leave me feeling rather cold, especially compared with the brilliance of his earlier work.\r\n</p>	2012-02-12 21:59:52.0269	f
793	Män som hatar kvinnor	The Girl with the Dragon Tattoo	t	3	Very peculiar title change: From <cite>Män som hatar kvinnor</cite>—literally “Men who hate women”—to the sexy “The Girl with the Dragon Tattoo”. Sells better, I suppose.	978-91-7001-368-3	\N	Girl with the Dragon Tattoo	7	\N	\N	f
795	Thank you, Jeeves!	Thank you, Jeeves!	t	1	\N	978-0-09-951373-5	\N	Thank you, Jeeves!	8	\N	\N	f
796	Mulliner Nights	Mulliner Nights	t	1	\N	978-1-4000-7961-2	\N	Mulliner Nights	7	\N	\N	f
797	Leave it to Psmith	Leave it to Psmith	t	1	\N	978-1-4000-7960-5	\N	Leave it to Psmith	8	\N	\N	f
798	The Fallacy of Fine-Tuning	The Fallacy of Fine-Tuning	t	1	\N	978-1-61614-443-2	\N	Fallacy of Fine-Tuning	8	<p>I only wish I could follow the physics better. I am glad that someone like Stenger exists to counter the more abstruse arguments the brighter among Creationists may occasionally raise.</p>\r\n<p>\r\nThe only thing I found curious is that the objection I have encountered that seems most obvious, as well as reasonable, was not mentioned: To wit and to summarise: When someone argues that the fundamental constants of the cosmos are balanced with improbable precision, this implies that they could have been otherwise. To say that a constant (such as the strength of a fundamental force) is balanced to within, say, 0.001% of its actual value, is to imply that there is a range of values that the constant might have had in our universe; the wonder is that it has its particular value—from, the argument clearly but never explicitly implies, <em>the range of values</em> it could have had. However, this range of values is nowhere specified. I am not aware of any argument that provides a <em>range</em> of values that, for example, the weak force might have had—let alone any account of mechanism to allow it to very. If we have no evidence that these values ever <em>could</em> vary, then it follows that we have no evidence that they might ever have had any other values. If the fundamental constants have the only values that they conceivably could ever have had, then it is no miracle that they are not different! Furthermore—and Stenger might be said to obliquely hint at this—these values are always assumed to vary independently; conceivably the variation in one might <em>necessitate</em> variation in the others that cancel it out as far as possibilty of life is concerned.\r\n</p>\r\n<p>\r\nBe that as it may, though; Stenger deftly disposes of <em>other</em> arguments, without ever (it may be said) resorting to the above argument that the question may be ill-posed to begin with.\r\n</p>	2012-02-12 22:21:37.332653	f
799	Lord Valentine’s Castle	Lord Valentine’s Castle	t	1	\N	0-553-14428-6	\N	Lord Valentine’s Castle	8	\N	\N	f
800	Aunts Aren’t Gentlemen	Aunts Aren’t Gentlemen	t	1	\N	978-0-09-951397-1	\N	Aunts Aren’t Gentlemen	8	\N	\N	f
801	Legacy of Kings	Legacy of Kings	t	1	\N	978-0-7564-0693-6	\N	Legacy of Kings	8	\N	\N	f
802	Sense and Goodness Without God: Defense of Metaphysical Naturalism	Sense and Goodness Without God: Defense of Metaphysical Naturalism	t	1	The bibliography of this book (chapter by chapter) is astonishing and reads not a little like a wish list.	1-4208-0293-3	\N	Sense and Goodness Without God: Defense of Metaphysical Naturalism	7	\N	\N	f
803	Unseen Academicals	Unseen Academicals	t	1	\N	978-0-552-15337-9	\N	Unseen Academicals	7	\N	\N	f
804	The Missionary Position	The Missionary Position	t	1	\N	1-85984-929-6	\N	Missionary Position	\N	\N	\N	f
805	The Mating Season	The Mating Season	t	1	\N	978-0-09-951377-3	\N	Mating Season	8	\N	\N	f
806	God—The Failed Hypothesis: How Science Shows That God Does Not Exist	God—The Failed Hypothesis: How Science Shows That God Does Not Exist	t	1	\N	978-1-59102-652-5	\N	God—The Failed Hypothesis: How Science Shows That God Does Not Exist	8	<p>Stenger tackles some of the God-of-the-gaps questions that are genuinely difficult for laymen to answer, and for that I cannot help but feel some gratitude. Additionally, precisely because the theists who seek gaps for their god to hide in tend to seek out tricky and interesting corners of science, any book that shines the light of genuine intelligence on them tends to present interesting science.</p>\r\n<p>\r\nPerhaps the most illuminating part of the book was the observation that many of the physical constants whose “fine-tuned” precision people marvel at are really mere artifacts of man-made definitions. To say that (as Stenger quotes theologian John Jefferson Davies) “if the mass of neutrinos were 5×10<sup>−34</sup> instead of 5×10<sup>−35</sup> kg” then the universe would be utterly different does not really speak to very “fine” tuning—it’s made to <em>sound</em> like a variation of ‘one part in 10<sup>−35</sup>’, but really refers to a <em>factor of ten</em>. Thus choice of units—man-made and thus arbitrary units not at all fundamental to the universe—obscures the fact that a lot of these purportedly fine-tuned values are in fact very coarsely tuned indeed.\r\n</p><p>\r\nThe one argument I felt was <em>missing</em> from this section was the point I once chanced across somewhere on the Internet, where a commenter remarked that to suggest that a value is finely tuned is to imply that its value is chosen within a minute portion <em>of its range of possible values</em>. Since we don’t know how to make universes, it’s not at all clear what those ranges are, and just because we can imagine and mathematically model various ranges this does not imply their physical possibility. Until theologians can scientifically demonstrate that there was a range of possible values that the constants <em>might</em> have taken, and that the (non-arbitrary-unit) constants are finely tuned <em>within their possible ranges</em>, it’s not clear that the claim of fine tuning is even logically coherent. (Stephen Hawking famously quipped, in <cite>A Brief History of Time</cite>, that God may have had no choice at all in the matter.)</p>\r\n<p>Well, I suppose Stenger wanted to avoid any tack that seemed like brushing the question aside, instead preferring to tackle every assertion head-on and demolish it; and it seems to me he was fairly successful.</p>	2012-04-24 00:08:32.144874	f
807	The Book of Merlyn	The Book of Merlyn	t	1	\N	0-425-03826-2	\N	Book of Merlyn	\N	\N	\N	f
808	Jeeves in the Offing	Jeeves in the Offing	f	1	\N		\N	Jeeves in the Offing	\N	\N	\N	f
809	Mistborn	Mistborn	t	1	\N	978-0-7653-5038-1	\N	Mistborn	8	\N	\N	f
810	The Well of Ascension	The Well of Ascension	t	1	\N	978-0-7653-5613-0	\N	Well of Ascension	\N	\N	\N	f
812	The Hero of Ages	The Hero of Ages	t	1	\N	978-0-7653-5614-7	\N	Hero of Ages	\N	\N	\N	f
813	A Second Chance at Eden	A Second Chance at Eden	t	1	\N	0-446-60671-5	\N	A Second Chance at Eden	\N	\N	\N	f
814	Bad Astronomy: Misconceptions and Misuses Revealed, from Astrology to the Moon Landing “Hoax”	Bad Astronomy: Misconceptions and Misuses Revealed, from Astrology to the Moon Landing “Hoax”	t	1	\N	978-0-471-40976-2	\N	Bad Astronomy: Misconceptions and Misuses Revealed, from Astrology to the Moon Landing “Hoax”	\N	\N	\N	f
815	Witches Abroad	Witches Abroad	t	1	\N	978-0-552-13465-1	\N	Witches Abroad	\N	\N	\N	f
816	Moving Pictures	Moving Pictures	t	1	\N		\N	Moving Pictures	\N	\N	\N	f
817	Reaper Man	Reaper Man	t	1	\N		\N	Reaper Man	\N	\N	\N	f
818	Wuthering Heights	Wuthering Heights	t	1	\N		\N	Wuthering Heights	\N	\N	\N	f
819	Gifts of the Crow: How Perception, Emotion, and Thought Allow Smart Birds to Behave Like Humans	Gifts of the Crow: How Perception, Emotion, and Thought Allow Smart Birds to Behave Like Humans	t	1	\N	978-1-4391-9873-5	\N	Gifts of the Crow: How Perception, Emotion, and Thought Allow Smart Birds to Behave Like Humans	7	Extremely interesting, as I am endlessly fascinated with animal, especially avian and notably corvid intelligence; only sometimes it was a bit lacking in rigour, or at least demonstrating rigour. Additionally, there were a few mentions of “this part of the brain causes this behaviour” that seemed a bit odd, providing some details of underlying neurology and talking about behaviour but never really explaining how the whole neurobiology fits together—omitting, as it were, the middle layer.	2012-12-30 13:48:55.545166	f
820	Men at Arms	Men at Arms	t	1	\N	978-0-552-14028-7	\N	Men at Arms	\N	\N	\N	f
821	Blandings Castle	Blandings Castle	t	1	\N		\N	Blandings Castle	\N	\N	\N	f
822	Ingen Mans Land	No Man's Land	t	3	\N	91-1-931161-3	\N	No Man's Land	\N	\N	\N	f
823	Barron's Guide to Companion Parrot Behavior	Barron's Guide to Companion Parrot Behavior	t	1	\N	0-7641-0688-0	\N	Barron's Guide to Companion Parrot Behavior	\N	\N	\N	f
824	Interesting Times	Interesting Times	t	1	\N	978-0-552-14235-9	\N	Interesting Times	\N	\N	\N	f
825	Pirate Latitudes	Pirate Latitudes	t	1	\N	978-1-55468-811-1	\N	Pirate Latitudes	6	\N	\N	f
826	Innocent Code: A Security Wake-up Call for Web Programmers	Innocent Code: A Security Wake-up Call for Web Programmers	t	1	\N	0-470-85744-7	\N	Innocent Code: A Security Wake-up Call for Web Programmers	7	<p>\r\nFor the most part it's fairly basic, but as an overview of web application security it's very good. It also included a few titbits about encoding-based XSS-type exploits that I had not heard about before. I think I need to spend more time with OWASP...\r\n</p>	2013-02-22 08:53:20.085128	f
827	Schneier on Security	Schneier on Security	t	1	\N	978-0-470-39535-6	\N	Schneier on Security	\N	\N	\N	f
828	Debugging the Development Process	Debugging the Development Process	t	1	\N	1-55615-650-2	\N	Debugging the Development Process	\N	\N	\N	f
829	The Princess Bride	The Princess Bride	t	1	\N	978-0-15-603521-7	\N	Princess Bride	\N	\N	\N	f
830	孫子兵法	The Art of War	f	17	\N	978-0-486-42557-3	\N	Art of War	\N	\N	\N	f
831	Going Clear: Scientology, Hollywood, & the Prison of Belief	Going Clear: Scientology, Hollywood, & the Prison of Belief	t	1	\N	978-0-307-70066-7	\N	Going Clear: Scientology, Hollywood, & the Prison of Belief	8	\N	\N	f
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('books_id_seq', 831, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2010-01-31 22:32:40.277223+00	1	10	647	Big Bang -- The most important scientific discovery of all time and why you need to know about it by Singh, Simon 	2	Changed title and english_title.
2	2010-01-31 22:54:51.033992+00	1	11	350	Russell, Bertrand 	1	
3	2010-01-31 22:54:54.766505+00	1	10	687	A History of Western Philosophy by Russell, Bertrand 	1	
4	2010-01-31 22:55:14.703572+00	1	10	687	History of Western Philosophy by Russell, Bertrand 	2	Changed title and english_title.
5	2010-01-31 23:05:43.734109+00	1	10	687	History of Western Philosophy by Russell, Bertrand 	2	No fields changed.
6	2010-01-31 23:06:09.023174+00	1	10	688	Pyramids by Pratchett, Terence David John	1	
7	2010-01-31 23:06:19.918567+00	1	10	689	Small Gods by Pratchett, Terence David John	1	
8	2010-01-31 23:06:40.955896+00	1	10	690	Casino Royale by Fleming, Ian 	1	
9	2010-01-31 23:07:03.563338+00	1	11	351	Ridley, Matt 	1	
10	2010-01-31 23:07:09.809378+00	1	10	691	The Red Queen by Ridley, Matt 	1	
11	2010-02-19 03:54:42.149002+00	1	10	692	On Her Majesty’s Secret Service by Fleming, Ian 	1	
12	2010-02-19 03:55:01.964165+00	1	10	693	Doctor No by Fleming, Ian 	1	
13	2010-02-19 03:55:35.283254+00	1	10	694	Guards! Guards! by Pratchett, Terence David John	1	
14	2010-02-19 03:55:56.705536+00	1	10	695	Eric by Pratchett, Terence David John	1	
15	2010-03-28 20:06:22.635913+00	1	11	352	Wodehouse, Pelham Grenville	1	
16	2010-03-28 20:06:31.502692+00	1	10	696	The Man With Two Left Feet and other stories by Wodehouse, Pelham Grenville	1	
17	2010-03-28 20:06:46.897949+00	1	10	697	The Inimitable Jeeves by Wodehouse, Pelham Grenville	1	
18	2010-03-28 20:07:13.40244+00	1	10	698	The Spy Who Loved Me by Fleming, Ian 	1	
19	2010-03-28 20:10:05.764777+00	1	10	699	Последний дозор (Posledniy Dozor) by Lukyanenko, Sergey 	1	
20	2010-03-28 20:11:09.461747+00	1	10	699	The Last Watch by Lukyanenko, Sergey 	2	Changed title and english_title.
21	2010-03-29 01:56:01.760088+00	1	11	353	Ehrman, Bart D.	1	
22	2010-03-29 01:56:08.259496+00	1	10	700	Misquoting Jesus: The Story Behind Who Changed the Bible and Why by Ehrman, Bart D.	1	
23	2010-04-05 01:11:45.450367+00	1	11	354	Kuhn, Thomas S.	1	
24	2010-04-05 01:11:49.164836+00	1	10	701	The Structure of Scientific Revolutions by Kuhn, Thomas S.	1	
25	2010-04-05 01:12:17.371008+00	1	11	355	Ohlenkamp, Neil 	1	
26	2010-04-05 01:12:22.42791+00	1	10	702	Judo Unleashed by Ohlenkamp, Neil 	1	
27	2010-05-02 02:46:56.001044+00	1	11	356	Meyers, Scott 	1	
28	2010-05-02 02:47:00.289529+00	1	10	703	Effective C++ by Meyers, Scott 	1	
29	2010-07-05 00:44:00.861425+00	1	10	704	From Russia, with love by Fleming, Ian 	1	
30	2010-07-05 00:44:35.72045+00	1	11	357	Clancy, Tom 	1	
31	2010-07-05 00:44:40.010057+00	1	10	705	The Hunt for Red October by Clancy, Tom 	1	
32	2010-07-05 00:45:26.914702+00	1	11	358	Blum, Deborah 	1	
33	2010-07-05 00:45:30.135144+00	1	10	706	The Poisoner’s Handbook by Blum, Deborah 	1	
34	2010-07-05 00:46:15.680747+00	1	11	359	Hirsi Ali, Ayaan 	1	
35	2010-07-05 00:46:18.616618+00	1	10	707	Infidel by Hirsi Ali, Ayaan 	1	
36	2010-07-05 00:46:39.051504+00	1	11	360	Peake, Mervyn 	1	
37	2010-07-05 00:46:43.190101+00	1	10	708	Titus Groan by Peake, Mervyn 	1	
38	2010-07-05 00:50:41.869169+00	1	10	709	Fallen Dragon by Hamilton, Peter F.	1	
39	2010-10-12 02:46:05.208577+00	1	10	710	Joy in the Morning by Wodehouse, Pelham Grenville	1	
40	2010-10-12 02:46:41.765484+00	1	11	361	Chandler, Raymond 	1	
41	2010-10-12 02:47:02.179601+00	1	10	711	Trouble Is My Business by Chandler, Raymond 	1	
42	2010-10-12 02:47:39.497483+00	1	10	712	The Big Sleep by Chandler, Raymond 	1	
43	2010-10-12 02:48:21.560682+00	1	10	713	Gormenghast by Peake, Mervyn 	1	
44	2010-10-12 02:48:54.275502+00	1	10	714	Genome by Ridley, Matt 	1	
45	2010-10-12 03:42:29.157687+00	1	10	715	Right Ho, Jeeves! by Wodehouse, Pelham Grenville	1	
46	2010-10-18 05:04:57.4711+00	1	11	362	Carroll, Lewis 	1	
47	2010-10-18 05:05:08.119255+00	1	10	716	Alice’s Adventures in Wonderland by Carroll, Lewis 	1	
48	2010-10-18 05:05:31.955081+00	1	10	717	Through the Looking-Glass by Carroll, Lewis 	1	
49	2010-10-18 05:06:03.337446+00	1	11	363	Goldacre, Ben 	1	
50	2010-10-18 05:06:08.784843+00	1	10	718	Junk Science by Goldacre, Ben 	1	
51	2010-11-15 03:43:39.743962+00	1	10	719	Red Seas Under Red Skies by Lynch, Scott 	1	
52	2010-11-15 03:45:07.824279+00	1	10	718	Bad Science by Goldacre, Ben 	2	Changed title and english_title.
53	2010-11-15 03:45:51.793342+00	1	11	364	Sanderson, Brandon 	1	
54	2010-11-15 03:45:59.180961+00	1	10	720	The Gathering Storm by Jordan, Robert ; Sanderson, Brandon 	1	
55	2010-11-15 03:46:30.178882+00	1	11	365	Pigliucci, Massimo 	1	
56	2010-11-15 03:46:34.114371+00	1	10	721	Nonsense On Stilts by Pigliucci, Massimo 	1	
57	2010-11-15 03:49:41.443133+00	1	10	722	Fermat’s Enigma by Singh, Simon 	1	
58	2010-11-29 03:11:01.831397+00	1	12	33	The Wheel of Time	2	Added volume "Volume object".
59	2010-11-29 05:29:40.208142+00	1	11	366	Alighieri, Dante 	1	
60	2010-11-29 05:29:47.808323+00	1	10	723	Inferno by Alighieri, Dante 	1	
61	2010-11-29 05:30:09.845742+00	1	12	51	The Divine Comedy	1	
62	2010-11-29 06:48:06.550975+00	1	10	212	The Talismans of Shannara by Brooks, Terry 	2	Changed english_title and read_original.
63	2010-11-29 06:49:18.48177+00	1	12	52	The Heritage of Shannara	1	
64	2010-11-29 07:15:40.194414+00	1	11	10	Martin, George R. R.	2	Changed nickname.
65	2010-11-29 07:50:40.114431+00	1	12	53	The Magister Trilogy	1	
66	2010-11-29 07:53:30.760757+00	1	10	524	Evolution—the triumph of an idea by Zimmer, Carl	2	Changed title and english_title.
67	2010-11-29 07:54:48.982661+00	1	10	508	Elbow Room: The varieties of free will worth wanting by Dennett, Daniel	2	Changed title and english_title.
68	2010-11-29 07:55:06.040647+00	1	10	493	Designing the Obvious: A common sense approach to web application design by Hoekman, Robert	2	Changed title and english_title.
69	2010-11-29 07:55:17.272259+00	1	10	526	Design Patterns: Elements of Reusable Object-Oriented Software by Gamma, Erich; Helm, Richard; Johnson, Ralph; Vlissides, John	2	Changed title and english_title.
70	2010-11-29 07:55:28.5615+00	1	10	510	Deep Simplicity: Bringing Order to Chaos and Complexity by Gribbin, John R.	2	Changed title and english_title.
71	2010-11-29 07:55:40.733651+00	1	10	634	Dark Banquet: Blood and the curious lives of blood-feeding creatures by Schutt, Bill	2	Changed title and english_title.
72	2010-11-29 07:58:08.859332+00	1	10	671	A Dash of Style: The art and mastery of punctuation by Lukeman, Noah	2	Changed title and english_title.
73	2010-11-29 07:58:23.59214+00	1	10	476	Beyond Good and Evil: Prelude to a Philosophy of the Future by Nietzsche, Friedrich	2	Changed title and english_title.
74	2010-11-29 07:58:38.160078+00	1	10	647	Big Bang: The most important scientific discovery of all time and why you need to know about it by Singh, Simon	2	Changed title and english_title.
75	2010-11-29 07:58:49.702551+00	1	10	674	Bonk: The Curious Coupling of Science and Sex by Roach, Mary	2	Changed title and english_title.
76	2010-11-29 07:59:02.281243+00	1	10	621	Code Complete: A Practical Handbook of Software Construction by McConnell, Steve	2	Changed title and english_title.
77	2010-11-29 07:59:11.141729+00	1	10	544	Consciousness: An Introduction by Blackmore, Susan	2	Changed title and english_title.
78	2010-11-29 07:59:21.061245+00	1	10	482	Defensive Design for the Web: How to Improve Error Messages, Help, Forms, and Other Crisis Points by Fried, Jason; Linderman, Matthew	2	Changed title and english_title.
79	2010-11-29 07:59:33.463776+00	1	10	524	Evolution: The triumph of an idea by Zimmer, Carl	2	Changed title and english_title.
80	2010-11-29 07:59:44.939994+00	1	10	451	Expert C Programming: Deep C Secrets by van der Linden, Peter	2	Changed title and english_title.
81	2010-11-29 07:59:54.171631+00	1	10	640	god is not Great: How religion poisons everything by Hitchens, Cristopher	2	Changed title and english_title.
82	2010-11-29 08:00:04.300824+00	1	10	228	Have Space Suit: Will Travel by Heinlein, Robert	2	Changed title and english_title.
83	2010-11-29 08:00:28.447973+00	1	10	570	How & Why Species Multiply: The Radiation of Darwin’s Finches by Grant, B. R.; Grant, Peter R.	2	Changed title and english_title.
84	2010-11-29 08:00:45.229986+00	1	10	615	Life As It Is: Biology for the public sphere by Loomis, William F.	2	Changed title and english_title.
85	2010-11-29 08:00:53.538612+00	1	10	620	Microcosm: E. coli and the New Science of Life by Zimmer, Carl	2	Changed title and english_title.
86	2010-11-29 08:01:50.997029+00	1	10	560	Origins: Fourteen billion years of cosmic evolution by Goldsmith, Donald; Tyson, Neil d.	2	Changed title and english_title.
87	2010-11-29 08:02:00.264322+00	1	10	617	Partners in Power: Living in a kinky relationship by Rinella, Jack	2	Changed title and english_title.
88	2010-11-29 08:02:07.689238+00	1	10	659	Poisons: From Hemlock to Botox and the Killer Bean of Calabar by Macinnis, Peter	2	Changed title and english_title.
89	2010-11-29 08:02:18.161746+00	1	10	480	Red Dwarf: Backwards by Grant, Rob	2	Changed title and english_title.
90	2010-11-29 08:02:24.81076+00	1	10	490	Red Dwarf: Better Than Life by Grant, Rob; Naylor, Doug	2	Changed title and english_title.
91	2010-11-29 08:02:31.473159+00	1	10	479	Red Dwarf: Last Human by Naylor, Doug	2	Changed title and english_title.
92	2010-11-29 08:02:40.91078+00	1	10	607	Refactoring: Improving the Design of Existing Code by Fowler, Martin	2	Changed title and english_title.
93	2010-11-29 08:02:58.600106+00	1	10	506	Richard Dawkins: How a scientist changed the way we think by various authors	2	Changed title and english_title.
94	2010-11-29 08:03:08.713005+00	1	10	557	Schrödingers Kittens and the Search for Reality: Solving the Quantum Mysteries by Gribbin, John R.	2	Changed title and english_title.
95	2010-11-29 08:03:16.436422+00	1	10	666	Security: What Every Programmer Needs To Know by Daswani, Neil; Kern, Cristoph; Kesavan, Anita	2	Changed title and english_title.
96	2010-11-29 08:03:27.680488+00	1	10	333	Shiva: An Adventure of the Ice Age by Brennan, J. H.	2	Changed title and english_title.
97	2010-11-29 08:03:35.690158+00	1	10	564	Six Easy Pieces: Essentials of Physics Explained by Its Most Brilliant Teacher by Feynman, Richard	2	Changed title and english_title.
98	2010-11-29 08:03:45.770888+00	1	10	642	Snake Oil Science: The Truth About Complementary and Alternative Medicine by Bausell, R. B.	2	Changed title and english_title.
99	2010-11-29 08:03:55.09017+00	1	10	678	Sweet Dreams: Philosophical Obstacles to a Science of Consciousness by Dennett, Daniel	2	Changed title and english_title.
100	2010-11-29 08:06:06.447873+00	1	10	332	The Crone: An Adventure of the Ice Age by Brennan, J. H.	2	Changed title and english_title.
101	2010-11-29 08:06:15.941826+00	1	10	648	The Demon-Haunted World: Science as a candle in the dark by Sagan, Carl	2	Changed title and english_title.
102	2010-11-29 08:06:23.051869+00	1	10	672	The First Five Pages: A Writer’s Guide to Staying Out of the Rejection Pile by Lukeman, Noah	2	Changed title and english_title.
103	2010-11-29 08:06:29.710487+00	1	10	681	The Greatest Show on Earth: The evidence for evolution by Dawkins, Richard	2	Changed title and english_title.
104	2010-11-29 08:06:38.140301+00	1	10	542	The Last Days of Socrates: Euthypro, The Apology, Phaedo, Crito by Plátōn	2	Changed title and english_title.
105	2010-11-29 08:06:45.568938+00	1	10	667	The Plot Thickens: 8 Ways to Bring Fiction to Life by Lukeman, Noah	2	Changed title and english_title.
106	2010-11-29 08:06:54.186794+00	1	10	609	The Pragmatic Programmer: From Journeyman to Master by Hunt, Andrew; Thomas, David	2	Changed title and english_title.
107	2010-11-29 08:07:01.353193+00	1	10	567	The Sex Contract: The Evolution of Human Behavior by Fisher, Helen E.	2	Changed title and english_title.
108	2010-11-29 08:07:07.77713+00	1	10	645	Trick or Treatment: The undeniable facts about alternative medicine by Ernst, Edzard; Singh, Simon	2	Changed title and english_title.
109	2010-11-29 08:07:15.449841+00	1	10	504	Wicked: The Life and Times of the Wicked Witch of the West by Maguire, Gregory	2	Changed title and english_title.
110	2010-11-29 08:07:30.721588+00	1	10	571	Your Inner Fish: A Journey into the 3.5-Billion-Year History of the Human Body by Shubin, Neil	2	Changed title and english_title.
111	2010-11-29 08:08:01.990014+00	1	10	239	Wyrd Sisters by Pratchett, Terry	2	Changed english_title.
112	2010-11-29 08:10:10.682752+00	1	10	445	The Bookseller of Kabul by Seierstad, Åsne	2	Changed title.
113	2010-11-29 08:11:23.92024+00	1	10	556	Life at the Limits: Organisms in extreme environments by Wharton, David A.	2	Changed title and english_title.
114	2010-11-29 08:12:16.452967+00	1	10	236	Equal Rites by Pratchett, Terry	2	Changed english_title.
115	2010-11-29 08:13:17.023364+00	1	10	646	Death from the Skies!: These are the ways the world will end... by Plait, Philip	2	Changed title and english_title.
116	2010-11-29 08:13:25.941787+00	1	10	547	Death by Black Hole: And other cosmic quandaries by Tyson, Neil d.	2	Changed title and english_title.
117	2010-12-05 05:42:55.046953+00	1	10	88	Daggerspell by Kerr, Katharine	2	Changed isbn.
118	2010-12-05 05:44:51.181308+00	1	10	89	Darkspell by Kerr, Katharine	2	Changed isbn.
119	2010-12-05 05:45:17.613151+00	1	10	90	The Bristling Wood by Kerr, Katharine	2	Changed isbn.
120	2010-12-05 05:51:35.933502+00	1	10	91	The Dragon Revenant by Kerr, Katharine	2	Changed isbn.
121	2010-12-05 05:52:07.525566+00	1	10	92	A Time of Exile by Kerr, Katharine	2	Changed isbn.
122	2010-12-05 05:52:29.935453+00	1	10	93	A Time of Omens by Kerr, Katharine	2	Changed isbn.
123	2010-12-05 05:52:57.595956+00	1	10	94	Days of Blood and Fire (A Time of War) by Kerr, Katharine	2	Changed isbn.
124	2010-12-05 05:53:23.690951+00	1	10	95	Days of Air and Darkness (A Time of Justice) by Kerr, Katharine	2	Changed isbn.
125	2010-12-05 05:59:54.914249+00	1	10	92	A Time of Exile by Kerr, Katharine	2	Changed isbn.
126	2010-12-05 06:12:59.56646+00	1	10	257	The Jungle Book by Kipling, Rudyard	2	Changed isbn.
127	2010-12-05 06:22:44.173868+00	1	10	528	The Island of Dr. Moreau by Wells, H. G.	2	Changed isbn.
128	2010-12-05 06:23:22.645814+00	1	10	81	The Long Dark Tea-Time of the Soul by Adams, Douglas	2	Changed isbn.
129	2010-12-05 06:24:28.577597+00	1	10	80	Dirk Gently's Holistic Detective Agency by Adams, Douglas	2	Changed isbn.
130	2010-12-05 06:24:59.570754+00	1	10	82	The Salmon of Doubt by Adams, Douglas	2	Changed isbn.
131	2010-12-05 06:31:15.73962+00	1	10	596	In This Sweet Summertime by Jungstedt, Mari	2	Changed isbn.
132	2010-12-05 06:32:55.999733+00	1	10	534	We who never said whore by Sandahl, Ronnie	2	Changed isbn.
133	2010-12-05 06:43:01.788565+00	1	10	257	The Jungle Book by Kipling, Rudyard	2	Changed oclc.
134	2010-12-05 06:44:49.422859+00	1	10	88	Daggerspell by Kerr, Katharine	2	Changed oclc.
135	2010-12-05 06:45:40.614814+00	1	10	89	Darkspell by Kerr, Katharine	2	Changed oclc.
136	2010-12-05 06:46:35.462599+00	1	10	90	The Bristling Wood by Kerr, Katharine	2	Changed oclc.
137	2010-12-05 06:47:05.530156+00	1	10	91	The Dragon Revenant by Kerr, Katharine	2	Changed oclc.
138	2010-12-05 06:47:37.030753+00	1	10	92	A Time of Exile by Kerr, Katharine	2	Changed oclc.
139	2010-12-05 06:48:03.374661+00	1	10	93	A Time of Omens by Kerr, Katharine	2	Changed oclc.
140	2010-12-05 06:49:20.361908+00	1	10	94	Days of Blood and Fire (A Time of War) by Kerr, Katharine	2	Changed oclc.
141	2010-12-05 06:49:47.02112+00	1	10	95	Days of Air and Darkness (A Time of Justice) by Kerr, Katharine	2	Changed oclc.
142	2010-12-05 07:10:28.746681+00	1	10	234	The Colour of Magic by Pratchett, Terry	2	Changed isbn.
143	2010-12-05 07:10:58.892958+00	1	10	235	The Light Fantastic by Pratchett, Terry	2	Changed isbn.
144	2010-12-05 07:11:29.083594+00	1	10	236	Equal Rites by Pratchett, Terry	2	Changed isbn.
145	2010-12-05 07:11:54.867023+00	1	10	237	Mort by Pratchett, Terry	2	Changed isbn.
146	2010-12-05 07:17:04.454502+00	1	10	694	Guards! Guards! by Pratchett, Terry	2	Changed isbn.
147	2010-12-05 07:18:52.014479+00	1	10	695	Eric by Pratchett, Terry	2	Changed isbn.
148	2010-12-05 07:19:24.15581+00	1	10	241	Thief of Time by Pratchett, Terry	2	Changed isbn.
149	2010-12-05 07:20:12.57108+00	1	10	238	Sourcery by Pratchett, Terry	2	Changed isbn.
150	2010-12-05 07:20:38.781713+00	1	10	239	Wyrd Sisters by Pratchett, Terry	2	Changed isbn.
151	2010-12-05 07:21:15.802415+00	1	10	688	Pyramids by Pratchett, Terry	2	Changed isbn.
152	2010-12-05 07:21:45.829534+00	1	10	240	Carpe Jugulum by Pratchett, Terry	2	Changed isbn.
153	2010-12-05 07:25:55.45286+00	1	12	54	Discworld	1	
154	2010-12-05 07:27:20.377855+00	1	12	54	Discworld	2	Added volume "Volume object". Added volume "Volume object". Added volume "Volume object".
155	2010-12-05 07:28:22.471834+00	1	12	54	Discworld	2	Added volume "Volume object".
156	2010-12-05 21:32:59.375977+00	1	11	367	Ciardi, John	1	
157	2010-12-05 21:33:02.467463+00	1	16	154	Inferno (Inferno by Alighieri, Dante), translated by Ciardi, John	1	
158	2010-12-11 10:05:26.447566+00	1	10	723	Inferno by Alighieri, Dante	2	Changed isbn.
159	2010-12-11 10:06:14.177041+00	1	10	724	Purgatorio by Alighieri, Dante	1	
160	2010-12-11 10:08:22.823499+00	1	16	155	Purgatorio (Purgatorio by Alighieri, Dante), translated by Ciardi, John	1	
161	2010-12-20 03:49:52.623917+00	1	10	725	Paradiso by Alighieri, Dante	1	
162	2010-12-20 03:50:16.969701+00	1	16	156	Paradiso (Paradiso by Alighieri, Dante), translated by Ciardi, John	1	
163	2010-12-20 09:32:59.971295+00	1	11	368	Kafka, Franz	1	
164	2010-12-20 09:33:05.448794+00	1	10	726	Metamorphosis by Kafka, Franz	1	
165	2010-12-20 09:33:58.555195+00	1	11	369	Aaltonen, William	1	
166	2010-12-20 09:34:03.44529+00	1	16	157	Metamorphosis (Die Verwandlung by Kafka, Franz), translated by Aaltonen, William	1	
167	2010-12-28 14:07:22.168652+00	1	10	134	Stone of Tears by Goodkind, Terry	2	Changed isbn.
168	2010-12-28 14:08:05.05063+00	1	10	135	Blood of the Fold by Goodkind, Terry	2	Changed isbn.
169	2010-12-28 14:08:37.424771+00	1	10	136	Temple of the Winds by Goodkind, Terry	2	Changed isbn.
170	2010-12-28 14:09:20.422566+00	1	10	137	Soul of the Fire by Goodkind, Terry	2	Changed isbn.
171	2010-12-28 14:09:52.072639+00	1	10	138	Faith of the Fallen by Goodkind, Terry	2	Changed isbn.
172	2010-12-28 14:10:41.439526+00	1	10	139	The Pillars of Creation by Goodkind, Terry	2	Changed isbn.
173	2010-12-28 14:13:01.072944+00	1	10	140	Naked Empire by Goodkind, Terry	2	Changed isbn.
174	2010-12-28 14:15:45.015401+00	1	10	204	Running with the Demon by Brooks, Terry	2	Changed isbn.
175	2010-12-28 14:17:19.953787+00	1	10	205	A Knight of the Word by Brooks, Terry	2	Changed isbn.
176	2010-12-28 14:18:02.274204+00	1	10	206	Angel Fire East by Brooks, Terry	2	Changed isbn.
177	2010-12-28 14:18:48.258715+00	1	10	320	The Pelican Brief by Grisham, John	2	Changed isbn.
178	2010-12-28 14:19:14.255108+00	1	10	221	The Firm by Grisham, John	2	Changed isbn.
179	2010-12-28 14:19:40.524291+00	1	10	220	A Time to Kill by Grisham, John	2	Changed isbn.
180	2010-12-28 14:20:10.865128+00	1	10	222	The Runaway Jury by Grisham, John	2	Changed isbn.
181	2010-12-28 14:20:57.248948+00	1	10	318	Other Lands by Wylie, Jonathan	2	Changed isbn.
182	2010-12-28 14:21:26.727967+00	1	10	196	Life of Pi by Martel, Yann	2	Changed isbn.
183	2010-12-28 14:26:08.400186+00	1	10	50	Pawn of Prophecy by Eddings, David	2	Changed isbn.
184	2010-12-28 14:26:32.481703+00	1	10	51	Queen of Sorcery by Eddings, David	2	Changed isbn.
185	2010-12-28 14:26:56.289729+00	1	10	52	Magician's Gambit by Eddings, David	2	Changed isbn.
186	2010-12-28 14:27:25.602746+00	1	10	53	Castle of Wizardry by Eddings, David	2	Changed isbn.
187	2010-12-28 14:27:45.5236+00	1	10	54	Enchanters' End Game by Eddings, David	2	Changed isbn.
188	2010-12-28 14:28:23.595389+00	1	10	55	Guardians of the West by Eddings, David	2	Changed isbn.
189	2010-12-28 14:33:59.263491+00	1	10	56	King of the Murgos by Eddings, David	2	Changed isbn.
190	2010-12-28 14:34:18.023809+00	1	10	57	Demon Lord of Karanda by Eddings, David	2	Changed isbn.
191	2010-12-28 14:34:58.772445+00	1	10	58	Sorceress of Darshiva by Eddings, David	2	Changed isbn.
192	2010-12-28 14:35:21.72362+00	1	10	59	The Seeress of Kell by Eddings, David	2	Changed isbn.
193	2010-12-28 14:37:15.566896+00	1	10	62	The Diamond Throne by Eddings, David	2	Changed isbn.
194	2010-12-28 14:37:34.922288+00	1	10	63	The Ruby Knight by Eddings, David	2	Changed isbn.
195	2010-12-28 14:37:59.064424+00	1	10	64	The Sapphire Rose by Eddings, David	2	Changed isbn.
196	2010-12-28 14:38:19.76802+00	1	10	65	Domes of Fire by Eddings, David	2	Changed isbn.
197	2010-12-28 14:38:41.466142+00	1	10	66	The Shining Ones by Eddings, David	2	Changed isbn.
198	2010-12-28 14:38:59.282922+00	1	10	67	The Hidden City by Eddings, David	2	Changed isbn.
199	2010-12-28 14:39:30.840064+00	1	10	60	Belgarath the Sorcerer by Eddings, David	2	Changed isbn.
200	2010-12-28 14:39:54.965083+00	1	10	70	High Hunt by Eddings, David	2	Changed isbn.
201	2010-12-28 14:40:14.204376+00	1	10	69	The Losers by Eddings, David	2	Changed isbn.
202	2010-12-28 14:40:45.481011+00	1	10	61	Polgara the Sorceress by Eddings, David	2	Changed isbn.
203	2010-12-28 14:43:08.83814+00	1	10	68	The Redemption of Althalus by Eddings, David	2	Changed isbn.
204	2010-12-28 14:46:03.882228+00	1	10	119	Dreamcatcher by King, Stephen	2	Changed isbn.
205	2010-12-28 14:46:22.361271+00	1	10	114	The Dead Zone by King, Stephen	2	Changed isbn.
206	2010-12-28 14:46:46.90618+00	1	10	321	Everything's Eventual by King, Stephen	2	Changed isbn.
207	2010-12-28 14:47:27.981693+00	1	10	120	The Stand by King, Stephen	2	Changed isbn.
208	2010-12-28 14:47:58.235919+00	1	10	117	Rose Madder by King, Stephen	2	Changed isbn.
209	2010-12-28 14:49:05.337155+00	1	10	174	The Call of Cthulhu and Other Weird Stories by Lovecraft, H.P.	2	Changed isbn.
210	2010-12-28 14:50:07.172744+00	1	12	55	The Tawny Man	1	
211	2010-12-28 14:50:12.277123+00	1	10	185	Fool’s Errand by Hobb, Robin	2	Changed title, english_title and isbn. Added volume "Volume object".
212	2010-12-28 14:51:37.191521+00	1	10	126	Dune by Herbert, Frank	2	Changed isbn.
213	2010-12-28 14:52:06.09116+00	1	10	288	Anansi Boys by Gaiman, Neil	2	Changed isbn.
214	2010-12-28 14:52:39.553126+00	1	10	74	Hamlet by Shakespeare, William	2	Changed isbn.
215	2010-12-28 14:53:17.543338+00	1	10	405	The Mammoth Book of Comic Fantasy by various authors	2	Changed isbn.
216	2010-12-28 14:53:42.173064+00	1	10	322	The Cider House Rules by Irving, John	2	Changed isbn.
217	2010-12-28 14:54:07.341465+00	1	10	319	Dark Fire by Wylie, Jonathan	2	Changed isbn.
218	2010-12-28 14:54:35.59085+00	1	10	166	Weaveworld by Barker, Clive	2	Changed isbn.
219	2010-12-28 14:54:59.737067+00	1	12	56	Island and Empire	1	
220	2010-12-28 14:55:04.531999+00	1	10	319	Dark Fire by Wylie, Jonathan	2	Added volume "Volume object".
221	2010-12-28 14:57:39.798305+00	1	12	57	The Elric Saga	1	
222	2010-12-28 14:57:43.612135+00	1	10	255	Elric of Melniboné by Moorcock, Michael	2	Changed isbn. Added volume "Volume object".
223	2010-12-28 14:59:20.089149+00	1	10	256	Sailor on the Seas of Fate by Moorcock, Michael	2	Changed isbn. Added volume "Volume object".
224	2010-12-28 15:00:22.681684+00	1	10	256	The Sailor on the Seas of Fate by Moorcock, Michael	2	Changed english_title.
225	2010-12-28 15:00:54.061426+00	1	10	630	The Shadow of the Wind by Zafón, Carlos R.	2	Changed isbn.
226	2010-12-28 15:05:31.369827+00	1	10	637	The People of the Black Circle by Howard, Robert E.	2	Changed isbn.
227	2010-12-28 15:06:02.905126+00	1	10	226	Cry from the Jungle by Haugen, Tormod	2	Changed isbn.
228	2010-12-28 16:18:32.284016+00	1	11	370	Iveroth Lagergren, Barbro	1	
229	2010-12-28 16:18:37.228992+00	1	16	158	Skriket från djungeln (Skriket fra jungelen by Haugen, Tormod), translated by Iveroth Lagergren, Barbro	1	
230	2010-12-28 16:19:42.889642+00	1	16	37	Skriket från djungeln (Skriket fra jungelen by Haugen, Tormod), translated by 	3	
231	2010-12-28 16:22:10.56277+00	1	10	226	The Cry from the Jungle by Haugen, Tormod	2	Changed english_title.
232	2010-12-28 16:23:38.26781+00	1	11	371	Orczy, Emmuska	1	
233	2010-12-28 16:24:35.822864+00	1	10	727	The Scarlet Pimpernel by Orczy, Emmuska	1	
234	2010-12-28 16:25:18.118599+00	1	11	372	Lindström, Sigfrid	1	
235	2010-12-28 16:25:21.969747+00	1	16	159	Röda Nejlikan (The Scarlet Pimpernel by Orczy, Emmuska), translated by Lindström, Sigfrid	1	
236	2010-12-28 16:33:50.771704+00	1	10	316	Bombi Bitt and I by Nilsson, Fritiof "Piraten"	2	Changed comments.
237	2010-12-28 16:35:23.136628+00	1	11	373	Dahlander, Pontus	1	
238	2010-12-28 16:35:25.203091+00	1	16	160	Fiffikus & Co. (Stalky & Co. by Kipling, Rudyard), translated by Dahlander, Pontus	1	
239	2010-12-28 16:36:46.168935+00	1	16	54	Fiffikus & Co: Minnen från skoltiden (Stalky & Co. by Kipling, Rudyard), translated by Dahlander, Pontus	2	Changed title. Added translator "Translator object".
240	2010-12-28 16:37:05.369668+00	1	10	260	Stalky & Co. by Kipling, Rudyard	2	Changed comments.
241	2010-12-28 16:37:54.915036+00	1	16	160	Fiffikus & Co. (Stalky & Co. by Kipling, Rudyard), translated by Dahlander, Pontus	3	
242	2010-12-28 16:38:19.234336+00	1	16	54	Fiffikus & Co: Minnen från skoltiden (Stalky & Co. by Kipling, Rudyard), translated by Dahlander, Pontus	2	No fields changed.
243	2010-12-28 16:40:44.759216+00	1	10	223	Ootah's Lucky Day by Parish, Peggy	2	Changed isbn and comments.
244	2010-12-28 16:41:36.250549+00	1	11	374	Strömstedt, Margareta	1	
245	2010-12-28 16:41:38.806249+00	1	16	34	Ootas stora dag (Ootah's Lucky Day by Parish, Peggy), translated by Strömstedt, Margareta	2	Added translator "Translator object".
246	2010-12-28 16:42:44.419234+00	1	10	406	Modern Classics of Fantasy by various authors	2	Changed isbn.
247	2010-12-28 16:43:48.981346+00	1	10	278	Adventures of Huckleberry Finn by Twain, Mark	2	Changed isbn.
248	2010-12-28 16:44:18.687683+00	1	11	375	Sandgren, Gustav	1	
249	2010-12-28 16:44:21.395704+00	1	16	61	Huckleberry Finns äventyr (Adventures of Huckleberry Finn by Twain, Mark), translated by Sandgren, Gustav	2	Added translator "Translator object".
250	2010-12-28 16:45:43.240932+00	1	10	328	A Hero Born by Stackpole, Michael A.	2	Changed isbn.
251	2010-12-28 16:48:11.68536+00	1	10	132	The White Plague by Herbert, Frank	2	Changed isbn and comments.
252	2010-12-28 16:48:54.372417+00	1	10	219	Hannibal by Harris, Thomas	2	Changed isbn.
253	2010-12-28 16:48:59.103599+00	1	10	218	Red Dragon by Harris, Thomas	2	Changed isbn.
254	2010-12-28 16:49:02.28855+00	1	10	217	The Silence of the Lambs by Harris, Thomas	2	Changed isbn.
255	2010-12-28 17:05:55.758776+00	1	10	557	Schrödingers Kittens and the Search for Reality: Solving the Quantum Mysteries by Gribbin, John R.	2	Changed isbn.
256	2010-12-28 17:06:27.947689+00	1	10	31	The Hobbit by Tolkien, J.R.R.	2	Changed isbn.
257	2010-12-28 17:07:12.734295+00	1	10	163	Assar Bubble by Lindgren, Astrid	2	Changed isbn.
258	2010-12-28 17:07:57.447853+00	1	10	157	Ronja the Robber’s Daughter by Lindgren, Astrid	2	Changed english_title and isbn.
259	2010-12-28 17:08:25.843579+00	1	10	159	The Brothers Lionheart by Lindgren, Astrid	2	Changed isbn.
260	2010-12-28 17:09:12.172924+00	1	10	400	The Rockingdown Mystery by Blyton, Enid	2	Changed isbn.
261	2010-12-28 17:09:47.148616+00	1	11	376	Rasmussen, Solveig	1	
262	2010-12-28 17:09:50.477166+00	1	16	119	De 6 och äventyret på Rockingdown (The Rockingdown Mystery by Blyton, Enid), translated by Rasmussen, Solveig	2	Added translator "Translator object".
263	2010-12-28 17:10:25.44542+00	1	10	326	Mammals: All the species of Europe by Bjärvall, Anders	2	Changed isbn.
264	2010-12-28 17:11:55.682396+00	1	10	728	The Swedish driving licence manual by 	1	
265	2010-12-28 17:12:53.089756+00	1	11	377	Westerlund, Hans G.	1	
266	2010-12-28 17:12:55.726028+00	1	16	57	Buffalo Bill (The Life and Adventures of Buffalo Bill by Cody, William F.), translated by Westerlund, Hans G.	2	Added translator "Translator object".
267	2010-12-28 17:13:33.099684+00	1	11	378	Bergström, Britte-Marie	1	
268	2010-12-28 17:13:35.515215+00	1	16	53	Kim (Kim by Kipling, Rudyard), translated by Bergström, Britte-Marie	2	Added translator "Translator object".
269	2010-12-28 17:14:30.988576+00	1	11	379	Holmberg, Nils	1	
270	2010-12-28 17:14:32.698898+00	1	16	76	Napoleons husar (The Exploits of Brigadier Gerard by Doyle, Sir Arthur C.), translated by Holmberg, Nils	2	Added translator "Translator object".
271	2010-12-28 17:19:16.758753+00	1	11	380	Le Blanc, Michelle	1	
272	2010-12-28 17:19:32.806669+00	1	11	381	Odell, Colin	1	
273	2010-12-28 17:19:35.349416+00	1	10	729	Tim Burton (Pocket Essentials) by Le Blanc, Michelle; Odell, Colin	1	
274	2010-12-28 19:59:51.505076+00	1	10	210	The Druid of Shannara by Brooks, Terry	2	Changed isbn.
275	2010-12-28 20:00:29.533452+00	1	10	211	The Elf Queen of Shannara by Brooks, Terry	2	Changed isbn.
276	2010-12-28 20:00:58.300038+00	1	10	212	The Talismans of Shannara by Brooks, Terry	2	Changed isbn.
277	2010-12-28 20:01:56.268561+00	1	11	382	Gahrton, Birgitta	1	
278	2010-12-28 20:01:59.151223+00	1	16	32	Shannaras talismaner (The Talismans of Shannara by Brooks, Terry), translated by Gahrton, Birgitta	2	Added translator "Translator object".
279	2010-12-28 20:02:24.375081+00	1	16	31	Shannaras alvdrottning (The Elf Queen of Shannara by Brooks, Terry), translated by Gahrton, Birgitta	2	Added translator "Translator object".
280	2010-12-28 20:02:46.757499+00	1	16	30	Shannaras druid (The Druid of Shannara by Brooks, Terry), translated by Gahrton, Birgitta	2	Added translator "Translator object".
281	2010-12-28 20:03:21.725534+00	1	16	29	Shannaras ättlingar (The Scions of Shannara by Brooks, Terry), translated by Gahrton, Birgitta	2	Added translator "Translator object".
282	2010-12-28 20:03:53.255387+00	1	10	209	The Scions of Shannara by Brooks, Terry	2	Changed isbn.
283	2010-12-28 20:05:50.35713+00	1	12	58	The Shannara Trilogy	1	
284	2010-12-28 20:05:55.522209+00	1	10	730	The Sword of Shannara by Brooks, Terry	1	
285	2010-12-28 20:06:55.354178+00	1	10	731	The Elfstones of Shannara by Brooks, Terry	1	
286	2010-12-28 20:07:41.112657+00	1	10	732	The Wishsong of Shannara by Brooks, Terry	1	
287	2010-12-28 20:08:45.581092+00	1	11	383	Ahlström, Lars	1	
288	2010-12-28 20:09:02.377783+00	1	11	384	Moëll, Louise	1	
289	2010-12-28 20:09:09.115693+00	1	16	161	Shannaras Svärd (The Sword of Shannara by Brooks, Terry), translated by Ahlström, Lars; Moëll, Louise	1	
290	2010-12-28 20:09:38.837199+00	1	11	385	Torndahl, Lena	1	
291	2010-12-28 20:09:43.507599+00	1	16	162	Shannaras Alvstenar (The Elfstones of Shannara by Brooks, Terry), translated by Torndahl, Lena	1	
292	2010-12-28 20:10:07.66621+00	1	16	163	Shannaras Önskesång (The Wishsong of Shannara by Brooks, Terry), translated by Torndahl, Lena	1	
293	2010-12-28 20:26:43.816855+00	1	10	88	Daggerspell by Kerr, Katharine	2	Changed isbn.
294	2010-12-29 21:16:02.497515+00	1	12	59	The Mages of Garillon	1	
295	2010-12-29 21:16:37.261266+00	1	11	386	Harris, Deborah T.	1	
296	2010-12-29 21:16:43.145678+00	1	10	733	The Burning Stone by Harris, Deborah T.	1	
297	2010-12-30 11:08:25.223124+00	1	11	387	Coren, Michael	1	
298	2010-12-30 11:17:28.491807+00	1	10	734	J.R.R. Tolkien: The man who created The Lord of the Rings by Coren, Michael	1	
299	2010-12-30 22:22:20.560999+00	1	10	735	Mere Christianity by Lewis, C.S.	1	
300	2011-01-03 13:45:07.499163+00	1	10	399	Shoot the king! by Svedelid, Olov	2	Changed isbn.
301	2011-01-03 13:45:54.806531+00	1	10	340	Mountain of the Gods by Guillou, Jan	2	Changed isbn.
302	2011-01-03 13:46:35.239002+00	1	10	390	When Man arrived... by Hulth, Sonja	2	Changed isbn.
303	2011-01-03 13:48:08.64842+00	1	10	389	The Fables of Aesop by Aisōpos	2	Changed english_title and isbn.
304	2011-01-03 13:49:41.935802+00	1	10	386	The Book of One Thousand and One Nights (selection) by unknown author(s)	2	Changed isbn.
305	2011-01-03 13:51:15.001932+00	1	10	404	The Big Book of the Animal World by Ahrland, Line; Carlsson, Gunnar	2	Changed english_title and isbn.
306	2011-01-03 13:54:30.186852+00	1	10	369	The Bright and Morning Star by Harris, Rosemary	2	Changed isbn.
307	2011-01-03 13:57:05.883332+00	1	11	388	Westrup, Jadwiga P.	1	
308	2011-01-03 13:57:11.65209+00	1	16	102	Stjärnan i öster (The Bright and Morning Star by Harris, Rosemary), translated by Westrup, Jadwiga P.	2	Changed isbn. Added translator "Translator object".
309	2011-01-03 13:58:29.059034+00	1	10	368	The Shadow on the Sun by Harris, Rosemary	2	Changed isbn.
310	2011-01-03 13:59:07.509476+00	1	16	101	Sedan alla gått iland (The Shadow on the Sun by Harris, Rosemary), translated by Westrup, Jadwiga P.	2	Changed isbn. Added translator "Translator object".
311	2011-01-03 13:59:56.505005+00	1	10	367	The Moon in the Cloud by Harris, Rosemary	2	Changed isbn.
312	2011-01-03 14:00:14.032579+00	1	16	100	Innan alla kom ombord (The Moon in the Cloud by Harris, Rosemary), translated by Westrup, Jadwiga P.	2	Changed isbn. Added translator "Translator object".
313	2011-01-03 14:06:41.833808+00	1	10	378	The book about grandpa the parson by Bexell, Eva	2	Changed isbn.
314	2011-01-03 14:07:27.307407+00	1	10	374	Mother is not a witch by Svedelid, Olov	2	Changed isbn.
315	2011-01-03 14:08:05.885286+00	1	10	190	Momo by Ende, Michael	2	Changed isbn.
316	2011-01-03 14:09:51.979787+00	1	11	389	Adlerberth, Roland	1	
317	2011-01-03 14:10:02.109189+00	1	16	17	Momo eller Kampen om tiden (Momo by Ende, Michael), translated by Adlerberth, Roland	2	Changed isbn. Added translator "Translator object".
318	2011-01-03 14:16:45.570739+00	1	10	333	Shiva: An Adventure of the Ice Age by Brennan, J. H.	2	Changed isbn.
319	2011-01-03 14:18:04.197114+00	1	10	332	The Crone: An Adventure of the Ice Age by Brennan, J. H.	2	Changed isbn.
320	2011-01-03 14:20:01.323343+00	1	11	390	Blomqvist, Gunvor V.	1	
321	2011-01-03 14:20:05.480737+00	1	16	81	Shiva: flicka i tidens gryning (Shiva: An Adventure of the Ice Age by Brennan, J. H.), translated by Blomqvist, Gunvor V.	2	Changed title and isbn. Added translator "Translator object".
322	2011-01-03 14:20:16.083393+00	1	16	80	Hiram jägaren (The Crone: An Adventure of the Ice Age by Brennan, J. H.), translated by 	2	Changed isbn.
323	2011-01-03 14:20:25.574201+00	1	16	80	Hiram jägaren (The Crone: An Adventure of the Ice Age by Brennan, J. H.), translated by Blomqvist, Gunvor V.	2	Added translator "Translator object".
324	2011-02-02 06:43:04.775027+00	1	12	60	The Void Trilogy	1	
325	2011-02-02 06:43:17.241221+00	1	10	736	The Dreaming Void by Hamilton, Peter F.	1	
326	2011-02-02 06:44:35.573205+00	1	10	737	The Temporal Void by Hamilton, Peter F.	1	
327	2011-02-02 06:47:20.485162+00	1	10	487	The Meaning of Liff by Adams, Douglas; Lloyd, John	2	Changed isbn.
328	2011-02-02 06:48:10.83869+00	1	10	144	Good Omens by Gaiman, Neil; Pratchett, Terry	2	Changed isbn and rating.
329	2011-02-02 06:50:16.306172+00	1	10	646	Death from the Skies!: These are the ways the world will end... by Plait, Phil	2	Changed isbn.
330	2011-02-02 07:04:06.827311+00	1	10	738	Oldest, youngest, or in between by 	1	
331	2011-02-02 07:05:17.048329+00	1	11	391	Schönbeck, Elizabeth	1	
332	2011-02-02 07:05:20.222153+00	1	10	738	Oldest, youngest, or in between by Schönbeck, Elizabeth	2	Added authorship "Authorship object".
333	2011-02-02 07:21:32.634972+00	1	12	17	The Gap Saga	2	Changed title and review.
334	2011-02-02 07:28:36.45774+00	1	10	25	The Gap into Conflict: The Real Story by Donaldson, Stephen R.	2	Changed isbn.
335	2011-02-02 07:29:12.875927+00	1	10	26	The Gap into Vision: Forbidden Knowledge by Donaldson, Stephen R.	2	Changed isbn.
336	2011-02-02 07:29:38.25641+00	1	10	27	The Gap into Power: A Dark and Hungry God Arises by Donaldson, Stephen R.	2	Changed isbn.
337	2011-02-02 07:30:01.924433+00	1	10	28	The Gap into Madness: Chaos and Order by Donaldson, Stephen R.	2	Changed isbn.
338	2011-02-02 07:30:27.131011+00	1	10	29	The Gap into Ruin: This Day All Gods Die by Donaldson, Stephen R.	2	Changed isbn.
339	2011-02-02 07:35:26.98703+00	1	10	30	Lord Foul's Bane by Donaldson, Stephen R.	2	Changed isbn.
340	2011-02-02 07:40:10.261722+00	1	10	20	The Power that Preserves by Donaldson, Stephen R.	2	Changed isbn.
341	2011-02-02 07:40:52.939956+00	1	10	21	The Wounded Land by Donaldson, Stephen R.	2	Changed isbn.
342	2011-02-02 07:40:55.573519+00	1	10	22	The One Tree by Donaldson, Stephen R.	2	Changed isbn.
343	2011-02-02 07:40:58.893385+00	1	10	23	White Gold Wielder by Donaldson, Stephen R.	2	Changed isbn.
344	2011-02-02 07:43:48.465654+00	1	10	24	The Runes of the Earth by Donaldson, Stephen R.	2	Changed isbn.
345	2011-02-02 07:44:13.321592+00	1	10	638	Fatal Revenant by Donaldson, Stephen R.	2	Changed isbn.
346	2011-02-02 07:48:19.648206+00	1	10	4	In Conquest Born by Friedman, C.S.	2	Changed isbn and rating.
347	2011-02-02 07:48:46.938146+00	1	10	10	The Wilding by Friedman, C.S.	2	Changed isbn.
348	2011-02-02 07:49:15.998924+00	1	10	5	The Madness Season by Friedman, C.S.	2	Changed isbn.
349	2011-02-02 07:49:57.986987+00	1	10	7	Black Sun Rising by Friedman, C.S.	2	Changed isbn and rating.
350	2011-02-02 07:50:20.46148+00	1	10	8	When True Night Falls by Friedman, C.S.	2	Changed isbn.
351	2011-02-02 07:50:43.824615+00	1	10	9	Crown of Shadows by Friedman, C.S.	2	Changed isbn.
352	2011-02-02 07:54:06.924634+00	1	10	3	This Alien Shore by Friedman, C.S.	2	Changed isbn.
353	2011-02-02 07:54:31.151948+00	1	10	516	Feast of Souls by Friedman, C.S.	2	Changed isbn.
354	2011-02-02 07:55:01.226521+00	1	10	680	Wings of Wrath by Friedman, C.S.	2	Changed isbn and rating.
355	2011-02-02 08:00:16.762421+00	1	10	643	The Annotated Hobbit by Anderson, Douglas A.; Tolkien, J.R.R.	2	Changed isbn and notes.
356	2011-02-02 08:01:49.189597+00	1	10	32	The Fellowship of the Ring by Tolkien, J.R.R.	2	Changed isbn.
357	2011-02-02 08:02:14.326456+00	1	10	33	The Two Towers by Tolkien, J.R.R.	2	Changed isbn.
358	2011-02-02 08:02:36.312883+00	1	10	34	The Return of the King by Tolkien, J.R.R.	2	Changed isbn.
359	2011-02-02 08:06:13.204511+00	1	11	392	Svahn, Clas	1	
360	2011-02-02 08:06:35.780662+00	1	11	393	Wall, Gunnar	1	
361	2011-02-02 08:07:09.971411+00	1	11	394	Ulwencreutz, Lars	1	
362	2011-02-02 08:08:07.803176+00	1	11	395	Persson, Åke	1	
363	2011-02-02 08:08:34.069914+00	1	11	396	Hellberg, Anders	1	
364	2011-02-02 08:09:08.690382+00	1	10	739	The World’s Greatest Conspiracies by Hellberg, Anders; Persson, Åke; Svahn, Clas; Ulwencreutz, Lars; Wall, Gunnar	1	
365	2011-02-02 08:11:20.684176+00	1	10	35	The Silmarillion by Tolkien, J.R.R.	2	Changed isbn.
366	2011-02-02 08:11:47.52884+00	1	10	38	Unfinished Tales by Tolkien, J.R.R.	2	Changed isbn.
367	2011-02-02 08:12:10.795013+00	1	10	42	Tales from the Perilous Realm by Tolkien, J.R.R.	2	Changed isbn.
368	2011-02-02 08:12:34.715336+00	1	10	41	Roverandom by Tolkien, J.R.R.	2	Changed isbn.
369	2011-02-02 08:14:51.702086+00	1	10	36	The Book of Lost Tales, Part 1 by Tolkien, Christopher; Tolkien, J.R.R.	2	Changed isbn.
370	2011-02-02 08:14:55.65613+00	1	10	37	The Book of Lost Tales, Part 2 by Tolkien, Christopher; Tolkien, J.R.R.	2	Changed isbn.
371	2011-02-02 08:15:02.361076+00	1	10	590	The Lays of Beleriand by Tolkien, Christopher; Tolkien, J.R.R.	2	Changed isbn.
372	2011-02-02 08:15:05.970573+00	1	10	597	The Shaping of Middle-earth by Tolkien, Christopher; Tolkien, J.R.R.	2	Changed isbn.
373	2011-02-02 08:15:09.46248+00	1	10	602	The Lost Road by Tolkien, Christopher; Tolkien, J.R.R.	2	Changed isbn.
374	2011-02-02 08:15:43.140854+00	1	10	605	The Return of the Shadow by Tolkien, Christopher; Tolkien, J.R.R.	2	Changed isbn.
375	2011-02-02 08:15:45.971811+00	1	10	606	The Treason of Isengard by Tolkien, Christopher; Tolkien, J.R.R.	2	Changed isbn.
376	2011-02-02 08:17:47.404482+00	1	10	460	The Children of Húrin by Tolkien, J.R.R.	2	Changed isbn and rating.
377	2011-02-02 08:18:23.932742+00	1	10	456	The Letters of J.R.R. Tolkien by Tolkien, J.R.R.	2	Changed isbn.
378	2011-02-02 08:18:58.306774+00	1	10	242	J.R.R. Tolkien: A Biography by Carpenter, Humphrey	2	Changed isbn.
379	2011-02-02 08:19:24.923897+00	1	10	143	Neuromancer by Gibson, William	2	Changed isbn.
380	2011-02-02 08:19:54.840235+00	1	10	468	Cryptonomicon by Stephenson, Neal	2	Changed isbn.
381	2011-02-02 08:30:22.736417+00	1	10	675	Beowulf by 	2	Changed isbn. Deleted authorship "Authorship object".
382	2011-02-02 08:30:52.313986+00	1	16	153	Beowulf (Beowulf by ), translated by Heaney, Seamus	2	Changed isbn.
383	2011-02-02 08:32:08.825397+00	1	10	46	Treasure Island by Stevenson, R.L.	2	Changed isbn.
384	2011-02-02 08:36:24.124037+00	1	10	44	Frankenstein by Shelley, Mary	2	Changed isbn.
385	2011-02-02 08:37:13.232471+00	1	10	46	Treasure Island by Stevenson, R.L.	2	Changed isbn.
386	2011-02-02 08:37:43.490139+00	1	10	491	The Deeper Meaning of Liff by Adams, Douglas; Lloyd, John	2	Changed isbn.
387	2011-02-02 08:38:12.206475+00	1	10	473	Casino Royale by Fleming, Ian	2	Changed isbn.
388	2011-02-02 08:41:25.134352+00	1	10	133	Wizard’s First Rule by Goodkind, Terry	2	Changed title, english_title and isbn.
389	2011-02-02 08:42:07.15527+00	1	10	447	To Kill A Mockingbird by Lee, Harper	2	Changed isbn.
390	2011-02-02 08:52:30.594287+00	1	10	434	Bag of Bones by King, Stephen	2	Changed isbn.
391	2011-02-02 08:52:53.858277+00	1	10	350	2001: A Space Odyssey by Clarke, Arthur C.	2	Changed isbn.
392	2011-02-02 08:53:28.50637+00	1	10	145	Neverwhere by Gaiman, Neil	2	Changed isbn.
393	2011-02-02 08:53:49.344351+00	1	10	48	The Godfather by Puzo, Mario	2	Changed isbn.
394	2011-02-03 07:39:52.318298+00	1	10	681	The Greatest Show on Earth: The evidence for evolution by Dawkins, Richard	2	Changed isbn.
395	2011-02-03 07:41:45.591344+00	1	10	486	A Devil's Chaplain: Reflections on Hope, Lies, Science, and Love by Dawkins, Richard	2	Changed isbn.
396	2011-02-03 07:42:15.269145+00	1	10	444	The Extended Phenotype by Dawkins, Richard	2	Changed isbn.
397	2011-02-03 07:42:52.028795+00	1	10	440	The Ancestor's Tale by Dawkins, Richard	2	Changed isbn.
398	2011-02-03 07:43:58.139558+00	1	10	673	The Oxford Book of Modern Science Writing by various authors	2	Changed isbn.
399	2011-02-03 07:47:04.522622+00	1	10	431	The God Delusion by Dawkins, Richard	2	Changed isbn.
400	2011-02-03 07:48:33.723256+00	1	10	509	River out of Eden by Dawkins, Richard	2	Changed isbn.
401	2011-02-03 07:49:02.236862+00	1	10	507	Climbing Mount Improbable by Dawkins, Richard	2	Changed isbn.
402	2011-02-03 07:50:19.385935+00	1	10	521	Unweaving the Rainbow by Dawkins, Richard	2	Changed isbn.
403	2011-02-03 07:51:44.990136+00	1	10	438	The Blind Watchmaker by Dawkins, Richard	2	Changed isbn.
404	2011-02-03 07:52:12.278771+00	1	10	14	The Selfish Gene by Dawkins, Richard	2	Changed isbn.
405	2011-02-03 07:57:16.193645+00	1	10	651	The Elegant Universe: Superstrings, Hidden Dimensions, and the Quest for the Ultimate Theory by Greene, Brian	2	Changed isbn.
406	2011-02-03 07:57:43.40499+00	1	10	610	The Third Chimpanzee by Diamond, Jared	2	Changed isbn.
407	2011-02-03 07:58:23.858432+00	1	10	503	Relativity: The Special and the General Theory by Einstein, Albert	2	Changed isbn.
408	2011-02-03 07:58:57.578261+00	1	10	13	On the Origin of Species by Darwin, Charles	2	Changed isbn.
409	2011-02-03 07:59:55.563649+00	1	10	647	Big Bang: The most important scientific discovery of all time and why you need to know about it by Singh, Simon	2	Changed isbn.
410	2011-02-03 08:00:39.208373+00	1	10	246	A Brief History of Time by Hawking, Stephen	2	Changed isbn and review.
411	2011-02-03 08:01:19.465874+00	1	10	435	In Search of Schrödinger's Cat: Quantum Physics And Reality by Gribbin, John	2	Changed isbn.
412	2011-02-03 08:02:58.958197+00	1	10	550	Parasite Rex: Inside the Bizarre World of Nature's Most Dangerous Creatures by Zimmer, Carl	2	Changed isbn.
413	2011-02-03 08:06:50.444637+00	1	10	685	The Stuff of Thought by Pinker, Steven	2	Changed isbn.
414	2011-02-03 08:07:16.60474+00	1	10	532	How the Mind Works by Pinker, Steven	2	Changed isbn.
415	2011-02-03 08:07:45.269242+00	1	10	623	The Language Instinct by Pinker, Steven	2	Changed isbn.
416	2011-02-03 08:08:10.407147+00	1	10	701	The Structure of Scientific Revolutions by Kuhn, Thomas S.	2	Changed isbn.
417	2011-02-03 08:08:38.001249+00	1	10	669	A Short History of Nearly Everything by Bryson, Bill	2	Changed isbn.
418	2011-02-03 08:10:53.830514+00	1	10	510	Deep Simplicity: Bringing Order to Chaos and Complexity by Gribbin, John	2	Changed isbn.
419	2011-02-03 08:11:20.398242+00	1	10	670	The Special Theory of Relativity by Bohm, David	2	Changed isbn.
420	2011-02-03 08:11:54.437756+00	1	10	714	Genome by Ridley, Matt	2	Changed isbn.
421	2011-02-03 08:14:19.194698+00	1	10	691	The Red Queen by Ridley, Matt	2	Changed isbn.
422	2011-02-03 08:14:50.523839+00	1	10	660	Why Evolution Is True by Coyne, Jerry A.	2	Changed isbn.
423	2011-02-03 08:17:08.638793+00	1	10	106	New Spring by Jordan, Robert	2	Changed isbn.
424	2011-02-03 08:17:33.025936+00	1	10	96	The Eye of the World by Jordan, Robert	2	Changed isbn.
425	2011-02-03 08:17:55.520503+00	1	10	97	The Great Hunt by Jordan, Robert	2	Changed isbn.
426	2011-02-03 08:18:16.999181+00	1	10	98	The Dragon Reborn by Jordan, Robert	2	Changed isbn.
427	2011-02-03 08:18:43.180905+00	1	10	99	The Shadow Rising by Jordan, Robert	2	Changed isbn.
428	2011-02-03 08:21:09.3726+00	1	10	100	The Fires of Heaven by Jordan, Robert	2	Changed isbn.
429	2011-02-03 08:21:51.832453+00	1	10	101	Lord of Chaos by Jordan, Robert	2	Changed isbn.
430	2011-02-03 08:22:20.683359+00	1	10	102	A Crown of Swords by Jordan, Robert	2	Changed isbn.
431	2011-02-03 08:22:52.517735+00	1	10	103	The Path of Daggers by Jordan, Robert	2	Changed isbn.
432	2011-02-03 08:23:21.845114+00	1	10	104	Winter’s Heart by Jordan, Robert	2	Changed title, english_title and isbn.
433	2011-02-03 08:23:47.106543+00	1	10	105	Crossroads of Twilight by Jordan, Robert	2	Changed isbn.
434	2011-02-03 08:24:08.675127+00	1	10	437	Knife of Dreams by Jordan, Robert	2	Changed isbn.
435	2011-02-03 08:24:47.012407+00	1	10	720	The Gathering Storm by Jordan, Robert; Sanderson, Brandon	2	Changed isbn.
436	2011-02-03 08:29:05.279554+00	1	10	15	A Game of Thrones by Martin, George R. R.	2	Changed isbn.
437	2011-02-03 08:29:29.473454+00	1	10	16	A Clash of Kings by Martin, George R. R.	2	Changed isbn.
438	2011-02-03 08:29:56.444067+00	1	10	17	A Storm of Swords by Martin, George R. R.	2	Changed isbn.
439	2011-02-03 08:30:21.420579+00	1	10	18	A Feast for Crows by Martin, George R. R.	2	Changed isbn.
440	2011-02-04 07:08:43.245479+00	1	10	251	The Adventures of Sherlock Holmes by Doyle, Sir Arthur Conan	2	Changed isbn.
441	2011-02-04 07:08:47.039867+00	1	10	252	The Memoirs of Sherlock Holmes by Doyle, Sir Arthur Conan	2	Changed isbn.
442	2011-02-04 07:08:54.463922+00	1	10	249	The Hound of the Baskervilles by Doyle, Sir Arthur Conan	2	Changed isbn.
443	2011-02-04 07:08:57.817259+00	1	10	253	The Return of Sherlock Holmes by Doyle, Sir Arthur Conan	2	Changed isbn.
444	2011-02-04 07:10:18.149865+00	1	10	250	A Study in Scarlet by Doyle, Sir Arthur Conan	2	Changed isbn.
445	2011-02-04 07:10:30.288237+00	1	10	248	The Sign of Four by Doyle, Sir Arthur Conan	2	Changed title and isbn.
446	2011-02-04 07:11:07.749801+00	1	10	502	The Case-Book of Sherlock Holmes by Doyle, Sir Arthur Conan	2	Changed isbn.
447	2011-02-04 07:22:31.513892+00	1	10	75	The Hitchhiker's Guide to the Galaxy by Adams, Douglas	2	Changed isbn.
448	2011-02-04 07:22:37.595601+00	1	10	76	The Restaurant at the End of the Universe by Adams, Douglas	2	Changed isbn.
449	2011-02-04 07:22:41.324852+00	1	10	77	Life, the Universe, and Everything by Adams, Douglas	2	Changed isbn.
450	2011-02-04 07:22:43.852184+00	1	10	78	So Long, and Thanks For All The Fish by Adams, Douglas	2	Changed isbn.
451	2011-02-04 07:22:47.433043+00	1	10	79	Mostly Harmless by Adams, Douglas	2	Changed isbn.
452	2011-02-04 07:22:48.862415+00	1	10	79	Mostly Harmless by Adams, Douglas	2	No fields changed.
453	2011-02-04 07:24:12.807282+00	1	10	483	The Summer Tree by Kay, Guy Gavriel	2	Changed isbn.
454	2011-02-04 07:24:15.289014+00	1	10	484	The Wandering Fire by Kay, Guy Gavriel	2	Changed isbn.
455	2011-02-04 07:24:18.64016+00	1	10	485	The Darkest Road by Kay, Guy Gavriel	2	Changed isbn.
456	2011-02-04 07:24:50.381144+00	1	10	49	Tigana by Kay, Guy Gavriel	2	Changed isbn.
457	2011-02-04 07:25:11.213294+00	1	10	533	The Last Light of the Sun by Kay, Guy Gavriel	2	Changed isbn.
458	2011-02-04 07:28:39.179574+00	1	10	706	The Poisoner’s Handbook by Blum, Deborah	2	Changed isbn.
459	2011-02-04 07:29:14.910516+00	1	10	659	Poisons: From Hemlock to Botox and the Killer Bean of Calabar by Macinnis, Peter	2	Changed isbn.
460	2011-02-04 07:29:45.465862+00	1	10	577	Cosmos by Sagan, Carl	2	Changed isbn.
461	2011-02-04 07:30:16.426069+00	1	10	648	The Demon-Haunted World: Science as a candle in the dark by Sagan, Carl	2	Changed isbn.
462	2011-02-04 07:31:58.785519+00	1	11	397	Conrad, Joseph	1	
463	2011-02-04 07:32:04.279398+00	1	10	740	Heart of Darkness by Conrad, Joseph	1	
464	2011-02-04 07:32:28.238482+00	1	10	741	The Secret Sharer by Conrad, Joseph	1	
465	2011-02-04 07:37:35.490629+00	1	10	663	Surely you're joking, Mr. Feynman! by Feynman, Richard	2	Changed isbn.
466	2011-02-04 07:39:01.535132+00	1	10	569	An Outline of Philosophy by Russell, Bertrand	2	Changed isbn.
467	2011-02-04 07:40:11.79381+00	1	10	687	History of Western Philosophy by Russell, Bertrand	2	Changed isbn. Changed author for authorship "Authorship object".
468	2011-02-04 07:40:53.431935+00	1	11	350	Russell, Bertrand	3	
469	2011-02-04 07:43:13.488928+00	1	10	581	Breaking the Spell: Religion as a Natural Phenomenon by Dennett, Daniel	2	Changed isbn.
470	2011-02-04 07:43:53.775906+00	1	10	678	Sweet Dreams: Philosophical Obstacles to a Science of Consciousness by Dennett, Daniel	2	Changed isbn.
471	2011-02-04 07:44:23.250414+00	1	10	508	Elbow Room: The varieties of free will worth wanting by Dennett, Daniel	2	Changed isbn.
472	2011-02-04 07:45:03.754281+00	1	10	530	Letter to a Christian Nation by Harris, Sam	2	Changed isbn.
473	2011-02-04 07:50:57.538152+00	1	10	523	Harry Potter and the Deathly Hallows by Rowling, J.K.	2	Changed isbn.
474	2011-02-04 07:51:23.932227+00	1	10	522	Harry Potter and the Half-Blood Prince by Rowling, J.K.	2	Changed isbn.
475	2011-02-04 07:51:54.404857+00	1	10	520	Harry Potter and the Order of the Phoenix by Rowling, J.K.	2	Changed isbn.
476	2011-02-04 07:52:21.976577+00	1	10	519	Harry Potter and the Goblet of Fire by Rowling, J.K.	2	Changed isbn.
477	2011-02-04 07:52:50.06765+00	1	10	518	Harry Potter and the Prisoner of Azkaban by Rowling, J.K.	2	Changed isbn.
478	2011-02-04 07:53:15.742904+00	1	10	517	Harry Potter and the Chamber of Secrets by Rowling, J.K.	2	Changed isbn.
479	2011-02-04 07:53:47.005779+00	1	10	513	Harry Potter and the Philosopher’s Stone by Rowling, J.K.	2	Changed title, english_title and isbn.
480	2011-02-04 08:00:49.284277+00	1	10	83	A Wizard of Earthsea by Le Guin, Ursula K.	2	Changed isbn.
481	2011-02-04 08:00:52.920954+00	1	10	84	The Tombs of Atuan by Le Guin, Ursula K.	2	Changed isbn.
482	2011-02-04 08:00:55.857506+00	1	10	85	The Farthest Shore by Le Guin, Ursula K.	2	Changed isbn.
483	2011-02-04 08:00:57.801804+00	1	10	86	Tehanu by Le Guin, Ursula K.	2	Changed isbn.
484	2011-02-04 08:01:27.753531+00	1	10	492	Orsinian Tales by Le Guin, Ursula K.	2	Changed isbn.
485	2011-02-04 08:01:56.293922+00	1	10	87	The Left Hand of Darkness by Le Guin, Ursula K.	2	Changed isbn and rating.
486	2011-02-04 08:02:24.264829+00	1	10	488	The Dispossessed by Le Guin, Ursula K.	2	Changed isbn.
487	2011-02-04 08:02:45.736229+00	1	10	527	Tales from Earthsea by Le Guin, Ursula K.	2	Changed isbn.
488	2011-02-04 08:05:12.230717+00	1	10	195	Silver on the Tree by Cooper, Susan	2	Changed isbn.
489	2011-02-04 08:05:36.236319+00	1	10	194	The Grey King by Cooper, Susan	2	Changed isbn.
490	2011-02-04 08:05:53.682255+00	1	10	193	Greenwitch by Cooper, Susan	2	Changed isbn.
491	2011-02-04 08:06:12.532126+00	1	10	192	The Dark Is Rising by Cooper, Susan	2	Changed isbn.
492	2011-02-04 08:06:33.637809+00	1	10	191	Over Sea, Under Stone by Cooper, Susan	2	Changed isbn.
493	2011-02-04 08:11:52.384162+00	1	10	572	The Republic by Plátōn	2	Changed isbn.
494	2011-02-04 08:14:14.017333+00	1	10	511	The Iliad by Hómēros	2	Changed isbn.
495	2011-02-04 08:14:47.904313+00	1	16	145	The Iliad (Iliad (Ἰλιάς) by Hómēros), translated by Jones, Peter; Rieu, D. H. C.; Rieu, E. V.	2	Changed isbn.
496	2011-02-04 08:20:30.834533+00	1	10	6	The Odyssey by Hómēros	2	Changed isbn.
497	2011-02-04 08:22:32.296444+00	1	16	1	The Odyssey (Odusseia (Ὀδύσσεια) by Hómēros), translated by Palmer, George H.	2	Changed isbn.
498	2011-02-04 08:23:01.230767+00	1	10	495	The Name of the Rose by Eco, Umberto	2	Changed isbn.
499	2011-02-04 08:23:23.601783+00	1	16	143	The Name of the Rose (Il nome della rosa by Eco, Umberto), translated by Weaver, William	2	Changed isbn.
500	2011-02-04 08:23:46.738432+00	1	10	72	Macbeth by Shakespeare, William	2	Changed isbn.
501	2011-02-04 08:25:41.252781+00	1	10	188	The Amber Spyglass by Pullman, Philip	2	Changed isbn.
502	2011-02-04 08:26:00.522257+00	1	10	187	The Subtle Knife by Pullman, Philip	2	Changed isbn.
503	2011-02-04 08:26:23.875684+00	1	10	186	Northern Lights (The Golden Compass) by Pullman, Philip	2	Changed isbn.
504	2011-02-20 23:14:51.542632+00	1	10	742	The Evolutionary Void by Hamilton, Peter F.	1	
505	2011-02-25 06:44:43.176288+00	1	10	649	I Am Legend by Matheson, Richard	2	Changed isbn.
506	2011-02-25 06:45:18.368495+00	1	10	692	On Her Majesty’s Secret Service by Fleming, Ian	2	Changed isbn.
507	2011-02-25 06:45:55.899051+00	1	10	693	Doctor No by Fleming, Ian	2	Changed isbn.
508	2011-02-25 06:47:08.795341+00	1	10	698	The Spy Who Loved Me by Fleming, Ian	2	Changed isbn.
509	2011-02-25 06:48:40.152229+00	1	10	446	Diamonds Are Forever by Fleming, Ian	2	Changed isbn.
510	2011-02-25 06:51:33.557191+00	1	10	261	The Wonderful Wizard of Oz by Baum, L. Frank	2	Changed isbn.
511	2011-02-25 06:53:19.36308+00	1	10	230	So, You Want to Be Canadian by Colburn, Kerry; Sorensen, Rob	2	Changed isbn.
512	2011-02-25 06:54:07.245199+00	1	10	696	The Man With Two Left Feet and other stories by Wodehouse, P.G.	2	Changed isbn.
513	2011-02-25 06:56:19.414098+00	1	10	710	Joy in the Morning by Wodehouse, P.G.	2	Changed isbn.
514	2011-02-25 06:56:51.426304+00	1	10	131	Jurassic Park by Crichton, Michael	2	Changed isbn.
515	2011-02-25 06:59:30.296457+00	1	10	125	Dracula by Stoker, Bram	2	Changed isbn.
516	2011-02-25 07:02:14.700254+00	1	10	677	The Picture of Dorian Gray by Wilde, Oscar	2	Changed isbn.
517	2011-02-25 07:02:49.156764+00	1	10	676	Spirits of the Dead: Tales and Poems by Poe, Edgar Allan	2	Changed isbn.
518	2011-02-25 07:04:02.485988+00	1	10	684	Moll Flanders by Defoe, Daniel	2	Changed isbn.
519	2011-02-25 07:04:28.465189+00	1	10	436	Great Expectations by Dickens, Charles	2	Changed isbn.
520	2011-02-25 07:05:38.018349+00	1	10	115	It by King, Stephen	2	Changed isbn.
521	2011-02-25 07:06:55.297133+00	1	10	535	The Chinese Garden by Martenson, Jan	2	Changed isbn.
522	2011-02-25 07:10:35.309411+00	1	16	151	Schamanen (Black Fly Season by Blunt, Giles), translated by Järnebrand, Jan	2	Changed isbn.
523	2011-02-25 07:12:14.130839+00	1	10	432	Sails of Stone by Edwardson, Åke	2	Changed isbn.
524	2011-02-25 07:16:10.976676+00	1	10	2	Canterbury Tales by Chaucer, Geoffrey	2	Changed isbn and notes.
525	2011-02-25 07:19:46.708797+00	1	10	470	The War of the Worlds by Wells, H. G.	2	Changed isbn.
526	2011-02-25 07:23:14.675623+00	1	10	214	The Christmas Eve of Karl-Bertil Jonsson by Danielsson, Tage	2	Changed isbn.
527	2011-02-25 07:30:36.840309+00	1	10	668	The Little Black Book of Beer by Cullen, Ruth	2	Changed isbn and notes.
528	2011-02-25 07:33:57.466318+00	1	11	398	Wolter, Annette	1	
529	2011-02-25 07:34:01.773043+00	1	10	743	Understanding and caring for budgies by Wolter, Annette	1	
530	2011-02-25 07:34:53.372942+00	1	11	399	Hallesius, Gunilla	1	
531	2011-02-25 07:34:56.584455+00	1	16	164	Undulater (Wellensittiche richtig pflegen und verstehen by Wolter, Annette), translated by Hallesius, Gunilla	1	
532	2011-02-25 07:37:27.748376+00	1	10	580	Caiques by Gorman, Mary	2	Changed isbn.
533	2011-02-25 07:37:58.586477+00	1	10	514	Guide to a well-behaved parrot by Athan, Mattie Sue	2	Changed isbn.
534	2011-02-25 07:38:29.025005+00	1	10	515	The Parrot Companion by Low, Rosemary	2	Changed isbn.
535	2011-02-25 07:39:13.171155+00	1	16	136	A Book of Five Rings (Go Rin No Sho (五輪書) by Musashi, Miyamoto), translated by Harris, Victor	2	Changed isbn.
536	2011-02-25 07:41:34.902083+00	1	16	134	Karate-dō: My way of life (Karate-dō: My way of life by Funakoshi, Gichin), translated by 	2	Changed isbn.
537	2011-02-25 07:48:51.086274+00	1	16	165	The Way of Karate: Beyond Technique (The Way of Karate: Beyond Technique by Egami, Shigeru), translated by 	1	
538	2011-02-25 07:49:28.557608+00	1	16	2	Karate-Do Kyohan: The Master Text (Karate-dō Kyōhan by Funakoshi, Gichin), translated by Ohshima, Tsutomu	2	Changed isbn.
539	2011-02-25 07:50:31.102643+00	1	10	71	Notes on Training by Ohshima, Tsutomu	2	Changed isbn.
540	2011-02-25 07:59:18.129691+00	1	10	702	Judo Unleashed by Ohlenkamp, Neil	2	Changed isbn and review.
541	2011-02-25 08:06:59.100584+00	1	10	609	The Pragmatic Programmer: From Journeyman to Master by Hunt, Andrew; Thomas, David	2	Changed isbn.
542	2011-02-25 08:07:24.273439+00	1	10	703	Effective C++ by Meyers, Scott	2	Changed isbn.
543	2011-02-25 08:08:55.989721+00	1	11	400	Stroustrup, Bjarne	1	
544	2011-02-25 08:09:00.155242+00	1	10	744	The C++ Programming Language by Stroustrup, Bjarne	1	
545	2011-02-25 08:09:53.604573+00	1	10	526	Design Patterns: Elements of Reusable Object-Oriented Software by Gamma, Erich; Helm, Richard; Johnson, Ralph; Vlissides, John	2	Changed isbn and notes.
546	2011-02-25 08:12:39.946233+00	1	10	147	The Long Ships by Bengtsson, Frans G.	2	Changed isbn and review.
547	2011-02-25 08:35:30.074919+00	1	10	716	Alice’s Adventures in Wonderland by Carroll, Lewis	2	Changed isbn.
548	2011-02-25 08:35:57.48738+00	1	10	717	Through the Looking-Glass by Carroll, Lewis	2	Changed isbn.
549	2011-02-25 08:36:36.95914+00	1	10	718	Bad Science by Goldacre, Ben	2	Changed isbn.
550	2011-02-25 08:37:09.874677+00	1	10	721	Nonsense On Stilts by Pigliucci, Massimo	2	Changed isbn.
551	2011-02-25 08:37:40.398298+00	1	10	711	Trouble Is My Business by Chandler, Raymond	2	Changed isbn.
552	2011-02-25 08:38:24.065196+00	1	10	712	The Big Sleep by Chandler, Raymond	2	Changed isbn.
553	2011-02-25 08:40:09.464143+00	1	10	449	The Fountainhead by Rand, Ayn	2	Changed isbn.
554	2011-02-25 08:40:30.377107+00	1	10	454	We the Living by Rand, Ayn	2	Changed isbn.
555	2011-02-26 08:58:23.684878+00	1	10	505	Moby-Dick by Melville, Herman	2	Changed isbn.
556	2011-02-26 08:59:29.692493+00	1	10	116	Needful Things by King, Stephen	2	Changed isbn.
557	2011-02-26 09:00:54.481007+00	1	12	61	The Dark Tower	1	
558	2011-02-26 09:00:58.095883+00	1	10	745	The Gunslinger by King, Stephen	1	
559	2011-02-26 09:02:04.207917+00	1	10	216	On Writing by King, Stephen	2	Changed isbn.
560	2011-02-26 09:02:32.744525+00	1	10	442	The Eyes of the Dragon by King, Stephen	2	Changed isbn.
561	2011-02-26 09:06:31.411707+00	1	10	73	Othello by Shakespeare, William	2	Changed isbn.
562	2011-02-26 09:07:04.874664+00	1	10	497	The Winter’s Tale by Shakespeare, William	2	Changed title, english_title and isbn.
563	2011-02-26 09:11:57.261621+00	1	10	722	Fermat’s Enigma by Singh, Simon	2	Changed isbn.
564	2011-02-26 09:12:30.622767+00	1	10	12	The Code Book by Singh, Simon	2	Changed isbn.
565	2011-02-26 09:20:47.681657+00	1	10	531	Judas Unchained by Hamilton, Peter F.	2	Changed isbn.
566	2011-02-26 09:21:15.079347+00	1	10	709	Fallen Dragon by Hamilton, Peter F.	2	Changed isbn.
567	2011-02-26 09:21:39.999884+00	1	10	529	Pandora's Star by Hamilton, Peter F.	2	Changed isbn.
568	2011-02-26 09:22:07.100374+00	1	10	233	The Naked God by Hamilton, Peter F.	2	Changed isbn.
569	2011-02-26 09:22:37.0563+00	1	10	232	The Neutronium Alchemist by Hamilton, Peter F.	2	Changed isbn.
570	2011-02-26 09:22:59.715167+00	1	10	231	The Reality Dysfunction by Hamilton, Peter F.	2	Changed isbn.
571	2011-02-26 09:28:15.290719+00	1	10	707	Infidel by Hirsi Ali, Ayaan	2	Changed isbn.
572	2011-02-26 09:28:39.693402+00	1	10	616	The Sexual Spectrum by Johnson, Olive Skene	2	Changed isbn.
573	2011-02-26 09:29:10.957678+00	1	10	674	Bonk: The Curious Coupling of Science and Sex by Roach, Mary	2	Changed isbn.
574	2011-02-26 09:29:33.599513+00	1	10	587	The Ethical Slut by Easton, Dossie; Liszt, Catherine A.	2	Changed isbn.
575	2011-02-26 09:30:26.996663+00	1	10	622	Tricks... To please a woman by Wiseman, Jay	2	Changed isbn.
576	2011-02-26 09:31:22.011421+00	1	10	705	The Hunt for Red October by Clancy, Tom	2	Changed isbn.
577	2011-02-26 09:32:35.070307+00	1	10	213	The Lurker at the Threshold by Derleth, August; Lovecraft, H.P.	2	Changed isbn.
578	2011-02-26 09:33:00.023123+00	1	10	464	Starship Troopers by Heinlein, Robert	2	Changed isbn.
579	2011-02-26 09:33:30.713531+00	1	10	713	Gormenghast by Peake, Mervyn	2	Changed isbn.
580	2011-02-26 09:33:54.036204+00	1	10	713	Gormenghast by Peake, Mervyn	2	Changed isbn.
581	2011-02-26 09:33:57.109881+00	1	10	713	Gormenghast by Peake, Mervyn	2	No fields changed.
582	2011-02-26 09:34:27.292082+00	1	10	708	Titus Groan by Peake, Mervyn	2	Changed isbn.
583	2011-02-26 09:41:40.11521+00	1	10	619	Jay Wiseman's Erotic Bondage Handbook by Wiseman, Jay	2	Changed isbn.
584	2011-02-26 09:42:14.212642+00	1	10	617	Partners in Power: Living in a kinky relationship by Rinella, Jack	2	Changed isbn.
585	2011-02-26 09:42:50.786595+00	1	10	274	The Eye in the Pyramid by Shea, Robert; Wilson, Robert A.	2	Changed isbn.
586	2011-02-26 09:42:53.76375+00	1	10	286	The Golden Apple by Shea, Robert; Wilson, Robert A.	2	Changed isbn.
587	2011-02-26 09:42:57.524185+00	1	10	287	Leviathan by Shea, Robert; Wilson, Robert A.	2	Changed isbn.
588	2011-02-26 09:44:51.507871+00	1	11	401	White, T.H.	1	
589	2011-02-26 09:44:57.237718+00	1	10	746	The Once And Future King by White, T.H.	1	
590	2011-02-26 09:49:17.867495+00	1	11	402	Blædel, Sara	1	
591	2011-02-26 09:49:21.956378+00	1	10	747	Call me Princess by Blædel, Sara	1	
592	2011-02-26 09:50:10.738995+00	1	11	403	Eriksson, Mona	1	
593	2011-02-26 09:50:13.423534+00	1	16	166	Kalla mig prinsessa (Kald mig prinsesse by Blædel, Sara), translated by Eriksson, Mona	1	
594	2011-02-26 09:50:34.814318+00	1	10	747	Call me Princess by Blædel, Sara	2	Changed isbn.
595	2011-02-26 09:51:05.790501+00	1	10	747	Call me Princess by Blædel, Sara	2	Changed title.
596	2011-02-26 09:51:37.442812+00	1	10	433	The Stonecutter by Läckberg, Camilla	2	Changed isbn.
597	2011-02-26 09:52:42.248406+00	1	11	404	Stolpe, Jan	1	
598	2011-02-26 09:52:44.918918+00	1	16	131	Bokhandlaren i Kabul (Bokhandleren i Kabul: et familiedrama by Seierstad, Åsne), translated by Stolpe, Jan	2	Changed isbn. Added translator "Translator object".
599	2011-02-26 09:53:27.36191+00	1	10	592	A Completely Different Story by Nessler, Håkan	2	Changed isbn.
600	2011-02-26 09:57:40.638349+00	1	11	405	Silverberg, Robert	1	
601	2011-02-26 09:58:08.348028+00	1	11	406	Feist, Raymond E.	1	
602	2011-02-26 09:58:25.800571+00	1	10	407	Legends by Card, Orson Scott; Feist, Raymond E.; Goodkind, Terry; King, Stephen; Le Guin, Ursula K.; Silverberg, Robert	2	Changed isbn and notes. Added authorship "Authorship object". Added authorship "Authorship object". Added authorship "Authorship object". Added authorship "Authorship object". Added authorship "Authorship object". Changed author for authorship "Authorship object".
603	2011-02-26 10:01:32.052719+00	1	10	699	The Last Watch by Lukyanenko, Sergey	2	Changed isbn.
604	2011-02-26 10:02:22.561464+00	1	10	665	Twilight Watch by Lukyanenko, Sergey	2	Changed isbn.
605	2011-02-26 10:02:47.972751+00	1	10	664	Day Watch by Lukyanenko, Sergey	2	Changed isbn.
606	2011-02-26 10:03:15.30502+00	1	10	459	The Night Watch by Lukyanenko, Sergey	2	Changed isbn.
607	2011-02-26 10:05:08.603122+00	1	10	719	Red Seas Under Red Skies by Lynch, Scott	2	Changed isbn.
608	2011-02-26 10:05:30.65839+00	1	10	655	The Lies of Locke Lamora by Lynch, Scott	2	Changed isbn.
609	2011-02-26 10:06:20.835687+00	1	10	481	Mona Lisa Overdrive by Gibson, William	2	Changed isbn.
610	2011-02-26 10:07:00.663026+00	1	10	540	Rob Roy by Scott, Sir Walter	2	Changed isbn.
611	2011-02-26 10:09:26.693699+00	1	10	621	Code Complete: A Practical Handbook of Software Construction by McConnell, Steve	2	Changed isbn.
612	2011-02-26 10:13:32.654206+00	1	11	407	Hall, Brian	1	
613	2011-02-26 10:13:39.938969+00	1	10	748	Beej’s Guide to Network Programming Using Internet Sockets by Hall, Brian	1	
614	2011-02-26 10:14:08.749711+00	1	10	325	Hackers & painters by Graham, Paul	2	Changed isbn.
615	2011-02-26 10:14:53.015946+00	1	10	666	Foundations of Security: What Every Programmer Needs To Know by Daswani, Neil; Kern, Cristoph; Kesavan, Anita	2	Changed title, english_title and isbn.
616	2011-02-26 10:16:34.781526+00	1	10	130	Do Androids Dream of Electric Sheep? by Dick, Philip K.	2	Changed isbn.
617	2011-02-26 10:17:05.612722+00	1	10	448	Brave New World by Huxley, Aldous	2	Changed isbn.
618	2011-02-26 10:21:14.419698+00	1	10	525	The Elements of Style by Strunk, William; White, E.B.	2	Changed isbn.
619	2011-02-26 10:22:27.775553+00	1	10	595	Eye in the Sky by Dahl, Arne	2	Changed title, english_title and isbn.
620	2011-04-18 04:54:00.653853+00	1	10	234	The Colour of Magic by Pratchett, Terry	2	Changed isbn and notes.
621	2011-04-18 04:55:40.605973+00	1	11	408	Malory, Sir Thomas	1	
622	2011-04-18 04:55:58.372312+00	1	12	62	Le Morte D’Arthur	1	
623	2011-04-18 04:56:04.772063+00	1	10	749	Le Morte D’Arthur, volume 1 by Malory, Sir Thomas	1	
624	2011-04-18 04:57:15.072754+00	1	10	750	Le Morte D’Arthur, volume 2 by Malory, Sir Thomas	1	
625	2011-04-18 04:58:40.362163+00	1	11	409	Asprin, Robert	1	
626	2011-04-18 04:59:00.996891+00	1	12	63	The Myth Books	1	
627	2011-04-18 04:59:06.435837+00	1	10	751	Another Fine Myth by Asprin, Robert	1	
628	2011-04-18 04:59:51.826753+00	1	10	752	Myth Conceptions by Asprin, Robert	1	
629	2011-04-18 05:00:28.272451+00	1	10	753	Myth Directions by Asprin, Robert	1	
630	2011-04-18 05:01:30.350857+00	1	10	754	The Chinese Man by Mankell, Henning	1	
631	2011-04-18 05:02:24.113804+00	1	10	1	American Gods by Gaiman, Neil	2	Changed isbn.
632	2011-04-18 05:03:59.430499+00	1	16	28	Candide (Candide, ou l'Optimisme by Voltaire), translated by 	2	Changed language and isbn.
633	2011-04-18 05:04:55.804675+00	1	10	755	Soul Made Flesh by Zimmer, Carl	1	
634	2011-04-18 05:05:37.781948+00	1	10	756	A Planet of Viruses by Zimmer, Carl	1	
635	2011-04-18 05:06:46.207016+00	1	11	410	Kallentoft, Mons	1	
636	2011-04-18 05:06:49.049119+00	1	10	757	Death in the summer by Kallentoft, Mons	1	
637	2011-04-22 16:42:04.487371+00	1	10	758	Titus Alone by Peake, Mervyn	1	
638	2011-04-22 16:43:00.071012+00	1	12	64	The Gormenghast Trilogy	1	
639	2011-05-08 04:13:50.568613+00	1	11	411	White. E.B.	1	
640	2011-05-08 04:14:02.464032+00	1	10	759	Charlotte’s Web by White. E.B.	1	
641	2011-05-08 04:15:27.546808+00	1	11	412	Hemingway, Ernest	1	
642	2011-05-08 04:15:43.874966+00	1	10	760	The Sun Also Rises by Hemingway, Ernest	1	
643	2011-05-08 04:19:12.201158+00	1	11	413	Mason, Michael Paul	1	
644	2011-05-08 04:19:19.240831+00	1	10	761	Head Cases: Stories of Brain Injury and Its Aftermath by Mason, Michael Paul	1	
645	2011-05-08 04:21:26.213167+00	1	11	414	Mitchell, David	1	
646	2011-05-08 04:21:42.876454+00	1	11	415	Webb, Robert	1	
647	2011-05-08 04:21:46.496622+00	1	10	762	This Mitchell and Webb Book by Mitchell, David; Webb, Robert	1	
648	2011-05-08 05:49:48.564479+00	1	10	761	Head Cases: Stories of Brain Injury and Its Aftermath by Mason, Michael Paul	2	Changed review.
649	2011-05-08 05:51:55.340574+00	1	10	761	Head Cases: Stories of Brain Injury and Its Aftermath by Mason, Michael Paul	2	Changed rating.
650	2011-07-06 16:08:19.392505+00	1	11	416	Judson, Horace Freeland	1	
651	2011-07-06 16:08:27.344514+00	1	10	763	The Eighth Day of Creation: The Makers of the Revolution in Biology by Judson, Horace Freeland	1	
652	2011-08-14 18:37:06.691758+00	1	11	417	Ramachandran, V.S.	1	
653	2011-08-14 18:37:29.114306+00	1	11	418	Blakeslee, Sanda	1	
654	2011-08-14 18:37:33.643698+00	1	10	764	Phantoms in the Brain: Probing the mysteries of the human mind by Blakeslee, Sanda; Ramachandran, V.S.	1	
655	2011-08-14 18:39:17.870926+00	1	10	761	Head Cases: Stories of Brain Injury and Its Aftermath by Mason, Michael Paul	2	Changed review.
656	2011-08-14 18:49:33.746823+00	1	11	419	Davies, Paul	1	
657	2011-08-14 18:49:37.560017+00	1	10	765	The Matter Myth: Dramatic Discoveries That Challenge Our Understanding of Physical Reality by Davies, Paul; Gribbin, John	1	
658	2011-08-14 18:51:03.859028+00	1	11	420	Garner, James Finn	1	
659	2011-08-14 18:51:06.186127+00	1	10	766	Politically Correct Bedtime Stories by Garner, James Finn	1	
660	2011-08-14 18:59:49.179419+00	1	10	767	In Search of the Multiverse by Gribbin, John	1	
661	2011-08-14 19:03:14.995343+00	1	10	768	A Dance with Dragons by Martin, George R. R.	1	
662	2011-08-14 19:12:54.884675+00	1	10	768	A Dance with Dragons by Martin, George R. R.	2	Added volume "Volume object".
663	2011-08-17 01:59:33.406575+00	1	10	769	Zodiac by Stephenson, Neal	1	
664	2011-08-21 03:27:32.669794+00	1	11	421	Bacigalupi, Paolo	1	
665	2011-08-21 03:27:39.304273+00	1	10	770	The Windup Girl by Bacigalupi, Paolo	1	
666	2011-08-28 21:24:47.74561+00	1	11	422	Wiseman, Richard	1	
667	2011-08-28 21:24:51.742904+00	1	10	771	59 seconds: Change your life in under a minute by Wiseman, Richard	1	
668	2011-09-18 04:08:28.198345+00	1	11	423	Valenti, Jessica	1	
669	2011-09-18 04:08:33.371511+00	1	10	772	He’s a stud, she’s a slut: And 49 other double standards every woman should know by Valenti, Jessica	1	
670	2011-10-09 07:18:58.359607+00	1	10	773	Maskerade by Pratchett, Terry	1	
671	2011-10-09 07:19:55.713355+00	1	10	774	Night Watch by Pratchett, Terry	1	
672	2011-10-09 07:20:56.627572+00	1	10	775	Lords and Ladies by Pratchett, Terry	1	
673	2011-10-09 07:22:54.783399+00	1	11	424	Randi, James	1	
674	2011-10-09 07:23:00.729962+00	1	10	776	Flim-flam! by Randi, James	1	
675	2011-10-22 05:49:20.027484+00	1	11	425	Gracie, Renzo	1	
676	2011-10-22 05:49:46.914944+00	1	11	426	Danaher, John	1	
677	2011-10-22 05:49:52.511212+00	1	10	777	Mastering Jujitsu by Danaher, John; Gracie, Renzo	1	
678	2011-10-22 05:51:12.259268+00	1	10	778	Bitchfest by 	1	
679	2011-11-14 04:14:59.307136+00	1	11	427	Robinson, Kim Stanley	1	
680	2011-11-14 04:15:04.384842+00	1	10	779	Red Mars by Robinson, Kim Stanley	1	
681	2011-12-12 04:09:11.785033+00	1	11	428	Levitin, Daniel J.	1	
682	2011-12-12 04:09:22.207395+00	1	10	780	This is your brain on music by Levitin, Daniel J.	1	
683	2011-12-12 04:15:40.315534+00	1	11	429	Crawford, Julia	1	
684	2011-12-12 04:16:10.885379+00	1	11	430	Dunbar, Ian	1	
685	2011-12-12 04:16:32.032901+00	1	11	431	McLennan, Bardi	1	
686	2011-12-12 04:16:35.973887+00	1	10	781	The Bernese Mountain Dog by Crawford, Julia; Dunbar, Ian; McLennan, Bardi	1	
687	2011-12-16 04:19:14.315417+00	1	11	432	Corbett, Jim	1	
688	2011-12-16 04:19:22.715333+00	1	10	782	Man-Eaters of Kumaon by Corbett, Jim	1	
689	2011-12-16 04:23:03.030098+00	1	10	782	Man-Eaters of Kumaon by Corbett, Jim	2	Changed rating.
690	2012-01-13 16:15:26.041238+00	1	12	65	The Mars Trilogy	1	
691	2012-01-13 16:15:34.927937+00	1	10	779	Red Mars by Robinson, Kim Stanley	2	Added volume "Volume object".
692	2012-01-13 16:16:16.003007+00	1	10	783	Green Mars by Robinson, Kim Stanley	1	
693	2012-01-13 16:16:29.483769+00	1	10	783	Green Mars by Robinson, Kim Stanley	2	Added volume "Volume object".
694	2012-01-13 16:18:29.810387+00	1	10	784	Blue Mars by Robinson, Kim Stanley	1	
695	2012-01-13 16:20:09.31243+00	1	10	785	The Code of the Woosters by Wodehouse, P.G.	1	
696	2012-01-13 16:21:27.774173+00	1	10	786	Letters from Father Christmas by Tolkien, J.R.R.	1	
697	2012-01-13 16:23:37.549244+00	1	11	433	Jones, Terry	1	
698	2012-01-13 16:25:30.339732+00	1	10	787	Starship Titanic by Adams, Douglas; Jones, Terry	1	
699	2012-01-13 16:36:15.028869+00	1	11	434	Virgil	1	
700	2012-01-13 16:36:57.351842+00	1	10	788	The Aeneid by Virgil	1	
701	2012-01-13 16:37:17.091105+00	1	10	788	The Aeneid by Virgil	2	Changed language.
702	2012-01-13 16:38:05.797112+00	1	11	435	Fagles, Robert	1	
703	2012-01-13 16:38:09.62234+00	1	16	167	The Aeneid (Aeneis by Virgil), translated by Fagles, Robert	1	
704	2012-01-15 19:42:47.419829+00	1	10	789	The Man Who Fought Alone by Donaldson, Stephen R.	1	
705	2012-01-15 19:43:57.610473+00	1	10	790	The Man Who Risked His Partner by Donaldson, Stephen R.	1	
706	2012-02-13 05:07:34.419272+00	1	10	791	The Land that Time Forgot by Burroughs, Edgar Rice	1	
707	2012-02-13 05:59:52.082128+00	1	10	792	The Tell-Tale Brain by Ramachandran, V.S.	1	
708	2012-02-13 06:04:21.160025+00	1	11	436	Larsson, Stieg	1	
709	2012-02-13 06:04:27.704236+00	1	10	793	The Girl with the Dragon Tattoo by Larsson, Stieg	1	
710	2012-02-13 06:08:26.359738+00	1	10	794	Alex and me by 	1	
711	2012-02-13 06:09:39.400008+00	1	10	795	Thank you, Jeeves! by Wodehouse, P.G.	1	
712	2012-02-13 06:10:29.289574+00	1	10	796	Mulliner Nights by Wodehouse, P.G.	1	
713	2012-02-13 06:12:36.021341+00	1	10	797	Leave it to Psmith by Wodehouse, P.G.	1	
714	2012-02-13 06:21:32.613586+00	1	11	437	Stenger, Victor	1	
715	2012-02-13 06:21:37.342531+00	1	10	798	The Fallacy of Fine-Tuning by Stenger, Victor	1	
716	2012-02-23 05:07:57.159392+00	1	10	794	Alex and me by Pepperberg, Irene	2	Added authorship "Authorship object".
717	2012-02-23 05:18:18.937681+00	1	10	799	Lord Valentine’s Castle by Silverberg, Robert	1	
718	2012-02-23 05:19:45.936609+00	1	3	1	petter	2	Changed first_name and last_name.
719	2012-03-03 19:15:52.430019+00	1	10	800	Aunts Aren’t Gentlemen by Wodehouse, P.G.	1	
720	2012-03-11 00:20:31.543393+00	1	10	801	Legacy of Kings by Friedman, C.S.	1	
721	2012-04-21 22:56:00.06276+00	1	11	438	Carrier, Richard	1	
722	2012-04-21 22:56:02.642799+00	1	10	802	Sense and Goodness Without God: Defense of Metaphysical Naturalism by Carrier, Richard	1	
723	2012-04-24 06:45:04.028876+00	1	10	803	Unseen Academicals by Pratchett, Terry	1	
724	2012-04-24 06:46:09.687846+00	1	10	804	The Missionary Position by Hitchens, Cristopher	1	
725	2012-04-24 06:47:21.886398+00	1	10	805	The Mating Season by Wodehouse, P.G.	1	
726	2012-04-24 07:08:32.177442+00	1	10	806	God—The Failed Hypothesis: How Science Shows That God Does Not Exist by Stenger, Victor	1	
727	2012-05-14 01:59:13.874815+00	1	10	807	The Book of Merlyn by White, T.H.	1	
728	2012-05-14 02:00:32.253476+00	1	10	808	Jeeves in the Offing by Wodehouse, P.G.	1	
729	2012-07-08 18:13:38.811037+00	1	10	809	Mistborn by Sanderson, Brandon	1	
730	2012-07-29 04:32:33.233438+00	1	12	66	Mistborn	1	
731	2012-07-29 04:32:37.640929+00	1	10	810	The Well of Ascension by Sanderson, Brandon	1	
733	2012-12-02 03:18:44.95077+00	1	10	812	The Hero of Ages by Sanderson, Brandon	1	
734	2012-12-02 03:20:08.634711+00	1	10	813	A Second Chance at Eden by Hamilton, Peter F.	1	
735	2012-12-02 03:21:44.139055+00	1	10	814	Bad Astronomy: Misconceptions and Misuses Revealed, from Astrology to the Moon Landing “Hoax” by Plait, Phil	1	
736	2012-12-21 05:41:25.882564+00	1	10	815	Witches Abroad by Pratchett, Terry	1	
737	2012-12-21 05:47:29.899131+00	1	10	816	Moving Pictures by Pratchett, Terry	1	
738	2012-12-21 05:47:54.974342+00	1	10	817	Reaper Man by Pratchett, Terry	1	
739	2012-12-23 02:33:46.467287+00	1	11	439	Brontë, Emily	1	
740	2012-12-23 02:33:49.309314+00	1	10	818	Wuthering Heights by Brontë, Emily	1	
741	2012-12-30 21:46:46.684924+00	1	11	440	Marzluff, John	1	
742	2012-12-30 21:47:04.233421+00	1	11	441	Angell, Tony	1	
743	2012-12-30 21:48:56.215332+00	1	10	819	Gifts of the Crow: How Perception, Emotion, and Thought Allow Smart Birds to Behave Like Humans by Angell, Tony; Marzluff, John	1	
744	2013-02-05 06:33:27.849435+00	1	10	820	Men at Arms by Pratchett, Terry	1	
745	2013-02-05 07:17:16.426249+00	1	10	821	Blandings Castle by Wodehouse, P.G.	1	
746	2013-02-05 07:18:43.031174+00	1	12	67	Coq Rouge	1	
747	2013-02-05 07:18:56.428533+00	1	10	822	No Man's Land by Guillou, Jan	1	
748	2013-02-05 07:20:07.81586+00	1	10	823	Barron's Guide to Companion Parrot Behavior by Athan, Mattie Sue	1	
749	2013-02-05 07:21:38.932869+00	1	10	824	Interesting Times by Pratchett, Terry	1	
750	2013-02-05 07:23:05.231024+00	1	10	825	Pirate Latitudes by Crichton, Michael	1	
751	2013-02-22 16:53:15.259109+00	1	11	442	Huseby, Sverre	1	
752	2013-02-22 16:53:20.467435+00	1	10	826	Innocent Code: A Security Wake-up Call for Web Programmers by Huseby, Sverre	1	
753	2013-02-22 16:54:46.664458+00	1	11	443	Schneier, Bruce	1	
754	2013-02-22 16:54:51.345484+00	1	10	827	Schneier on Security by Schneier, Bruce	1	
755	2013-02-22 16:58:32.708288+00	1	11	444	Maguire, Steve	1	
756	2013-02-22 16:58:35.749199+00	1	10	828	Debugging the Development Process by Maguire, Steve	1	
757	2013-05-20 03:07:18.314843+00	1	11	445	Goldman, William	1	
758	2013-05-20 03:07:21.356784+00	1	10	829	The Princess Bride by Goldman, William	1	
759	2013-05-20 03:15:04.845184+00	1	11	446	Sun Tzu (孫武)	1	
760	2013-05-20 03:15:10.683952+00	1	10	830	The Art of War by Sun Tzu (孫武)	1	
761	2013-05-20 03:15:39.615474+00	1	10	830	The Art of War by Sun Tzu (孫武)	2	No fields changed.
762	2013-05-20 03:17:03.955055+00	1	11	447	Wright, Lawrence	1	
763	2013-05-20 03:17:08.056681+00	1	10	831	Going Clear: Scientology, Hollywood, & the Prison of Belief by Wright, Lawrence	1	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 763, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	message	auth	message
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	log entry	admin	logentry
9	author	editor	author
10	book	editor	book
11	person	editor	person
12	series	editor	series
13	volume	editor	volume
14	translator	editor	translator
15	language	editor	language
16	translation	editor	translation
17	authorship	editor	authorship
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
e693b9cac97941250e80a9cfbb3413e6	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-02-14 21:29:54.921812+00
9dc97226d82c2b8bf43979f28567b788	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-03-05 03:53:47.033815+00
f1717d3a0f7681b34db05f6b129ff347	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-02-07 03:19:04.260612+00
c20994bbb9cef0d30d81aa70e163d2c2	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-04-04 03:10:06.06474+00
bc52381272437f1e2ad253c536b5bfb5	gAJ9cQEuNGFkZTVjYzI1NzlmMTEwZDViOTFlZTQ5N2MyZWFjMWE=\n	2011-02-24 07:41:56.544276+00
096074553a9ac3e2000e0d820c0b8f79	gAJ9cQEuNGFkZTVjYzI1NzlmMTEwZDViOTFlZTQ5N2MyZWFjMWE=\n	2011-03-03 08:37:35.064998+00
5561e880fef219244a8ec3e6bf4386c5	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-04-19 01:11:16.697114+00
7ae44fb2f77b3ac62f87edb37453d999	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-05-16 02:46:11.693189+00
586db16aee454a7ec9cdaa51483fb559	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-07-19 00:41:41.949884+00
3d04c5e508c16959ba127283c77c7929	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-10-26 02:45:04.262104+00
9dc56368c389b3752336f8e824762e32	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-11-29 03:42:28.616992+00
fb7063b0867453a70cb690bed84a2520	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2010-12-13 05:28:47.922071+00
5028253bb3289ad9565615bb1599da91	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-01-03 03:49:10.139862+00
c41b83c42add122830b39771e3cc387a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-01-17 13:44:17.382358+00
a8cf15af41f43f2efadadeb4551b1f07	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-03-06 23:13:35.542019+00
3b9f173a7f640ae6503f79d530cae75b	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-03-12 08:58:20.003899+00
63b72f954b9e6c64efdcddab8f64e658	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-05-02 04:52:34.81511+00
a9fffeaa990678043d364ebc4928cddb	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-05-22 04:08:24.19243+00
567b112ef6dfe6ed5758fa6a2983bcc3	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1Ljc2MThkMjhmMTM3NmIwZGUwYzEz\nN2U5ODQwNDQ0Njhm\n	2011-07-20 16:03:12.280499+00
55b8ecfe820089720cd6ef19785be08b	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-08-28 18:31:03.608708+00
739fab4237fb89da75825312ad6129b0	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-09-11 21:22:47.490327+00
09d0be492289ac6daa9a33569c306477	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-02 04:06:19.10897+00
9142c585eec0fe90b8d941482f4250ab	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-23 07:17:20.538852+00
b14fee97efcdd75bb92f736f0c8c61ac	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-05 05:48:40.163502+00
a236106316f03312f2a98d16709a1b4e	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-28 04:12:06.471937+00
70a269910ed9afb2316f5486c5b12b7c	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-26 04:07:36.201902+00
c13b2ae24e97d3afd974fd7fd421ddf1	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-01-27 16:13:51.286671+00
21fd87b08dce6a90ef930a69191c915c	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-02-27 05:04:39.494099+00
baa56b6180a0d37cab118a2a5e142ef1	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-03-08 04:57:25.108448+00
3ca69471163f4a14bea9a5f3efd9f5e0	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-03-11 11:07:37.428526+00
829cba2994e86d4eae74e35bb463cfd8	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-03-17 18:14:25.495019+00
2438c38fee66a0db7adba4b996c07cf8	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-05-05 22:54:37.023626+00
d948cb23a2c3ae331f046f395e2b0fec	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-05-28 01:45:20.756019+00
a2530e2ddede80506a2f97eb172c1cab	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2013-03-08 16:50:47.718687+00
ub2o7h652iwc2z0u3xv3kqvltbamdd2m	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2013-04-13 06:21:40.355043+00
wba43npn89mezjdcm4n1c4ouz7ompj16	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2013-06-03 03:05:00.557487+00
b4cf672306ebe3a6fab546db50b2a8b7	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-07-22 18:12:41.173826+00
tcv57tphrebhfd1ia3iq2z5oyv5dwlvc	YTA0NjZjYWMxYzMxMzg1YTEzYTk1ODc0YTQxMmZhMDg5NjE3ODhkMjqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-06-03 03:05:16.023044+00
d2c78f0ff00131a790692b0f606231a8	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-08-12 04:31:13.091824+00
78d89551c64d5ea3630f4bb004aa5b73	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-12-16 01:24:39.474728+00
c5de70086d50440b59a2c086fe899e69	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-12-16 01:24:43.993718+00
29a700a45030fc4d715978a201ddd9c4	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-12-16 07:03:01.204078+00
5e6742b9c0e7c5b3f178d90b82b6fd19	OTA2MjNjNDg5Mjc1ZTQ2ZGJiYzVkYmIyNGMzYWY5MTcyMDJlYjU2NjqAAn1xAS4=\n	2012-11-05 23:57:22.276592+00
du9tluldnn4qgg24uq233gb17hang3q8	YTA0NjZjYWMxYzMxMzg1YTEzYTk1ODc0YTQxMmZhMDg5NjE3ODhkMjqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-06-04 08:28:45.413424+00
vxd0cztbhubnp47161nqxbpr3cugauab	YTA0NjZjYWMxYzMxMzg1YTEzYTk1ODc0YTQxMmZhMDg5NjE3ODhkMjqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-06-06 06:52:20.278227+00
682222a45f93562dc44dee7a1ca50e86	OTA2MjNjNDg5Mjc1ZTQ2ZGJiYzVkYmIyNGMzYWY5MTcyMDJlYjU2NjqAAn1xAS4=\n	2012-12-16 00:31:47.446834+00
c0b55b11452ec583cc5db8aeda0ec30e	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2013-01-04 05:40:42.468863+00
6074246f7307879ed5d444d3f9734cd7	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2013-01-04 05:40:46.029615+00
4b14ee212860e69f2288c6541461f924	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2013-01-06 02:33:05.875494+00
99f3d415a0b3affb0757a4d312d34d32	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2013-01-13 21:45:14.423778+00
10333786fe21f3695e1f71179ed51976	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2013-01-13 21:45:27.510419+00
9a9cb8c1ece863bb97bac45e05326ed7	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2013-01-24 03:55:33.606458+00
3f5c787912210a33225d9efad87eafff	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2013-01-27 03:13:16.969945+00
18598dbf70fa2b0a14f73b02ddb43334	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2013-02-19 06:32:16.462154+00
49ff912cfce9b27a2963625957f94eeb	MDRlOWMyNTU5NGZlZTgwZjFlMWYwODkxOTdjMzU4YWFiYzEwNTYzZjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2013-02-19 06:32:19.697388+00
61fbf2a9f8a2bc8aef7b7052f813a42a	MGRhMzI4ZmYwNDY4YjQ2ZTZhODA1YjgzMjA3NDZiYjM1ZjYxZTRiNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2013-03-08 16:50:42.204263+00
pun6nw049n129f8ae7052psws5lixwsy	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-05-06 04:22:15.503024+00
s79boiqlo9vv1w8jvnbvqnm3x3puyo2e	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-05-06 04:22:15.666219+00
y5p99p9tniq89cfvxb4d4a8x46kxxqn4	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-05-24 12:34:55.206224+00
9y4tt80ys67bzh0joo31tcdcd78za0zg	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-05-26 04:40:49.604119+00
uwlgcf6l8wli8sslhkwrkkjsfo3md5pr	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-05-26 04:41:00.898182+00
kyvtsm61msx1stki20m489sonafysucf	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-07-12 08:41:18.581025+00
5sxxbx0h6behqof53dkkb79nb9qux3ig	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-08-24 16:58:12.827977+00
lnrc2u8an4myh2uskye41zenimcnf58g	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-08-31 10:57:40.765935+00
4s4hrv8b44hmh8zlmwmuc9chptznyq1s	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-10-20 11:32:39.583505+00
drkqu2z3qjnn0897w1g3h7xaxlmfbik3	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-11-02 07:47:09.301289+00
vuem27y4yjsn84tw10gsxfni1cvnarcv	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-11-15 15:26:59.841322+00
jkf4qgwrolhim8mnjfcmox6xq4qdvyqk	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-01-31 09:17:15.773581+00
eg5tpweryf4poge8kw4q607yejpys8hv	MWE1MTYwM2IwYjA4ZTc3OTU1MmI1NjE0MjQwNmVkZTBjMjNhZDU1YzqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==	2015-03-11 13:16:01.413047+00
qdss1as6yovobhnr82sz60ozrjsoj026	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.172509+00
t34sc887foj1iz1cx77xg9t52e405be1	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.172545+00
bky0rm9x47mbsdbgl6ujj1gwkvxp8pog	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.21723+00
1gye0vg97eu18btfvvz80e6123x22r3a	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.221234+00
5vbjbv1d0h0rb913izky9aahs11qbejc	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.251822+00
xz2zwh2xrnvbg239auwmsbnckgak950d	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.258832+00
e322qrcm91wcl9avd8onzw43w49kymf3	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.283223+00
nstdvd3ui108htdjjn3rom0d1hmgug1w	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.293263+00
orfnwbqzq0t2vi089wrj98bkwvmib87k	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.313992+00
a9m6qfjc00dqlhndztfsr9xncv5z21ph	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.329731+00
hyak0g4aijdsejrizm2wh6l66xkmqk18	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-03-27 14:54:58.423886+00
2h4qiwsv96jb2c20h1rutspr68h6xbeh	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.331856+00
mziii3uwqznea2866gjg9k3nnfoju5kb	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.337115+00
ii8no5b9yfbks43225zuq8bzffrefwgw	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.376313+00
lqr580fonn11h64188rcu70zp1kihkjx	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.385225+00
70kyea3osxobe1saf59yqhsfzwq1qjs5	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.415024+00
05q6auwzmn8l2uira7i7mn8f0vb47wqo	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.415612+00
1hu9k3fkplg0ygg77a7y2uwp4fr8rlcx	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.455776+00
knoao2xrz06vdxyq97q6m54svxyj3uyg	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.456759+00
i32yqykndyezrty71jfn72eehjvngs8c	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.482327+00
kpd6szqbk5s0o0u9na7anhknagk68m2v	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.498096+00
l4oydclpohmrxgx3u63gbcea4x4x7dog	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-04-02 09:38:13.53772+00
q1ggl80zopkjxn8nwdhku6n72qkeqcdf	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:25.875124+00
oaglok4okm8zdk21eiruappyqkc3s2kf	MWE1MTYwM2IwYjA4ZTc3OTU1MmI1NjE0MjQwNmVkZTBjMjNhZDU1YzqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==	2015-05-14 21:02:10.011302+00
ajcyhi7sl5irk4n6kpndgz5zf09iiza7	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:01.695217+00
8nwgdxkpa2la2gxcenlmofaip21q8wq2	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:01.775384+00
shryntbswheo82e3pr31yvpy1aa7rzg2	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:01.878444+00
kv3dnufliioommjxa4ka9ewblw6b0ujh	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:01.931858+00
o45h0129tk35x3jvdrxjxzzdusgby3s5	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.009155+00
uw0e8p1cbuxmw8ajvw69rffgjomntgpd	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.063004+00
9jmlorg29o4hyvy99zxdziy9f8dic15a	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.152624+00
jhsff7zhgqc4m9fc8wa2efefqonjft7o	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.213542+00
yxklejbwfe7apkk1nyfuwbp2vn3dxorh	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.296358+00
6cf9v2r5scmj75ofmby1cz6z3hochc2z	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.349699+00
ll6bh2zgz7gisg64hp3cxijgxohapwyc	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.463518+00
0hrcs09malvxi4bax1vdl6at9h00ky85	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.515182+00
r7dzn59ykkyu337ionf26xlybz9c7gix	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.590853+00
it1eu89g5ib9q3ghoa5m9ko6f37in23w	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.639993+00
hhr18es0vhie92urekyaqiuswjhvvd05	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.714741+00
zyo1w4507prydm5vzj7020iw58ivx09u	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-18 15:18:02.764291+00
wy2371vwsizip7bt77eiqtt1fe63m661	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:24.252068+00
lozh0t25xhdr9p532ysmlucctfzsuxt5	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:24.446921+00
nklq8f0py4e5he8hw7gf840vf2sp0pxc	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:24.807827+00
h0r8hqtmxev0cboo9wrqhj7n7wnp4zoz	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:25.005865+00
b6ecbf1187c77reehfhy39794nqslknr	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:25.338695+00
0vdcob5rzes4udb1bm4bjg2y69hnnohr	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:25.52722+00
zb1ijodlyx2r9iufeyf77ch2g8cjnvjh	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:26.070606+00
74myn9ky2esc6xnp3ckfw52t9mg9q7ny	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:26.420439+00
p3umfv4ybcgrx9fbyeq2gwsd29j6uzzr	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:26.612089+00
jzcqd4atin0yglzzz0b7937bqape0q9k	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:26.9631+00
mhwzzsxo8yq57choe9amcixr6df2b8ye	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:27.15351+00
mkfx5eczldr7h6sxrpsd2cl8dgqnw2np	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:27.494963+00
r6ladyb41km09gq2huqsmcqpcewes1v0	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:27.685306+00
31x7aivtev7oozmczbw63izlslg6h0sv	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:28.026088+00
3rz2vl00xqde9gq2ap9jvkhrozvg27pb	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-06-19 04:08:28.216109+00
0icahzz1nsrtmovz2cg3lw4owx800c7z	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-07-16 12:28:33.217634+00
g2ygamnneik10pjrlma7xh2fd41q6oi9	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-07-25 20:45:45.393151+00
g7w9sinrw8r3lhnvecmpkifucdu7ma8k	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.528842+00
jikg8rqx8n6sa41p58j18e5phdks8fjg	MWE1MTYwM2IwYjA4ZTc3OTU1MmI1NjE0MjQwNmVkZTBjMjNhZDU1YzqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==	2015-10-15 09:26:27.450117+00
tclxh16areriiweskj6k8ga2aa1hjb40	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-10-16 02:36:24.845956+00
g6dqy8qw9y59qoqh5iqu886idiyqqhaw	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-11-05 08:28:06.173953+00
9dr3651wxjiig04y5bbhu4h261hv0v23	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-11-16 03:00:02.005937+00
a8tlnocqr1fihtc1bde061o0h757ycb0	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.64293+00
1056m3y4plxllgoy3urpndgu5iu495ns	MWE1MTYwM2IwYjA4ZTc3OTU1MmI1NjE0MjQwNmVkZTBjMjNhZDU1YzqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==	2015-12-22 09:22:22.870024+00
jsgww86x7s84mketm1m7cdsljipngteg	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-12-28 17:19:34.147486+00
9ijstakafh6kukqokm9id6s31ye3j67t	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2015-12-30 15:21:02.083645+00
qkxv8s9fyvcx4ux0v9t2hb5a2w2j278w	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-01-10 10:36:33.762825+00
xf2nga0t1hqk605uzrl1yb3dz0hk9epw	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-01-11 00:02:38.926079+00
89uda6iypbivnh0xax9iq498zldw0aqm	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-01-14 19:18:51.951368+00
ubmfrpxfynepicjr22mcpockcubeijdw	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-01-28 17:23:26.738847+00
tshu6xox6106hyxna4tgpnswcjvt1oy3	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-07 14:21:54.131023+00
kf9csapeiar95zuhw0kx9mv4k7xbw45h	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-09 08:14:31.706248+00
msbthj21rhk9674s3r4pg2q3f6npwk8y	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-09 08:55:28.253057+00
frtgn484r2g4t2iiuth38vjiwqtfyvns	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-09 09:28:29.034771+00
482xyzyivm7qnc4ou21bpxtqialtamqi	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-09 10:33:08.359626+00
cro3tf8bbrcp0j3g88i1axcwajia85s0	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-09 11:19:45.068323+00
yqpvqaxngtkczjvarfxixw501srp47is	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.700382+00
o6tdn7h6kespnhjbng6o5cpq3osl5apo	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.7891+00
nb23equnnvsxo7g04d5244j4wrc711xf	MWE1MTYwM2IwYjA4ZTc3OTU1MmI1NjE0MjQwNmVkZTBjMjNhZDU1YzqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==	2016-02-22 22:53:52.465129+00
5ene88uj8b2q7ytxveztukqbc286pqzn	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-23 00:00:24.017686+00
06ieob10bgxipko5igt0k91mhn89bjcf	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-02-26 16:49:22.329074+00
1rxnn1ecdgmync0wwc01regy9hf0kply	MWE1MTYwM2IwYjA4ZTc3OTU1MmI1NjE0MjQwNmVkZTBjMjNhZDU1YzqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==	2016-03-01 20:47:10.454801+00
zuodkunis8lxz1eok3yhcdrlfev8f8lu	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.142906+00
585kdugp1o4il7lv3ykjr8lcdvhw89x8	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.217632+00
y66fxq3mihdualziyr8w52i9aw2b7rre	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.315122+00
0khl8qwqcr13fw14gpddludzyxgxsbcq	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.375212+00
fjn2xv5i6ughcqaiip7pooqzx5i4sjin	Y2I0NzNkYTdiMjQwZDBhZmMxNjIyYzJjZTc0Y2MxNTJhM2YxMGMwMDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2016-03-28 02:28:52.470866+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY languages (name, id) FROM stdin;
English	1
Greek	2
Swedish	3
French	4
German	5
Japanese	6
Norwegian	7
Dutch	8
Danish	9
Finnish	10
Persian	11
Italian	12
Russian	13
Spanish	14
Anglo-Saxon	15
Latin	16
Chinese	17
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('languages_id_seq', 17, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY people (id, first_name, middle_names, last_name, nickname, list_name, full_name) FROM stdin;
3	Geoffrey		Chaucer		Chaucer, Geoffrey	Geoffrey Chaucer
5			Hómēros		Hómēros	Hómēros
6	George	Herbert	Palmer		Palmer, George H.	George Herbert Palmer
7	Simon		Singh		Singh, Simon	Simon Singh
13	Mary		Shelley		Shelley, Mary	Mary Shelley
15	David		Berlinski		Berlinski, David	David Berlinski
18	David		Eddings		Eddings, David	David Eddings
19	Tsutomu		Ohshima		Ohshima, Tsutomu	Tsutomu Ohshima
20	William		Shakespeare		Shakespeare, William	William Shakespeare
23	Katharine		Kerr		Kerr, Katharine	Katharine Kerr
24	Robert		Jordan		Jordan, Robert	Robert Jordan
27	Dan		Brown		Brown, Dan	Dan Brown
30	Isaac		Asimov		Asimov, Isaac	Isaac Asimov
33	Terry		Goodkind		Goodkind, Terry	Terry Goodkind
36	Gichin		Funakoshi		Funakoshi, Gichin	Gichin Funakoshi
44	Clive		Barker		Barker, Clive	Clive Barker
45	Nick		Hornby		Hornby, Nick	Nick Hornby
47	George		Orwell		Orwell, George	George Orwell
49	Patricia	A.	McKillip		McKillip, Patricia A.	Patricia A. McKillip
52	Robin		Hobb		Hobb, Robin	Robin Hobb
53	Philip		Pullman		Pullman, Philip	Philip Pullman
54	Michael		Ende		Ende, Michael	Michael Ende
56	Yann		Martel		Martel, Yann	Yann Martel
58	Alexandre		Dumas		Dumas, Alexandre	Alexandre Dumas
60			Voltaire		Voltaire	Voltaire
61	Terry		Brooks		Brooks, Terry	Terry Brooks
63	Tage	Ivar Roland	Danielsson	Tage	Danielsson, Tage	Tage Ivar Roland (Tage) Danielsson
64	Andrew		Solomon		Solomon, Andrew	Andrew Solomon
65	Thomas		Harris		Harris, Thomas	Thomas Harris
67	Peggy		Parish		Parish, Peggy	Peggy Parish
68	Jack		London		London, Jack	Jack London
70	Tormod		Haugen		Haugen, Tormod	Tormod Haugen
71	Mary		Batchelor		Batchelor, Mary	Mary Batchelor
73	Kerry		Colburn		Colburn, Kerry	Kerry Colburn
74	Rob		Sorensen		Sorensen, Rob	Rob Sorensen
75	Peter	F.	Hamilton		Hamilton, Peter F.	Peter F. Hamilton
77	Sir Walter		Scott		Scott, Sir Walter	Sir Walter Scott
78	Jonathan		Swift		Swift, Jonathan	Jonathan Swift
161	Robert		Zemeckis		Zemeckis, Robert	Robert Zemeckis
2	Terence	David John	Pratchett	Terry	Pratchett, Terry	Terry Pratchett
4	Celia	S.	Friedman		Friedman, C.S.	C.S. Friedman
8	Charles	Robert	Darwin	Charles	Darwin, Charles	Charles Darwin
9	Clinton	Richard	Dawkins	Richard	Dawkins, Richard	Richard Dawkins
10	George	Raymond Richard	Martin		Martin, George R. R.	George R.R. Martin
11	Stephen	Reeder	Donaldson	Stephen R.	Donaldson, Stephen R.	Stephen R. Donaldson
12	John	Ronald Reuel	Tolkien	J.R.R.	Tolkien, J.R.R.	J.R.R. Tolkien
14	Robert	Louis	Stevenson	R.L.	Stevenson, R.L.	Robert Louis Stevenson
16	Mario	Gianluigi	Puzo	Mario	Puzo, Mario	Mario Puzo
17	Guy	Gavriel	Kay		Kay, Guy Gavriel	Guy Gavriel Kay
22	Ursula	Kroeber	Le Guin	Ursula K.	Le Guin, Ursula K.	Ursula K. Le Guin
25	Clives	Staples	Lewis	C.S.	Lewis, C.S.	C.S. Lewis
26	Stephen	Edwin	King	Stephen	King, Stephen	Stephen King
28	Abraham		Stoker	Bram	Stoker, Bram	Bram Stoker
29	Frank	Patrick	Herbert	Frank	Herbert, Frank	Frank Herbert
31	Philip	Kindred	Dick	Philip K.	Dick, Philip K.	Philip K. Dick
32	John	Michael	Crichton	Michael	Crichton, Michael	Michael Crichton
34	Neal	Town	Stephenson	Neal	Stephenson, Neal	Neal Stephenson
35	William	Ford	Gibson	William	Gibson, William	William Gibson
37	Frans	Gunnar	Bengtsson	Frans G.	Bengtsson, Frans G.	Frans G. Bengtsson
38	Astrid	Anna Emilia	Lindgren	Astrid	Lindgren, Astrid	Astrid Lindgren
42	Tracy	Raye	Hickman	Tracy	Hickman, Tracy	Tracy Hickman
43	unknown translator(s)				unknown translator(s)	unknown translator(s)
46	Howard	Phillips	Lovecraft	H.P.	Lovecraft, H.P.	H.P. Lovecraft
48	Kenneth	Elliot	Kesey	Ken	Kesey, Ken	Ken Kesey
50	Nancy	Connor	Springer	Nancy	Springer, Nancy	Nancy Springer
51	Sheri	Stewart	Tepper	Sheri S.	Tepper, Sheri S.	Sheri S. Tepper
55	Susan	Mary	Cooper	Susan	Cooper, Susan	Susan Cooper
57	Georges	Joseph Christian	Simenon	Georges	Simenon, Georges	Georges Simenon
41	Margaret	Baldwin	Weis	Margaret	Weis, Margaret	Margaret Weis
59	Jules	Gabriel	Verne	Jules	Verne, Jules	Jules Verne
62	August	William	Derleth	August	Derleth, August	August Derleth
66	John	Ray	Grisham	John	Grisham, John	John Grisham
69	James	Fenimore	Cooper		Cooper, James Fenimore	James Fenimore Cooper
72	Robert	Anson	Heinlein	Robert	Heinlein, Robert	Robert Heinlein
76	Humphrey	William Bouverie	Carpenter	Humphrey	Carpenter, Humphrey	Humphrey Carpenter
21	Douglas	Noël	Adams	Douglas	Adams, Douglas	Douglas Adams
83	Michael	John	Moorcock	Michael	Moorcock, Michael	Michael John (Michael) Moorcock
92	Robert		Shea		Shea, Robert	Robert Shea
93	Robert	Anton	Wilson		Wilson, Robert A.	Robert Anton Wilson
95	Gaston	Louis Alfred	Leroux	Gaston	Leroux, Gaston	Gaston Louis Alfred (Gaston) Leroux
96	Mark		Twain		Twain, Mark	Mark Twain
97	Henning		Mankell		Mankell, Henning	Henning Mankell
101	Jonathan		Wylie		Wylie, Jonathan	Jonathan Wylie
102	John		Irving		Irving, John	John Irving
103	Nils		Hydén		Hydén, Nils	Nils Hydén
104	Paul		Graham		Graham, Paul	Paul Graham
105	Anders		Bjärvall		Bjärvall, Anders	Anders Bjärvall
106	Rand		Miller		Miller, Rand	Rand Miller
107	Robyn		Miller		Miller, Robyn	Robyn Miller
108	David		Wingrove		Wingrove, David	David Wingrove
109	Michael	A.	Stackpole		Stackpole, Michael A.	Michael A. Stackpole
110	Eva		Ibbotson		Ibbotson, Eva	Eva Ibbotson
111	Sterling	E.	Lanier		Lanier, Sterling E.	Sterling E. Lanier
112	Chris		Westwood		Westwood, Chris	Chris Westwood
113	J.	H.	Brennan		Brennan, J. H.	J. H. Brennan
114	William		Kotzwinkle		Kotzwinkle, William	William Kotzwinkle
115	Melissa		Mathison		Mathison, Melissa	Melissa Mathison
116	Michel		Tournier		Tournier, Michel	Michel Tournier
117	Judith		Kerr		Kerr, Judith	Judith Kerr
118	Per	Holm	Knudsen		Knudsen, Per H.	Per Holm Knudsen
119	Arthur		Hailey		Hailey, Arthur	Arthur Hailey
120	Agatha		Christie		Christie, Agatha	Agatha Christie
121	P.	C.	Jersild		Jersild, P. C.	P. C. Jersild
122	Alistair		MacLean		MacLean, Alistair	Alistair MacLean
123	Alastair		MacNeill		MacNeill, Alastair	Alastair MacNeill
124	Arthur	C.	Clarke		Clarke, Arthur C.	Arthur C. Clarke
125	William		Golding		Golding, William	William Golding
126	Maj		Sjöwall		Sjöwall, Maj	Maj Sjöwall
127	Per		Wahlöö		Wahlöö, Per	Per Wahlöö
128	George		Johansson		Johansson, George	George Johansson
129	Torkel		Bratt		Bratt, Torkel	Torkel Bratt
130	Michael		Morpurgo		Morpurgo, Michael	Michael Morpurgo
131	W.	W.	Stabell		Stabell, W. W.	W. W. Stabell
132	Rosemary		Harris		Harris, Rosemary	Rosemary Harris
133	Hans		Peterson		Peterson, Hans	Hans Peterson
134	Mats		Wahl		Wahl, Mats	Mats Wahl
135	Patricia		Wrightson		Wrightson, Patricia	Patricia Wrightson
136	Christine		Nöstlinger		Nöstlinger, Christine	Christine Nöstlinger
137	Olov		Svedelid		Svedelid, Olov	Olov Svedelid
138	Edith		Unnerstad		Unnerstad, Edith	Edith Unnerstad
139	Karl		May		May, Karl	Karl May
140	Eva		Bexell		Bexell, Eva	Eva Bexell
141	Diana	Wynne	Jones		Jones, Diana W.	Diana Wynne Jones
142	Anna		Cnattingius		Cnattingius, Anna	Anna Cnattingius
143	Christian		Reinhard		Reinhard, Christian	Christian Reinhard
145	Lisa		Tetzner		Tetzner, Lisa	Lisa Tetzner
146	Mika		Waltari		Waltari, Mika	Mika Waltari
148	Gustaf		Bolinder		Bolinder, Gustaf	Gustaf Bolinder
150			Aisōpos		Aisōpos	Aisōpos
151	Brita		af Geijerstam		af Geijerstam, Brita	Brita af Geijerstam
152	Sonja		Hulth		Hulth, Sonja	Sonja Hulth
153	Lasse		Ekholm		Ekholm, Lasse	Lasse Ekholm
155	Bengt		Linder		Linder, Bengt	Bengt Linder
156	Leif		Hamre		Hamre, Leif	Leif Hamre
157	Betsy		Byars		Byars, Betsy	Betsy Byars
158	Albert		Payson-Terhune		Payson-Terhune, Albert	Albert Payson-Terhune
160	Bob		Gale		Gale, Bob	Bob Gale
162	Enid		Blyton		Blyton, Enid	Enid Blyton
80	Stephen	William	Hawking	Stephen	Hawking, Stephen	Stephen Hawking
82	Roger	Joseph	Zelazny	Roger	Zelazny, Roger	Roger Zelazny
81	Arthur	Conan	Doyle		Doyle, Sir Arthur Conan	Sir Arthur Conan Doyle
84	Joseph	Rudyard	Kipling	Rudyard	Kipling, Rudyard	Rudyard Kipling
85	Lyman	Frank	Baum	L. Frank	Baum, L. Frank	L. Frank Baum
86	Edgar	Rice	Burroughs		Burroughs, Edgar Rice	Edgar Rice Burroughs
87	William	Frederick	Cody		Cody, William F.	William F. Cody
88	Selma	Ottilia Lovisa	Lagerlöf	Selma	Lagerlöf, Selma	Selma Lagerlöf
89	Orson	Scott	Card		Card, Orson Scott	Orson Scott Card
90	James	Matthew	Barrie	J. M.	Barrie, J. M.	J.M. Barrie
91	Laurell	Kaye	Hamilton	Laurell K.	Hamilton, Laurell K.	Laurell K. Hamilton
94	Charles	John Huffam	Dickens	Charles	Dickens, Charles	Charles Dickens
98	Jan	Oscar Sverre Lucien Henri	Guillou	Jan	Guillou, Jan	Jan Guillou
99	William	Earl	Johns	Captain W.E.	Johns, Captain W.E.	Captain W.E. Johns
100	Nils	Fritiof Adam	Nilsson	Fritiof "Piraten"	Nilsson “Piraten”, Fritiof	Fritiof Nilsson Piraten
147	unknown author(s)	\N	\N		unknown author(s)	unknown author(s)
154	Harriet	Beecher	Stowe		Stowe, Harriet Beecher	Harriet Beecher Stowe
159	Craig	Shaw	Gardner		Gardner, Craig Shaw	Craig Shaw Gardner
163	William		Arden		Arden, William	William Arden
164	Terrance		Dicks		Dicks, Terrance	Terrance Dicks
165	Line		Ahrland		Ahrland, Line	Line Ahrland
167	\N	\N	various authors		various authors	various authors
168	E.	C.	Eliott		Eliott, E. C.	E. C. Eliott
169	M.	V.	Carey		Carey, M. V.	M. V. Carey
170	Robert		Arthur		Arthur, Robert	Robert Arthur
171	F.	W.	Dixon		Dixon, F. W.	F. W. Dixon
172	Edward	S.	Ellis		Ellis, Edward S.	Edward S. Ellis
173	Roy		Rockwood		Rockwood, Roy	Roy Rockwood
174	Thea		Oljelund		Oljelund, Thea	Thea Oljelund
175	Sivar		Ahlrud		Ahlrud, Sivar	Sivar Ahlrud
176	Åke		Edwardson		Edwardson, Åke	Åke Edwardson
177	Camilla		Läckberg		Läckberg, Camilla	Camilla Läckberg
179	Carlo		Collodi		Collodi, Carlo	Carlo Collodi
180	Harry		Harrison		Harrison, Harry	Harry Harrison
181	Åsne		Seierstad		Seierstad, Åsne	Åsne Seierstad
182	Ian		Fleming		Fleming, Ian	Ian Fleming
183	Harper		Lee		Lee, Harper	Harper Lee
184	Aldous		Huxley		Huxley, Aldous	Aldous Huxley
185	Ayn		Rand		Rand, Ayn	Ayn Rand
187	Peter		van der Linden		van der Linden, Peter	Peter van der Linden
188	Herb		Sutter		Sutter, Herb	Herb Sutter
189	Mercedes		Lackey		Lackey, Mercedes	Mercedes Lackey
191	Sergey		Lukyanenko		Lukyanenko, Sergey	Sergey Lukyanenko
192	Ray		Bradbury		Bradbury, Ray	Ray Bradbury
193	Chuck		Palahniuk		Palahniuk, Chuck	Chuck Palahniuk
195	Miyamoto		Musashi		Musashi, Miyamoto	Miyamoto Musashi
196	Victor		Harris		Harris, Victor	Victor Harris
198	Roger		Penrose		Penrose, Roger	Roger Penrose
201	Friedrich		Nietzsche		Nietzsche, Friedrich	Friedrich Nietzsche
202	R. J.		Hollingdale		Hollingdale, R. J.	R. J. Hollingdale
203	Fyodor		Dostoevsky		Dostoevsky, Fyodor	Fyodor Dostoevsky
204	Richard		Pevear		Pevear, Richard	Richard Pevear
205	Larissa		Volokhonsky		Volokhonsky, Larissa	Larissa Volokhonsky
206	Jeffrey		Zeldman		Zeldman, Jeffrey	Jeffrey Zeldman
207	Doug		Naylor		Naylor, Doug	Doug Naylor
208	Rob		Grant		Grant, Rob	Rob Grant
209	Matthew		Linderman		Linderman, Matthew	Matthew Linderman
210	Jason		Fried		Fried, Jason	Jason Fried
211	John		Lloyd		Lloyd, John	John Lloyd
212	Robert		Hoekman		Hoekman, Robert	Robert Hoekman
214	Umberto		Eco		Eco, Umberto	Umberto Eco
215	William		Weaver		Weaver, William	William Weaver
217	Shigeru		Egami		Egami, Shigeru	Shigeru Egami
218	Anthony		Bourdain		Bourdain, Anthony	Anthony Bourdain
219	Albert		Einstein		Einstein, Albert	Albert Einstein
220	Robert	W.	Lawson		Lawson, Robert W.	Robert W. Lawson
221	Gregory		Maguire		Maguire, Gregory	Gregory Maguire
222	Herman		Melville		Melville, Herman	Herman Melville
223	Daniel		Dennett		Dennett, Daniel	Daniel Dennett
224	E.	V.	Rieu		Rieu, E. V.	E. V. Rieu
225	Peter		Jones		Jones, Peter	Peter Jones
226	D.	H. C.	Rieu		Rieu, D. H. C.	D. H. C. Rieu
227	Sam		Harris		Harris, Sam	Sam Harris
230	Rosemary		Low		Low, Rosemary	Rosemary Low
231	Carl		Zimmer		Zimmer, Carl	Carl Zimmer
232	William		Strunk		Strunk, William	William Strunk
234	Erich		Gamma		Gamma, Erich	Erich Gamma
235	Richard		Helm		Helm, Richard	Richard Helm
236	Ralph		Johnson		Johnson, Ralph	Ralph Johnson
237	John		Vlissides		Vlissides, John	John Vlissides
238	Steven		Pinker		Pinker, Steven	Steven Pinker
239	Ronnie		Sandahl		Sandahl, Ronnie	Ronnie Sandahl
240	Jan		Martenson		Martenson, Jan	Jan Martenson
241	John		Steinbeck		Steinbeck, John	John Steinbeck
242	Thomas	\N	Hobbes		Hobbes, Thomas	Thomas Hobbes
243	Michael		Shermer		Shermer, Michael	Michael Shermer
244			Plátōn		Plátōn	Plátōn
245	Hugh		Tredennick		Tredennick, Hugh	Hugh Tredennick
246	Harold		Tarrant		Tarrant, Harold	Harold Tarrant
247	Anthony		Burgess		Burgess, Anthony	Anthony Burgess
248	Susan		Blackmore		Blackmore, Susan	Susan Blackmore
249	Constance		Garnett		Garnett, Constance	Constance Garnett
252	Steven		Levitt		Levitt, Steven	Steven Levitt
253	Stephen	J.	Dubner		Dubner, Stephen J.	Stephen J. Dubner
254	Sir Fred		Hoyle		Hoyle, Sir Fred	Sir Fred Hoyle
178	John	R.	Gribbin		Gribbin, John	John Gribbin
186	M.	Scott	Peck		Peck, M. Scott	M. Scott Peck
197	Herbert	George	Wells	H. G.	Wells, H. G.	H.G. Wells
216	Jerome	David	Salinger	J. D.	Salinger, J. D.	J.D. Salinger
228	Joanne		Rowling	J.K.	Rowling, J.K.	J.K. Rowling
229	Mattie	Sue	Athan		Athan, Mattie Sue	Mattie Sue Athan
233	Elwyn	Brooks	White	E.B.	White, E.B.	E.B. White
251	Neil	deGrasse	Tyson		Tyson, Neil deGrasse	Neil deGrasse Tyson
250	Irene	Maxine	Pepperberg		Pepperberg, Irene	Dr. Irene Pepperberg
255	David	A.	Wharton		Wharton, David A.	David A. Wharton
256	Donald		Goldsmith		Goldsmith, Donald	Donald Goldsmith
257	Richard		Feynman		Feynman, Richard	Richard Feynman
258	Bertrand		Russell		Russell, Bertrand	Bertrand Russell
259	Jared		Diamond		Diamond, Jared	Jared Diamond
260	Helen	E.	Fisher		Fisher, Helen E.	Helen E. Fisher
261	Peter	R.	Grant		Grant, Peter R.	Peter R. Grant
262	B.	Rosemary	Grant		Grant, B. R.	B. Rosemary Grant
263	Neil		Shubin		Shubin, Neil	Neil Shubin
264	Spider		Robinson		Robinson, Spider	Spider Robinson
265	Carl		Sagan		Sagan, Carl	Carl Sagan
266	Katy		McElroy		McElroy, Katy	Katy McElroy
267	Mary		Gorman		Gorman, Mary	Mary Gorman
268	Kate		Daniel		Daniel, Kate	Kate Daniel
269	Jim		Al-Khalili		Al-Khalili, Jim	Jim Al-Khalili
271	Niccolò		Machiavelli		Machiavelli, Niccolò	Niccolò Machiavelli
272	Peter		Bondanella		Bondanella, Peter	Peter Bondanella
273	Carl	David	Anderson		Anderson, Carl D.	Carl David Anderson
274	Dossie		Easton		Easton, Dossie	Dossie Easton
275	Catherine	A.	Liszt		Liszt, Catherine A.	Catherine A. Liszt
276	Gordon	R.	Dickson		Dickson, Gordon R.	Gordon R. Dickson
277	Håkan		Nessler		Nessler, Håkan	Håkan Nessler
279	Giles		Blunt		Blunt, Giles	Giles Blunt
280	Jan		Järnebrand		Järnebrand, Jan	Jan Järnebrand
281	Arne		Dahl		Dahl, Arne	Arne Dahl
282	Mari		Jungstedt		Jungstedt, Mari	Mari Jungstedt
283	Christopher	\N	Tolkien		Tolkien, Christopher	Christopher Tolkien
284	Piers		Anthony		Anthony, Piers	Piers Anthony
286	Martin		Fowler		Fowler, Martin	Martin Fowler
287	David		Sklansky		Sklansky, David	David Sklansky
288	Andrew		Hunt		Hunt, Andrew	Andrew Hunt
289	David		Thomas		Thomas, David	David Thomas
290	Kurt		Vonnegut		Vonnegut, Kurt	Kurt Vonnegut
291	Robert		Glover		Glover, Robert	Robert Glover
292	James		Newkirk		Newkirk, James	James Newkirk
293	Robert	C.	Martin		Martin, Robert C.	Robert C. Martin
294	William	F.	Loomis		Loomis, William F.	William F. Loomis
296	Jack		Rinella		Rinella, Jack	Jack Rinella
297	Susanna		Clarke		Clarke, Susanna	Susanna Clarke
298	Jay		Wiseman		Wiseman, Jay	Jay Wiseman
299	Steve		McConnell		McConnell, Steve	Steve McConnell
301	Richard		Adams		Adams, Richard	Richard Adams
302	Tony		Ballantine		Ballantine, Tony	Tony Ballantine
304	Bert		Hölldobler		Hölldobler, Bert	Bert Hölldobler
305	Steven		Gould		Gould, Steven	Steven Gould
306	John		Wyndham		Wyndham, John	John Wyndham
308	Yvonne		Blank		Blank, Yvonne	Yvonne Blank
309	Joan	D.	Vinge		Vinge, Joan D.	Joan D. Vinge
310	Bill		Schutt		Schutt, Bill	Bill Schutt
311	Greg		Hill		Hill, Greg	Greg Hill
312	Kerry		Thornley		Thornley, Kerry	Kerry Thornley
313	Robert	E.	Howard		Howard, Robert E.	Robert E. Howard
314	Joseph		Heller		Heller, Joseph	Joseph Heller
315	Cristopher		Hitchens		Hitchens, Cristopher	Cristopher Hitchens
316	R.	Barker	Bausell		Bausell, R. B.	R. Barker Bausell
317	Douglas	A.	Anderson		Anderson, Douglas A.	Douglas A. Anderson
318	Edzard		Ernst		Ernst, Edzard	Edzard Ernst
320	Richard		Matheson		Matheson, Richard	Richard Matheson
321	Brian		Greene		Greene, Brian	Brian Greene
322	Dale		Carnegie		Carnegie, Dale	Dale Carnegie
328	John		Milton		Milton, John	John Milton
329	Stephen		Baxter		Baxter, Stephen	Stephen Baxter
330	Scott		Lynch		Lynch, Scott	Scott Lynch
331	Tad		Williams		Williams, Tad	Tad Williams
332	Peter		Macinnis		Macinnis, Peter	Peter Macinnis
334	Peter		Klimley		Klimley, Peter	Peter Klimley
335	Neil		Daswani		Daswani, Neil	Neil Daswani
336	Cristoph		Kern		Kern, Cristoph	Cristoph Kern
337	Anita		Kesavan		Kesavan, Anita	Anita Kesavan
338	Noah		Lukeman		Lukeman, Noah	Noah Lukeman
339	Ruth		Cullen		Cullen, Ruth	Ruth Cullen
340	Bill		Bryson		Bryson, Bill	Bill Bryson
341	David		Bohm		Bohm, David	David Bohm
342	Mary		Roach		Roach, Mary	Mary Roach
343	Seamus		Heaney		Heaney, Seamus	Seamus Heaney
345	Oscar		Wilde		Wilde, Oscar	Oscar Wilde
346	Sam		Horn		Horn, Sam	Sam Horn
347	Paul	A.	Offit		Offit, Paul A.	Paul A. Offit
348	Daniel		Defoe		Defoe, Daniel	Daniel Defoe
349	Lewis		Black		Black, Lewis	Lewis Black
295	Olive	Skene	Johnson		Johnson, Olive Skene	Olive Skene Johnson
300	Frederick	Phillips	Brooks		Brooks, Frederick P.	Frederick P. Brooks
303	Edward	O.	Wilson		Wilson, E.O.	E.O. Wilson
307	Carlos	Ruiz	Zafón		Zafón, Carlos Ruiz	Carlos Ruiz Zafón
319	Philip		Plait		Plait, Phil	Phil Plait
333	Jerry		Coyne		Coyne, Jerry A.	Jerry A. Coyne
344	Edgar	Allan	Poe	E.A.	Poe, Edgar Allan	Edgar Allan Poe
351	Matt		Ridley		Ridley, Matt	Matt Ridley
353	Bart	D.	Ehrman		Ehrman, Bart D.	Bart D. Ehrman
354	Thomas	S.	Kuhn		Kuhn, Thomas S.	Thomas S. Kuhn
355	Neil		Ohlenkamp		Ohlenkamp, Neil	Neil Ohlenkamp
356	Scott		Meyers		Meyers, Scott	Scott Meyers
357	Tom		Clancy		Clancy, Tom	Tom Clancy
358	Deborah		Blum		Blum, Deborah	Deborah Blum
359	Ayaan		Hirsi Ali		Hirsi Ali, Ayaan	Ayaan Hirsi Ali
360	Mervyn		Peake		Peake, Mervyn	Mervyn Peake
361	Raymond		Chandler		Chandler, Raymond	Raymond Chandler
362	Lewis		Carroll		Carroll, Lewis	Lewis Carroll
363	Ben		Goldacre		Goldacre, Ben	Ben Goldacre
364	Brandon		Sanderson		Sanderson, Brandon	Brandon Sanderson
365	Massimo		Pigliucci		Pigliucci, Massimo	Massimo Pigliucci
366	Dante		Alighieri		Alighieri, Dante	Dante Alighieri
367	John		Ciardi		Ciardi, John	John Ciardi
368	Franz		Kafka		Kafka, Franz	Franz Kafka
369	William		Aaltonen		Aaltonen, William	William Aaltonen
370	Barbro		Iveroth Lagergren		Iveroth Lagergren, Barbro	Barbro Iveroth Lagergren
372	Sigfrid		Lindström		Lindström, Sigfrid	Sigfrid Lindström
373	Pontus		Dahlander		Dahlander, Pontus	Pontus Dahlander
374	Margareta		Strömstedt		Strömstedt, Margareta	Margareta Strömstedt
375	Gustav		Sandgren		Sandgren, Gustav	Gustav Sandgren
376	Solveig		Rasmussen		Rasmussen, Solveig	Solveig Rasmussen
377	Hans	G.	Westerlund		Westerlund, Hans G.	Hans G. Westerlund
378	Britte-Marie		Bergström		Bergström, Britte-Marie	Britte-Marie Bergström
379	Nils		Holmberg		Holmberg, Nils	Nils Holmberg
380	Michelle		Le Blanc		Le Blanc, Michelle	Michelle Le Blanc
381	Colin		Odell		Odell, Colin	Colin Odell
382	Birgitta		Gahrton		Gahrton, Birgitta	Birgitta Gahrton
383	Lars		Ahlström		Ahlström, Lars	Lars Ahlström
384	Louise		Moëll		Moëll, Louise	Louise Moëll
385	Lena		Torndahl		Torndahl, Lena	Lena Torndahl
386	Deborah	Turner	Harris		Harris, Deborah T.	Deborah Turner Harris
1	Neil	Richard	Gaiman	Neil	Gaiman, Neil	Neil Gaiman
79	Albert	Chinualumogu	Achebe	Chinua	Achebe, Chinua	Chinua Achebe
166	Gunnar		Carlsson (Ph.D.)		Carlsson, Gunnar	Gunnar Carlsson
285	Edwin	\N	Abbott		Abbott, Edwin	Edwin Abbott
352	Pelham	Grenville	Wodehouse	P.G.	Wodehouse, P.G.	P.G. Wodehouse
415	Robert		Webb		Webb, Robert	Robert Webb
371	Emmuska		Orczy		Orczy	Baroness Emmuska Orczy
387	Michael		Coren		Coren, Michael	Michael Coren
388	Jadwiga	P.	Westrup		Westrup, Jadwiga P.	Jadwiga P. Westrup
389	Roland		Adlerberth		Adlerberth, Roland	Roland Adlerberth
390	Gunvor	V.	Blomqvist		Blomqvist, Gunvor V.	Gunvor V. Blomqvist
391	Elizabeth		Schönbeck		Schönbeck, Elizabeth	Elizabeth Schönbeck
392	Clas		Svahn		Svahn, Clas	Clas Svahn
393	Gunnar		Wall		Wall, Gunnar	Gunnar Wall
394	Lars		Ulwencreutz		Ulwencreutz, Lars	Lars Ulwencreutz
395	Åke		Persson		Persson, Åke	Åke Persson
396	Anders		Hellberg		Hellberg, Anders	Anders Hellberg
397	Joseph		Conrad		Conrad, Joseph	Joseph Conrad
398	Annette		Wolter		Wolter, Annette	Annette Wolter
399	Gunilla		Hallesius		Hallesius, Gunilla	Gunilla Hallesius
400	Bjarne		Stroustrup		Stroustrup, Bjarne	Bjarne Stroustrup
401	Terence	Hanbury	White	T.H.	White, T.H.	T.H. White
402	Sara		Blædel		Blædel, Sara	Sara Blædel
403	Mona		Eriksson		Eriksson, Mona	Mona Eriksson
404	Jan		Stolpe		Stolpe, Jan	Jan Stolpe
405	Robert		Silverberg		Silverberg, Robert	Robert Silverberg
406	Raymond	E.	Feist		Feist, Raymond E.	Raymond E. Feist
407	Brian		Hall		Hall, Brian	Brian Hall
408	Thomas		Malory		Malory, Sir Thomas	Sir Thomas Malory
409	Robert		Asprin		Asprin, Robert	Robert Asprin
410	Mons		Kallentoft		Kallentoft, Mons	Mons Kallentoft
411	Elwyn	Brooks	White	E.B.	White. E.B.	E.B. White
412	Ernest		Hemingway		Hemingway, Ernest	Ernest Hemingway
413	Michael	Paul	Mason		Mason, Michael Paul	Michael Paul Mason
414	David		Mitchell		Mitchell, David	David Mitchell
416	Horace	Freeland	Judson		Judson, Horace Freeland	Horace Freeland Judson
417	Vilayanur	Subramanian	Ramachandran	Rama	Ramachandran, V.S.	V.S. Ramachandran
418	Sandra		Blakeslee		Blakeslee, Sanda	Sandra Blakeslee
419	Paul		Davies		Davies, Paul	Paul Davies
420	James	Finn	Garner		Garner, James Finn	James Finn Garner
421	Paolo		Bacigalupi		Bacigalupi, Paolo	Paolo Bacigalupi
422	Richard		Wiseman		Wiseman, Richard	Richard Wiseman
423	Jessica		Valenti		Valenti, Jessica	Jessica Valenti
424	James		Randi		Randi, James	James Randi
425	Renzo		Gracie		Gracie, Renzo	Renzo Gracie
426	John		Danaher		Danaher, John	John Danaher
427	Kim	Stanley	Robinson		Robinson, Kim Stanley	Kim Stanley Robinson
428	Daniel	J.	Levitin		Levitin, Daniel J.	Daniel J. Levitin
429	Julia		Crawford		Crawford, Julia	Julia Crawford
430	Ian		Dunbar		Dunbar, Ian	Dr. Ian Dunbar
431	Bardi		McLennan		McLennan, Bardi	Bardi McLennan
432	Edward	James	Corbett	Jim	Corbett, Jim	Jim Corbett
433	Terry		Jones		Jones, Terry	Terry Jones
434	Publius	Vergilius	Maro	Virgil	Virgil	Publius Vergilius Maro
435	Robert		Fagles		Fagles, Robert	Robert Fagles
436	Stieg		Larsson		Larsson, Stieg	Stieg Larsson
437	Victor		Stenger		Stenger, Victor	Victor Stenger
438	Richard		Carrier		Carrier, Richard	Richard Carrier
439	Emily		Brontë		Brontë, Emily	Emily Brontë
440	John		Marzluff		Marzluff, John	John Marzluff
441	Tony		Angell		Angell, Tony	Tony Angell
442	Sverre	H.	Huseby		Huseby, Sverre	Sverre H. Huseby
443	Bruce		Schneier		Schneier, Bruce	Bruce Schneier
444	Steve		Maguire		Maguire, Steve	Steve Maguire
445	William		Goldman		Goldman, William	William Goldman
446					Sun Tzu (孫武)	Sun Tzu (孫武)
447	Lawrence		Wright		Wright, Lawrence	Lawrence Wright
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('people_id_seq', 447, true);


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY series (id, title, sort_title, notes, review, review_date) FROM stdin;
38	The Deverry Cycle, Act Two: The Westlands	Deverry Cycle, Act Two: The Westlands	\N	\N	\N
54	Discworld	Discworld	\N	\N	\N
51	The Divine Comedy	Divine Comedy	\N	\N	\N
40	The Earthsea Chronicles	Earthsea Chronicles	\N	\N	\N
2	The Earthsea novels	Earthsea novels	\N	\N	\N
12	The Elenium	Elenium	\N	\N	\N
57	The Elric Saga	Elric Saga	\N	\N	\N
36	The Farseer Trilogy	Farseer Trilogy	\N	\N	\N
46	The Fionavar Tapestry	Fionavar Tapestry	\N	\N	\N
14	The First Chronicles of Thomas Covenant, the Unbeliever	First Chronicles of Thomas Covenant, the Unbeliever	\N	\N	\N
52	The Heritage of Shannara	Heritage of Shannara	\N	\N	\N
30	His Dark Materials	His Dark Materials	\N	\N	\N
49	The History of Middle-earth	History of Middle-earth	\N	\N	\N
29	The Hitchhiker's Guide to the Galaxy Trilogy	Hitchhiker's Guide to the Galaxy Trilogy	\N	\N	\N
43	The Illuminatus! Trilogy	Illuminatus! Trilogy	\N	\N	\N
56	Island and Empire	Island and Empire	\N	\N	\N
16	The Last Chronicles of Thomas Covenant, the Unbeliever	Last Chronicles of Thomas Covenant, the Unbeliever	\N	\N	\N
59	The Mages of Garillon	Mages of Garillon	\N	\N	\N
53	The Magister Trilogy	Magister Trilogy	\N	\N	\N
11	The Malloreon	Malloreon	\N	<cite>The Malloreon</cite> feels like a pretty tired reiteration of <cite>The Belgariad</cite>. Of course, it is <em>explicitly</em> so and is up front in stating that it is <em>intentional</em>, by the means of cyclic prophesies. Nevertheless, while <cite>The Malloreon</cite> is by no means <em>terrible</em>, all the good stuff it has on offer was already presented, fresher, in its prequel series.	2011-01-23 22:00:14.548578
35	The Night's Dawn Trilogy	Night's Dawn Trilogy	\N	\N	\N
15	The Second Chronicles of Thomas Covenant, the Unbeliever	Second Chronicles of Thomas Covenant, the Unbeliever	\N	\N	\N
55	The Tawny Man	Tawny Man	\N	\N	\N
41	Anita Blake: Vampire Hunter	Anita Blake: Vampire Hunter	\N	\N	\N
21	A Song of Ice and Fire	A Song of Ice and Fire	\N	\N	\N
33	The Wheel of Time	Wheel of Time	\N	\N	\N
22	The Word and the Void	Word and the Void	\N	\N	\N
17	The Gap Saga	Gap Saga	\N	Stephen Donaldson’s <cite>Gap Saga</cite> is one of the greatest, and one of the grimmest, works of science fiction I have ever read: Also one of the most brilliant. It starts out with a narrow focus on a small group of characters (Donaldson describes <cite>The Real Story</cite> as a study in character role reversal), then gradually expands to take on an epic scope affecting all of humanity—and simultaneously serving as a very clever, sci fi cast of Wagner’s <cite>Ring</cite> cycle! Somehow, it manages to do so seamlessly.\r\n\r\nIt is not for the faint of heart. The characters are mercilessly human even at their darkest (well, the human ones, anyway!), and many of them are very dark indeed. I often joke that this is the best series you will ever read, but you’d best not read it without Prozac—at least until the <em>pleasant</em> characters begin to attempt to act in the third book or so. But they are memorable, and Min Donner and Warden Dios are among those characters whom I greet as old friends when they enter the stage.\r\n\r\nThe “science” in this science fiction is also interesting. It is by no means the ultra-hard science of an Arthur C. Clarke, but in some respects it has a great deal of verisimilitude. In much sci fi, space battles take on the aspects of WW2 dogfights, as in <cite>Star Wars</cite>; in <cite>The Gap Saga</cite>, ships are dangerously close when they get within several tens of thousands of kilometres. Space is big, after all, and weapons do not scatter or slow with friction in a vacuum. Touches like this, which make it all seem a bit more realistic, add to the grittiness of the setting as much as the sweating and human tics of both its nicest and its most miserable and malevolent characters.\r\n\r\nIf cruelty, despair, rape, and violence (none of them ever glorified) are too much for you—I don’t blame you, but these books are not for you. If you can handle it, get your hands on these books as soon as you can.	2011-02-01 23:21:32.622088
25	The Belgariad	Belgariad	\N	\N	\N
45	The Chronicles of Amber	Chronicles of Amber	\N	\N	\N
39	The Coldfire Trilogy	Coldfire Trilogy	\N	\N	\N
28	The Dark is Rising	Dark is Rising	\N	\N	\N
37	The Deverry Cycle, Act One: Deverry	Deverry Cycle, Act One: Deverry	\N	\N	\N
47	Harry Potter	Harry Potter	\N	When the <cite>Harry Potter</cite> books first hit the market, they were met with a roar of acclaim and hype so vast, so deafening, and so bloody annoying that I resolved not to read the books for years, in part out of (silly and) bloody-minded obstinacy not to be so moved by the mass market; and in part because I would judge them negatively and unfairly out of sheer irritation with the hype. Once I had finally come to terms with their <em>existance</em>, I decided that I would eventually read them, since several people whose opinion on these matters I respected really liked them.\n\nFor some reason, I then spent several years waiting on various people who, each at different times, assured me that they’d lend me the books just next month or so, which of course never happened at all. When, at long last, I finally got around to acquiring and <em>reading</em> the damned things—in 2007 or so—they turned out to be very good. Not as good as the hype would have it, of course, but then nothing would be. Still, in spite of flagging a bit in <em>some</em> chapters of some of the later books where things just get exhaustingly angsty, they are very good books that, in spite of being marketed for children, even self-conscious I do not feel ashamed to keep them on my shelf.	2011-01-23 22:00:14.50903
48	The Commonwealth Saga	Commonwealth Saga	\N	\N	\N
50	The Conan Chronicles	Conan Chronicles	\N	I’m not sure how Robert E. Howard’s <cite>Conan</cite> stories ever gained such lasting popularity. They are glaringly racist, blatantly sexist, and poorly written: It’s as though Howard had read Strunk and White’s famous <cite>Elements of Style</cite> and defiantly set out to break their every precept. On top of all that, the stories are terribly repetitive. I’ve read the first half of the “Fantasy Masterworks” collection several times, chiefly in a morbid attempt to figure out why anybody likes it; thus far I’ve not been successful.	2011-01-23 22:00:14.464561
58	The Shannara Trilogy	Shannara Trilogy	\N	\N	\N
26	The Sword of Truth	Sword of Truth	\N	\N	\N
13	The Tamuli	Tamuli	\N	Just as <cite>The Malloreon</cite> was a reiteration of <cite>The Belgariad</cite>, so <cite>The Tamuli</cite> feels like a repeat of <cite>The Elenium</cite>. It lacks even more quality compared to its predecessor, however.	2011-01-23 22:00:14.563453
32	The Lord of the Rings	Lord of the Rings	\N	There is no way whatsoever that I will ever gain perspective to review <cite>The Lord of the Rings</cite> in an ‘objective’ manner—to whatever degree that word even makes sense in the context of reviews. Not only is this part of the most sacred canon of the fantasy genre; it is also material that I grew up on. Since the first time I read it (at age ten or so?), I’ve read it dozens of times; at the time of writing this note—at the very end of 2010—the count is probably closer to fifty than it is to forty.\n\nOf course <cite>The Lord of the Rings</cite> is not for everyone. It is slow-paced, it is exceptionally detailed in its environment, and it bears many signs of the peculiar station of Tolkien’s nature as an academic and former soldier used to male camaraderie with few women playing much of a role. I will not attempt to defend any of this, but merely note that I am aware of it and do not feel that it detracts.\n\nTolkien referred to his creative acts as <q>sub-creation</q> (note Christianity), and the detail and authenticity are unrivalled. The depth, if you’ve the patience for it, is immense. And the scene where Frodo learns in the gardens of Ithilien that Gandalf did not after all perish in the Mines of Moria remains, after more than forty readings, one of the vanishingly few passages of any book anywhere that manages to move a few tears to my eyes.	2011-01-23 22:00:14.5382
34	The Chronicles of Narnia	Chronicles of Narnia	\N	The reasons why I dislike the <cite>Narnia</cite> books are many and varied. I actually <em>loved</em> these books as a child, and devoured them repeatedly when I was ten or eleven or so, which probably accounts for some of the vehemence with which I now dislike them: I feel somehow betrayed. Of course, as any adult or perceptive person knows, the <cite>Narnia</cite> books are blatant Christian allegory written by a Christian apologist. That alone would of course bias me against them, and may again contribute to the <em>vehemence</em>: I loved these books as a child; as an adult I recognise that they were an attempt to mould and manipulate me. This may sound a bit strong, since there’s no <em>secret</em> about their being apologetic in nature, but they are geared toward children who may be unequipped to understand their nature—as I was.\n\nStill, not all of my dislike has to do with religion or ideology; I think the books are simply bad <i>qua</i> books. The most glaring problem is that the apparent protagonists are not actually protagonists at all. Protagonists <em>do</em> something (cf. the etymology, agonist, Greek <i>agōnistés</i>, &c.). The children in the <cite>Narnia</cite> books appear to do things, but they are all ultimately irrelevant. One really should see it coming, but there it is: Every crisis, every serious issue in all the <cite>Narnia</cite> books is resolved by a major, in fact a <em>literal</em> <i>deus ex machina</i>. There’s a reason why the <i>deus ex machina</i> is a <i>faux pas</i> in literature: It removes tension. When not merely one, but <em>all</em> major problems are so resolved—\n\nAdditionally, I share an objection to Lewis’s style first expressed by his friend J.R.R. Tolkien: The piecemeal composition of Lewis’s mythology is æsthetically unpleasing. A faun here, a Jesus-lion there, and a Santa Claus stopping by for a brief halloa—it seems a hodgepodge and it does not create any sense of authenticity.\n\nSo: An underhanded message, delivered in a manner that sucks out all the tension, placed in a clumsily constructed world. Colour me unimpressed.	2011-01-23 22:00:14.456126
60	The Void Trilogy	Void Trilogy	\N	\N	\N
61	The Dark Tower	Dark Tower	\N	\N	\N
62	Le Morte D’Arthur	Le Morte D’Arthur	\N	\N	\N
63	The Myth Books	Myth Books	\N	\N	\N
64	The Gormenghast Trilogy	Gormenghast Trilogy	\N	\N	\N
65	The Mars Trilogy	Mars Trilogy	\N	\N	\N
66	Mistborn	Mistborn	\N	\N	\N
67	Coq Rouge	Coq Rouge	\N	\N	\N
\.


--
-- Name: series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('series_id_seq', 67, true);


--
-- Data for Name: tg_group; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY tg_group (group_id, group_name, display_name, created) FROM stdin;
1	managers	Managers Group	2010-12-29 00:54:11.200056
\.


--
-- Name: tg_group_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('tg_group_group_id_seq', 1, true);


--
-- Data for Name: tg_group_permission; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY tg_group_permission (group_id, permission_id) FROM stdin;
1	1
\.


--
-- Data for Name: tg_permission; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY tg_permission (permission_id, permission_name, description) FROM stdin;
1	manage	This permission give an administrative right to the bearer
\.


--
-- Name: tg_permission_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('tg_permission_permission_id_seq', 1, true);


--
-- Data for Name: tg_user; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY tg_user (user_id, user_name, email_address, display_name, password, created) FROM stdin;
1	manager	petter@petterhaggholm.net	Petter	645b567d49fc35c65841fc86d00a99885ab89c6fd995a1b6285196d219c3e34a48734c222000d200	2010-12-29 00:54:11.204433
\.


--
-- Data for Name: tg_user_group; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY tg_user_group (user_id, group_id) FROM stdin;
1	1
\.


--
-- Name: tg_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('tg_user_user_id_seq', 4, true);


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY translations (id, book, title, language_id, isbn) FROM stdin;
164	743	Undulater	3	91-534-1335-0
166	747	Kalla mig prinsessa	3	978-91-7263-912-6
19	192	En ring av järn	3	\N
102	369	Stjärnan i öster	3	91-502-1057-2
101	368	Sedan alla gått iland	3	91-502-1056-4
100	367	Innan alla kom ombord	3	91-502-1055-6
145	511	The Iliad	1	978-0-14-044794-1
1	6	The Odyssey	1	978-04-8640654-1
143	495	The Name of the Rose	1	0-15-600131-4
151	594	Schamanen	3	91-7001-365-9
134	462	Karate-dō: My way of life	1	0-87011-463-8
165	499	The Way of Karate: Beyond Technique	1	0-87011-254-6
2	146	Karate-Do Kyohan: The Master Text	1	0-87011-190-6
28	203	Candide	1	978-1-84837-203-0
155	724	Purgatorio	1	978-0-451-20863-7
157	726	Metamorphosis	1	978-1-84837-202-3
159	727	Röda Nejlikan	3	91-38-90355-5
156	725	Paradiso	1	978-0-451-20863-7
25	200	Greven av Monte Cristo	3	\N
40	229	Dörren till sommaren	3	\N
16	189	Den oändliga historien	3	\N
12	178	Gåtmästaren från Hed	3	\N
13	182	Mördarens lärling	3	\N
8	170	Eldfödd	3	\N
9	171	Jurkyrkogården	3	\N
14	183	Vargbroder	3	\N
24	199	Myladys son	3	\N
34	223	Ootas stora dag	3	91-510-0890-4
60	277	Tom Sawyers äventyr	3	\N
35	224	Skriet från vildmarken	3	\N
5	167	Stark	3	\N
6	168	Carrie	3	\N
7	169	Cujo	3	\N
158	226	Skriket från djungeln	3	91-20-10100-7
29	209	Shannaras ättlingar	3	91-37-10339-3
85	338	Vapen från Avalon	3	\N
57	263	Buffalo Bill	3	\N
66	306	Biggles och mr X	3	\N
69	309	Biggles på hett spår	3	\N
67	307	Biggles och dollarkuppen	3	\N
63	303	Biggles & Co	3	\N
72	312	Biggles flyger söderut	3	\N
62	302	Biggles i strid	3	\N
65	305	Biggles går i fällan	3	\N
83	336	Fredag eller ett liv i frihet	3	\N
39	228	Egen rymddräkt finnes	3	\N
54	260	Fiffikus & Co: Minnen från skoltiden	3	
61	278	Huckleberry Finns äventyr	3	91-550-2486-6
90	349	Nattvakten	3	\N
68	308	Biggles i Liberia	3	\N
58	266	Sjunde sonen	3	\N
88	342	Senaste nytt	3	\N
59	276	The Phantom of the Opera	1	\N
78	330	Råttornas krig	3	\N
41	243	Ivanhoe	3	\N
53	259	Kim	3	\N
89	347	Tio små negerpojkar	3	\N
121	402	Fallet med de osynliga bevisen	3	\N
93	354	Flygplatsen	3	\N
118	398	Tillbaka till framtiden II	3	\N
129	414	Bomba och Tigeröns hemlighet	3	\N
115	395	Helikopter KKV saknad	3	\N
119	400	De 6 och äventyret på Rockingdown	3	91-7674-050-1
31	211	Shannaras alvdrottning	3	91-37-10631-7
107	381	I Falkpatrullens spår	3	\N
95	356	Staden som försvann	3	\N
113	392	Onkel Toms stuga	3	\N
130	439	The Adventures of Pinocchio	1	\N
127	412	Jakten på dokumentet	3	\N
114	393	Där världen heter skog	3	\N
120	401	Alfred Hitchcock och Tre Deckare löser: Stirrande trädets gåta	3	\N
97	362	Dotter till hav och eld	3	\N
123	408	Kemlo från satellit K	3	\N
117	397	Vår vän Lad	3	\N
106	379	Guldkragen	3	\N
96	361	Profeten	3	\N
109	385	Sinuhe egyptiern	3	\N
21	194	Gråkungen	3	\N
48	252	Sherlock Holmes memoarer	3	\N
52	258	Andra djungelboken	3	\N
140	483	Offerträdet	3	\N
141	484	Den brinnande stenen	3	\N
55	261	Trollkarlen från Oz	3	\N
46	250	En studie i rött	3	\N
4	165	Höstmörkrets drakar	3	\N
161	730	Shannaras Svärd	3	91-37-10875-1
20	193	Lövhäxan	3	\N
22	195	Silverträdet	3	\N
47	251	Sherlock Holmes äventyr	3	\N
51	257	Djungelboken	3	0-19-281650-0
162	731	Shannaras Alvstenar	3	91-37-11190-6
133	459	The Night Watch	1	\N
139	477	The Brothers Karamazov	1	\N
149	585	The Prince	1	\N
11	176	Djurfarmen	3	\N
92	352	Flugornas herre	3	\N
43	247	Breven från Jultomten	3	\N
163	732	Shannaras Önskesång	3	91-37-11036-5
91	350	År 2001	3	\N
99	366	Falkpatrullens äventyr	3	\N
154	723	Inferno	1	978-0-451-20863-7
124	409	Alfred Hitchcock och Tre Deckare löser: Skräckfilmens gåta	3	\N
112	389	Aisopos fabler	3	\N
71	311	Biggles i Arabien	3	\N
138	476	Beyond Good and Evil -- Prelude to a Philosophy of the Future	1	\N
74	314	Biggles i knipa	3	\N
64	304	Biggles bakom järnridån	3	\N
82	334	E.T. The Extra-Terrestrial	3	\N
26	201	Från jorden till månen	3	\N
75	315	King griper in	3	\N
79	331	Vandraren från ingenstans	3	\N
15	184	Mördarens jakt	3	\N
73	313	Biggles och indianguden	3	\N
147	545	Crime and Punishment	1	\N
87	341	Musen Malla	3	\N
50	254	Nio prinsar i Amber	3	\N
105	377	Old Shatterhand och Yuma-indianerna	3	\N
18	191	Ovan hav, under sten	3	\N
30	210	Shannaras druid	3	91-37-10499-3
108	384	Sotarpojken	3	\N
110	386	Tusen och en natt	3	\N
38	227	BarnBibeln -- 365 illustrerade berättelser ur Bibeln	3	\N
76	323	Napoleons husar	3	\N
144	503	Relativity: The Special and the General Theory	1	\N
70	310	Biggles rensar luften	3	\N
94	355	Den förskräckliga apan och andra berättelser	3	\N
128	413	Hjortfot och pälsjägarna	3	\N
86	339	Enhörningens tecken	3	\N
56	262	Tarzan, apornas son	3	\N
152	630	Vindens skugga	3	978-91-7263-756-6
33	217	När lammen tystnar	3	0-434-00905-9
32	212	Shannaras talismaner	3	91-37-10693-7
77	329	Spökena från Carra	3	\N
146	542	The Last Days of Socrates -- Euthypro, The Apology, Phaedo, Crito	1	\N
103	372	Nargonen och stjärnorna	3	\N
49	253	Sherlock Holmes återkomst	3	\N
44	248	De fyras tecken	3	\N
104	373	Tänkaren griper in	3	\N
10	172	Förbannelse	3	\N
45	249	Baskervilles hund	3	\N
36	225	Den sista mohikanen	3	\N
126	411	Mysteriet med främlingen i grottan	3	\N
23	198	De tre musketörerna	3	\N
116	396	Guldfisken anfaller!	3	\N
125	410	Alfred Hitchcock och Tre Deckare löser: Gröna vålnadens gåta	3	\N
122	403	Alfred Hitchcock och Tre Deckare löser: Tjutande grottans gåta	3	\N
42	244	Gullivers resor	3	\N
27	202	En världsomsegling under havet	3	\N
98	365	Joey	3	\N
84	337	När Hitler stal den skära kaninen	3	\N
17	190	Momo eller Kampen om tiden	3	91-502-0905-1
81	333	Shiva: flicka i tidens gryning	3	91-7270-633-3
80	332	Hiram jägaren	3	91-7270-651-1
153	675	Beowulf	1	978-0-393-32097-8
136	467	A Book of Five Rings	1	0-087951-018-8
131	445	Bokhandlaren i Kabul	3	91-7001-042-0
167	788	The Aeneid	1	978-0-14-310513-8
\.


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('translations_id_seq', 167, true);


--
-- Data for Name: translators; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY translators (translation, person, id) FROM stdin;
1	6	1
2	19	2
4	43	3
5	43	4
6	43	5
7	43	6
8	43	7
9	43	8
10	43	9
42	43	10
112	151	11
136	196	12
138	202	13
139	204	14
139	205	15
143	215	16
144	220	17
145	224	18
145	225	19
145	226	20
146	245	21
146	246	22
147	249	23
149	272	24
151	280	25
152	308	26
153	343	27
154	367	28
155	367	29
156	367	30
157	369	31
158	370	32
159	372	33
102	388	50
54	373	35
34	374	36
61	375	37
119	376	38
57	377	39
53	378	40
76	379	41
32	382	42
31	382	43
30	382	44
29	382	45
161	383	46
161	384	47
162	385	48
163	385	49
101	388	51
100	388	52
17	389	53
81	390	54
80	390	55
164	399	56
166	403	57
131	404	58
167	435	59
\.


--
-- Name: translators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('translators_id_seq', 59, true);


--
-- Data for Name: volumes; Type: TABLE DATA; Schema: public; Owner: phnet
--

COPY volumes (series, book, volume, id) FROM stdin;
41	270	3	100
41	271	4	101
41	272	5	102
41	273	6	103
21	15	1	24
21	16	2	25
21	17	3	26
21	18	4	27
25	50	1	31
25	51	2	32
25	52	3	33
25	53	4	34
25	54	5	35
45	254	1	107
45	338	2	108
45	339	3	109
34	107	1	70
34	108	2	71
34	109	3	72
34	110	4	73
34	111	5	74
34	112	6	75
34	113	7	76
39	7	1	91
39	8	2	92
39	9	3	93
48	529	1	121
48	531	2	122
50	637	1	131
28	191	1	44
28	192	2	45
28	193	3	46
28	194	4	47
28	195	5	48
37	88	1	83
37	89	2	84
37	90	3	85
37	91	4	86
38	92	1	87
38	93	2	88
38	94	3	89
38	95	4	90
54	234	1	140
54	235	2	141
54	236	3	142
54	237	4	143
54	238	5	144
54	239	6	145
54	688	7	146
54	694	8	147
54	695	9	148
54	689	13	152
54	240	23	149
54	241	26	151
54	598	33	150
51	723	1	133
51	724	2	153
51	725	3	154
40	83	1	94
40	84	2	95
40	85	3	96
40	86	4	97
12	62	1	6
12	63	2	7
12	64	3	8
57	255	1	157
57	256	2	158
36	182	1	80
36	183	2	81
36	184	3	82
46	483	1	111
46	484	2	112
46	485	3	113
14	30	1	12
14	19	2	13
14	20	3	14
17	25	1	19
17	26	2	20
17	27	3	21
17	28	4	22
17	29	5	23
47	517	2	115
47	518	3	116
47	519	4	117
47	522	6	119
47	523	7	120
52	209	1	134
52	210	2	135
52	212	4	137
30	186	1	54
30	187	2	55
49	36	1	123
49	37	2	124
49	590	3	125
49	602	5	127
49	605	6	128
49	606	7	129
29	75	1	49
29	77	3	51
29	78	4	52
29	79	5	53
43	286	2	105
43	287	3	106
56	319	1	156
16	638	2	130
32	32	1	57
32	33	2	58
32	34	3	59
53	516	1	138
53	680	2	139
11	55	1	1
11	57	3	3
11	58	4	4
11	59	5	5
35	232	2	78
35	233	3	79
15	21	1	15
15	22	2	16
58	730	1	159
58	731	2	160
58	732	3	161
26	134	2	37
26	135	3	38
26	136	4	39
26	138	6	41
26	139	7	42
26	140	8	43
60	736	1	163
41	268	1	98
41	269	2	99
60	742	3	165
61	745	1	166
62	749	1	167
63	751	1	169
63	753	3	171
60	737	2	164
62	750	2	168
63	752	2	170
64	708	1	172
64	713	2	173
64	758	3	174
47	513	1	114
47	520	5	118
52	211	3	136
30	188	3	56
49	597	4	126
29	76	2	50
43	274	1	104
16	24	1	18
59	733	1	162
11	56	2	2
35	231	1	77
15	23	3	17
26	133	1	36
26	137	5	40
13	65	1	9
13	66	2	10
13	67	3	11
55	185	1	155
33	96	1	60
33	97	2	61
33	98	3	62
33	99	4	63
33	100	5	64
33	101	6	65
33	102	7	66
33	103	8	67
33	104	9	68
33	105	10	69
33	437	11	110
33	720	12	132
22	204	1	28
22	205	2	29
22	206	3	30
21	768	5	175
54	773	18	176
54	774	29	177
54	775	14	178
65	779	1	179
65	783	2	180
65	784	3	181
53	801	3	182
54	803	37	183
66	809	1	184
66	810	2	185
66	812	3	187
54	815	12	188
54	816	10	189
54	817	11	190
54	820	15	191
67	822	7	192
54	824	17	193
\.


--
-- Name: volumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phnet
--

SELECT pg_catalog.setval('volumes_id_seq', 193, true);


SET search_path = htpage, pg_catalog;

--
-- Name: db_update_name; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY db_update
    ADD CONSTRAINT db_update_name PRIMARY KEY (name);


--
-- Name: group_id; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_id PRIMARY KEY (id);


--
-- Name: group_name; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_name UNIQUE (group_name);


--
-- Name: menuitem_name_key; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY menu_item
    ADD CONSTRAINT menuitem_name_key UNIQUE (name);


--
-- Name: menuitem_pkey; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY menu_item
    ADD CONSTRAINT menuitem_pkey PRIMARY KEY (id);


--
-- Name: permission_name_key; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_name_key UNIQUE (name);


--
-- Name: permission_pkey; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: session_id; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_id PRIMARY KEY (id);


--
-- Name: user_id; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_id PRIMARY KEY (id);


--
-- Name: username; Type: CONSTRAINT; Schema: htpage; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT username UNIQUE (username);


SET search_path = public, pg_catalog;

--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: languages_name; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_name UNIQUE (name);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: series_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);


--
-- Name: tg_group_group_name_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_group
    ADD CONSTRAINT tg_group_group_name_key UNIQUE (group_name);


--
-- Name: tg_group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_group_permission
    ADD CONSTRAINT tg_group_permission_pkey PRIMARY KEY (group_id, permission_id);


--
-- Name: tg_group_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_group
    ADD CONSTRAINT tg_group_pkey PRIMARY KEY (group_id);


--
-- Name: tg_permission_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_permission
    ADD CONSTRAINT tg_permission_permission_name_key UNIQUE (permission_name);


--
-- Name: tg_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_permission
    ADD CONSTRAINT tg_permission_pkey PRIMARY KEY (permission_id);


--
-- Name: tg_user_email_address_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_user
    ADD CONSTRAINT tg_user_email_address_key UNIQUE (email_address);


--
-- Name: tg_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_user_group
    ADD CONSTRAINT tg_user_group_pkey PRIMARY KEY (user_id, group_id);


--
-- Name: tg_user_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_user
    ADD CONSTRAINT tg_user_pkey PRIMARY KEY (user_id);


--
-- Name: tg_user_user_name_key; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY tg_user
    ADD CONSTRAINT tg_user_user_name_key UNIQUE (user_name);


--
-- Name: title_unique; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY series
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- Name: translations_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: translators_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY translators
    ADD CONSTRAINT translators_pkey PRIMARY KEY (id);


--
-- Name: volumes_pkey; Type: CONSTRAINT; Schema: public; Owner: phnet; Tablespace: 
--

ALTER TABLE ONLY volumes
    ADD CONSTRAINT volumes_pkey PRIMARY KEY (id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: books_sort_title_index; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX books_sort_title_index ON books USING btree (sort_title);


--
-- Name: books_title_index; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX books_title_index ON books USING btree (title);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: people_firstname_index; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX people_firstname_index ON people USING btree (first_name);


--
-- Name: people_lastname_index; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX people_lastname_index ON people USING btree (last_name);


--
-- Name: people_listname_index; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX people_listname_index ON people USING btree (list_name);


--
-- Name: people_middlename_index; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX people_middlename_index ON people USING btree (middle_names);


--
-- Name: people_nickname_index; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX people_nickname_index ON people USING btree (nickname);


--
-- Name: volumes_volnum; Type: INDEX; Schema: public; Owner: phnet; Tablespace: 
--

CREATE INDEX volumes_volnum ON volumes USING btree (volume);


SET search_path = htpage, pg_catalog;

--
-- Name: group_permission_group_id; Type: FK CONSTRAINT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY group_permission
    ADD CONSTRAINT group_permission_group_id FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: group_permission_permission_id; Type: FK CONSTRAINT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY group_permission
    ADD CONSTRAINT group_permission_permission_id FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- Name: menuitem_parent_id_fkey; Type: FK CONSTRAINT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY menu_item
    ADD CONSTRAINT menuitem_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES menu_item(id);


--
-- Name: session_user_id; Type: FK CONSTRAINT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_user_id FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_group_group_id_fkey; Type: FK CONSTRAINT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: user_group_user_id_fkey; Type: FK CONSTRAINT; Schema: htpage; Owner: phnet
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


SET search_path = public, pg_catalog;

--
-- Name: auth_group_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authors_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_author_fkey FOREIGN KEY (author) REFERENCES people(id);


--
-- Name: authors_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_book_fkey FOREIGN KEY (book) REFERENCES books(id);


--
-- Name: book_language; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY books
    ADD CONSTRAINT book_language FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tg_group_permission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY tg_group_permission
    ADD CONSTRAINT tg_group_permission_group_id_fkey FOREIGN KEY (group_id) REFERENCES tg_group(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tg_group_permission_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY tg_group_permission
    ADD CONSTRAINT tg_group_permission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES tg_permission(permission_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tg_user_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY tg_user_group
    ADD CONSTRAINT tg_user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES tg_group(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tg_user_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY tg_user_group
    ADD CONSTRAINT tg_user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES tg_user(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: translations_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_book_fkey FOREIGN KEY (book) REFERENCES books(id);


--
-- Name: translations_lang; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_lang FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: translators_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY translators
    ADD CONSTRAINT translators_person_fkey FOREIGN KEY (person) REFERENCES people(id);


--
-- Name: translators_translation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY translators
    ADD CONSTRAINT translators_translation_fkey FOREIGN KEY (translation) REFERENCES translations(id);


--
-- Name: volume_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY volumes
    ADD CONSTRAINT volume_book_fkey FOREIGN KEY (book) REFERENCES books(id);


--
-- Name: volume_series_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phnet
--

ALTER TABLE ONLY volumes
    ADD CONSTRAINT volume_series_fkey FOREIGN KEY (series) REFERENCES series(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


SET search_path = htpage, pg_catalog;

--
-- Name: group_id_seq; Type: ACL; Schema: htpage; Owner: phnet
--

REVOKE ALL ON SEQUENCE group_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE group_id_seq FROM phnet;
GRANT ALL ON SEQUENCE group_id_seq TO phnet;


--
-- Name: user; Type: ACL; Schema: htpage; Owner: phnet
--

REVOKE ALL ON TABLE "user" FROM PUBLIC;
REVOKE ALL ON TABLE "user" FROM phnet;
GRANT ALL ON TABLE "user" TO phnet;


--
-- Name: user_id_seq; Type: ACL; Schema: htpage; Owner: phnet
--

REVOKE ALL ON SEQUENCE user_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE user_id_seq FROM phnet;
GRANT ALL ON SEQUENCE user_id_seq TO phnet;


SET search_path = public, pg_catalog;

--
-- Name: authors; Type: ACL; Schema: public; Owner: phnet
--

REVOKE ALL ON TABLE authors FROM PUBLIC;
REVOKE ALL ON TABLE authors FROM phnet;
GRANT ALL ON TABLE authors TO phnet;


--
-- Name: books; Type: ACL; Schema: public; Owner: phnet
--

REVOKE ALL ON TABLE books FROM PUBLIC;
REVOKE ALL ON TABLE books FROM phnet;
GRANT ALL ON TABLE books TO phnet;


--
-- Name: people; Type: ACL; Schema: public; Owner: phnet
--

REVOKE ALL ON TABLE people FROM PUBLIC;
REVOKE ALL ON TABLE people FROM phnet;
GRANT ALL ON TABLE people TO phnet;


--
-- Name: series; Type: ACL; Schema: public; Owner: phnet
--

REVOKE ALL ON TABLE series FROM PUBLIC;
REVOKE ALL ON TABLE series FROM phnet;
GRANT ALL ON TABLE series TO phnet;


--
-- Name: volumes; Type: ACL; Schema: public; Owner: phnet
--

REVOKE ALL ON TABLE volumes FROM PUBLIC;
REVOKE ALL ON TABLE volumes FROM phnet;
GRANT ALL ON TABLE volumes TO phnet;


--
-- Name: book_info; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE book_info FROM PUBLIC;
REVOKE ALL ON TABLE book_info FROM postgres;
GRANT ALL ON TABLE book_info TO postgres;
GRANT SELECT ON TABLE book_info TO PUBLIC;


--
-- PostgreSQL database dump complete
--

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
insert into artwork(filename, thumbnail, title, caption, details)
values
('cthulhu.jpg', E'gallery/thumbnails/cthulhu.jpg', E'Escape from R''lyeh', E'<p style="text-align:center;font-size:smaller;font-style:italic;">\nIf you particularly like this drawing, you can\n<a href="http://www.cafepress.ca/haggholm/7960542">get it on\na t-shirt</a> via\n<a href="http://www.cafepress.ca/haggholm/7960542">CafePress</a>.\n</p>\n<blockquote>\n<p>\nSteam had not been suffered to go down entirely, despite the\ndeparture of all hands for the shore; and it was the work of\nonly a few moments of feverish rushing up and down between\nwheel and engines to get the Alert under way. Slowly, amidst\nthe distorted horrors of that indescribable scene, she began\nto churn the lethal waters; whilst on the masonry of that\ncharnel shore that was not of earth the titan Thing from the\nstars slavered and gibbered like Polypheme cursing the fleeing\nship of Odysseus. Then, bolder than the storied Cyclops, great\nCthulhu slid greasily into the water and began to pursue with\nvast wave-raising strokes of cosmic potency.\n</p>\n<footer>H.P. Lovecraft, <cite title="The Call of Cthulhu">The Call of Cthulhu</cite></footer>\n</blockquote>\n<p>\nAn experiment with applying ink with a brush, which I had done\nonly once before, and never to detailed work. Details were\nenhanced with pens. My drawing was based, naturally enough, on\nLovecraft’s description of Cthulhu:\n</p>\n<blockquote>\n<p>\nA pulpy, tentacled head surmounted a grotesque and scaly body\nwith rudimentary wings … It represented a monster of\nvaguely anthropoid outline, but with an octopus-like head whose\nface was a mass of feelers, a scaly, rubbery-looking body,\nprodigious claws on hind and fore feet, and long, narrow wings\nbehind. This thing, which seemed instinct with a fearsome and\nunnatural malignancy, was of a somewhat bloated corpulence …\n</p>\n<footer>Ibid.</footer>\n</blockquote>\n<p>\n<em>Some</em> of the reasons my Cthulhu looks a bit unlike a lot\nof depictions have to do with paying attention to that: Note\n<q><em>rudimentary</em> wings</q>, for instance, and <q>bloated\ncorpulence</q>.\n</p>', E'Ink.'),
('arise.jpg', E'gallery/thumbnails/arise.jpg', E'Arise, demon!', E'<p>\nI don’t really have anything to say about this one. Nothing\nbeats a little virgin sacrifice in the morning.\n</p>', E'0.5 mm mechanical pencil.'),
('futility.png', E'gallery/thumbnails/futility.png', E'Futility', E'<p>\nI think the title says it all. The scan quality is not the\nbest; some of the finer details (such as the teeth) don’t\nshow up well or at all, but I''m reasonably happy with the\nimage in general.\n</p>', E'Ink pens over mechanical pencil sketch.'),
('dread_sentry.jpg', E'gallery/thumbnails/dread_sentry.jpg', E'Dread Sentry', E'<p>\nThe Dread Sentry is vaguely inspired by a death knight in a\nplanned RPG campaign of my own design (that may or may not ever\nget off the ground). It was drawn in two classes; sketched in\none and fleshed out in another. Unfortunately, it does not at\nall portray the power of the death knight whom I had in\nmind—nevertheless, as a picture, I am reasonably content with\nit.\n</p>', E'0.5 mm mechanical pencil.'),
('wizard.png', E'gallery/thumbnails/wizard.png', E'Black Magic', E'<p>\nA dark wizard hard at work; I''m not sure what he’s brewing, but\nI’m reasonably certain it''s both more potent and more malicious\nthan your average witch’s brew.\n</p>\n<p>\nThis picture was drawn as a (very belated) Christmas gift for\nmy good friend <a href="http://www.linkedin.com/in/sheepeeh">Sheepy</a>,\nwho is in possession of the original (and who scanned it for\nme after my scan mysteriously disappeared), for which reason I\nput more effort into the details than I normally do (though\nunfortunately, many of those details are somewhat too small\nto show up well at this resolution). She requested something\nrepresentative of what I like to draw:\n<q>Goblins and eyeballs and stuff</q>—voilà!\n</p>\n<p>\nOther than a horrible mistake in inking, mostly covered up\n(but still present and as you see it), I''m rather pleased with\nit. Ah, and incidentally, the imp and cherub are the classical\ncartoon representations of the wizard’s conscience.\n</p>', E'Ink pens over mechanical pencil sketch.'),
('dragonfury.png', E'gallery/thumbnails/dragonfury.png', E'The Fury of Stormwing', E'<p>\nTormented by unsatiable hunger and burning with the fire that\nwas in him, raving and ravenous, Stormwing, greatest of all\nthe flying dragons in their first Age, went on a rampage,\nrazing cities and burning or devouring every living thing in\nhis path. Ultimately, it took the concerted efforts of the\nDragonlord and the one who would much later become greatest of\nthe Dragonlords to slay the beast.\n</p>', E'Ink pens (mechanical pencil sketch, since erased).'),
('devil.jpg', E'gallery/thumbnails/devil.jpg', E'Doom', E'<p>\nA doodle I did on a bus and refined whilst waiting for a ferry;\nquick work and fairly small, but I’m quite pleased with it.\nTo me there appears to be a certain power in him—but I find\nthis power easier to represent in this image than in words, so\nI shall be less long-winded here than is customary for me.\n</p>', E'0.5 mm mechanical pencil.'),
('warrior.jpg', E'gallery/thumbnails/warrior.jpg', E'Barbarian Warrior', E'<p>\nA barbarian warrior, delivering his challenge with posture.\n</p>\n<p>\nThis was done during a short break in drawing class (yes, I\ntook a basic drawing class). We had just been introduced to\nthe basics of gesture drawing, and I felt like applying what\nI percieved to be the central concept to something more free\nand fun, drawn from my head, not life. Nothing fancy; it''s\njust an attempt to convey a sense of movement.\n</p>', E'Pencil.'),
('dragon_summoner.jpg', E'gallery/thumbnails/dragon_summoner.jpg', E'The Dragon Summoner', E'<p>\nWhat few wizards seem to realise is that summoning a servant\nis not the most important part. Mastering the servant is.\n</p>\n<p>\nThis is really the second version of a much (much) older\npicture. Unfortunately, you cannot compare and contrast the\ntwo because the older version is also much too poor for me\nto display here without feeling embarrassed.\n</p>', E'0.7 mm and 0.3 mm mechanical pencils.'),
('evil_goblin_2.jpg', E'gallery/thumbnails/evil_goblin_2.jpg', E'Evil Goblin', E'<p class="c">\nOne of many renditions of my favourite random Evil Goblin&trade;.\n</p>', E'Mechanical pencil.'),
('golem.jpg', E'gallery/thumbnails/golem.jpg', E'Freedom!', E'<p>\nA Golem, Demon or God of the Earth—I don''t know which—breaks\nfree after eons of being trapped within the cold darkness of\nthe bedrock. With a force that can tear mountains asunder and\nthe pain of stone torn apart, it surfaces at last to walk the\nworld anew—but to what purpose, I cannot say.\n</p>\n<p>\nWhile it’s obviously a rough drawing, drawn with a much softer\npencil than I’m prone to use, I''m quite pleased with this as\nan anatomical study—please tell me what’s wrong with it if you\nfind anything, but bear in mind that it was done entirely\nwithout reference, although Lori helped me by pointing out a\nmistake (now fixed) I made with the pectoral muscles. I''m also\nfairly pleased with the dynamics—for once I''m fairly sure that\nhe looks like he’s moving…\n</p>', E'Soft-lead pencil.'),
('hammerduel.jpg', E'gallery/thumbnails/hammerduel.jpg', E'The Duel', E'<p class="c">\nDavid vs. Goliath’s bigger, badder brother? My money''s on the big guy.\n</p>', E'Pencils.'),
('harbinger.jpg', E'gallery/thumbnails/harbinger.jpg', E'The First Harbinger', E'<blockquote>\n<p>\nIt stood by the dead tree, turning its head this way and\nthat, then entered the clearing. … Pale light glinted\nnow and then from its eyes, but although their cover was\nimperfect it seemed not to notice them. There was a\nfrightening intelligence in its eyes…sharp and\nbright and filled with a palpable malevolence.\n</p>\n<p>\nIt appeared to be unarmed, though it was difficult to tell;\nit could easily be hiding an entire arsenal of knives and guns\namong the black rags and tatters of its garments. Only the\nhood was in marginally good shape, frayed around the edges\nbut whole enough to conceal most of the Harbinger’s\nfeatures. He could see a flash of pale skin, though; its\nchin, open to the light, was a deathly white, as were its\nthin lips. Finally giving up it hissed softly, flashing a\nset of white fangs, and stalked off in the brush.\n</p>\n</blockquote>\n\n<p>\nOmen, the First Harbinger, is one of the most mysterious and\nresourceful servants of the sorcerer Nekros, a product of\nthe Necromancer’s twisted magic. An undead creature possessed\nof both unnatural strength and a wicked cunning he hunts\ndown relentlessly both those who oppose his master and those\nwho fail him.\n</p>', E'Ink pens over mechanical pencil sketch.'),
('dragonlord.jpg', E'gallery/thumbnails/dragonlord.jpg', E'The Dragonlord', E'<p>\nThe Dragonlord, leaning against a wall after a battle, tired\nnot in the body but in the spirit after centuries of fighting\nand killing. If you think I drew him with the face turned away\njust so I wouldn''t have to draw it, you’re right (I tried, I\nfailed), but I rather like the result, anyway.\n</p>', E'Pencil.');
alter table authors
  rename column author to person_id;
alter table authors
  rename column book to book_id;
alter table authors
  drop column id;

alter table people
  rename to persons;

alter table translations
  rename column translation to translation_id;
alter table translations
  rename column person to person_id;

alter table volumes
  rename column series to series_id;
alter table translations
  rename column book to book_id;


drop table auth_group;
drop table auth_group_permissions;
drop table auth_message;
drop table auth_permission;
drop table auth_user_groups;
drop table auth_user_permissions;
drop table django_admin_log;
drop table django_content_type;
drop table django_session;
drop table django_site;
drop table tg_group;
drop table tg_group_permission;
drop table tg_user;
drop table tg_user_group;
