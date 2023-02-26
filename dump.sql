--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE boardcamp;
DROP DATABASE database_join_7a7ce1c6;
DROP DATABASE database_join_b9908799;
DROP DATABASE desafio_sql_b672418d;
DROP DATABASE exercicio_mystoreultrasystem_3a28727e;
DROP DATABASE exercicio_sql_8e64656a;
DROP DATABASE laboleria;
DROP DATABASE linkdriven;
DROP DATABASE linkedriven;
DROP DATABASE linkr;
DROP DATABASE linkrdriven;
DROP DATABASE ola;
DROP DATABASE operacoes;
DROP DATABASE shortly;
DROP DATABASE test;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:UMi50L9/5rcs5bETA+HJDg==$qy9j5aSZZFrLJy/qKVDP5L8FzT4bSJ6GsGSyYaao2kc=:OcX5QICn95klk4psBFS/uxGSrUJRPnX28flBwf2kj7c=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "boardcamp" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: boardcamp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE boardcamp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE boardcamp OWNER TO postgres;

\connect boardcamp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    cpf character varying(11) NOT NULL,
    birthday date NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    name text NOT NULL,
    image text NOT NULL,
    "stockTotal" integer NOT NULL,
    "pricePerDay" integer NOT NULL
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: rentals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentals (
    id integer NOT NULL,
    "customerId" integer NOT NULL,
    "gameId" integer NOT NULL,
    "rentDate" date NOT NULL,
    "daysRented" integer NOT NULL,
    "returnDate" date,
    "originalPrice" integer NOT NULL,
    "delayFee" integer
);


ALTER TABLE public.rentals OWNER TO postgres;

--
-- Name: rentals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rentals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rentals_id_seq OWNER TO postgres;

--
-- Name: rentals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rentals_id_seq OWNED BY public.rentals.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: rentals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals ALTER COLUMN id SET DEFAULT nextval('public.rentals_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, phone, cpf, birthday) FROM stdin;
2	João	21998899222	01234567897	1992-10-05
3	João Alfredo	21998899222	01234567890	1992-10-05
4	Gui	21998499222	51234567890	1994-10-05
1	Gui	21998499222	51234567898	1994-10-05
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, name, image, "stockTotal", "pricePerDay") FROM stdin;
1	banco imobiliario	https://a-static.mlcdn.com.br/1500x1500/jogo-banco-imobiliario-tabuleiro-estrela/magazineluiza/181205900/6b291054f2f617dec6e138382b14e6fa.jpg	5	1000
2	Banco Imobiliário	https://imgs.casasbahia.com.br/426687/1xg.jpg?imwidth=1000	3	1500
3	Video Game	https://imgs.casasbahia.com.br/426687/1xg.jpg?imwidth=1000	3	1500
4	Futebol	https://s.concursosnobrasil.com.br/media/cache/f/futebol-960x540.jpg	3	1500
5	Futebol	https://s.concursosnobrasil.com.br/media/cache/f/futebol-960x540.jpg	3	1500
6	Futebol	https://s.concursosnobrasil.com.br/media/cache/f/futebol-960x540.jpg	3	1500
\.


--
-- Data for Name: rentals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentals (id, "customerId", "gameId", "rentDate", "daysRented", "returnDate", "originalPrice", "delayFee") FROM stdin;
3	1	1	2023-02-12	3	2023-02-12	3000	0
6	1	4	2023-02-13	3	\N	4500	\N
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 4, true);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 6, true);


--
-- Name: rentals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rentals_id_seq', 6, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "database_join_7a7ce1c6" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: database_join_7a7ce1c6; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE database_join_7a7ce1c6 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE database_join_7a7ce1c6 OWNER TO postgres;

\connect database_join_7a7ce1c6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: allocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.allocations (
    id integer NOT NULL,
    "roomId" integer NOT NULL,
    "guestId" integer NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date
);


ALTER TABLE public.allocations OWNER TO postgres;

--
-- Name: allocations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.allocations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allocations_id_seq OWNER TO postgres;

--
-- Name: allocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.allocations_id_seq OWNED BY public.allocations.id;


--
-- Name: guests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guests (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.guests OWNER TO postgres;

--
-- Name: guests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guests_id_seq OWNER TO postgres;

--
-- Name: guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guests_id_seq OWNED BY public.guests.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: allocations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allocations ALTER COLUMN id SET DEFAULT nextval('public.allocations_id_seq'::regclass);


--
-- Name: guests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests ALTER COLUMN id SET DEFAULT nextval('public.guests_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Data for Name: allocations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.allocations (id, "roomId", "guestId", "startDate", "endDate") FROM stdin;
1	1	1	2020-12-01	\N
2	2	2	2020-01-03	2020-01-15
3	3	3	2019-12-01	2020-12-15
4	4	4	2018-07-22	2018-07-29
5	5	5	2020-06-01	2020-06-10
6	6	6	2020-05-13	2020-05-20
7	4	7	2019-02-19	2019-02-26
8	3	8	2020-01-02	2020-01-05
9	1	9	2019-08-01	2019-08-20
\.


--
-- Data for Name: guests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guests (id, name) FROM stdin;
1	Olivia Barreno Letras
2	Xavier Paião Banha
3	Alessia Caminha Gorjão
4	Hilário Moreno Ponte
5	Laércio Milheirão Eiró
6	Emmanuel Gomide Canário
7	Ticiana Outeiro Pequeno
8	Sol Quinterno Boaventura
9	Vladislav Neiva Viana
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, name) FROM stdin;
1	01
2	02
3	03
4	04
5	05
6	06
\.


--
-- Name: allocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.allocations_id_seq', 9, true);


--
-- Name: guests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guests_id_seq', 9, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 6, true);


--
-- Name: allocations allocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allocations
    ADD CONSTRAINT allocations_pkey PRIMARY KEY (id);


--
-- Name: guests guests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "database_join_b9908799" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: database_join_b9908799; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE database_join_b9908799 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE database_join_b9908799 OWNER TO postgres;

\connect database_join_b9908799

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    "categoryId" integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Television
2	Mobile
3	Computer
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, "categoryId") FROM stdin;
1	Televisão 43"	139997	1
2	Televisão 55"	250000	1
3	Notebook Entrada	200000	3
4	Notebook Intermediário	350000	3
5	Notebook Topo de Linha	600000	3
6	Celular Entrada	80000	2
7	Celular Intermediário	160000	2
8	Celular Topo de Linha	340000	2
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "desafio_sql_b672418d" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: desafio_sql_b672418d; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE desafio_sql_b672418d WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE desafio_sql_b672418d OWNER TO postgres;

\connect desafio_sql_b672418d

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf character varying(11) NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    id integer NOT NULL,
    id_cliente integer NOT NULL,
    id_produto integer NOT NULL
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- Name: compras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_id_seq OWNER TO postgres;

--
-- Name: compras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_id_seq OWNED BY public.compras.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome text NOT NULL,
    preco integer NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: compras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras ALTER COLUMN id SET DEFAULT nextval('public.compras_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, cpf) FROM stdin;
1	Allana Fidalgo Moreira	12345678900
2	Benício Freire Sampaio	98765432100
4	Olga Cascais Fortunato	01928374650
5	Martinha Lima Zambujal	11992288445
6	Anabela Baptista Soverosa	22883377446
7	Raul Arouca Pederneiras	11889922385
8	Chico Buarque de Holanda	65719484743
10	Patrícia Toste Prudente	19847457596
9	Lucca Santarém Branco	04652651298
\.


--
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras (id, id_cliente, id_produto) FROM stdin;
1	1	7
2	2	9
3	2	9
4	2	7
5	3	2
7	6	6
8	7	6
9	8	3
10	8	1
11	8	10
12	4	8
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome, preco) FROM stdin;
1	Televisão 43"	139997
2	Televisão 55"	250000
3	Notebook Entrada	200000
4	Notebook Intermediário	350000
5	Notebook Topo de Linha	600000
6	Celular Entrada	80000
7	Celular Intermediário	160000
8	Celular Topo de Linha	340000
11	Bicicleta Elétrica	370000
12	Fone Entrada	2000
13	Fone Intermediário	20000
14	Fone Topo de Linha	80000
15	Macbook Pro 13"	17000
9	Pelúcia Strange Planet com Gatinho	8000
10	Violão Lava ME 2	980000
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 10, true);


--
-- Name: compras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_id_seq', 12, true);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 15, true);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "exercicio_mystoreultrasystem_3a28727e" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: exercicio_mystoreultrasystem_3a28727e; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE exercicio_mystoreultrasystem_3a28727e WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE exercicio_mystoreultrasystem_3a28727e OWNER TO postgres;

\connect exercicio_mystoreultrasystem_3a28727e

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tipo_condicao; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_condicao AS ENUM (
    'novo',
    'seminovo',
    'usado'
);


ALTER TYPE public.tipo_condicao OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome text NOT NULL,
    preco integer NOT NULL,
    condicao public.tipo_condicao NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome, preco, condicao) FROM stdin;
1	Televisão 43"	139997	novo
2	Televisão 55"	250000	seminovo
3	Notebook Entrada	200000	seminovo
4	Notebook Intermediário	350000	novo
5	Notebook Topo de Linha	600000	novo
6	Celular Entrada	80000	seminovo
7	Celular Intermediário	160000	usado
8	Celular Topo de Linha	340000	usado
9	Pelúcia Strange Planet com Gatinho	7051	novo
10	Violão Lava ME 2	860000	seminovo
11	Bicicleta Elétrica	370000	usado
12	Fone Entrada	2000	novo
13	Fone Intermediário	20000	seminovo
14	Fone Topo de Linha	80000	usado
15	Televisão 32"	100000	usado
16	Televisão 75"	700000	seminovo
17	Prego	15000	novo
\.


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 17, true);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "exercicio_sql_8e64656a" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: exercicio_sql_8e64656a; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE exercicio_sql_8e64656a WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE exercicio_sql_8e64656a OWNER TO postgres;

\connect exercicio_sql_8e64656a

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf character varying(11) NOT NULL,
    numero_compras integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, cpf, numero_compras) FROM stdin;
1	Allana Fidalgo Moreira	12345678900	4
2	Benício Freire Sampaio	98765432100	6
3	Orlando Pequeno Jesus	10293847560	1
4	Olga Cascais Fortunato	01928374650	2
5	Martinha Lima Zambujal	11992288445	2
6	Anabela Baptista Soverosa	22883377446	6
7	Raul Arouca Pederneiras	11889922385	1
8	Chico Buarque de Holanda	65719484743	10
9	Lucca Santarém Branco	48769275911	4
10	Patrícia Toste Prudente	19847457596	3
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 10, true);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "laboleria" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: laboleria; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE laboleria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE laboleria OWNER TO postgres;

\connect laboleria

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cakes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cakes (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric NOT NULL,
    image character varying NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.cakes OWNER TO postgres;

--
-- Name: cakes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cakes_id_seq OWNER TO postgres;

--
-- Name: cakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cakes_id_seq OWNED BY public.cakes.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "clientId" integer NOT NULL,
    "cakeId" integer NOT NULL,
    quantity integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "totalPrice" numeric NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: cakes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes ALTER COLUMN id SET DEFAULT nextval('public.cakes_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Data for Name: cakes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cakes (id, name, price, image, description) FROM stdin;
1	bolo	15	https://img.itdg.com.br/images/recipes/000/062/547/318292/318292_original.jpg	com chocolate
2	tortal	10	https://www.eucomosim.com/wp-content/uploads/2019/02/20180722_142045.jpg	de limão
3	bolinho	10	https://static.wixstatic.com/media/82c31c_704e8315d7ca4eb8b7aa5650d3a0b83d~mv2.jpg/v1/fit/w_940%2Ch_571%2Cal_c%2Cq_80/file.jpg	de forno
4	bolão	1	https://www.receiteria.com.br/wp-content/uploads/receitas-de-bolo-de-melancia-0.jpg	de forno
5	Bolo de pote 422	13	https://www.receiteria.com.br/wp-content/uploads/bolo-de-pote-de-chocolate-com-morango-fit-1.jpg	Bolo de chocolate com recheio de leite ninho
6	Bolo de pote 422	13	https://www.receiteria.com.br/wp-content/uploads/bolo-de-pote-de-chocolate-com-morango-fit-1.jpg	Bolo de chocolate com recheio de leite ninho
8	Bolo de pddddddsssote	13	https://www.alura.com.br/artigos/assets/code/formatando-numeros-no-javascript.1672417225.png	
9	Bolo de pddddddsssxxxxote	13	https://www.alura.com.br/artigos/assets/code/formatando-numeros-no-javascript.1672417225.png	
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, address, phone) FROM stdin;
1	Gui	Rua 1	21999999999
2	Guill	Rua 2	21977777777
3	Guiiii	Curitiba	21444444444
4	Fulana		2199999999
5		fff	2199999999
6	Fulano		2199999999
7	Fulano1		2199999999
8	Fulano5		2199999999
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, "clientId", "cakeId", quantity, "createdAt", "totalPrice") FROM stdin;
1	1	1	2	2023-01-08 22:08:30	30
2	1	2	2	2023-01-08 22:08:35	20
3	2	1	2	2023-01-08 22:08:40	30
4	2	2	2	2023-01-08 22:08:44	20
5	3	1	3	2023-01-08 22:32:48	45
6	2	2	3	2023-01-09 22:33:36	30
7	2	2	4	2023-01-09 22:34:59	40
8	1	1	4	2023-01-11 15:53:45	60
9	1	1	4	2023-01-11 15:54:07	60
\.


--
-- Name: cakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cakes_id_seq', 9, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 8, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 9, true);


--
-- Name: cakes cakes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders orders_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_fk0 FOREIGN KEY ("clientId") REFERENCES public.orders(id);


--
-- Name: orders orders_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_fk1 FOREIGN KEY ("cakeId") REFERENCES public.cakes(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "linkdriven" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: linkdriven; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE linkdriven WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE linkdriven OWNER TO postgres;

\connect linkdriven

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.hashtags OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    date timestamp with time zone NOT NULL,
    text text NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts-hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."posts-hashtags" (
    id integer NOT NULL,
    "post-id" integer NOT NULL,
    "hashtag-id" integer NOT NULL
);


ALTER TABLE public."posts-hashtags" OWNER TO postgres;

--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."posts-hashtags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."posts-hashtags_id_seq" OWNER TO postgres;

--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."posts-hashtags_id_seq" OWNED BY public."posts-hashtags".id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: public.comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."public.comments" (
    id integer NOT NULL,
    comment text NOT NULL,
    "user-id" integer NOT NULL,
    "post-id" integer NOT NULL
);


ALTER TABLE public."public.comments" OWNER TO postgres;

--
-- Name: public.comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.comments_id_seq" OWNER TO postgres;

--
-- Name: public.comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.comments_id_seq" OWNED BY public."public.comments".id;


--
-- Name: public.followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."public.followers" (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    "followed-id" integer NOT NULL
);


ALTER TABLE public."public.followers" OWNER TO postgres;

--
-- Name: public.followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.followers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.followers_id_seq" OWNER TO postgres;

--
-- Name: public.followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.followers_id_seq" OWNED BY public."public.followers".id;


--
-- Name: public.reposts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."public.reposts" (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    "reposted-post-id" integer NOT NULL,
    date time with time zone DEFAULT '10:19:32.382914+00'::time with time zone NOT NULL
);


ALTER TABLE public."public.reposts" OWNER TO postgres;

--
-- Name: public.reposts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.reposts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.reposts_id_seq" OWNER TO postgres;

--
-- Name: public.reposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.reposts_id_seq" OWNED BY public."public.reposts".id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    token uuid NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: sessions_user-id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."sessions_user-id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."sessions_user-id_seq" OWNER TO postgres;

--
-- Name: sessions_user-id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."sessions_user-id_seq" OWNED BY public.sessions."user-id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    image text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users-like-posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."users-like-posts" (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    "post-id" integer NOT NULL
);


ALTER TABLE public."users-like-posts" OWNER TO postgres;

--
-- Name: users-like-posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users-like-posts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-like-posts_id_seq" OWNER TO postgres;

--
-- Name: users-like-posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users-like-posts_id_seq" OWNED BY public."users-like-posts".id;


--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users-like-posts_post-id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-like-posts_post-id_seq" OWNER TO postgres;

--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users-like-posts_post-id_seq" OWNED BY public."users-like-posts"."post-id";


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts-hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags" ALTER COLUMN id SET DEFAULT nextval('public."posts-hashtags_id_seq"'::regclass);


--
-- Name: public.comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."public.comments" ALTER COLUMN id SET DEFAULT nextval('public."public.comments_id_seq"'::regclass);


--
-- Name: public.followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."public.followers" ALTER COLUMN id SET DEFAULT nextval('public."public.followers_id_seq"'::regclass);


--
-- Name: public.reposts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."public.reposts" ALTER COLUMN id SET DEFAULT nextval('public."public.reposts_id_seq"'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: sessions user-id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN "user-id" SET DEFAULT nextval('public."sessions_user-id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users-like-posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts" ALTER COLUMN id SET DEFAULT nextval('public."users-like-posts_id_seq"'::regclass);


--
-- Name: users-like-posts post-id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts" ALTER COLUMN "post-id" SET DEFAULT nextval('public."users-like-posts_post-id_seq"'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashtags (id, name) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, "user-id", date, text, url) FROM stdin;
\.


--
-- Data for Name: posts-hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."posts-hashtags" (id, "post-id", "hashtag-id") FROM stdin;
\.


--
-- Data for Name: public.comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."public.comments" (id, comment, "user-id", "post-id") FROM stdin;
\.


--
-- Data for Name: public.followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."public.followers" (id, "user-id", "followed-id") FROM stdin;
\.


--
-- Data for Name: public.reposts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."public.reposts" (id, "user-id", "reposted-post-id", date) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "user-id", token) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, image, email, password) FROM stdin;
\.


--
-- Data for Name: users-like-posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."users-like-posts" (id, "user-id", "post-id") FROM stdin;
\.


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."posts-hashtags_id_seq"', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: public.comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.comments_id_seq"', 1, false);


--
-- Name: public.followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.followers_id_seq"', 1, false);


--
-- Name: public.reposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.reposts_id_seq"', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: sessions_user-id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."sessions_user-id_seq"', 1, false);


--
-- Name: users-like-posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users-like-posts_id_seq"', 1, false);


--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users-like-posts_post-id_seq"', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: public.followers followers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."public.followers"
    ADD CONSTRAINT followers_pk PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pk PRIMARY KEY (id);


--
-- Name: posts-hashtags posts-hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_pk" PRIMARY KEY (id);


--
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: users-like-posts users-like-posts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_pk" PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: posts-hashtags posts-hashtags_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_fk0" FOREIGN KEY ("post-id") REFERENCES public.posts(id);


--
-- Name: posts-hashtags posts-hashtags_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_fk1" FOREIGN KEY ("hashtag-id") REFERENCES public.hashtags(id);


--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: users-like-posts users-like-posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_fk0" FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: users-like-posts users-like-posts_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_fk1" FOREIGN KEY ("post-id") REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "linkedriven" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: linkedriven; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE linkedriven WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE linkedriven OWNER TO postgres;

\connect linkedriven

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: applicants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicants (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "jobId" integer NOT NULL
);


ALTER TABLE public.applicants OWNER TO postgres;

--
-- Name: applicants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applicants_id_seq OWNER TO postgres;

--
-- Name: applicants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicants_id_seq OWNED BY public.applicants.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name text NOT NULL,
    "imageUrl" text NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.educations (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "schoolId" integer NOT NULL,
    "courseId" integer NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL,
    status text NOT NULL
);


ALTER TABLE public.educations OWNER TO postgres;

--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.educations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educations_id_seq OWNER TO postgres;

--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;


--
-- Name: experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "companyId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date
);


ALTER TABLE public.experiences OWNER TO postgres;

--
-- Name: experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiences_id_seq OWNER TO postgres;

--
-- Name: experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiences_id_seq OWNED BY public.experiences.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    "companyId" integer NOT NULL,
    "roleId" integer NOT NULL,
    description text NOT NULL,
    salary integer NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools (
    id integer NOT NULL,
    name text NOT NULL,
    "imageUrl" text NOT NULL
);


ALTER TABLE public.schools OWNER TO postgres;

--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schools_id_seq OWNER TO postgres;

--
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schools_id_seq OWNED BY public.schools.id;


--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    "writerId" integer NOT NULL,
    "recipientId" integer NOT NULL,
    message text NOT NULL,
    "publicationDate" date NOT NULL
);


ALTER TABLE public.testimonials OWNER TO postgres;

--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testimonials_id_seq OWNER TO postgres;

--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "birthDate" date NOT NULL,
    "imageUrl" text NOT NULL,
    "cityId" integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: applicants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants ALTER COLUMN id SET DEFAULT nextval('public.applicants_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);


--
-- Name: experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences ALTER COLUMN id SET DEFAULT nextval('public.experiences_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: schools id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools ALTER COLUMN id SET DEFAULT nextval('public.schools_id_seq'::regclass);


--
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: applicants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicants (id, "userId", "jobId") FROM stdin;
1	162	68
2	490	88
3	144	16
4	471	16
5	436	5
6	308	58
7	193	45
8	245	59
9	127	95
10	147	58
11	448	13
12	460	70
13	317	69
14	492	18
15	118	52
16	26	56
17	310	99
18	27	80
19	27	69
20	392	68
21	11	91
22	120	35
23	316	43
24	104	13
25	151	99
26	382	46
27	363	48
28	36	75
29	293	94
30	109	90
31	278	74
32	341	78
33	292	92
34	215	69
35	259	17
36	89	38
37	168	7
38	30	77
39	277	60
40	440	61
41	179	71
42	432	24
43	277	54
44	255	49
45	34	25
46	209	63
47	359	13
48	8	33
49	354	63
50	23	90
51	493	66
52	396	94
53	492	41
54	132	54
55	70	80
56	394	55
57	181	92
58	299	42
59	27	67
60	181	59
61	11	34
62	177	31
63	496	50
64	94	40
65	477	31
66	328	48
67	92	90
68	278	90
69	26	73
70	431	9
71	110	38
72	76	17
73	363	29
74	326	15
75	11	2
76	80	99
77	428	4
78	177	17
79	166	82
80	192	11
81	335	22
82	17	65
83	450	57
84	431	68
85	436	26
86	284	73
87	357	42
88	433	25
89	222	11
90	130	7
91	470	36
92	223	52
93	15	78
94	15	30
95	229	32
96	161	4
97	392	64
98	10	34
99	23	11
100	210	66
101	193	101
102	26	101
103	30	101
104	34	101
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name) FROM stdin;
1	Afonso Cláudio
2	Água Doce do Norte
3	Águia Branca
4	Alegre
5	Alfredo Chaves
6	Alto Rio Novo
7	Anchieta
8	Apiacá
9	Aracruz
10	Atilio Vivacqua
11	Baixo Guandu
12	Barra de São Francisco
13	Boa Esperança
14	Bom Jesus do Norte
15	Brejetuba
16	Cachoeiro de Itapemirim
17	Cariacica
18	Castelo
19	Colatina
20	Conceição da Barra
21	Conceição do Castelo
22	Divino de São Lourenço
23	Domingos Martins
24	Dores do Rio Preto
25	Ecoporanga
26	Fundão
27	Governador Lindenberg
28	Guaçuí
29	Guarapari
30	Ibatiba
31	Ibiraçu
32	Ibitirama
33	Iconha
34	Irupi
35	Itaguaçu
36	Itapemirim
37	Itarana
38	Iúna
39	Jaguaré
40	Jerônimo Monteiro
41	João Neiva
42	Laranja da Terra
43	Linhares
44	Mantenópolis
45	Marataízes
46	Marechal Floriano
47	Marilândia
48	Mimoso do Sul
49	Montanha
50	Mucurici
51	Muniz Freire
52	Muqui
53	Nova Venécia
54	Pancas
55	Pedro Canário
56	Pinheiros
57	Piúma
58	Ponto Belo
59	Presidente Kennedy
60	Rio Bananal
61	Rio Novo do Sul
62	Santa Leopoldina
63	Santa Maria de Jetibá
64	Santa Teresa
65	São Domingos do Norte
66	São Gabriel da Palha
67	São José do Calçado
68	São Mateus
69	São Roque do Canaã
70	Serra
71	Sooretama
72	Vargem Alta
73	Venda Nova do Imigrante
74	Viana
75	Vila Pavão
76	Vila Valério
77	Vila Velha
78	Vitória
79	Acrelândia
80	Assis Brasil
81	Brasiléia
82	Bujari
83	Capixaba
84	Cruzeiro do Sul
85	Epitaciolândia
86	Feijó
87	Jordão
88	Mâncio Lima
89	Manoel Urbano
90	Marechal Thaumaturgo
91	Plácido de Castro
92	Porto Acre
93	Porto Walter
94	Rio Branco
95	Rodrigues Alves
96	Santa Rosa do Purus
97	Sena Madureira
98	Senador Guiomard
99	Tarauacá
100	Xapuri
101	Água Branca
102	Anadia
103	Arapiraca
104	Atalaia
105	Barra de Santo Antônio
106	Barra de São Miguel
107	Batalha
108	Belém
109	Belo Monte
110	Boca da Mata
111	Branquinha
112	Cacimbinhas
113	Cajueiro
114	Campestre
115	Campo Alegre
116	Campo Grande
117	Canapi
118	Capela
119	Carneiros
120	Chã Preta
121	Coité do Nóia
122	Colônia Leopoldina
123	Coqueiro Seco
124	Coruripe
125	Craíbas
126	Delmiro Gouveia
127	Dois Riachos
128	Estrela de Alagoas
129	Feira Grande
130	Feliz Deserto
131	Flexeiras
132	Girau do Ponciano
133	Ibateguara
134	Igaci
135	Igreja Nova
136	Inhapi
137	Jacaré dos Homens
138	Jacuípe
139	Japaratinga
140	Jaramataia
141	Jequiá da Praia
142	Joaquim Gomes
143	Jundiá
144	Junqueiro
145	Lagoa da Canoa
146	Limoeiro de Anadia
147	Maceió
148	Major Isidoro
149	Mar Vermelho
150	Maragogi
151	Maravilha
152	Marechal Deodoro
153	Maribondo
154	Mata Grande
155	Matriz de Camaragibe
156	Messias
157	Minador do Negrão
158	Monteirópolis
159	Murici
160	Novo Lino
161	Olho d`Água das Flores
162	Olho d`Água do Casado
163	Olho d`Água Grande
164	Olivença
165	Ouro Branco
166	Palestina
167	Palmeira dos Índios
168	Pão de Açúcar
169	Pariconha
170	Paripueira
171	Passo de Camaragibe
172	Paulo Jacinto
173	Penedo
174	Piaçabuçu
175	Pilar
176	Pindoba
177	Piranhas
178	Poço das Trincheiras
179	Porto Calvo
180	Porto de Pedras
181	Porto Real do Colégio
182	Quebrangulo
183	Rio Largo
184	Roteiro
185	Santa Luzia do Norte
186	Santana do Ipanema
187	Santana do Mundaú
188	São Brás
189	São José da Laje
190	São José da Tapera
191	São Luís do Quitunde
192	São Miguel dos Campos
193	São Miguel dos Milagres
194	São Sebastião
195	Satuba
196	Senador Rui Palmeira
197	Tanque d`Arca
198	Taquarana
199	Teotônio Vilela
200	Traipu
201	União dos Palmares
202	Viçosa
203	Amapá
204	Calçoene
205	Cutias
206	Ferreira Gomes
207	Itaubal
208	Laranjal do Jari
209	Macapá
210	Mazagão
211	Oiapoque
212	Pedra Branca do Amaparí
213	Porto Grande
214	Pracuúba
215	Santana
216	Serra do Navio
217	Tartarugalzinho
218	Vitória do Jari
219	Alvarães
220	Amaturá
221	Anamã
222	Anori
223	Apuí
224	Atalaia do Norte
225	Autazes
226	Barcelos
227	Barreirinha
228	Benjamin Constant
229	Beruri
230	Boa Vista do Ramos
231	Boca do Acre
232	Borba
233	Caapiranga
234	Canutama
235	Carauari
236	Careiro
237	Careiro da Várzea
238	Coari
239	Codajás
240	Eirunepé
241	Envira
242	Fonte Boa
243	Guajará
244	Humaitá
245	Ipixuna
246	Iranduba
247	Itacoatiara
248	Itamarati
249	Itapiranga
250	Japurá
251	Juruá
252	Jutaí
253	Lábrea
254	Manacapuru
255	Manaquiri
256	Manaus
257	Manicoré
258	Maraã
259	Maués
260	Nhamundá
261	Nova Olinda do Norte
262	Novo Airão
263	Novo Aripuanã
264	Parintins
265	Pauini
266	Presidente Figueiredo
267	Rio Preto da Eva
268	Santa Isabel do Rio Negro
269	Santo Antônio do Içá
270	São Gabriel da Cachoeira
271	São Paulo de Olivença
272	São Sebastião do Uatumã
273	Silves
274	Tabatinga
275	Tapauá
276	Tefé
277	Tonantins
278	Uarini
279	Urucará
280	Urucurituba
281	Abaíra
282	Abaré
283	Acajutiba
284	Adustina
285	Água Fria
286	Aiquara
287	Alagoinhas
288	Alcobaça
289	Almadina
290	Amargosa
291	Amélia Rodrigues
292	América Dourada
293	Anagé
294	Andaraí
295	Andorinha
296	Angical
297	Anguera
298	Antas
299	Antônio Cardoso
300	Antônio Gonçalves
301	Aporá
302	Apuarema
303	Araças
304	Aracatu
305	Araci
306	Aramari
307	Arataca
308	Aratuípe
309	Aurelino Leal
310	Baianópolis
311	Baixa Grande
312	Banzaê
313	Barra
314	Barra da Estiva
315	Barra do Choça
316	Barra do Mendes
317	Barra do Rocha
318	Barreiras
319	Barro Alto
320	Barro Preto (antigo Gov. Lomanto Jr
321	Barrocas
322	Belmonte
323	Belo Campo
324	Biritinga
325	Boa Nova
326	Boa Vista do Tupim
327	Bom Jesus da Lapa
328	Bom Jesus da Serra
329	Boninal
330	Bonito
331	Boquira
332	Botuporã
333	Brejões
334	Brejolândia
335	Brotas de Macaúbas
336	Brumado
337	Buerarema
338	Buritirama
339	Caatiba
340	Cabaceiras do Paraguaçu
341	Cachoeira
342	Caculé
343	Caém
344	Caetanos
345	Caetité
346	Cafarnaum
347	Cairu
348	Caldeirão Grande
349	Camacan
350	Camaçari
351	Camamu
352	Campo Alegre de Lourdes
353	Campo Formoso
354	Canápolis
355	Canarana
356	Canavieiras
357	Candeal
358	Candeias
359	Candiba
360	Cândido Sales
361	Cansanção
362	Canudos
363	Capela do Alto Alegre
364	Capim Grosso
365	Caraíbas
366	Caravelas
367	Cardeal da Silva
368	Carinhanha
369	Casa Nova
370	Castro Alves
371	Catolândia
372	Catu
373	Caturama
374	Central
375	Chorrochó
376	Cícero Dantas
377	Cipó
378	Coaraci
379	Cocos
380	Conceição da Feira
381	Conceição do Almeida
382	Conceição do Coité
383	Conceição do Jacuípe
384	Conde
385	Condeúba
386	Contendas do Sincorá
387	Coração de Maria
388	Cordeiros
389	Coribe
390	Coronel João Sá
391	Correntina
392	Cotegipe
393	Cravolândia
394	Crisópolis
395	Cristópolis
396	Cruz das Almas
397	Curaçá
398	Dário Meira
399	Dias d`Ávila
400	Dom Basílio
401	Dom Macedo Costa
402	Elísio Medrado
403	Encruzilhada
404	Entre Rios
405	Érico Cardoso
406	Esplanada
407	Euclides da Cunha
408	Eunápolis
409	Fátima
410	Feira da Mata
411	Feira de Santana
412	Filadélfia
413	Firmino Alves
414	Floresta Azul
415	Formosa do Rio Preto
416	Gandu
417	Gavião
418	Gentio do Ouro
419	Glória
420	Gongogi
421	Governador Mangabeira
422	Guajeru
423	Guanambi
424	Guaratinga
425	Heliópolis
426	Iaçu
427	Ibiassucê
428	Ibicaraí
429	Ibicoara
430	Ibicuí
431	Ibipeba
432	Ibipitanga
433	Ibiquera
434	Ibirapitanga
435	Ibirapuã
436	Ibirataia
437	Ibitiara
438	Ibititá
439	Ibotirama
440	Ichu
441	Igaporã
442	Igrapiúna
443	Iguaí
444	Ilhéus
445	Inhambupe
446	Ipecaetá
447	Ipiaú
448	Ipirá
449	Ipupiara
450	Irajuba
451	Iramaia
452	Iraquara
453	Irará
454	Irecê
455	Itabela
456	Itaberaba
457	Itabuna
458	Itacaré
459	Itaeté
460	Itagi
461	Itagibá
462	Itagimirim
463	Itaguaçu da Bahia
464	Itaju do Colônia
465	Itajuípe
466	Itamaraju
467	Itamari
468	Itambé
469	Itanagra
470	Itanhém
471	Itaparica
472	Itapé
473	Itapebi
474	Itapetinga
475	Itapicuru
476	Itapitanga
477	Itaquara
478	Itarantim
479	Itatim
480	Itiruçu
481	Itiúba
482	Itororó
483	Ituaçu
484	Ituberá
485	Iuiú
486	Jaborandi
487	Jacaraci
488	Jacobina
489	Jaguaquara
490	Jaguarari
491	Jaguaripe
492	Jandaíra
493	Jequié
494	Jeremoabo
495	Jiquiriçá
496	Jitaúna
497	João Dourado
498	Juazeiro
499	Jucuruçu
500	Jussara
501	Jussari
502	Jussiape
503	Lafaiete Coutinho
504	Lagoa Real
505	Laje
506	Lajedão
507	Lajedinho
508	Lajedo do Tabocal
509	Lamarão
510	Lapão
511	Lauro de Freitas
512	Lençóis
513	Licínio de Almeida
514	Livramento de Nossa Senhora
515	Luís Eduardo Magalhães
516	Macajuba
517	Macarani
518	Macaúbas
519	Macururé
520	Madre de Deus
521	Maetinga
522	Maiquinique
523	Mairi
524	Malhada
525	Malhada de Pedras
526	Manoel Vitorino
527	Mansidão
528	Maracás
529	Maragogipe
530	Maraú
531	Marcionílio Souza
532	Mascote
533	Mata de São João
534	Matina
535	Medeiros Neto
536	Miguel Calmon
537	Milagres
538	Mirangaba
539	Mirante
540	Monte Santo
541	Morpará
542	Morro do Chapéu
543	Mortugaba
544	Mucugê
545	Mucuri
546	Mulungu do Morro
547	Mundo Novo
548	Muniz Ferreira
549	Muquém de São Francisco
550	Muritiba
551	Mutuípe
552	Nazaré
553	Nilo Peçanha
554	Nordestina
555	Nova Canaã
556	Nova Fátima
557	Nova Ibiá
558	Nova Itarana
559	Nova Redenção
560	Nova Soure
561	Nova Viçosa
562	Novo Horizonte
563	Novo Triunfo
564	Olindina
565	Oliveira dos Brejinhos
566	Ouriçangas
567	Ourolândia
568	Palmas de Monte Alto
569	Palmeiras
570	Paramirim
571	Paratinga
572	Paripiranga
573	Pau Brasil
574	Paulo Afonso
575	Pé de Serra
576	Pedrão
577	Pedro Alexandre
578	Piatã
579	Pilão Arcado
580	Pindaí
581	Pindobaçu
582	Pintadas
583	Piraí do Norte
584	Piripá
585	Piritiba
586	Planaltino
587	Planalto
588	Poções
589	Pojuca
590	Ponto Novo
591	Porto Seguro
592	Potiraguá
593	Prado
594	Presidente Dutra
595	Presidente Jânio Quadros
596	Presidente Tancredo Neves
597	Queimadas
598	Quijingue
599	Quixabeira
600	Rafael Jambeiro
601	Remanso
602	Retirolândia
603	Riachão das Neves
604	Riachão do Jacuípe
605	Riacho de Santana
606	Ribeira do Amparo
607	Ribeira do Pombal
608	Ribeirão do Largo
609	Rio de Contas
610	Rio do Antônio
611	Rio do Pires
612	Rio Real
613	Rodelas
614	Ruy Barbosa
615	Salinas da Margarida
616	Salvador
617	Santa Bárbara
618	Santa Brígida
619	Santa Cruz Cabrália
620	Santa Cruz da Vitória
621	Santa Inês
622	Santa Luzia
623	Santa Maria da Vitória
624	Santa Rita de Cássia
625	Santa Teresinha
626	Santaluz
627	Santana
628	Santanópolis
629	Santo Amaro
630	Santo Antônio de Jesus
631	Santo Estêvão
632	São Desidério
633	São Domingos
634	São Felipe
635	São Félix
636	São Félix do Coribe
637	São Francisco do Conde
638	São Gabriel
639	São Gonçalo dos Campos
640	São José da Vitória
641	São José do Jacuípe
642	São Miguel das Matas
643	São Sebastião do Passé
644	Sapeaçu
645	Sátiro Dias
646	Saubara
647	Saúde
648	Seabra
649	Sebastião Laranjeiras
650	Senhor do Bonfim
651	Sento Sé
652	Serra do Ramalho
653	Serra Dourada
654	Serra Preta
655	Serrinha
656	Serrolândia
657	Simões Filho
658	Sítio do Mato
659	Sítio do Quinto
660	Sobradinho
661	Souto Soares
662	Tabocas do Brejo Velho
663	Tanhaçu
664	Tanque Novo
665	Tanquinho
666	Taperoá
667	Tapiramutá
668	Teixeira de Freitas
669	Teodoro Sampaio
670	Teofilândia
671	Teolândia
672	Terra Nova
673	Tremedal
674	Tucano
675	Uauá
676	Ubaíra
677	Ubaitaba
678	Ubatã
679	Uibaí
680	Umburanas
681	Una
682	Urandi
683	Uruçuca
684	Utinga
685	Valença
686	Valente
687	Várzea da Roça
688	Várzea do Poço
689	Várzea Nova
690	Varzedo
691	Vera Cruz
692	Vereda
693	Vitória da Conquista
694	Wagner
695	Wanderley
696	Wenceslau Guimarães
697	Xique-Xique
698	Abaiara
699	Acarape
700	Acaraú
701	Acopiara
702	Aiuaba
703	Alcântaras
704	Altaneira
705	Alto Santo
706	Amontada
707	Antonina do Norte
708	Apuiarés
709	Aquiraz
710	Aracati
711	Aracoiaba
712	Ararendá
713	Araripe
714	Aratuba
715	Arneiroz
716	Assaré
717	Aurora
718	Baixio
719	Banabuiú
720	Barbalha
721	Barreira
722	Barro
723	Barroquinha
724	Baturité
725	Beberibe
726	Bela Cruz
727	Boa Viagem
728	Brejo Santo
729	Camocim
730	Campos Sales
731	Canindé
732	Capistrano
733	Caridade
734	Cariré
735	Caririaçu
736	Cariús
737	Carnaubal
738	Cascavel
739	Catarina
740	Catunda
741	Caucaia
742	Cedro
743	Chaval
744	Choró
745	Chorozinho
746	Coreaú
747	Crateús
748	Crato
749	Croatá
750	Cruz
751	Deputado Irapuan Pinheiro
752	Ererê
753	Eusébio
754	Farias Brito
755	Forquilha
756	Fortaleza
757	Fortim
758	Frecheirinha
759	General Sampaio
760	Graça
761	Granja
762	Granjeiro
763	Groaíras
764	Guaiúba
765	Guaraciaba do Norte
766	Guaramiranga
767	Hidrolândia
768	Horizonte
769	Ibaretama
770	Ibiapina
771	Ibicuitinga
772	Icapuí
773	Icó
774	Iguatu
775	Independência
776	Ipaporanga
777	Ipaumirim
778	Ipu
779	Ipueiras
780	Iracema
781	Irauçuba
782	Itaiçaba
783	Itaitinga
784	Itapagé
785	Itapipoca
786	Itapiúna
787	Itarema
788	Itatira
789	Jaguaretama
790	Jaguaribara
791	Jaguaribe
792	Jaguaruana
793	Jardim
794	Jati
795	Jijoca de Jericoacoara
796	Juazeiro do Norte
797	Jucás
798	Lavras da Mangabeira
799	Limoeiro do Norte
800	Madalena
801	Maracanaú
802	Maranguape
803	Marco
804	Martinópole
805	Massapê
806	Mauriti
807	Meruoca
808	Milagres
809	Milhã
810	Miraíma
811	Missão Velha
812	Mombaça
813	Monsenhor Tabosa
814	Morada Nova
815	Moraújo
816	Morrinhos
817	Mucambo
818	Mulungu
819	Nova Olinda
820	Nova Russas
821	Novo Oriente
822	Ocara
823	Orós
824	Pacajus
825	Pacatuba
826	Pacoti
827	Pacujá
828	Palhano
829	Palmácia
830	Paracuru
831	Paraipaba
832	Parambu
833	Paramoti
834	Pedra Branca
835	Penaforte
836	Pentecoste
837	Pereiro
838	Pindoretama
839	Piquet Carneiro
840	Pires Ferreira
841	Poranga
842	Porteiras
843	Potengi
844	Potiretama
845	Quiterianópolis
846	Quixadá
847	Quixelô
848	Quixeramobim
849	Quixeré
850	Redenção
851	Reriutaba
852	Russas
853	Saboeiro
854	Salitre
855	Santa Quitéria
856	Santana do Acaraú
857	Santana do Cariri
858	São Benedito
859	São Gonçalo do Amarante
860	São João do Jaguaribe
861	São Luís do Curu
862	Senador Pompeu
863	Senador Sá
864	Sobral
865	Solonópole
866	Tabuleiro do Norte
867	Tamboril
868	Tarrafas
869	Tauá
870	Tejuçuoca
871	Tianguá
872	Trairi
873	Tururu
874	Ubajara
875	Umari
876	Umirim
877	Uruburetama
878	Uruoca
879	Varjota
880	Várzea Alegre
881	Viçosa do Ceará
882	Brasília
883	Abadia de Goiás
884	Abadiânia
885	Acreúna
886	Adelândia
887	Água Fria de Goiás
888	Água Limpa
889	Águas Lindas de Goiás
890	Alexânia
891	Aloândia
892	Alto Horizonte
893	Alto Paraíso de Goiás
894	Alvorada do Norte
895	Amaralina
896	Americano do Brasil
897	Amorinópolis
898	Anápolis
899	Anhanguera
900	Anicuns
901	Aparecida de Goiânia
902	Aparecida do Rio Doce
903	Aporé
904	Araçu
905	Aragarças
906	Aragoiânia
907	Araguapaz
908	Arenópolis
909	Aruanã
910	Aurilândia
911	Avelinópolis
912	Baliza
913	Barro Alto
914	Bela Vista de Goiás
915	Bom Jardim de Goiás
916	Bom Jesus de Goiás
917	Bonfinópolis
918	Bonópolis
919	Brazabrantes
920	Britânia
921	Buriti Alegre
922	Buriti de Goiás
923	Buritinópolis
924	Cabeceiras
925	Cachoeira Alta
926	Cachoeira de Goiás
927	Cachoeira Dourada
928	Caçu
929	Caiapônia
930	Caldas Novas
931	Caldazinha
932	Campestre de Goiás
933	Campinaçu
934	Campinorte
935	Campo Alegre de Goiás
936	Campo Limpo de Goiás
937	Campos Belos
938	Campos Verdes
939	Carmo do Rio Verde
940	Castelândia
941	Catalão
942	Caturaí
943	Cavalcante
944	Ceres
945	Cezarina
946	Chapadão do Céu
947	Cidade Ocidental
948	Cocalzinho de Goiás
949	Colinas do Sul
950	Córrego do Ouro
951	Corumbá de Goiás
952	Corumbaíba
953	Cristalina
954	Cristianópolis
955	Crixás
956	Cromínia
957	Cumari
958	Damianópolis
959	Damolândia
960	Davinópolis
961	Diorama
962	Divinópolis de Goiás
963	Doverlândia
964	Edealina
965	Edéia
966	Estrela do Norte
967	Faina
968	Fazenda Nova
969	Firminópolis
970	Flores de Goiás
971	Formosa
972	Formoso
973	Gameleira de Goiás
974	Goianápolis
975	Goiandira
976	Goianésia
977	Goiânia
978	Goianira
979	Goiás
980	Goiatuba
981	Gouvelândia
982	Guapó
983	Guaraíta
984	Guarani de Goiás
985	Guarinos
986	Heitoraí
987	Hidrolândia
988	Hidrolina
989	Iaciara
990	Inaciolândia
991	Indiara
992	Inhumas
993	Ipameri
994	Ipiranga de Goiás
995	Iporá
996	Israelândia
997	Itaberaí
998	Itaguari
999	Itaguaru
1000	Itajá
1001	Itapaci
1002	Itapirapuã
1003	Itapuranga
1004	Itarumã
1005	Itauçu
1006	Itumbiara
1007	Ivolândia
1008	Jandaia
1009	Jaraguá
1010	Jataí
1011	Jaupaci
1012	Jesúpolis
1013	Joviânia
1014	Jussara
1015	Lagoa Santa
1016	Leopoldo de Bulhões
1017	Luziânia
1018	Mairipotaba
1019	Mambaí
1020	Mara Rosa
1021	Marzagão
1022	Matrinchã
1023	Maurilândia
1024	Mimoso de Goiás
1025	Minaçu
1026	Mineiros
1027	Moiporá
1028	Monte Alegre de Goiás
1029	Montes Claros de Goiás
1030	Montividiu
1031	Montividiu do Norte
1032	Morrinhos
1033	Morro Agudo de Goiás
1034	Mossâmedes
1035	Mozarlândia
1036	Mundo Novo
1037	Mutunópolis
1038	Nazário
1039	Nerópolis
1040	Niquelândia
1041	Nova América
1042	Nova Aurora
1043	Nova Crixás
1044	Nova Glória
1045	Nova Iguaçu de Goiás
1046	Nova Roma
1047	Nova Veneza
1048	Novo Brasil
1049	Novo Gama
1050	Novo Planalto
1051	Orizona
1052	Ouro Verde de Goiás
1053	Ouvidor
1054	Padre Bernardo
1055	Palestina de Goiás
1056	Palmeiras de Goiás
1057	Palmelo
1058	Palminópolis
1059	Panamá
1060	Paranaiguara
1061	Paraúna
1062	Perolândia
1063	Petrolina de Goiás
1064	Pilar de Goiás
1065	Piracanjuba
1066	Piranhas
1067	Pirenópolis
1068	Pires do Rio
1069	Planaltina
1070	Pontalina
1071	Porangatu
1072	Porteirão
1073	Portelândia
1074	Posse
1075	Professor Jamil
1076	Quirinópolis
1077	Rialma
1078	Rianápolis
1079	Rio Quente
1080	Rio Verde
1081	Rubiataba
1082	Sanclerlândia
1083	Santa Bárbara de Goiás
1084	Santa Cruz de Goiás
1085	Santa Fé de Goiás
1086	Santa Helena de Goiás
1087	Santa Isabel
1088	Santa Rita do Araguaia
1089	Santa Rita do Novo Destino
1090	Santa Rosa de Goiás
1091	Santa Tereza de Goiás
1092	Santa Terezinha de Goiás
1093	Santo Antônio da Barra
1094	Santo Antônio de Goiás
1095	Santo Antônio do Descoberto
1096	São Domingos
1097	São Francisco de Goiás
1098	São João d`Aliança
1099	São João da Paraúna
1100	São Luís de Montes Belos
1101	São Luíz do Norte
1102	São Miguel do Araguaia
1103	São Miguel do Passa Quatro
1104	São Patrício
1105	São Simão
1106	Senador Canedo
1107	Serranópolis
1108	Silvânia
1109	Simolândia
1110	Sítio d`Abadia
1111	Taquaral de Goiás
1112	Teresina de Goiás
1113	Terezópolis de Goiás
1114	Três Ranchos
1115	Trindade
1116	Trombas
1117	Turvânia
1118	Turvelândia
1119	Uirapuru
1120	Uruaçu
1121	Uruana
1122	Urutaí
1123	Valparaíso de Goiás
1124	Varjão
1125	Vianópolis
1126	Vicentinópolis
1127	Vila Boa
1128	Vila Propício
1129	Açailândia
1130	Afonso Cunha
1131	Água Doce do Maranhão
1132	Alcântara
1133	Aldeias Altas
1134	Altamira do Maranhão
1135	Alto Alegre do Maranhão
1136	Alto Alegre do Pindaré
1137	Alto Parnaíba
1138	Amapá do Maranhão
1139	Amarante do Maranhão
1140	Anajatuba
1141	Anapurus
1142	Apicum-Açu
1143	Araguanã
1144	Araioses
1145	Arame
1146	Arari
1147	Axixá
1148	Bacabal
1149	Bacabeira
1150	Bacuri
1151	Bacurituba
1152	Balsas
1153	Barão de Grajaú
1154	Barra do Corda
1155	Barreirinhas
1156	Bela Vista do Maranhão
1157	Belágua
1158	Benedito Leite
1159	Bequimão
1160	Bernardo do Mearim
1161	Boa Vista do Gurupi
1162	Bom Jardim
1163	Bom Jesus das Selvas
1164	Bom Lugar
1165	Brejo
1166	Brejo de Areia
1167	Buriti
1168	Buriti Bravo
1169	Buriticupu
1170	Buritirana
1171	Cachoeira Grande
1172	Cajapió
1173	Cajari
1174	Campestre do Maranhão
1175	Cândido Mendes
1176	Cantanhede
1177	Capinzal do Norte
1178	Carolina
1179	Carutapera
1180	Caxias
1181	Cedral
1182	Central do Maranhão
1183	Centro do Guilherme
1184	Centro Novo do Maranhão
1185	Chapadinha
1186	Cidelândia
1187	Codó
1188	Coelho Neto
1189	Colinas
1190	Conceição do Lago-Açu
1191	Coroatá
1192	Cururupu
1193	Davinópolis
1194	Dom Pedro
1195	Duque Bacelar
1196	Esperantinópolis
1197	Estreito
1198	Feira Nova do Maranhão
1199	Fernando Falcão
1200	Formosa da Serra Negra
1201	Fortaleza dos Nogueiras
1202	Fortuna
1203	Godofredo Viana
1204	Gonçalves Dias
1205	Governador Archer
1206	Governador Edison Lobão
1207	Governador Eugênio Barros
1208	Governador Luiz Rocha
1209	Governador Newton Bello
1210	Governador Nunes Freire
1211	Graça Aranha
1212	Grajaú
1213	Guimarães
1214	Humberto de Campos
1215	Icatu
1216	Igarapé do Meio
1217	Igarapé Grande
1218	Imperatriz
1219	Itaipava do Grajaú
1220	Itapecuru Mirim
1221	Itinga do Maranhão
1222	Jatobá
1223	Jenipapo dos Vieiras
1224	João Lisboa
1225	Joselândia
1226	Junco do Maranhão
1227	Lago da Pedra
1228	Lago do Junco
1229	Lago dos Rodrigues
1230	Lago Verde
1231	Lagoa do Mato
1232	Lagoa Grande do Maranhão
1233	Lajeado Novo
1234	Lima Campos
1235	Loreto
1236	Luís Domingues
1237	Magalhães de Almeida
1238	Maracaçumé
1239	Marajá do Sena
1240	Maranhãozinho
1241	Mata Roma
1242	Matinha
1243	Matões
1244	Matões do Norte
1245	Milagres do Maranhão
1246	Mirador
1247	Miranda do Norte
1248	Mirinzal
1249	Monção
1250	Montes Altos
1251	Morros
1252	Nina Rodrigues
1253	Nova Colinas
1254	Nova Iorque
1255	Nova Olinda do Maranhão
1256	Olho d`Água das Cunhãs
1257	Olinda Nova do Maranhão
1258	Paço do Lumiar
1259	Palmeirândia
1260	Paraibano
1261	Parnarama
1262	Passagem Franca
1263	Pastos Bons
1264	Paulino Neves
1265	Paulo Ramos
1266	Pedreiras
1267	Pedro do Rosário
1268	Penalva
1269	Peri Mirim
1270	Peritoró
1271	Pindaré-Mirim
1272	Pinheiro
1273	Pio XII
1274	Pirapemas
1275	Poção de Pedras
1276	Porto Franco
1277	Porto Rico do Maranhão
1278	Presidente Dutra
1279	Presidente Juscelino
1280	Presidente Médici
1281	Presidente Sarney
1282	Presidente Vargas
1283	Primeira Cruz
1284	Raposa
1285	Riachão
1286	Ribamar Fiquene
1287	Rosário
1288	Sambaíba
1289	Santa Filomena do Maranhão
1290	Santa Helena
1291	Santa Inês
1292	Santa Luzia
1293	Santa Luzia do Paruá
1294	Santa Quitéria do Maranhão
1295	Santa Rita
1296	Santana do Maranhão
1297	Santo Amaro do Maranhão
1298	Santo Antônio dos Lopes
1299	São Benedito do Rio Preto
1300	São Bento
1301	São Bernardo
1302	São Domingos do Azeitão
1303	São Domingos do Maranhão
1304	São Félix de Balsas
1305	São Francisco do Brejão
1306	São Francisco do Maranhão
1307	São João Batista
1308	São João do Carú
1309	São João do Paraíso
1310	São João do Soter
1311	São João dos Patos
1312	São José de Ribamar
1313	São José dos Basílios
1314	São Luís
1315	São Luís Gonzaga do Maranhão
1316	São Mateus do Maranhão
1317	São Pedro da Água Branca
1318	São Pedro dos Crentes
1319	São Raimundo das Mangabeiras
1320	São Raimundo do Doca Bezerra
1321	São Roberto
1322	São Vicente Ferrer
1323	Satubinha
1324	Senador Alexandre Costa
1325	Senador La Rocque
1326	Serrano do Maranhão
1327	Sítio Novo
1328	Sucupira do Norte
1329	Sucupira do Riachão
1330	Tasso Fragoso
1331	Timbiras
1332	Timon
1333	Trizidela do Vale
1334	Tufilândia
1335	Tuntum
1336	Turiaçu
1337	Turilândia
1338	Tutóia
1339	Urbano Santos
1340	Vargem Grande
1341	Viana
1342	Vila Nova dos Martírios
1343	Vitória do Mearim
1344	Vitorino Freire
1345	Zé Doca
1346	Acorizal
1347	Água Boa
1348	Alta Floresta
1349	Alto Araguaia
1350	Alto Boa Vista
1351	Alto Garças
1352	Alto Paraguai
1353	Alto Taquari
1354	Apiacás
1355	Araguaiana
1356	Araguainha
1357	Araputanga
1358	Arenápolis
1359	Aripuanã
1360	Barão de Melgaço
1361	Barra do Bugres
1362	Barra do Garças
1363	Bom Jesus do Araguaia
1364	Brasnorte
1365	Cáceres
1366	Campinápolis
1367	Campo Novo do Parecis
1368	Campo Verde
1369	Campos de Júlio
1370	Canabrava do Norte
1371	Canarana
1372	Carlinda
1373	Castanheira
1374	Chapada dos Guimarães
1375	Cláudia
1376	Cocalinho
1377	Colíder
1378	Colniza
1379	Comodoro
1380	Confresa
1381	Conquista d`Oeste
1382	Cotriguaçu
1383	Cuiabá
1384	Curvelândia
1385	Curvelândia
1386	Denise
1387	Diamantino
1388	Dom Aquino
1389	Feliz Natal
1390	Figueirópolis d`Oeste
1391	Gaúcha do Norte
1392	General Carneiro
1393	Glória d`Oeste
1394	Guarantã do Norte
1395	Guiratinga
1396	Indiavaí
1397	Ipiranga do Norte
1398	Itanhangá
1399	Itaúba
1400	Itiquira
1401	Jaciara
1402	Jangada
1403	Jauru
1404	Juara
1405	Juína
1406	Juruena
1407	Juscimeira
1408	Lambari d`Oeste
1409	Lucas do Rio Verde
1410	Luciára
1411	Marcelândia
1412	Matupá
1413	Mirassol d`Oeste
1414	Nobres
1415	Nortelândia
1416	Nossa Senhora do Livramento
1417	Nova Bandeirantes
1418	Nova Brasilândia
1419	Nova Canaã do Norte
1420	Nova Guarita
1421	Nova Lacerda
1422	Nova Marilândia
1423	Nova Maringá
1424	Nova Monte verde
1425	Nova Mutum
1426	Nova Olímpia
1427	Nova Santa Helena
1428	Nova Ubiratã
1429	Nova Xavantina
1430	Novo Horizonte do Norte
1431	Novo Mundo
1432	Novo Santo Antônio
1433	Novo São Joaquim
1434	Paranaíta
1435	Paranatinga
1436	Pedra Preta
1437	Peixoto de Azevedo
1438	Planalto da Serra
1439	Poconé
1440	Pontal do Araguaia
1441	Ponte Branca
1442	Pontes e Lacerda
1443	Porto Alegre do Norte
1444	Porto dos Gaúchos
1445	Porto Esperidião
1446	Porto Estrela
1447	Poxoréo
1448	Primavera do Leste
1449	Querência
1450	Reserva do Cabaçal
1451	Ribeirão Cascalheira
1452	Ribeirãozinho
1453	Rio Branco
1454	Rondolândia
1455	Rondonópolis
1456	Rosário Oeste
1457	Salto do Céu
1458	Santa Carmem
1459	Santa Cruz do Xingu
1460	Santa Rita do Trivelato
1461	Santa Terezinha
1462	Santo Afonso
1463	Santo Antônio do Leste
1464	Santo Antônio do Leverger
1465	São Félix do Araguaia
1466	São José do Povo
1467	São José do Rio Claro
1468	São José do Xingu
1469	São José dos Quatro Marcos
1470	São Pedro da Cipa
1471	Sapezal
1472	Serra Nova Dourada
1473	Sinop
1474	Sorriso
1475	Tabaporã
1476	Tangará da Serra
1477	Tapurah
1478	Terra Nova do Norte
1479	Tesouro
1480	Torixoréu
1481	União do Sul
1482	Vale de São Domingos
1483	Várzea Grande
1484	Vera
1485	Vila Bela da Santíssima Trindade
1486	Vila Rica
1487	Água Clara
1488	Alcinópolis
1489	Amambaí
1490	Anastácio
1491	Anaurilândia
1492	Angélica
1493	Antônio João
1494	Aparecida do Taboado
1495	Aquidauana
1496	Aral Moreira
1497	Bandeirantes
1498	Bataguassu
1499	Bataiporã
1500	Bela Vista
1501	Bodoquena
1502	Bonito
1503	Brasilândia
1504	Caarapó
1505	Camapuã
1506	Campo Grande
1507	Caracol
1508	Cassilândia
1509	Chapadão do Sul
1510	Corguinho
1511	Coronel Sapucaia
1512	Corumbá
1513	Costa Rica
1514	Coxim
1515	Deodápolis
1516	Dois Irmãos do Buriti
1517	Douradina
1518	Dourados
1519	Eldorado
1520	Fátima do Sul
1521	Figueirão
1522	Glória de Dourados
1523	Guia Lopes da Laguna
1524	Iguatemi
1525	Inocência
1526	Itaporã
1527	Itaquiraí
1528	Ivinhema
1529	Japorã
1530	Jaraguari
1531	Jardim
1532	Jateí
1533	Juti
1534	Ladário
1535	Laguna Carapã
1536	Maracaju
1537	Miranda
1538	Mundo Novo
1539	Naviraí
1540	Nioaque
1541	Nova Alvorada do Sul
1542	Nova Andradina
1543	Novo Horizonte do Sul
1544	Paranaíba
1545	Paranhos
1546	Pedro Gomes
1547	Ponta Porã
1548	Porto Murtinho
1549	Ribas do Rio Pardo
1550	Rio Brilhante
1551	Rio Negro
1552	Rio Verde de Mato Grosso
1553	Rochedo
1554	Santa Rita do Pardo
1555	São Gabriel do Oeste
1556	Selvíria
1557	Sete Quedas
1558	Sidrolândia
1559	Sonora
1560	Tacuru
1561	Taquarussu
1562	Terenos
1563	Três Lagoas
1564	Vicentina
1565	Abadia dos Dourados
1566	Abaeté
1567	Abre Campo
1568	Acaiaca
1569	Açucena
1570	Água Boa
1571	Água Comprida
1572	Aguanil
1573	Águas Formosas
1574	Águas Vermelhas
1575	Aimorés
1576	Aiuruoca
1577	Alagoa
1578	Albertina
1579	Além Paraíba
1580	Alfenas
1581	Alfredo Vasconcelos
1582	Almenara
1583	Alpercata
1584	Alpinópolis
1585	Alterosa
1586	Alto Caparaó
1587	Alto Jequitibá
1588	Alto Rio Doce
1589	Alvarenga
1590	Alvinópolis
1591	Alvorada de Minas
1592	Amparo do Serra
1593	Andradas
1594	Andrelândia
1595	Angelândia
1596	Antônio Carlos
1597	Antônio Dias
1598	Antônio Prado de Minas
1599	Araçaí
1600	Aracitaba
1601	Araçuaí
1602	Araguari
1603	Arantina
1604	Araponga
1605	Araporã
1606	Arapuá
1607	Araújos
1608	Araxá
1609	Arceburgo
1610	Arcos
1611	Areado
1612	Argirita
1613	Aricanduva
1614	Arinos
1615	Astolfo Dutra
1616	Ataléia
1617	Augusto de Lima
1618	Baependi
1619	Baldim
1620	Bambuí
1621	Bandeira
1622	Bandeira do Sul
1623	Barão de Cocais
1624	Barão de Monte Alto
1625	Barbacena
1626	Barra Longa
1627	Barroso
1628	Bela Vista de Minas
1629	Belmiro Braga
1630	Belo Horizonte
1631	Belo Oriente
1632	Belo Vale
1633	Berilo
1634	Berizal
1635	Bertópolis
1636	Betim
1637	Bias Fortes
1638	Bicas
1639	Biquinhas
1640	Boa Esperança
1641	Bocaina de Minas
1642	Bocaiúva
1643	Bom Despacho
1644	Bom Jardim de Minas
1645	Bom Jesus da Penha
1646	Bom Jesus do Amparo
1647	Bom Jesus do Galho
1648	Bom Repouso
1649	Bom Sucesso
1650	Bonfim
1651	Bonfinópolis de Minas
1652	Bonito de Minas
1653	Borda da Mata
1654	Botelhos
1655	Botumirim
1656	Brás Pires
1657	Brasilândia de Minas
1658	Brasília de Minas
1659	Brasópolis
1660	Braúnas
1661	Brumadinho
1662	Bueno Brandão
1663	Buenópolis
1664	Bugre
1665	Buritis
1666	Buritizeiro
1667	Cabeceira Grande
1668	Cabo Verde
1669	Cachoeira da Prata
1670	Cachoeira de Minas
1671	Cachoeira de Pajeú
1672	Cachoeira Dourada
1673	Caetanópolis
1674	Caeté
1675	Caiana
1676	Cajuri
1677	Caldas
1678	Camacho
1679	Camanducaia
1680	Cambuí
1681	Cambuquira
1682	Campanário
1683	Campanha
1684	Campestre
1685	Campina Verde
1686	Campo Azul
1687	Campo Belo
1688	Campo do Meio
1689	Campo Florido
1690	Campos Altos
1691	Campos Gerais
1692	Cana Verde
1693	Canaã
1694	Canápolis
1695	Candeias
1696	Cantagalo
1697	Caparaó
1698	Capela Nova
1699	Capelinha
1700	Capetinga
1701	Capim Branco
1702	Capinópolis
1703	Capitão Andrade
1704	Capitão Enéas
1705	Capitólio
1706	Caputira
1707	Caraí
1708	Caranaíba
1709	Carandaí
1710	Carangola
1711	Caratinga
1712	Carbonita
1713	Careaçu
1714	Carlos Chagas
1715	Carmésia
1716	Carmo da Cachoeira
1717	Carmo da Mata
1718	Carmo de Minas
1719	Carmo do Cajuru
1720	Carmo do Paranaíba
1721	Carmo do Rio Claro
1722	Carmópolis de Minas
1723	Carneirinho
1724	Carrancas
1725	Carvalhópolis
1726	Carvalhos
1727	Casa Grande
1728	Cascalho Rico
1729	Cássia
1730	Cataguases
1731	Catas Altas
1732	Catas Altas da Noruega
1733	Catuji
1734	Catuti
1735	Caxambu
1736	Cedro do Abaeté
1737	Central de Minas
1738	Centralina
1739	Chácara
1740	Chalé
1741	Chapada do Norte
1742	Chapada Gaúcha
1743	Chiador
1744	Cipotânea
1745	Claraval
1746	Claro dos Poções
1747	Cláudio
1748	Coimbra
1749	Coluna
1750	Comendador Gomes
1751	Comercinho
1752	Conceição da Aparecida
1753	Conceição da Barra de Minas
1754	Conceição das Alagoas
1755	Conceição das Pedras
1756	Conceição de Ipanema
1757	Conceição do Mato Dentro
1758	Conceição do Pará
1759	Conceição do Rio Verde
1760	Conceição dos Ouros
1761	Cônego Marinho
1762	Confins
1763	Congonhal
1764	Congonhas
1765	Congonhas do Norte
1766	Conquista
1767	Conselheiro Lafaiete
1768	Conselheiro Pena
1769	Consolação
1770	Contagem
1771	Coqueiral
1772	Coração de Jesus
1773	Cordisburgo
1774	Cordislândia
1775	Corinto
1776	Coroaci
1777	Coromandel
1778	Coronel Fabriciano
1779	Coronel Murta
1780	Coronel Pacheco
1781	Coronel Xavier Chaves
1782	Córrego Danta
1783	Córrego do Bom Jesus
1784	Córrego Fundo
1785	Córrego Novo
1786	Couto de Magalhães de Minas
1787	Crisólita
1788	Cristais
1789	Cristália
1790	Cristiano Otoni
1791	Cristina
1792	Crucilândia
1793	Cruzeiro da Fortaleza
1794	Cruzília
1795	Cuparaque
1796	Curral de Dentro
1797	Curvelo
1798	Datas
1799	Delfim Moreira
1800	Delfinópolis
1801	Delta
1802	Descoberto
1803	Desterro de Entre Rios
1804	Desterro do Melo
1805	Diamantina
1806	Diogo de Vasconcelos
1807	Dionísio
1808	Divinésia
1809	Divino
1810	Divino das Laranjeiras
1811	Divinolândia de Minas
1812	Divinópolis
1813	Divisa Alegre
1814	Divisa Nova
1815	Divisópolis
1816	Dom Bosco
1817	Dom Cavati
1818	Dom Joaquim
1819	Dom Silvério
1820	Dom Viçoso
1821	Dona Eusébia
1822	Dores de Campos
1823	Dores de Guanhães
1824	Dores do Indaiá
1825	Dores do Turvo
1826	Doresópolis
1827	Douradoquara
1828	Durandé
1829	Elói Mendes
1830	Engenheiro Caldas
1831	Engenheiro Navarro
1832	Entre Folhas
1833	Entre Rios de Minas
1834	Ervália
1835	Esmeraldas
1836	Espera Feliz
1837	Espinosa
1838	Espírito Santo do Dourado
1839	Estiva
1840	Estrela Dalva
1841	Estrela do Indaiá
1842	Estrela do Sul
1843	Eugenópolis
1844	Ewbank da Câmara
1845	Extrema
1846	Fama
1847	Faria Lemos
1848	Felício dos Santos
1849	Felisburgo
1850	Felixlândia
1851	Fernandes Tourinho
1852	Ferros
1853	Fervedouro
1854	Florestal
1855	Formiga
1856	Formoso
1857	Fortaleza de Minas
1858	Fortuna de Minas
1859	Francisco Badaró
1860	Francisco Dumont
1861	Francisco Sá
1862	Franciscópolis
1863	Frei Gaspar
1864	Frei Inocêncio
1865	Frei Lagonegro
1866	Fronteira
1867	Fronteira dos Vales
1868	Fruta de Leite
1869	Frutal
1870	Funilândia
1871	Galiléia
1872	Gameleiras
1873	Glaucilândia
1874	Goiabeira
1875	Goianá
1876	Gonçalves
1877	Gonzaga
1878	Gouveia
1879	Governador Valadares
1880	Grão Mogol
1881	Grupiara
1882	Guanhães
1883	Guapé
1884	Guaraciaba
1885	Guaraciama
1886	Guaranésia
1887	Guarani
1888	Guarará
1889	Guarda-Mor
1890	Guaxupé
1891	Guidoval
1892	Guimarânia
1893	Guiricema
1894	Gurinhatã
1895	Heliodora
1896	Iapu
1897	Ibertioga
1898	Ibiá
1899	Ibiaí
1900	Ibiracatu
1901	Ibiraci
1902	Ibirité
1903	Ibitiúra de Minas
1904	Ibituruna
1905	Icaraí de Minas
1906	Igarapé
1907	Igaratinga
1908	Iguatama
1909	Ijaci
1910	Ilicínea
1911	Imbé de Minas
1912	Inconfidentes
1913	Indaiabira
1914	Indianópolis
1915	Ingaí
1916	Inhapim
1917	Inhaúma
1918	Inimutaba
1919	Ipaba
1920	Ipanema
1921	Ipatinga
1922	Ipiaçu
1923	Ipuiúna
1924	Iraí de Minas
1925	Itabira
1926	Itabirinha de Mantena
1927	Itabirito
1928	Itacambira
1929	Itacarambi
1930	Itaguara
1931	Itaipé
1932	Itajubá
1933	Itamarandiba
1934	Itamarati de Minas
1935	Itambacuri
1936	Itambé do Mato Dentro
1937	Itamogi
1938	Itamonte
1939	Itanhandu
1940	Itanhomi
1941	Itaobim
1942	Itapagipe
1943	Itapecerica
1944	Itapeva
1945	Itatiaiuçu
1946	Itaú de Minas
1947	Itaúna
1948	Itaverava
1949	Itinga
1950	Itueta
1951	Ituiutaba
1952	Itumirim
1953	Iturama
1954	Itutinga
1955	Jaboticatubas
1956	Jacinto
1957	Jacuí
1958	Jacutinga
1959	Jaguaraçu
1960	Jaíba
1961	Jampruca
1962	Janaúba
1963	Januária
1964	Japaraíba
1965	Japonvar
1966	Jeceaba
1967	Jenipapo de Minas
1968	Jequeri
1969	Jequitaí
1970	Jequitibá
1971	Jequitinhonha
1972	Jesuânia
1973	Joaíma
1974	Joanésia
1975	João Monlevade
1976	João Pinheiro
1977	Joaquim Felício
1978	Jordânia
1979	José Gonçalves de Minas
1980	José Raydan
1981	Josenópolis
1982	Juatuba
1983	Juiz de Fora
1984	Juramento
1985	Juruaia
1986	Juvenília
1987	Ladainha
1988	Lagamar
1989	Lagoa da Prata
1990	Lagoa dos Patos
1991	Lagoa Dourada
1992	Lagoa Formosa
1993	Lagoa Grande
1994	Lagoa Santa
1995	Lajinha
1996	Lambari
1997	Lamim
1998	Laranjal
1999	Lassance
2000	Lavras
2001	Leandro Ferreira
2002	Leme do Prado
2003	Leopoldina
2004	Liberdade
2005	Lima Duarte
2006	Limeira do Oeste
2007	Lontra
2008	Luisburgo
2009	Luislândia
2010	Luminárias
2011	Luz
2012	Machacalis
2013	Machado
2014	Madre de Deus de Minas
2015	Malacacheta
2016	Mamonas
2017	Manga
2018	Manhuaçu
2019	Manhumirim
2020	Mantena
2021	Mar de Espanha
2022	Maravilhas
2023	Maria da Fé
2024	Mariana
2025	Marilac
2026	Mário Campos
2027	Maripá de Minas
2028	Marliéria
2029	Marmelópolis
2030	Martinho Campos
2031	Martins Soares
2032	Mata Verde
2033	Materlândia
2034	Mateus Leme
2035	Mathias Lobato
2036	Matias Barbosa
2037	Matias Cardoso
2038	Matipó
2039	Mato Verde
2040	Matozinhos
2041	Matutina
2042	Medeiros
2043	Medina
2044	Mendes Pimentel
2045	Mercês
2046	Mesquita
2047	Minas Novas
2048	Minduri
2049	Mirabela
2050	Miradouro
2051	Miraí
2052	Miravânia
2053	Moeda
2054	Moema
2055	Monjolos
2056	Monsenhor Paulo
2057	Montalvânia
2058	Monte Alegre de Minas
2059	Monte Azul
2060	Monte Belo
2061	Monte Carmelo
2062	Monte Formoso
2063	Monte Santo de Minas
2064	Monte Sião
2065	Montes Claros
2066	Montezuma
2067	Morada Nova de Minas
2068	Morro da Garça
2069	Morro do Pilar
2070	Munhoz
2071	Muriaé
2072	Mutum
2073	Muzambinho
2074	Nacip Raydan
2075	Nanuque
2076	Naque
2077	Natalândia
2078	Natércia
2079	Nazareno
2080	Nepomuceno
2081	Ninheira
2082	Nova Belém
2083	Nova Era
2084	Nova Lima
2085	Nova Módica
2086	Nova Ponte
2087	Nova Porteirinha
2088	Nova Resende
2089	Nova Serrana
2090	Nova União
2091	Novo Cruzeiro
2092	Novo Oriente de Minas
2093	Novorizonte
2094	Olaria
2095	Olhos-d`Água
2096	Olímpio Noronha
2097	Oliveira
2098	Oliveira Fortes
2099	Onça de Pitangui
2100	Oratórios
2101	Orizânia
2102	Ouro Branco
2103	Ouro Fino
2104	Ouro Preto
2105	Ouro Verde de Minas
2106	Padre Carvalho
2107	Padre Paraíso
2108	Pai Pedro
2109	Paineiras
2110	Pains
2111	Paiva
2112	Palma
2113	Palmópolis
2114	Papagaios
2115	Pará de Minas
2116	Paracatu
2117	Paraguaçu
2118	Paraisópolis
2119	Paraopeba
2120	Passa Quatro
2121	Passa Tempo
2122	Passabém
2123	Passa-Vinte
2124	Passos
2125	Patis
2126	Patos de Minas
2127	Patrocínio
2128	Patrocínio do Muriaé
2129	Paula Cândido
2130	Paulistas
2131	Pavão
2132	Peçanha
2133	Pedra Azul
2134	Pedra Bonita
2135	Pedra do Anta
2136	Pedra do Indaiá
2137	Pedra Dourada
2138	Pedralva
2139	Pedras de Maria da Cruz
2140	Pedrinópolis
2141	Pedro Leopoldo
2142	Pedro Teixeira
2143	Pequeri
2144	Pequi
2145	Perdigão
2146	Perdizes
2147	Perdões
2148	Periquito
2149	Pescador
2150	Piau
2151	Piedade de Caratinga
2152	Piedade de Ponte Nova
2153	Piedade do Rio Grande
2154	Piedade dos Gerais
2155	Pimenta
2156	Pingo-d`Água
2157	Pintópolis
2158	Piracema
2159	Pirajuba
2160	Piranga
2161	Piranguçu
2162	Piranguinho
2163	Pirapetinga
2164	Pirapora
2165	Piraúba
2166	Pitangui
2167	Piumhi
2168	Planura
2169	Poço Fundo
2170	Poços de Caldas
2171	Pocrane
2172	Pompéu
2173	Ponte Nova
2174	Ponto Chique
2175	Ponto dos Volantes
2176	Porteirinha
2177	Porto Firme
2178	Poté
2179	Pouso Alegre
2180	Pouso Alto
2181	Prados
2182	Prata
2183	Pratápolis
2184	Pratinha
2185	Presidente Bernardes
2186	Presidente Juscelino
2187	Presidente Kubitschek
2188	Presidente Olegário
2189	Prudente de Morais
2190	Quartel Geral
2191	Queluzito
2192	Raposos
2193	Raul Soares
2194	Recreio
2195	Reduto
2196	Resende Costa
2197	Resplendor
2198	Ressaquinha
2199	Riachinho
2200	Riacho dos Machados
2201	Ribeirão das Neves
2202	Ribeirão Vermelho
2203	Rio Acima
2204	Rio Casca
2205	Rio do Prado
2206	Rio Doce
2207	Rio Espera
2208	Rio Manso
2209	Rio Novo
2210	Rio Paranaíba
2211	Rio Pardo de Minas
2212	Rio Piracicaba
2213	Rio Pomba
2214	Rio Preto
2215	Rio Vermelho
2216	Ritápolis
2217	Rochedo de Minas
2218	Rodeiro
2219	Romaria
2220	Rosário da Limeira
2221	Rubelita
2222	Rubim
2223	Sabará
2224	Sabinópolis
2225	Sacramento
2226	Salinas
2227	Salto da Divisa
2228	Santa Bárbara
2229	Santa Bárbara do Leste
2230	Santa Bárbara do Monte Verde
2231	Santa Bárbara do Tugúrio
2232	Santa Cruz de Minas
2233	Santa Cruz de Salinas
2234	Santa Cruz do Escalvado
2235	Santa Efigênia de Minas
2236	Santa Fé de Minas
2237	Santa Helena de Minas
2238	Santa Juliana
2239	Santa Luzia
2240	Santa Margarida
2241	Santa Maria de Itabira
2242	Santa Maria do Salto
2243	Santa Maria do Suaçuí
2244	Santa Rita de Caldas
2245	Santa Rita de Ibitipoca
2246	Santa Rita de Jacutinga
2247	Santa Rita de Minas
2248	Santa Rita do Itueto
2249	Santa Rita do Sapucaí
2250	Santa Rosa da Serra
2251	Santa Vitória
2252	Santana da Vargem
2253	Santana de Cataguases
2254	Santana de Pirapama
2255	Santana do Deserto
2256	Santana do Garambéu
2257	Santana do Jacaré
2258	Santana do Manhuaçu
2259	Santana do Paraíso
2260	Santana do Riacho
2261	Santana dos Montes
2262	Santo Antônio do Amparo
2263	Santo Antônio do Aventureiro
2264	Santo Antônio do Grama
2265	Santo Antônio do Itambé
2266	Santo Antônio do Jacinto
2267	Santo Antônio do Monte
2268	Santo Antônio do Retiro
2269	Santo Antônio do Rio Abaixo
2270	Santo Hipólito
2271	Santos Dumont
2272	São Bento Abade
2273	São Brás do Suaçuí
2274	São Domingos das Dores
2275	São Domingos do Prata
2276	São Félix de Minas
2277	São Francisco
2278	São Francisco de Paula
2279	São Francisco de Sales
2280	São Francisco do Glória
2281	São Geraldo
2282	São Geraldo da Piedade
2283	São Geraldo do Baixio
2284	São Gonçalo do Abaeté
2285	São Gonçalo do Pará
2286	São Gonçalo do Rio Abaixo
2287	São Gonçalo do Rio Preto
2288	São Gonçalo do Sapucaí
2289	São Gotardo
2290	São João Batista do Glória
2291	São João da Lagoa
2292	São João da Mata
2293	São João da Ponte
2294	São João das Missões
2295	São João del Rei
2296	São João do Manhuaçu
2297	São João do Manteninha
2298	São João do Oriente
2299	São João do Pacuí
2300	São João do Paraíso
2301	São João Evangelista
2302	São João Nepomuceno
2303	São Joaquim de Bicas
2304	São José da Barra
2305	São José da Lapa
2306	São José da Safira
2307	São José da Varginha
2308	São José do Alegre
2309	São José do Divino
2310	São José do Goiabal
2311	São José do Jacuri
2312	São José do Mantimento
2313	São Lourenço
2314	São Miguel do Anta
2315	São Pedro da União
2316	São Pedro do Suaçuí
2317	São Pedro dos Ferros
2318	São Romão
2319	São Roque de Minas
2320	São Sebastião da Bela Vista
2321	São Sebastião da Vargem Alegre
2322	São Sebastião do Anta
2323	São Sebastião do Maranhão
2324	São Sebastião do Oeste
2325	São Sebastião do Paraíso
2326	São Sebastião do Rio Preto
2327	São Sebastião do Rio Verde
2328	São Thomé das Letras
2329	São Tiago
2330	São Tomás de Aquino
2331	São Vicente de Minas
2332	Sapucaí-Mirim
2333	Sardoá
2334	Sarzedo
2335	Sem-Peixe
2336	Senador Amaral
2337	Senador Cortes
2338	Senador Firmino
2339	Senador José Bento
2340	Senador Modestino Gonçalves
2341	Senhora de Oliveira
2342	Senhora do Porto
2343	Senhora dos Remédios
2344	Sericita
2345	Seritinga
2346	Serra Azul de Minas
2347	Serra da Saudade
2348	Serra do Salitre
2349	Serra dos Aimorés
2350	Serrania
2351	Serranópolis de Minas
2352	Serranos
2353	Serro
2354	Sete Lagoas
2355	Setubinha
2356	Silveirânia
2357	Silvianópolis
2358	Simão Pereira
2359	Simonésia
2360	Sobrália
2361	Soledade de Minas
2362	Tabuleiro
2363	Taiobeiras
2364	Taparuba
2365	Tapira
2366	Tapiraí
2367	Taquaraçu de Minas
2368	Tarumirim
2369	Teixeiras
2370	Teófilo Otoni
2371	Timóteo
2372	Tiradentes
2373	Tiros
2374	Tocantins
2375	Tocos do Moji
2376	Toledo
2377	Tombos
2378	Três Corações
2379	Três Marias
2380	Três Pontas
2381	Tumiritinga
2382	Tupaciguara
2383	Turmalina
2384	Turvolândia
2385	Ubá
2386	Ubaí
2387	Ubaporanga
2388	Uberaba
2389	Uberlândia
2390	Umburatiba
2391	Unaí
2392	União de Minas
2393	Uruana de Minas
2394	Urucânia
2395	Urucuia
2396	Vargem Alegre
2397	Vargem Bonita
2398	Vargem Grande do Rio Pardo
2399	Varginha
2400	Varjão de Minas
2401	Várzea da Palma
2402	Varzelândia
2403	Vazante
2404	Verdelândia
2405	Veredinha
2406	Veríssimo
2407	Vermelho Novo
2408	Vespasiano
2409	Viçosa
2410	Vieiras
2411	Virgem da Lapa
2412	Virgínia
2413	Virginópolis
2414	Virgolândia
2415	Visconde do Rio Branco
2416	Volta Grande
2417	Wenceslau Braz
2418	Abaetetuba
2419	Abel Figueiredo
2420	Acará
2421	Afuá
2422	Água Azul do Norte
2423	Alenquer
2424	Almeirim
2425	Altamira
2426	Anajás
2427	Ananindeua
2428	Anapu
2429	Augusto Corrêa
2430	Aurora do Pará
2431	Aveiro
2432	Bagre
2433	Baião
2434	Bannach
2435	Barcarena
2436	Belém
2437	Belterra
2438	Benevides
2439	Bom Jesus do Tocantins
2440	Bonito
2441	Bragança
2442	Brasil Novo
2443	Brejo Grande do Araguaia
2444	Breu Branco
2445	Breves
2446	Bujaru
2447	Cachoeira do Arari
2448	Cachoeira do Piriá
2449	Cametá
2450	Canaã dos Carajás
2451	Capanema
2452	Capitão Poço
2453	Castanhal
2454	Chaves
2455	Colares
2456	Conceição do Araguaia
2457	Concórdia do Pará
2458	Cumaru do Norte
2459	Curionópolis
2460	Curralinho
2461	Curuá
2462	Curuçá
2463	Dom Eliseu
2464	Eldorado dos Carajás
2465	Faro
2466	Floresta do Araguaia
2467	Garrafão do Norte
2468	Goianésia do Pará
2469	Gurupá
2470	Igarapé-Açu
2471	Igarapé-Miri
2472	Inhangapi
2473	Ipixuna do Pará
2474	Irituia
2475	Itaituba
2476	Itupiranga
2477	Jacareacanga
2478	Jacundá
2479	Juruti
2480	Limoeiro do Ajuru
2481	Mãe do Rio
2482	Magalhães Barata
2483	Marabá
2484	Maracanã
2485	Marapanim
2486	Marituba
2487	Medicilândia
2488	Melgaço
2489	Mocajuba
2490	Moju
2491	Monte Alegre
2492	Muaná
2493	Nova Esperança do Piriá
2494	Nova Ipixuna
2495	Nova Timboteua
2496	Novo Progresso
2497	Novo Repartimento
2498	Óbidos
2499	Oeiras do Pará
2500	Oriximiná
2501	Ourém
2502	Ourilândia do Norte
2503	Pacajá
2504	Palestina do Pará
2505	Paragominas
2506	Parauapebas
2507	Pau d`Arco
2508	Peixe-Boi
2509	Piçarra
2510	Placas
2511	Ponta de Pedras
2512	Portel
2513	Porto de Moz
2514	Prainha
2515	Primavera
2516	Quatipuru
2517	Redenção
2518	Rio Maria
2519	Rondon do Pará
2520	Rurópolis
2521	Salinópolis
2522	Salvaterra
2523	Santa Bárbara do Pará
2524	Santa Cruz do Arari
2525	Santa Isabel do Pará
2526	Santa Luzia do Pará
2527	Santa Maria das Barreiras
2528	Santa Maria do Pará
2529	Santana do Araguaia
2530	Santarém
2531	Santarém Novo
2532	Santo Antônio do Tauá
2533	São Caetano de Odivelas
2534	São Domingos do Araguaia
2535	São Domingos do Capim
2536	São Félix do Xingu
2537	São Francisco do Pará
2538	São Geraldo do Araguaia
2539	São João da Ponta
2540	São João de Pirabas
2541	São João do Araguaia
2542	São Miguel do Guamá
2543	São Sebastião da Boa Vista
2544	Sapucaia
2545	Senador José Porfírio
2546	Soure
2547	Tailândia
2548	Terra Alta
2549	Terra Santa
2550	Tomé-Açu
2551	Tracuateua
2552	Trairão
2553	Tucumã
2554	Tucuruí
2555	Ulianópolis
2556	Uruará
2557	Vigia
2558	Viseu
2559	Vitória do Xingu
2560	Xinguara
2561	Água Branca
2562	Aguiar
2563	Alagoa Grande
2564	Alagoa Nova
2565	Alagoinha
2566	Alcantil
2567	Algodão de Jandaíra
2568	Alhandra
2569	Amparo
2570	Aparecida
2571	Araçagi
2572	Arara
2573	Araruna
2574	Areia
2575	Areia de Baraúnas
2576	Areial
2577	Aroeiras
2578	Assunção
2579	Baía da Traição
2580	Bananeiras
2581	Baraúna
2582	Barra de Santa Rosa
2583	Barra de Santana
2584	Barra de São Miguel
2585	Bayeux
2586	Belém
2587	Belém do Brejo do Cruz
2588	Bernardino Batista
2589	Boa Ventura
2590	Boa Vista
2591	Bom Jesus
2592	Bom Sucesso
2593	Bonito de Santa Fé
2594	Boqueirão
2595	Borborema
2596	Brejo do Cruz
2597	Brejo dos Santos
2598	Caaporã
2599	Cabaceiras
2600	Cabedelo
2601	Cachoeira dos Índios
2602	Cacimba de Areia
2603	Cacimba de Dentro
2604	Cacimbas
2605	Caiçara
2606	Cajazeiras
2607	Cajazeirinhas
2608	Caldas Brandão
2609	Camalaú
2610	Campina Grande
2611	Campo de Santana
2612	Capim
2613	Caraúbas
2614	Carrapateira
2615	Casserengue
2616	Catingueira
2617	Catolé do Rocha
2618	Caturité
2619	Conceição
2620	Condado
2621	Conde
2622	Congo
2623	Coremas
2624	Coxixola
2625	Cruz do Espírito Santo
2626	Cubati
2627	Cuité
2628	Cuité de Mamanguape
2629	Cuitegi
2630	Curral de Cima
2631	Curral Velho
2632	Damião
2633	Desterro
2634	Diamante
2635	Dona Inês
2636	Duas Estradas
2637	Emas
2638	Esperança
2639	Fagundes
2640	Frei Martinho
2641	Gado Bravo
2642	Guarabira
2643	Gurinhém
2644	Gurjão
2645	Ibiara
2646	Igaracy
2647	Imaculada
2648	Ingá
2649	Itabaiana
2650	Itaporanga
2651	Itapororoca
2652	Itatuba
2653	Jacaraú
2654	Jericó
2655	João Pessoa
2656	Juarez Távora
2657	Juazeirinho
2658	Junco do Seridó
2659	Juripiranga
2660	Juru
2661	Lagoa
2662	Lagoa de Dentro
2663	Lagoa Seca
2664	Lastro
2665	Livramento
2666	Logradouro
2667	Lucena
2668	Mãe d`Água
2669	Malta
2670	Mamanguape
2671	Manaíra
2672	Marcação
2673	Mari
2674	Marizópolis
2675	Massaranduba
2676	Mataraca
2677	Matinhas
2678	Mato Grosso
2679	Maturéia
2680	Mogeiro
2681	Montadas
2682	Monte Horebe
2683	Monteiro
2684	Mulungu
2685	Natuba
2686	Nazarezinho
2687	Nova Floresta
2688	Nova Olinda
2689	Nova Palmeira
2690	Olho d`Água
2691	Olivedos
2692	Ouro Velho
2693	Parari
2694	Passagem
2695	Patos
2696	Paulista
2697	Pedra Branca
2698	Pedra Lavrada
2699	Pedras de Fogo
2700	Pedro Régis
2701	Piancó
2702	Picuí
2703	Pilar
2704	Pilões
2705	Pilõezinhos
2706	Pirpirituba
2707	Pitimbu
2708	Pocinhos
2709	Poço Dantas
2710	Poço de José de Moura
2711	Pombal
2712	Prata
2713	Princesa Isabel
2714	Puxinanã
2715	Queimadas
2716	Quixabá
2717	Remígio
2718	Riachão
2719	Riachão do Bacamarte
2720	Riachão do Poço
2721	Riacho de Santo Antônio
2722	Riacho dos Cavalos
2723	Rio Tinto
2724	Salgadinho
2725	Salgado de São Félix
2726	Santa Cecília
2727	Santa Cruz
2728	Santa Helena
2729	Santa Inês
2730	Santa Luzia
2731	Santa Rita
2732	Santa Teresinha
2733	Santana de Mangueira
2734	Santana dos Garrotes
2735	Santarém
2736	Santo André
2737	São Bentinho
2738	São Bento
2739	São Domingos de Pombal
2740	São Domingos do Cariri
2741	São Francisco
2742	São João do Cariri
2743	São João do Rio do Peixe
2744	São João do Tigre
2745	São José da Lagoa Tapada
2746	São José de Caiana
2747	São José de Espinharas
2748	São José de Piranhas
2749	São José de Princesa
2750	São José do Bonfim
2751	São José do Brejo do Cruz
2752	São José do Sabugi
2753	São José dos Cordeiros
2754	São José dos Ramos
2755	São Mamede
2756	São Miguel de Taipu
2757	São Sebastião de Lagoa de Roça
2758	São Sebastião do Umbuzeiro
2759	Sapé
2760	Seridó
2761	Serra Branca
2762	Serra da Raiz
2763	Serra Grande
2764	Serra Redonda
2765	Serraria
2766	Sertãozinho
2767	Sobrado
2768	Solânea
2769	Soledade
2770	Sossêgo
2771	Sousa
2772	Sumé
2773	Taperoá
2774	Tavares
2775	Teixeira
2776	Tenório
2777	Triunfo
2778	Uiraúna
2779	Umbuzeiro
2780	Várzea
2781	Vieirópolis
2782	Vista Serrana
2783	Zabelê
2784	Abatiá
2785	Adrianópolis
2786	Agudos do Sul
2787	Almirante Tamandaré
2788	Altamira do Paraná
2789	Alto Paraíso
2790	Alto Paraná
2791	Alto Piquiri
2792	Altônia
2793	Alvorada do Sul
2794	Amaporã
2795	Ampére
2796	Anahy
2797	Andirá
2798	Ângulo
2799	Antonina
2800	Antônio Olinto
2801	Apucarana
2802	Arapongas
2803	Arapoti
2804	Arapuã
2805	Araruna
2806	Araucária
2807	Ariranha do Ivaí
2808	Assaí
2809	Assis Chateaubriand
2810	Astorga
2811	Atalaia
2812	Balsa Nova
2813	Bandeirantes
2814	Barbosa Ferraz
2815	Barra do Jacaré
2816	Barracão
2817	Bela Vista da Caroba
2818	Bela Vista do Paraíso
2819	Bituruna
2820	Boa Esperança
2821	Boa Esperança do Iguaçu
2822	Boa Ventura de São Roque
2823	Boa Vista da Aparecida
2824	Bocaiúva do Sul
2825	Bom Jesus do Sul
2826	Bom Sucesso
2827	Bom Sucesso do Sul
2828	Borrazópolis
2829	Braganey
2830	Brasilândia do Sul
2831	Cafeara
2832	Cafelândia
2833	Cafezal do Sul
2834	Califórnia
2835	Cambará
2836	Cambé
2837	Cambira
2838	Campina da Lagoa
2839	Campina do Simão
2840	Campina Grande do Sul
2841	Campo Bonito
2842	Campo do Tenente
2843	Campo Largo
2844	Campo Magro
2845	Campo Mourão
2846	Cândido de Abreu
2847	Candói
2848	Cantagalo
2849	Capanema
2850	Capitão Leônidas Marques
2851	Carambeí
2852	Carlópolis
2853	Cascavel
2854	Castro
2855	Catanduvas
2856	Centenário do Sul
2857	Cerro Azul
2858	Céu Azul
2859	Chopinzinho
2860	Cianorte
2861	Cidade Gaúcha
2862	Clevelândia
2863	Colombo
2864	Colorado
2865	Congonhinhas
2866	Conselheiro Mairinck
2867	Contenda
2868	Corbélia
2869	Cornélio Procópio
2870	Coronel Domingos Soares
2871	Coronel Vivida
2872	Corumbataí do Sul
2873	Cruz Machado
2874	Cruzeiro do Iguaçu
2875	Cruzeiro do Oeste
2876	Cruzeiro do Sul
2877	Cruzmaltina
2878	Curitiba
2879	Curiúva
2880	Diamante d`Oeste
2881	Diamante do Norte
2882	Diamante do Sul
2883	Dois Vizinhos
2884	Douradina
2885	Doutor Camargo
2886	Doutor Ulysses
2887	Enéas Marques
2888	Engenheiro Beltrão
2889	Entre Rios do Oeste
2890	Esperança Nova
2891	Espigão Alto do Iguaçu
2892	Farol
2893	Faxinal
2894	Fazenda Rio Grande
2895	Fênix
2896	Fernandes Pinheiro
2897	Figueira
2898	Flor da Serra do Sul
2899	Floraí
2900	Floresta
2901	Florestópolis
2902	Flórida
2903	Formosa do Oeste
2904	Foz do Iguaçu
2905	Foz do Jordão
2906	Francisco Alves
2907	Francisco Beltrão
2908	General Carneiro
2909	Godoy Moreira
2910	Goioerê
2911	Goioxim
2912	Grandes Rios
2913	Guaíra
2914	Guairaçá
2915	Guamiranga
2916	Guapirama
2917	Guaporema
2918	Guaraci
2919	Guaraniaçu
2920	Guarapuava
2921	Guaraqueçaba
2922	Guaratuba
2923	Honório Serpa
2924	Ibaiti
2925	Ibema
2926	Ibiporã
2927	Icaraíma
2928	Iguaraçu
2929	Iguatu
2930	Imbaú
2931	Imbituva
2932	Inácio Martins
2933	Inajá
2934	Indianópolis
2935	Ipiranga
2936	Iporã
2937	Iracema do Oeste
2938	Irati
2939	Iretama
2940	Itaguajé
2941	Itaipulândia
2942	Itambaracá
2943	Itambé
2944	Itapejara d`Oeste
2945	Itaperuçu
2946	Itaúna do Sul
2947	Ivaí
2948	Ivaiporã
2949	Ivaté
2950	Ivatuba
2951	Jaboti
2952	Jacarezinho
2953	Jaguapitã
2954	Jaguariaíva
2955	Jandaia do Sul
2956	Janiópolis
2957	Japira
2958	Japurá
2959	Jardim Alegre
2960	Jardim Olinda
2961	Jataizinho
2962	Jesuítas
2963	Joaquim Távora
2964	Jundiaí do Sul
2965	Juranda
2966	Jussara
2967	Kaloré
2968	Lapa
2969	Laranjal
2970	Laranjeiras do Sul
2971	Leópolis
2972	Lidianópolis
2973	Lindoeste
2974	Loanda
2975	Lobato
2976	Londrina
2977	Luiziana
2978	Lunardelli
2979	Lupionópolis
2980	Mallet
2981	Mamborê
2982	Mandaguaçu
2983	Mandaguari
2984	Mandirituba
2985	Manfrinópolis
2986	Mangueirinha
2987	Manoel Ribas
2988	Marechal Cândido Rondon
2989	Maria Helena
2990	Marialva
2991	Marilândia do Sul
2992	Marilena
2993	Mariluz
2994	Maringá
2995	Mariópolis
2996	Maripá
2997	Marmeleiro
2998	Marquinho
2999	Marumbi
3000	Matelândia
3001	Matinhos
3002	Mato Rico
3003	Mauá da Serra
3004	Medianeira
3005	Mercedes
3006	Mirador
3007	Miraselva
3008	Missal
3009	Moreira Sales
3010	Morretes
3011	Munhoz de Melo
3012	Nossa Senhora das Graças
3013	Nova Aliança do Ivaí
3014	Nova América da Colina
3015	Nova Aurora
3016	Nova Cantu
3017	Nova Esperança
3018	Nova Esperança do Sudoeste
3019	Nova Fátima
3020	Nova Laranjeiras
3021	Nova Londrina
3022	Nova Olímpia
3023	Nova Prata do Iguaçu
3024	Nova Santa Bárbara
3025	Nova Santa Rosa
3026	Nova Tebas
3027	Novo Itacolomi
3028	Ortigueira
3029	Ourizona
3030	Ouro Verde do Oeste
3031	Paiçandu
3032	Palmas
3033	Palmeira
3034	Palmital
3035	Palotina
3036	Paraíso do Norte
3037	Paranacity
3038	Paranaguá
3039	Paranapoema
3040	Paranavaí
3041	Pato Bragado
3042	Pato Branco
3043	Paula Freitas
3044	Paulo Frontin
3045	Peabiru
3046	Perobal
3047	Pérola
3048	Pérola d`Oeste
3049	Piên
3050	Pinhais
3051	Pinhal de São Bento
3052	Pinhalão
3053	Pinhão
3054	Piraí do Sul
3055	Piraquara
3056	Pitanga
3057	Pitangueiras
3058	Planaltina do Paraná
3059	Planalto
3060	Ponta Grossa
3061	Pontal do Paraná
3062	Porecatu
3063	Porto Amazonas
3064	Porto Barreiro
3065	Porto Rico
3066	Porto Vitória
3067	Prado Ferreira
3068	Pranchita
3069	Presidente Castelo Branco
3070	Primeiro de Maio
3071	Prudentópolis
3072	Quarto Centenário
3073	Quatiguá
3074	Quatro Barras
3075	Quatro Pontes
3076	Quedas do Iguaçu
3077	Querência do Norte
3078	Quinta do Sol
3079	Quitandinha
3080	Ramilândia
3081	Rancho Alegre
3082	Rancho Alegre d`Oeste
3083	Realeza
3084	Rebouças
3085	Renascença
3086	Reserva
3087	Reserva do Iguaçu
3088	Ribeirão Claro
3089	Ribeirão do Pinhal
3090	Rio Azul
3091	Rio Bom
3092	Rio Bonito do Iguaçu
3093	Rio Branco do Ivaí
3094	Rio Branco do Sul
3095	Rio Negro
3096	Rolândia
3097	Roncador
3098	Rondon
3099	Rosário do Ivaí
3100	Sabáudia
3101	Salgado Filho
3102	Salto do Itararé
3103	Salto do Lontra
3104	Santa Amélia
3105	Santa Cecília do Pavão
3106	Santa Cruz de Monte Castelo
3107	Santa Fé
3108	Santa Helena
3109	Santa Inês
3110	Santa Isabel do Ivaí
3111	Santa Izabel do Oeste
3112	Santa Lúcia
3113	Santa Maria do Oeste
3114	Santa Mariana
3115	Santa Mônica
3116	Santa Tereza do Oeste
3117	Santa Terezinha de Itaipu
3118	Santana do Itararé
3119	Santo Antônio da Platina
3120	Santo Antônio do Caiuá
3121	Santo Antônio do Paraíso
3122	Santo Antônio do Sudoeste
3123	Santo Inácio
3124	São Carlos do Ivaí
3125	São Jerônimo da Serra
3126	São João
3127	São João do Caiuá
3128	São João do Ivaí
3129	São João do Triunfo
3130	São Jorge d`Oeste
3131	São Jorge do Ivaí
3132	São Jorge do Patrocínio
3133	São José da Boa Vista
3134	São José das Palmeiras
3135	São José dos Pinhais
3136	São Manoel do Paraná
3137	São Mateus do Sul
3138	São Miguel do Iguaçu
3139	São Pedro do Iguaçu
3140	São Pedro do Ivaí
3141	São Pedro do Paraná
3142	São Sebastião da Amoreira
3143	São Tomé
3144	Sapopema
3145	Sarandi
3146	Saudade do Iguaçu
3147	Sengés
3148	Serranópolis do Iguaçu
3149	Sertaneja
3150	Sertanópolis
3151	Siqueira Campos
3152	Sulina
3153	Tamarana
3154	Tamboara
3155	Tapejara
3156	Tapira
3157	Teixeira Soares
3158	Telêmaco Borba
3159	Terra Boa
3160	Terra Rica
3161	Terra Roxa
3162	Tibagi
3163	Tijucas do Sul
3164	Toledo
3165	Tomazina
3166	Três Barras do Paraná
3167	Tunas do Paraná
3168	Tuneiras do Oeste
3169	Tupãssi
3170	Turvo
3171	Ubiratã
3172	Umuarama
3173	União da Vitória
3174	Uniflor
3175	Uraí
3176	Ventania
3177	Vera Cruz do Oeste
3178	Verê
3179	Virmond
3180	Vitorino
3181	Wenceslau Braz
3182	Xambrê
3183	Abreu e Lima
3184	Afogados da Ingazeira
3185	Afrânio
3186	Agrestina
3187	Água Preta
3188	Águas Belas
3189	Alagoinha
3190	Aliança
3191	Altinho
3192	Amaraji
3193	Angelim
3194	Araçoiaba
3195	Araripina
3196	Arcoverde
3197	Barra de Guabiraba
3198	Barreiros
3199	Belém de Maria
3200	Belém de São Francisco
3201	Belo Jardim
3202	Betânia
3203	Bezerros
3204	Bodocó
3205	Bom Conselho
3206	Bom Jardim
3207	Bonito
3208	Brejão
3209	Brejinho
3210	Brejo da Madre de Deus
3211	Buenos Aires
3212	Buíque
3213	Cabo de Santo Agostinho
3214	Cabrobó
3215	Cachoeirinha
3216	Caetés
3217	Calçado
3218	Calumbi
3219	Camaragibe
3220	Camocim de São Félix
3221	Camutanga
3222	Canhotinho
3223	Capoeiras
3224	Carnaíba
3225	Carnaubeira da Penha
3226	Carpina
3227	Caruaru
3228	Casinhas
3229	Catende
3230	Cedro
3231	Chã de Alegria
3232	Chã Grande
3233	Condado
3234	Correntes
3235	Cortês
3236	Cumaru
3237	Cupira
3238	Custódia
3239	Dormentes
3240	Escada
3241	Exu
3242	Feira Nova
3243	Fernando de Noronha
3244	Ferreiros
3245	Flores
3246	Floresta
3247	Frei Miguelinho
3248	Gameleira
3249	Garanhuns
3250	Glória do Goitá
3251	Goiana
3252	Granito
3253	Gravatá
3254	Iati
3255	Ibimirim
3256	Ibirajuba
3257	Igarassu
3258	Iguaraci
3259	Ilha de Itamaracá
3260	Inajá
3261	Ingazeira
3262	Ipojuca
3263	Ipubi
3264	Itacuruba
3265	Itaíba
3266	Itambé
3267	Itapetim
3268	Itapissuma
3269	Itaquitinga
3270	Jaboatão dos Guararapes
3271	Jaqueira
3272	Jataúba
3273	Jatobá
3274	João Alfredo
3275	Joaquim Nabuco
3276	Jucati
3277	Jupi
3278	Jurema
3279	Lagoa do Carro
3280	Lagoa do Itaenga
3281	Lagoa do Ouro
3282	Lagoa dos Gatos
3283	Lagoa Grande
3284	Lajedo
3285	Limoeiro
3286	Macaparana
3287	Machados
3288	Manari
3289	Maraial
3290	Mirandiba
3291	Moreilândia
3292	Moreno
3293	Nazaré da Mata
3294	Olinda
3295	Orobó
3296	Orocó
3297	Ouricuri
3298	Palmares
3299	Palmeirina
3300	Panelas
3301	Paranatama
3302	Parnamirim
3303	Passira
3304	Paudalho
3305	Paulista
3306	Pedra
3307	Pesqueira
3308	Petrolândia
3309	Petrolina
3310	Poção
3311	Pombos
3312	Primavera
3313	Quipapá
3314	Quixaba
3315	Recife
3316	Riacho das Almas
3317	Ribeirão
3318	Rio Formoso
3319	Sairé
3320	Salgadinho
3321	Salgueiro
3322	Saloá
3323	Sanharó
3324	Santa Cruz
3325	Santa Cruz da Baixa Verde
3326	Santa Cruz do Capibaribe
3327	Santa Filomena
3328	Santa Maria da Boa Vista
3329	Santa Maria do Cambucá
3330	Santa Terezinha
3331	São Benedito do Sul
3332	São Bento do Una
3333	São Caitano
3334	São João
3335	São Joaquim do Monte
3336	São José da Coroa Grande
3337	São José do Belmonte
3338	São José do Egito
3339	São Lourenço da Mata
3340	São Vicente Ferrer
3341	Serra Talhada
3342	Serrita
3343	Sertânia
3344	Sirinhaém
3345	Solidão
3346	Surubim
3347	Tabira
3348	Tacaimbó
3349	Tacaratu
3350	Tamandaré
3351	Taquaritinga do Norte
3352	Terezinha
3353	Terra Nova
3354	Timbaúba
3355	Toritama
3356	Tracunhaém
3357	Trindade
3358	Triunfo
3359	Tupanatinga
3360	Tuparetama
3361	Venturosa
3362	Verdejante
3363	Vertente do Lério
3364	Vertentes
3365	Vicência
3366	Vitória de Santo Antão
3367	Xexéu
3368	Acauã
3369	Agricolândia
3370	Água Branca
3371	Alagoinha do Piauí
3372	Alegrete do Piauí
3373	Alto Longá
3374	Altos
3375	Alvorada do Gurguéia
3376	Amarante
3377	Angical do Piauí
3378	Anísio de Abreu
3379	Antônio Almeida
3380	Aroazes
3381	Aroeiras do Itaim
3382	Arraial
3383	Assunção do Piauí
3384	Avelino Lopes
3385	Baixa Grande do Ribeiro
3386	Barra d`Alcântara
3387	Barras
3388	Barreiras do Piauí
3389	Barro Duro
3390	Batalha
3391	Bela Vista do Piauí
3392	Belém do Piauí
3393	Beneditinos
3394	Bertolínia
3395	Betânia do Piauí
3396	Boa Hora
3397	Bocaina
3398	Bom Jesus
3399	Bom Princípio do Piauí
3400	Bonfim do Piauí
3401	Boqueirão do Piauí
3402	Brasileira
3403	Brejo do Piauí
3404	Buriti dos Lopes
3405	Buriti dos Montes
3406	Cabeceiras do Piauí
3407	Cajazeiras do Piauí
3408	Cajueiro da Praia
3409	Caldeirão Grande do Piauí
3410	Campinas do Piauí
3411	Campo Alegre do Fidalgo
3412	Campo Grande do Piauí
3413	Campo Largo do Piauí
3414	Campo Maior
3415	Canavieira
3416	Canto do Buriti
3417	Capitão de Campos
3418	Capitão Gervásio Oliveira
3419	Caracol
3420	Caraúbas do Piauí
3421	Caridade do Piauí
3422	Castelo do Piauí
3423	Caxingó
3424	Cocal
3425	Cocal de Telha
3426	Cocal dos Alves
3427	Coivaras
3428	Colônia do Gurguéia
3429	Colônia do Piauí
3430	Conceição do Canindé
3431	Coronel José Dias
3432	Corrente
3433	Cristalândia do Piauí
3434	Cristino Castro
3435	Curimatá
3436	Currais
3437	Curral Novo do Piauí
3438	Curralinhos
3439	Demerval Lobão
3440	Dirceu Arcoverde
3441	Dom Expedito Lopes
3442	Dom Inocêncio
3443	Domingos Mourão
3444	Elesbão Veloso
3445	Eliseu Martins
3446	Esperantina
3447	Fartura do Piauí
3448	Flores do Piauí
3449	Floresta do Piauí
3450	Floriano
3451	Francinópolis
3452	Francisco Ayres
3453	Francisco Macedo
3454	Francisco Santos
3455	Fronteiras
3456	Geminiano
3457	Gilbués
3458	Guadalupe
3459	Guaribas
3460	Hugo Napoleão
3461	Ilha Grande
3462	Inhuma
3463	Ipiranga do Piauí
3464	Isaías Coelho
3465	Itainópolis
3466	Itaueira
3467	Jacobina do Piauí
3468	Jaicós
3469	Jardim do Mulato
3470	Jatobá do Piauí
3471	Jerumenha
3472	João Costa
3473	Joaquim Pires
3474	Joca Marques
3475	José de Freitas
3476	Juazeiro do Piauí
3477	Júlio Borges
3478	Jurema
3479	Lagoa Alegre
3480	Lagoa de São Francisco
3481	Lagoa do Barro do Piauí
3482	Lagoa do Piauí
3483	Lagoa do Sítio
3484	Lagoinha do Piauí
3485	Landri Sales
3486	Luís Correia
3487	Luzilândia
3488	Madeiro
3489	Manoel Emídio
3490	Marcolândia
3491	Marcos Parente
3492	Massapê do Piauí
3493	Matias Olímpio
3494	Miguel Alves
3495	Miguel Leão
3496	Milton Brandão
3497	Monsenhor Gil
3498	Monsenhor Hipólito
3499	Monte Alegre do Piauí
3500	Morro Cabeça no Tempo
3501	Morro do Chapéu do Piauí
3502	Murici dos Portelas
3503	Nazaré do Piauí
3504	Nossa Senhora de Nazaré
3505	Nossa Senhora dos Remédios
3506	Nova Santa Rita
3507	Novo Oriente do Piauí
3508	Novo Santo Antônio
3509	Oeiras
3510	Olho d`Água do Piauí
3511	Padre Marcos
3512	Paes Landim
3513	Pajeú do Piauí
3514	Palmeira do Piauí
3515	Palmeirais
3516	Paquetá
3517	Parnaguá
3518	Parnaíba
3519	Passagem Franca do Piauí
3520	Patos do Piauí
3521	Pau d`Arco do Piauí
3522	Paulistana
3523	Pavussu
3524	Pedro II
3525	Pedro Laurentino
3526	Picos
3527	Pimenteiras
3528	Pio IX
3529	Piracuruca
3530	Piripiri
3531	Porto
3532	Porto Alegre do Piauí
3533	Prata do Piauí
3534	Queimada Nova
3535	Redenção do Gurguéia
3536	Regeneração
3537	Riacho Frio
3538	Ribeira do Piauí
3539	Ribeiro Gonçalves
3540	Rio Grande do Piauí
3541	Santa Cruz do Piauí
3542	Santa Cruz dos Milagres
3543	Santa Filomena
3544	Santa Luz
3545	Santa Rosa do Piauí
3546	Santana do Piauí
3547	Santo Antônio de Lisboa
3548	Santo Antônio dos Milagres
3549	Santo Inácio do Piauí
3550	São Braz do Piauí
3551	São Félix do Piauí
3552	São Francisco de Assis do Piauí
3553	São Francisco do Piauí
3554	São Gonçalo do Gurguéia
3555	São Gonçalo do Piauí
3556	São João da Canabrava
3557	São João da Fronteira
3558	São João da Serra
3559	São João da Varjota
3560	São João do Arraial
3561	São João do Piauí
3562	São José do Divino
3563	São José do Peixe
3564	São José do Piauí
3565	São Julião
3566	São Lourenço do Piauí
3567	São Luis do Piauí
3568	São Miguel da Baixa Grande
3569	São Miguel do Fidalgo
3570	São Miguel do Tapuio
3571	São Pedro do Piauí
3572	São Raimundo Nonato
3573	Sebastião Barros
3574	Sebastião Leal
3575	Sigefredo Pacheco
3576	Simões
3577	Simplício Mendes
3578	Socorro do Piauí
3579	Sussuapara
3580	Tamboril do Piauí
3581	Tanque do Piauí
3582	Teresina
3583	União
3584	Uruçuí
3585	Valença do Piauí
3586	Várzea Branca
3587	Várzea Grande
3588	Vera Mendes
3589	Vila Nova do Piauí
3590	Wall Ferraz
3591	Angra dos Reis
3592	Aperibé
3593	Araruama
3594	Areal
3595	Armação dos Búzios
3596	Arraial do Cabo
3597	Barra do Piraí
3598	Barra Mansa
3599	Belford Roxo
3600	Bom Jardim
3601	Bom Jesus do Itabapoana
3602	Cabo Frio
3603	Cachoeiras de Macacu
3604	Cambuci
3605	Campos dos Goytacazes
3606	Cantagalo
3607	Carapebus
3608	Cardoso Moreira
3609	Carmo
3610	Casimiro de Abreu
3611	Comendador Levy Gasparian
3612	Conceição de Macabu
3613	Cordeiro
3614	Duas Barras
3615	Duque de Caxias
3616	Engenheiro Paulo de Frontin
3617	Guapimirim
3618	Iguaba Grande
3619	Itaboraí
3620	Itaguaí
3621	Italva
3622	Itaocara
3623	Itaperuna
3624	Itatiaia
3625	Japeri
3626	Laje do Muriaé
3627	Macaé
3628	Macuco
3629	Magé
3630	Mangaratiba
3631	Maricá
3632	Mendes
3633	Mesquita
3634	Miguel Pereira
3635	Miracema
3636	Natividade
3637	Nilópolis
3638	Niterói
3639	Nova Friburgo
3640	Nova Iguaçu
3641	Paracambi
3642	Paraíba do Sul
3643	Parati
3644	Paty do Alferes
3645	Petrópolis
3646	Pinheiral
3647	Piraí
3648	Porciúncula
3649	Porto Real
3650	Quatis
3651	Queimados
3652	Quissamã
3653	Resende
3654	Rio Bonito
3655	Rio Claro
3656	Rio das Flores
3657	Rio das Ostras
3658	Rio de Janeiro
3659	Santa Maria Madalena
3660	Santo Antônio de Pádua
3661	São Fidélis
3662	São Francisco de Itabapoana
3663	São Gonçalo
3664	São João da Barra
3665	São João de Meriti
3666	São José de Ubá
3667	São José do Vale do Rio Pret
3668	São Pedro da Aldeia
3669	São Sebastião do Alto
3670	Sapucaia
3671	Saquarema
3672	Seropédica
3673	Silva Jardim
3674	Sumidouro
3675	Tanguá
3676	Teresópolis
3677	Trajano de Morais
3678	Três Rios
3679	Valença
3680	Varre-Sai
3681	Vassouras
3682	Volta Redonda
3683	Acari
3684	Açu
3685	Afonso Bezerra
3686	Água Nova
3687	Alexandria
3688	Almino Afonso
3689	Alto do Rodrigues
3690	Angicos
3691	Antônio Martins
3692	Apodi
3693	Areia Branca
3694	Arês
3695	Augusto Severo
3696	Baía Formosa
3697	Baraúna
3698	Barcelona
3699	Bento Fernandes
3700	Bodó
3701	Bom Jesus
3702	Brejinho
3703	Caiçara do Norte
3704	Caiçara do Rio do Vento
3705	Caicó
3706	Campo Redondo
3707	Canguaretama
3708	Caraúbas
3709	Carnaúba dos Dantas
3710	Carnaubais
3711	Ceará-Mirim
3712	Cerro Corá
3713	Coronel Ezequiel
3714	Coronel João Pessoa
3715	Cruzeta
3716	Currais Novos
3717	Doutor Severiano
3718	Encanto
3719	Equador
3720	Espírito Santo
3721	Extremoz
3722	Felipe Guerra
3723	Fernando Pedroza
3724	Florânia
3725	Francisco Dantas
3726	Frutuoso Gomes
3727	Galinhos
3728	Goianinha
3729	Governador Dix-Sept Rosado
3730	Grossos
3731	Guamaré
3732	Ielmo Marinho
3733	Ipanguaçu
3734	Ipueira
3735	Itajá
3736	Itaú
3737	Jaçanã
3738	Jandaíra
3739	Janduís
3740	Januário Cicco
3741	Japi
3742	Jardim de Angicos
3743	Jardim de Piranhas
3744	Jardim do Seridó
3745	João Câmara
3746	João Dias
3747	José da Penha
3748	Jucurutu
3749	Jundiá
3750	Lagoa d`Anta
3751	Lagoa de Pedras
3752	Lagoa de Velhos
3753	Lagoa Nova
3754	Lagoa Salgada
3755	Lajes
3756	Lajes Pintadas
3757	Lucrécia
3758	Luís Gomes
3759	Macaíba
3760	Macau
3761	Major Sales
3762	Marcelino Vieira
3763	Martins
3764	Maxaranguape
3765	Messias Targino
3766	Montanhas
3767	Monte Alegre
3768	Monte das Gameleiras
3769	Mossoró
3770	Natal
3771	Nísia Floresta
3772	Nova Cruz
3773	Olho-d`Água do Borges
3774	Ouro Branco
3775	Paraná
3776	Paraú
3777	Parazinho
3778	Parelhas
3779	Parnamirim
3780	Passa e Fica
3781	Passagem
3782	Patu
3783	Pau dos Ferros
3784	Pedra Grande
3785	Pedra Preta
3786	Pedro Avelino
3787	Pedro Velho
3788	Pendências
3789	Pilões
3790	Poço Branco
3791	Portalegre
3792	Porto do Mangue
3793	Presidente Juscelino
3794	Pureza
3795	Rafael Fernandes
3796	Rafael Godeiro
3797	Riacho da Cruz
3798	Riacho de Santana
3799	Riachuelo
3800	Rio do Fogo
3801	Rodolfo Fernandes
3802	Ruy Barbosa
3803	Santa Cruz
3804	Santa Maria
3805	Santana do Matos
3806	Santana do Seridó
3807	Santo Antônio
3808	São Bento do Norte
3809	São Bento do Trairí
3810	São Fernando
3811	São Francisco do Oeste
3812	São Gonçalo do Amarante
3813	São João do Sabugi
3814	São José de Mipibu
3815	São José do Campestre
3816	São José do Seridó
3817	São Miguel
3818	São Miguel do Gostoso
3819	São Paulo do Potengi
3820	São Pedro
3821	São Rafael
3822	São Tomé
3823	São Vicente
3824	Senador Elói de Souza
3825	Senador Georgino Avelino
3826	Serra de São Bento
3827	Serra do Mel
3828	Serra Negra do Norte
3829	Serrinha
3830	Serrinha dos Pintos
3831	Severiano Melo
3832	Sítio Novo
3833	Taboleiro Grande
3834	Taipu
3835	Tangará
3836	Tenente Ananias
3837	Tenente Laurentino Cruz
3838	Tibau
3839	Tibau do Sul
3840	Timbaúba dos Batistas
3841	Touros
3842	Triunfo Potiguar
3843	Umarizal
3844	Upanema
3845	Várzea
3846	Venha-Ver
3847	Vera Cruz
3848	Viçosa
3849	Vila Flor
3850	Aceguá
3851	Água Santa
3852	Agudo
3853	Ajuricaba
3854	Alecrim
3855	Alegrete
3856	Alegria
3857	Almirante Tamandaré do Sul
3858	Alpestre
3859	Alto Alegre
3860	Alto Feliz
3861	Alvorada
3862	Amaral Ferrador
3863	Ametista do Sul
3864	André da Rocha
3865	Anta Gorda
3866	Antônio Prado
3867	Arambaré
3868	Araricá
3869	Aratiba
3870	Arroio do Meio
3871	Arroio do Padre
3872	Arroio do Sal
3873	Arroio do Tigre
3874	Arroio dos Ratos
3875	Arroio Grande
3876	Arvorezinha
3877	Augusto Pestana
3878	Áurea
3879	Bagé
3880	Balneário Pinhal
3881	Barão
3882	Barão de Cotegipe
3883	Barão do Triunfo
3884	Barra do Guarita
3885	Barra do Quaraí
3886	Barra do Ribeiro
3887	Barra do Rio Azul
3888	Barra Funda
3889	Barracão
3890	Barros Cassal
3891	Benjamin Constant do Sul
3892	Bento Gonçalves
3893	Boa Vista das Missões
3894	Boa Vista do Buricá
3895	Boa Vista do Cadeado
3896	Boa Vista do Incra
3897	Boa Vista do Sul
3898	Bom Jesus
3899	Bom Princípio
3900	Bom Progresso
3901	Bom Retiro do Sul
3902	Boqueirão do Leão
3903	Bossoroca
3904	Bozano
3905	Braga
3906	Brochier
3907	Butiá
3908	Caçapava do Sul
3909	Cacequi
3910	Cachoeira do Sul
3911	Cachoeirinha
3912	Cacique Doble
3913	Caibaté
3914	Caiçara
3915	Camaquã
3916	Camargo
3917	Cambará do Sul
3918	Campestre da Serra
3919	Campina das Missões
3920	Campinas do Sul
3921	Campo Bom
3922	Campo Novo
3923	Campos Borges
3924	Candelária
3925	Cândido Godói
3926	Candiota
3927	Canela
3928	Canguçu
3929	Canoas
3930	Canudos do Vale
3931	Capão Bonito do Sul
3932	Capão da Canoa
3933	Capão do Cipó
3934	Capão do Leão
3935	Capela de Santana
3936	Capitão
3937	Capivari do Sul
3938	Caraá
3939	Carazinho
3940	Carlos Barbosa
3941	Carlos Gomes
3942	Casca
3943	Caseiros
3944	Catuípe
3945	Caxias do Sul
3946	Centenário
3947	Cerrito
3948	Cerro Branco
3949	Cerro Grande
3950	Cerro Grande do Sul
3951	Cerro Largo
3952	Chapada
3953	Charqueadas
3954	Charrua
3955	Chiapeta
3956	Chuí
3957	Chuvisca
3958	Cidreira
3959	Ciríaco
3960	Colinas
3961	Colorado
3962	Condor
3963	Constantina
3964	Coqueiro Baixo
3965	Coqueiros do Sul
3966	Coronel Barros
3967	Coronel Bicaco
3968	Coronel Pilar
3969	Cotiporã
3970	Coxilha
3971	Crissiumal
3972	Cristal
3973	Cristal do Sul
3974	Cruz Alta
3975	Cruzaltense
3976	Cruzeiro do Sul
3977	David Canabarro
3978	Derrubadas
3979	Dezesseis de Novembro
3980	Dilermando de Aguiar
3981	Dois Irmãos
3982	Dois Irmãos das Missões
3983	Dois Lajeados
3984	Dom Feliciano
3985	Dom Pedrito
3986	Dom Pedro de Alcântara
3987	Dona Francisca
3988	Doutor Maurício Cardoso
3989	Doutor Ricardo
3990	Eldorado do Sul
3991	Encantado
3992	Encruzilhada do Sul
3993	Engenho Velho
3994	Entre Rios do Sul
3995	Entre-Ijuís
3996	Erebango
3997	Erechim
3998	Ernestina
3999	Erval Grande
4000	Erval Seco
4001	Esmeralda
4002	Esperança do Sul
4003	Espumoso
4004	Estação
4005	Estância Velha
4006	Esteio
4007	Estrela
4008	Estrela Velha
4009	Eugênio de Castro
4010	Fagundes Varela
4011	Farroupilha
4012	Faxinal do Soturno
4013	Faxinalzinho
4014	Fazenda Vilanova
4015	Feliz
4016	Flores da Cunha
4017	Floriano Peixoto
4018	Fontoura Xavier
4019	Formigueiro
4020	Forquetinha
4021	Fortaleza dos Valos
4022	Frederico Westphalen
4023	Garibaldi
4024	Garruchos
4025	Gaurama
4026	General Câmara
4027	Gentil
4028	Getúlio Vargas
4029	Giruá
4030	Glorinha
4031	Gramado
4032	Gramado dos Loureiros
4033	Gramado Xavier
4034	Gravataí
4035	Guabiju
4036	Guaíba
4037	Guaporé
4038	Guarani das Missões
4039	Harmonia
4040	Herval
4041	Herveiras
4042	Horizontina
4043	Hulha Negra
4044	Humaitá
4045	Ibarama
4046	Ibiaçá
4047	Ibiraiaras
4048	Ibirapuitã
4049	Ibirubá
4050	Igrejinha
4051	Ijuí
4052	Ilópolis
4053	Imbé
4054	Imigrante
4055	Independência
4056	Inhacorá
4057	Ipê
4058	Ipiranga do Sul
4059	Iraí
4060	Itaara
4061	Itacurubi
4062	Itapuca
4063	Itaqui
4064	Itati
4065	Itatiba do Sul
4066	Ivorá
4067	Ivoti
4068	Jaboticaba
4069	Jacuizinho
4070	Jacutinga
4071	Jaguarão
4072	Jaguari
4073	Jaquirana
4074	Jari
4075	Jóia
4076	Júlio de Castilhos
4077	Lagoa Bonita do Sul
4078	Lagoa dos Três Cantos
4079	Lagoa Vermelha
4080	Lagoão
4081	Lajeado
4082	Lajeado do Bugre
4083	Lavras do Sul
4084	Liberato Salzano
4085	Lindolfo Collor
4086	Linha Nova
4087	Maçambara
4088	Machadinho
4089	Mampituba
4090	Manoel Viana
4091	Maquiné
4092	Maratá
4093	Marau
4094	Marcelino Ramos
4095	Mariana Pimentel
4096	Mariano Moro
4097	Marques de Souza
4098	Mata
4099	Mato Castelhano
4100	Mato Leitão
4101	Mato Queimado
4102	Maximiliano de Almeida
4103	Minas do Leão
4104	Miraguaí
4105	Montauri
4106	Monte Alegre dos Campos
4107	Monte Belo do Sul
4108	Montenegro
4109	Mormaço
4110	Morrinhos do Sul
4111	Morro Redondo
4112	Morro Reuter
4113	Mostardas
4114	Muçum
4115	Muitos Capões
4116	Muliterno
4117	Não-Me-Toque
4118	Nicolau Vergueiro
4119	Nonoai
4120	Nova Alvorada
4121	Nova Araçá
4122	Nova Bassano
4123	Nova Boa Vista
4124	Nova Bréscia
4125	Nova Candelária
4126	Nova Esperança do Sul
4127	Nova Hartz
4128	Nova Pádua
4129	Nova Palma
4130	Nova Petrópolis
4131	Nova Prata
4132	Nova Ramada
4133	Nova Roma do Sul
4134	Nova Santa Rita
4135	Novo Barreiro
4136	Novo Cabrais
4137	Novo Hamburgo
4138	Novo Machado
4139	Novo Tiradentes
4140	Novo Xingu
4141	Osório
4142	Paim Filho
4143	Palmares do Sul
4144	Palmeira das Missões
4145	Palmitinho
4146	Panambi
4147	Pantano Grande
4148	Paraí
4149	Paraíso do Sul
4150	Pareci Novo
4151	Parobé
4152	Passa Sete
4153	Passo do Sobrado
4154	Passo Fundo
4155	Paulo Bento
4156	Paverama
4157	Pedras Altas
4158	Pedro Osório
4159	Pejuçara
4160	Pelotas
4161	Picada Café
4162	Pinhal
4163	Pinhal da Serra
4164	Pinhal Grande
4165	Pinheirinho do Vale
4166	Pinheiro Machado
4167	Pirapó
4168	Piratini
4169	Planalto
4170	Poço das Antas
4171	Pontão
4172	Ponte Preta
4173	Portão
4174	Porto Alegre
4175	Porto Lucena
4176	Porto Mauá
4177	Porto Vera Cruz
4178	Porto Xavier
4179	Pouso Novo
4180	Presidente Lucena
4181	Progresso
4182	Protásio Alves
4183	Putinga
4184	Quaraí
4185	Quatro Irmãos
4186	Quevedos
4187	Quinze de Novembro
4188	Redentora
4189	Relvado
4190	Restinga Seca
4191	Rio dos Índios
4192	Rio Grande
4193	Rio Pardo
4194	Riozinho
4195	Roca Sales
4196	Rodeio Bonito
4197	Rolador
4198	Rolante
4199	Ronda Alta
4200	Rondinha
4201	Roque Gonzales
4202	Rosário do Sul
4203	Sagrada Família
4204	Saldanha Marinho
4205	Salto do Jacuí
4206	Salvador das Missões
4207	Salvador do Sul
4208	Sananduva
4209	Santa Bárbara do Sul
4210	Santa Cecília do Sul
4211	Santa Clara do Sul
4212	Santa Cruz do Sul
4213	Santa Margarida do Sul
4214	Santa Maria
4215	Santa Maria do Herval
4216	Santa Rosa
4217	Santa Tereza
4218	Santa Vitória do Palmar
4219	Santana da Boa Vista
4220	Santana do Livramento
4221	Santiago
4222	Santo Ângelo
4223	Santo Antônio da Patrulha
4224	Santo Antônio das Missões
4225	Santo Antônio do Palma
4226	Santo Antônio do Planalto
4227	Santo Augusto
4228	Santo Cristo
4229	Santo Expedito do Sul
4230	São Borja
4231	São Domingos do Sul
4232	São Francisco de Assis
4233	São Francisco de Paula
4234	São Gabriel
4235	São Jerônimo
4236	São João da Urtiga
4237	São João do Polêsine
4238	São Jorge
4239	São José das Missões
4240	São José do Herval
4241	São José do Hortêncio
4242	São José do Inhacorá
4243	São José do Norte
4244	São José do Ouro
4245	São José do Sul
4246	São José dos Ausentes
4247	São Leopoldo
4248	São Lourenço do Sul
4249	São Luiz Gonzaga
4250	São Marcos
4251	São Martinho
4252	São Martinho da Serra
4253	São Miguel das Missões
4254	São Nicolau
4255	São Paulo das Missões
4256	São Pedro da Serra
4257	São Pedro das Missões
4258	São Pedro do Butiá
4259	São Pedro do Sul
4260	São Sebastião do Caí
4261	São Sepé
4262	São Valentim
4263	São Valentim do Sul
4264	São Valério do Sul
4265	São Vendelino
4266	São Vicente do Sul
4267	Sapiranga
4268	Sapucaia do Sul
4269	Sarandi
4270	Seberi
4271	Sede Nova
4272	Segredo
4273	Selbach
4274	Senador Salgado Filho
4275	Sentinela do Sul
4276	Serafina Corrêa
4277	Sério
4278	Sertão
4279	Sertão Santana
4280	Sete de Setembro
4281	Severiano de Almeida
4282	Silveira Martins
4283	Sinimbu
4284	Sobradinho
4285	Soledade
4286	Tabaí
4287	Tapejara
4288	Tapera
4289	Tapes
4290	Taquara
4291	Taquari
4292	Taquaruçu do Sul
4293	Tavares
4294	Tenente Portela
4295	Terra de Areia
4296	Teutônia
4297	Tio Hugo
4298	Tiradentes do Sul
4299	Toropi
4300	Torres
4301	Tramandaí
4302	Travesseiro
4303	Três Arroios
4304	Três Cachoeiras
4305	Três Coroas
4306	Três de Maio
4307	Três Forquilhas
4308	Três Palmeiras
4309	Três Passos
4310	Trindade do Sul
4311	Triunfo
4312	Tucunduva
4313	Tunas
4314	Tupanci do Sul
4315	Tupanciretã
4316	Tupandi
4317	Tuparendi
4318	Turuçu
4319	Ubiretama
4320	União da Serra
4321	Unistalda
4322	Uruguaiana
4323	Vacaria
4324	Vale do Sol
4325	Vale Real
4326	Vale Verde
4327	Vanini
4328	Venâncio Aires
4329	Vera Cruz
4330	Veranópolis
4331	Vespasiano Correa
4332	Viadutos
4333	Viamão
4334	Vicente Dutra
4335	Victor Graeff
4336	Vila Flores
4337	Vila Lângaro
4338	Vila Maria
4339	Vila Nova do Sul
4340	Vista Alegre
4341	Vista Alegre do Prata
4342	Vista Gaúcha
4343	Vitória das Missões
4344	Westfália
4345	Xangri-lá
4346	Alta Floresta d`Oeste
4347	Alto Alegre dos Parecis
4348	Alto Paraíso
4349	Alvorada d`Oeste
4350	Ariquemes
4351	Buritis
4352	Cabixi
4353	Cacaulândia
4354	Cacoal
4355	Campo Novo de Rondônia
4356	Candeias do Jamari
4357	Castanheiras
4358	Cerejeiras
4359	Chupinguaia
4360	Colorado do Oeste
4361	Corumbiara
4362	Costa Marques
4363	Cujubim
4364	Espigão d`Oeste
4365	Governador Jorge Teixeira
4366	Guajará-Mirim
4367	Itapuã do Oeste
4368	Jaru
4369	Ji-Paraná
4370	Machadinho d`Oeste
4371	Ministro Andreazza
4372	Mirante da Serra
4373	Monte Negro
4374	Nova Brasilândia d`Oeste
4375	Nova Mamoré
4376	Nova União
4377	Novo Horizonte do Oeste
4378	Ouro Preto do Oeste
4379	Parecis
4380	Pimenta Bueno
4381	Pimenteiras do Oeste
4382	Porto Velho
4383	Presidente Médici
4384	Primavera de Rondônia
4385	Rio Crespo
4386	Rolim de Moura
4387	Santa Luzia d`Oeste
4388	São Felipe d`Oeste
4389	São Francisco do Guaporé
4390	São Miguel do Guaporé
4391	Seringueiras
4392	Teixeirópolis
4393	Theobroma
4394	Urupá
4395	Vale do Anari
4396	Vale do Paraíso
4397	Vilhena
4398	Alto Alegre
4399	Amajari
4400	Boa Vista
4401	Bonfim
4402	Cantá
4403	Caracaraí
4404	Caroebe
4405	Iracema
4406	Mucajaí
4407	Normandia
4408	Pacaraima
4409	Rorainópolis
4410	São João da Baliza
4411	São Luiz
4412	Uiramutã
4413	Abdon Batista
4414	Abelardo Luz
4415	Agrolândia
4416	Agronômica
4417	Água Doce
4418	Águas de Chapecó
4419	Águas Frias
4420	Águas Mornas
4421	Alfredo Wagner
4422	Alto Bela Vista
4423	Anchieta
4424	Angelina
4425	Anita Garibaldi
4426	Anitápolis
4427	Antônio Carlos
4428	Apiúna
4429	Arabutã
4430	Araquari
4431	Araranguá
4432	Armazém
4433	Arroio Trinta
4434	Arvoredo
4435	Ascurra
4436	Atalanta
4437	Aurora
4438	Balneário Arroio do Silva
4439	Balneário Barra do Sul
4440	Balneário Camboriú
4441	Balneário Gaivota
4442	Bandeirante
4443	Barra Bonita
4444	Barra Velha
4445	Bela Vista do Toldo
4446	Belmonte
4447	Benedito Novo
4448	Biguaçu
4449	Blumenau
4450	Bocaina do Sul
4451	Bom Jardim da Serra
4452	Bom Jesus
4453	Bom Jesus do Oeste
4454	Bom Retiro
4455	Bombinhas
4456	Botuverá
4457	Braço do Norte
4458	Braço do Trombudo
4459	Brunópolis
4460	Brusque
4461	Caçador
4462	Caibi
4463	Calmon
4464	Camboriú
4465	Campo Alegre
4466	Campo Belo do Sul
4467	Campo Erê
4468	Campos Novos
4469	Canelinha
4470	Canoinhas
4471	Capão Alto
4472	Capinzal
4473	Capivari de Baixo
4474	Catanduvas
4475	Caxambu do Sul
4476	Celso Ramos
4477	Cerro Negro
4478	Chapadão do Lageado
4479	Chapecó
4480	Cocal do Sul
4481	Concórdia
4482	Cordilheira Alta
4483	Coronel Freitas
4484	Coronel Martins
4485	Correia Pinto
4486	Corupá
4487	Criciúma
4488	Cunha Porã
4489	Cunhataí
4490	Curitibanos
4491	Descanso
4492	Dionísio Cerqueira
4493	Dona Emma
4494	Doutor Pedrinho
4495	Entre Rios
4496	Ermo
4497	Erval Velho
4498	Faxinal dos Guedes
4499	Flor do Sertão
4500	Florianópolis
4501	Formosa do Sul
4502	Forquilhinha
4503	Fraiburgo
4504	Frei Rogério
4505	Galvão
4506	Garopaba
4507	Garuva
4508	Gaspar
4509	Governador Celso Ramos
4510	Grão Pará
4511	Gravatal
4512	Guabiruba
4513	Guaraciaba
4514	Guaramirim
4515	Guarujá do Sul
4516	Guatambú
4517	Herval d`Oeste
4518	Ibiam
4519	Ibicaré
4520	Ibirama
4521	Içara
4522	Ilhota
4523	Imaruí
4524	Imbituba
4525	Imbuia
4526	Indaial
4527	Iomerê
4528	Ipira
4529	Iporã do Oeste
4530	Ipuaçu
4531	Ipumirim
4532	Iraceminha
4533	Irani
4534	Irati
4535	Irineópolis
4536	Itá
4537	Itaiópolis
4538	Itajaí
4539	Itapema
4540	Itapiranga
4541	Itapoá
4542	Ituporanga
4543	Jaborá
4544	Jacinto Machado
4545	Jaguaruna
4546	Jaraguá do Sul
4547	Jardinópolis
4548	Joaçaba
4549	Joinville
4550	José Boiteux
4551	Jupiá
4552	Lacerdópolis
4553	Lages
4554	Laguna
4555	Lajeado Grande
4556	Laurentino
4557	Lauro Muller
4558	Lebon Régis
4559	Leoberto Leal
4560	Lindóia do Sul
4561	Lontras
4562	Luiz Alves
4563	Luzerna
4564	Macieira
4565	Mafra
4566	Major Gercino
4567	Major Vieira
4568	Maracajá
4569	Maravilha
4570	Marema
4571	Massaranduba
4572	Matos Costa
4573	Meleiro
4574	Mirim Doce
4575	Modelo
4576	Mondaí
4577	Monte Carlo
4578	Monte Castelo
4579	Morro da Fumaça
4580	Morro Grande
4581	Navegantes
4582	Nova Erechim
4583	Nova Itaberaba
4584	Nova Trento
4585	Nova Veneza
4586	Novo Horizonte
4587	Orleans
4588	Otacílio Costa
4589	Ouro
4590	Ouro Verde
4591	Paial
4592	Painel
4593	Palhoça
4594	Palma Sola
4595	Palmeira
4596	Palmitos
4597	Papanduva
4598	Paraíso
4599	Passo de Torres
4600	Passos Maia
4601	Paulo Lopes
4602	Pedras Grandes
4603	Penha
4604	Peritiba
4605	Petrolândia
4606	Piçarras
4607	Pinhalzinho
4608	Pinheiro Preto
4609	Piratuba
4610	Planalto Alegre
4611	Pomerode
4612	Ponte Alta
4613	Ponte Alta do Norte
4614	Ponte Serrada
4615	Porto Belo
4616	Porto União
4617	Pouso Redondo
4618	Praia Grande
4619	Presidente Castelo Branco
4620	Presidente Getúlio
4621	Presidente Nereu
4622	Princesa
4623	Quilombo
4624	Rancho Queimado
4625	Rio das Antas
4626	Rio do Campo
4627	Rio do Oeste
4628	Rio do Sul
4629	Rio dos Cedros
4630	Rio Fortuna
4631	Rio Negrinho
4632	Rio Rufino
4633	Riqueza
4634	Rodeio
4635	Romelândia
4636	Salete
4637	Saltinho
4638	Salto Veloso
4639	Sangão
4640	Santa Cecília
4641	Santa Helena
4642	Santa Rosa de Lima
4643	Santa Rosa do Sul
4644	Santa Terezinha
4645	Santa Terezinha do Progresso
4646	Santiago do Sul
4647	Santo Amaro da Imperatriz
4648	São Bento do Sul
4649	São Bernardino
4650	São Bonifácio
4651	São Carlos
4652	São Cristovão do Sul
4653	São Domingos
4654	São Francisco do Sul
4655	São João Batista
4656	São João do Itaperiú
4657	São João do Oeste
4658	São João do Sul
4659	São Joaquim
4660	São José
4661	São José do Cedro
4662	São José do Cerrito
4663	São Lourenço do Oeste
4664	São Ludgero
4665	São Martinho
4666	São Miguel da Boa Vista
4667	São Miguel do Oeste
4668	São Pedro de Alcântara
4669	Saudades
4670	Schroeder
4671	Seara
4672	Serra Alta
4673	Siderópolis
4674	Sombrio
4675	Sul Brasil
4676	Taió
4677	Tangará
4678	Tigrinhos
4679	Tijucas
4680	Timbé do Sul
4681	Timbó
4682	Timbó Grande
4683	Três Barras
4684	Treviso
4685	Treze de Maio
4686	Treze Tílias
4687	Trombudo Central
4688	Tubarão
4689	Tunápolis
4690	Turvo
4691	União do Oeste
4692	Urubici
4693	Urupema
4694	Urussanga
4695	Vargeão
4696	Vargem
4697	Vargem Bonita
4698	Vidal Ramos
4699	Videira
4700	Vitor Meireles
4701	Witmarsum
4702	Xanxerê
4703	Xavantina
4704	Xaxim
4705	Zortéa
4706	Adamantina
4707	Adolfo
4708	Aguaí
4709	Águas da Prata
4710	Águas de Lindóia
4711	Águas de Santa Bárbara
4712	Águas de São Pedro
4713	Agudos
4714	Alambari
4715	Alfredo Marcondes
4716	Altair
4717	Altinópolis
4718	Alto Alegre
4719	Alumínio
4720	Álvares Florence
4721	Álvares Machado
4722	Álvaro de Carvalho
4723	Alvinlândia
4724	Americana
4725	Américo Brasiliense
4726	Américo de Campos
4727	Amparo
4728	Analândia
4729	Andradina
4730	Angatuba
4731	Anhembi
4732	Anhumas
4733	Aparecida
4734	Aparecida d`Oeste
4735	Apiaí
4736	Araçariguama
4737	Araçatuba
4738	Araçoiaba da Serra
4739	Aramina
4740	Arandu
4741	Arapeí
4742	Araraquara
4743	Araras
4744	Arco-Íris
4745	Arealva
4746	Areias
4747	Areiópolis
4748	Ariranha
4749	Artur Nogueira
4750	Arujá
4751	Aspásia
4752	Assis
4753	Atibaia
4754	Auriflama
4755	Avaí
4756	Avanhandava
4757	Avaré
4758	Bady Bassitt
4759	Balbinos
4760	Bálsamo
4761	Bananal
4762	Barão de Antonina
4763	Barbosa
4764	Bariri
4765	Barra Bonita
4766	Barra do Chapéu
4767	Barra do Turvo
4768	Barretos
4769	Barrinha
4770	Barueri
4771	Bastos
4772	Batatais
4773	Bauru
4774	Bebedouro
4775	Bento de Abreu
4776	Bernardino de Campos
4777	Bertioga
4778	Bilac
4779	Birigui
4780	Biritiba-Mirim
4781	Boa Esperança do Sul
4782	Bocaina
4783	Bofete
4784	Boituva
4785	Bom Jesus dos Perdões
4786	Bom Sucesso de Itararé
4787	Borá
4788	Boracéia
4789	Borborema
4790	Borebi
4791	Botucatu
4792	Bragança Paulista
4793	Braúna
4794	Brejo Alegre
4795	Brodowski
4796	Brotas
4797	Buri
4798	Buritama
4799	Buritizal
4800	Cabrália Paulista
4801	Cabreúva
4802	Caçapava
4803	Cachoeira Paulista
4804	Caconde
4805	Cafelândia
4806	Caiabu
4807	Caieiras
4808	Caiuá
4809	Cajamar
4810	Cajati
4811	Cajobi
4812	Cajuru
4813	Campina do Monte Alegre
4814	Campinas
4815	Campo Limpo Paulista
4816	Campos do Jordão
4817	Campos Novos Paulista
4818	Cananéia
4819	Canas
4820	Cândido Mota
4821	Cândido Rodrigues
4822	Canitar
4823	Capão Bonito
4824	Capela do Alto
4825	Capivari
4826	Caraguatatuba
4827	Carapicuíba
4828	Cardoso
4829	Casa Branca
4830	Cássia dos Coqueiros
4831	Castilho
4832	Catanduva
4833	Catiguá
4834	Cedral
4835	Cerqueira César
4836	Cerquilho
4837	Cesário Lange
4838	Charqueada
4839	Chavantes
4840	Clementina
4841	Colina
4842	Colômbia
4843	Conchal
4844	Conchas
4845	Cordeirópolis
4846	Coroados
4847	Coronel Macedo
4848	Corumbataí
4849	Cosmópolis
4850	Cosmorama
4851	Cotia
4852	Cravinhos
4853	Cristais Paulista
4854	Cruzália
4855	Cruzeiro
4856	Cubatão
4857	Cunha
4858	Descalvado
4859	Diadema
4860	Dirce Reis
4861	Divinolândia
4862	Dobrada
4863	Dois Córregos
4864	Dolcinópolis
4865	Dourado
4866	Dracena
4867	Duartina
4868	Dumont
4869	Echaporã
4870	Eldorado
4871	Elias Fausto
4872	Elisiário
4873	Embaúba
4874	Embu
4875	Embu-Guaçu
4876	Emilianópolis
4877	Engenheiro Coelho
4878	Espírito Santo do Pinhal
4879	Espírito Santo do Turvo
4880	Estiva Gerbi
4881	Estrela d`Oeste
4882	Estrela do Norte
4883	Euclides da Cunha Paulista
4884	Fartura
4885	Fernando Prestes
4886	Fernandópolis
4887	Fernão
4888	Ferraz de Vasconcelos
4889	Flora Rica
4890	Floreal
4891	Flórida Paulista
4892	Florínia
4893	Franca
4894	Francisco Morato
4895	Franco da Rocha
4896	Gabriel Monteiro
4897	Gália
4898	Garça
4899	Gastão Vidigal
4900	Gavião Peixoto
4901	General Salgado
4902	Getulina
4903	Glicério
4904	Guaiçara
4905	Guaimbê
4906	Guaíra
4907	Guapiaçu
4908	Guapiara
4909	Guará
4910	Guaraçaí
4911	Guaraci
4912	Guarani d`Oeste
4913	Guarantã
4914	Guararapes
4915	Guararema
4916	Guaratinguetá
4917	Guareí
4918	Guariba
4919	Guarujá
4920	Guarulhos
4921	Guatapará
4922	Guzolândia
4923	Herculândia
4924	Holambra
4925	Hortolândia
4926	Iacanga
4927	Iacri
4928	Iaras
4929	Ibaté
4930	Ibirá
4931	Ibirarema
4932	Ibitinga
4933	Ibiúna
4934	Icém
4935	Iepê
4936	Igaraçu do Tietê
4937	Igarapava
4938	Igaratá
4939	Iguape
4940	Ilha Comprida
4941	Ilha Solteira
4942	Ilhabela
4943	Indaiatuba
4944	Indiana
4945	Indiaporã
4946	Inúbia Paulista
4947	Ipaussu
4948	Iperó
4949	Ipeúna
4950	Ipiguá
4951	Iporanga
4952	Ipuã
4953	Iracemápolis
4954	Irapuã
4955	Irapuru
4956	Itaberá
4957	Itaí
4958	Itajobi
4959	Itaju
4960	Itanhaém
4961	Itaóca
4962	Itapecerica da Serra
4963	Itapetininga
4964	Itapeva
4965	Itapevi
4966	Itapira
4967	Itapirapuã Paulista
4968	Itápolis
4969	Itaporanga
4970	Itapuí
4971	Itapura
4972	Itaquaquecetuba
4973	Itararé
4974	Itariri
4975	Itatiba
4976	Itatinga
4977	Itirapina
4978	Itirapuã
4979	Itobi
4980	Itu
4981	Itupeva
4982	Ituverava
4983	Jaborandi
4984	Jaboticabal
4985	Jacareí
4986	Jaci
4987	Jacupiranga
4988	Jaguariúna
4989	Jales
4990	Jambeiro
4991	Jandira
4992	Jardinópolis
4993	Jarinu
4994	Jaú
4995	Jeriquara
4996	Joanópolis
4997	João Ramalho
4998	José Bonifácio
4999	Júlio Mesquita
5000	Jumirim
5001	Jundiaí
5002	Junqueirópolis
5003	Juquiá
5004	Juquitiba
5005	Lagoinha
5006	Laranjal Paulista
5007	Lavínia
5008	Lavrinhas
5009	Leme
5010	Lençóis Paulista
5011	Limeira
5012	Lindóia
5013	Lins
5014	Lorena
5015	Lourdes
5016	Louveira
5017	Lucélia
5018	Lucianópolis
5019	Luís Antônio
5020	Luiziânia
5021	Lupércio
5022	Lutécia
5023	Macatuba
5024	Macaubal
5025	Macedônia
5026	Magda
5027	Mairinque
5028	Mairiporã
5029	Manduri
5030	Marabá Paulista
5031	Maracaí
5032	Marapoama
5033	Mariápolis
5034	Marília
5035	Marinópolis
5036	Martinópolis
5037	Matão
5038	Mauá
5039	Mendonça
5040	Meridiano
5041	Mesópolis
5042	Miguelópolis
5043	Mineiros do Tietê
5044	Mira Estrela
5045	Miracatu
5046	Mirandópolis
5047	Mirante do Paranapanema
5048	Mirassol
5049	Mirassolândia
5050	Mococa
5051	Mogi das Cruzes
5052	Mogi Guaçu
5053	Moji Mirim
5054	Mombuca
5055	Monções
5056	Mongaguá
5057	Monte Alegre do Sul
5058	Monte Alto
5059	Monte Aprazível
5060	Monte Azul Paulista
5061	Monte Castelo
5062	Monte Mor
5063	Monteiro Lobato
5064	Morro Agudo
5065	Morungaba
5066	Motuca
5067	Murutinga do Sul
5068	Nantes
5069	Narandiba
5070	Natividade da Serra
5071	Nazaré Paulista
5072	Neves Paulista
5073	Nhandeara
5074	Nipoã
5075	Nova Aliança
5076	Nova Campina
5077	Nova Canaã Paulista
5078	Nova Castilho
5079	Nova Europa
5080	Nova Granada
5081	Nova Guataporanga
5082	Nova Independência
5083	Nova Luzitânia
5084	Nova Odessa
5085	Novais
5086	Novo Horizonte
5087	Nuporanga
5088	Ocauçu
5089	Óleo
5090	Olímpia
5091	Onda Verde
5092	Oriente
5093	Orindiúva
5094	Orlândia
5095	Osasco
5096	Oscar Bressane
5097	Osvaldo Cruz
5098	Ourinhos
5099	Ouro Verde
5100	Ouroeste
5101	Pacaembu
5102	Palestina
5103	Palmares Paulista
5104	Palmeira d`Oeste
5105	Palmital
5106	Panorama
5107	Paraguaçu Paulista
5108	Paraibuna
5109	Paraíso
5110	Paranapanema
5111	Paranapuã
5112	Parapuã
5113	Pardinho
5114	Pariquera-Açu
5115	Parisi
5116	Patrocínio Paulista
5117	Paulicéia
5118	Paulínia
5119	Paulistânia
5120	Paulo de Faria
5121	Pederneiras
5122	Pedra Bela
5123	Pedranópolis
5124	Pedregulho
5125	Pedreira
5126	Pedrinhas Paulista
5127	Pedro de Toledo
5128	Penápolis
5129	Pereira Barreto
5130	Pereiras
5131	Peruíbe
5132	Piacatu
5133	Piedade
5134	Pilar do Sul
5135	Pindamonhangaba
5136	Pindorama
5137	Pinhalzinho
5138	Piquerobi
5139	Piquete
5140	Piracaia
5141	Piracicaba
5142	Piraju
5143	Pirajuí
5144	Pirangi
5145	Pirapora do Bom Jesus
5146	Pirapozinho
5147	Pirassununga
5148	Piratininga
5149	Pitangueiras
5150	Planalto
5151	Platina
5152	Poá
5153	Poloni
5154	Pompéia
5155	Pongaí
5156	Pontal
5157	Pontalinda
5158	Pontes Gestal
5159	Populina
5160	Porangaba
5161	Porto Feliz
5162	Porto Ferreira
5163	Potim
5164	Potirendaba
5165	Pracinha
5166	Pradópolis
5167	Praia Grande
5168	Pratânia
5169	Presidente Alves
5170	Presidente Bernardes
5171	Presidente Epitácio
5172	Presidente Prudente
5173	Presidente Venceslau
5174	Promissão
5175	Quadra
5176	Quatá
5177	Queiroz
5178	Queluz
5179	Quintana
5180	Rafard
5181	Rancharia
5182	Redenção da Serra
5183	Regente Feijó
5184	Reginópolis
5185	Registro
5186	Restinga
5187	Ribeira
5188	Ribeirão Bonito
5189	Ribeirão Branco
5190	Ribeirão Corrente
5191	Ribeirão do Sul
5192	Ribeirão dos Índios
5193	Ribeirão Grande
5194	Ribeirão Pires
5195	Ribeirão Preto
5196	Rifaina
5197	Rincão
5198	Rinópolis
5199	Rio Claro
5200	Rio das Pedras
5201	Rio Grande da Serra
5202	Riolândia
5203	Riversul
5204	Rosana
5205	Roseira
5206	Rubiácea
5207	Rubinéia
5208	Sabino
5209	Sagres
5210	Sales
5211	Sales Oliveira
5212	Salesópolis
5213	Salmourão
5214	Saltinho
5215	Salto
5216	Salto de Pirapora
5217	Salto Grande
5218	Sandovalina
5219	Santa Adélia
5220	Santa Albertina
5221	Santa Bárbara d`Oeste
5222	Santa Branca
5223	Santa Clara d`Oeste
5224	Santa Cruz da Conceição
5225	Santa Cruz da Esperança
5226	Santa Cruz das Palmeiras
5227	Santa Cruz do Rio Pardo
5228	Santa Ernestina
5229	Santa Fé do Sul
5230	Santa Gertrudes
5231	Santa Isabel
5232	Santa Lúcia
5233	Santa Maria da Serra
5234	Santa Mercedes
5235	Santa Rita d`Oeste
5236	Santa Rita do Passa Quatro
5237	Santa Rosa de Viterbo
5238	Santa Salete
5239	Santana da Ponte Pensa
5240	Santana de Parnaíba
5241	Santo Anastácio
5242	Santo André
5243	Santo Antônio da Alegria
5244	Santo Antônio de Posse
5245	Santo Antônio do Aracanguá
5246	Santo Antônio do Jardim
5247	Santo Antônio do Pinhal
5248	Santo Expedito
5249	Santópolis do Aguapeí
5250	Santos
5251	São Bento do Sapucaí
5252	São Bernardo do Campo
5253	São Caetano do Sul
5254	São Carlos
5255	São Francisco
5256	São João da Boa Vista
5257	São João das Duas Pontes
5258	São João de Iracema
5259	São João do Pau d`Alho
5260	São Joaquim da Barra
5261	São José da Bela Vista
5262	São José do Barreiro
5263	São José do Rio Pardo
5264	São José do Rio Preto
5265	São José dos Campos
5266	São Lourenço da Serra
5267	São Luís do Paraitinga
5268	São Manuel
5269	São Miguel Arcanjo
5270	São Paulo
5271	São Pedro
5272	São Pedro do Turvo
5273	São Roque
5274	São Sebastião
5275	São Sebastião da Grama
5276	São Simão
5277	São Vicente
5278	Sarapuí
5279	Sarutaiá
5280	Sebastianópolis do Sul
5281	Serra Azul
5282	Serra Negra
5283	Serrana
5284	Sertãozinho
5285	Sete Barras
5286	Severínia
5287	Silveiras
5288	Socorro
5289	Sorocaba
5290	Sud Mennucci
5291	Sumaré
5292	Suzanápolis
5293	Suzano
5294	Tabapuã
5295	Tabatinga
5296	Taboão da Serra
5297	Taciba
5298	Taguaí
5299	Taiaçu
5300	Taiúva
5301	Tambaú
5302	Tanabi
5303	Tapiraí
5304	Tapiratiba
5305	Taquaral
5306	Taquaritinga
5307	Taquarituba
5308	Taquarivaí
5309	Tarabai
5310	Tarumã
5311	Tatuí
5312	Taubaté
5313	Tejupá
5314	Teodoro Sampaio
5315	Terra Roxa
5316	Tietê
5317	Timburi
5318	Torre de Pedra
5319	Torrinha
5320	Trabiju
5321	Tremembé
5322	Três Fronteiras
5323	Tuiuti
5324	Tupã
5325	Tupi Paulista
5326	Turiúba
5327	Turmalina
5328	Ubarana
5329	Ubatuba
5330	Ubirajara
5331	Uchoa
5332	União Paulista
5333	Urânia
5334	Uru
5335	Urupês
5336	Valentim Gentil
5337	Valinhos
5338	Valparaíso
5339	Vargem
5340	Vargem Grande do Sul
5341	Vargem Grande Paulista
5342	Várzea Paulista
5343	Vera Cruz
5344	Vinhedo
5345	Viradouro
5346	Vista Alegre do Alto
5347	Vitória Brasil
5348	Votorantim
5349	Votuporanga
5350	Zacarias
5351	Amparo de São Francisco
5352	Aquidabã
5353	Aracaju
5354	Arauá
5355	Areia Branca
5356	Barra dos Coqueiros
5357	Boquim
5358	Brejo Grande
5359	Campo do Brito
5360	Canhoba
5361	Canindé de São Francisco
5362	Capela
5363	Carira
5364	Carmópolis
5365	Cedro de São João
5366	Cristinápolis
5367	Cumbe
5368	Divina Pastora
5369	Estância
5370	Feira Nova
5371	Frei Paulo
5372	Gararu
5373	General Maynard
5374	Gracho Cardoso
5375	Ilha das Flores
5376	Indiaroba
5377	Itabaiana
5378	Itabaianinha
5379	Itabi
5380	Itaporanga d`Ajuda
5381	Japaratuba
5382	Japoatã
5383	Lagarto
5384	Laranjeiras
5385	Macambira
5386	Malhada dos Bois
5387	Malhador
5388	Maruim
5389	Moita Bonita
5390	Monte Alegre de Sergipe
5391	Muribeca
5392	Neópolis
5393	Nossa Senhora Aparecida
5394	Nossa Senhora da Glória
5395	Nossa Senhora das Dores
5396	Nossa Senhora de Lourdes
5397	Nossa Senhora do Socorro
5398	Pacatuba
5399	Pedra Mole
5400	Pedrinhas
5401	Pinhão
5402	Pirambu
5403	Poço Redondo
5404	Poço Verde
5405	Porto da Folha
5406	Propriá
5407	Riachão do Dantas
5408	Riachuelo
5409	Ribeirópolis
5410	Rosário do Catete
5411	Salgado
5412	Santa Luzia do Itanhy
5413	Santa Rosa de Lima
5414	Santana do São Francisco
5415	Santo Amaro das Brotas
5416	São Cristóvão
5417	São Domingos
5418	São Francisco
5419	São Miguel do Aleixo
5420	Simão Dias
5421	Siriri
5422	Telha
5423	Tobias Barreto
5424	Tomar do Geru
5425	Umbaúba
5426	Abreulândia
5427	Aguiarnópolis
5428	Aliança do Tocantins
5429	Almas
5430	Alvorada
5431	Ananás
5432	Angico
5433	Aparecida do Rio Negro
5434	Aragominas
5435	Araguacema
5436	Araguaçu
5437	Araguaína
5438	Araguanã
5439	Araguatins
5440	Arapoema
5441	Arraias
5442	Augustinópolis
5443	Aurora do Tocantins
5444	Axixá do Tocantins
5445	Babaçulândia
5446	Bandeirantes do Tocantins
5447	Barra do Ouro
5448	Barrolândia
5449	Bernardo Sayão
5450	Bom Jesus do Tocantins
5451	Brasilândia do Tocantins
5452	Brejinho de Nazaré
5453	Buriti do Tocantins
5454	Cachoeirinha
5455	Campos Lindos
5456	Cariri do Tocantins
5457	Carmolândia
5458	Carrasco Bonito
5459	Caseara
5460	Centenário
5461	Chapada da Natividade
5462	Chapada de Areia
5463	Colinas do Tocantins
5464	Colméia
5465	Combinado
5466	Conceição do Tocantins
5467	Couto de Magalhães
5468	Cristalândia
5469	Crixás do Tocantins
5470	Darcinópolis
5471	Dianópolis
5472	Divinópolis do Tocantins
5473	Dois Irmãos do Tocantins
5474	Dueré
5475	Esperantina
5476	Fátima
5477	Figueirópolis
5478	Filadélfia
5479	Formoso do Araguaia
5480	Fortaleza do Tabocão
5481	Goianorte
5482	Goiatins
5483	Guaraí
5484	Gurupi
5485	Ipueiras
5486	Itacajá
5487	Itaguatins
5488	Itapiratins
5489	Itaporã do Tocantins
5490	Jaú do Tocantins
5491	Juarina
5492	Lagoa da Confusão
5493	Lagoa do Tocantins
5494	Lajeado
5495	Lavandeira
5496	Lizarda
5497	Luzinópolis
5498	Marianópolis do Tocantins
5499	Mateiros
5500	Maurilândia do Tocantins
5501	Miracema do Tocantins
5502	Miranorte
5503	Monte do Carmo
5504	Monte Santo do Tocantins
5505	Muricilândia
5506	Natividade
5507	Nazaré
5508	Nova Olinda
5509	Nova Rosalândia
5510	Novo Acordo
5511	Novo Alegre
5512	Novo Jardim
5513	Oliveira de Fátima
5514	Palmas
5515	Palmeirante
5516	Palmeiras do Tocantins
5517	Palmeirópolis
5518	Paraíso do Tocantins
5519	Paranã
5520	Pau d`Arco
5521	Pedro Afonso
5522	Peixe
5523	Pequizeiro
5524	Pindorama do Tocantins
5525	Piraquê
5526	Pium
5527	Ponte Alta do Bom Jesus
5528	Ponte Alta do Tocantins
5529	Porto Alegre do Tocantins
5530	Porto Nacional
5531	Praia Norte
5532	Presidente Kennedy
5533	Pugmil
5534	Recursolândia
5535	Riachinho
5536	Rio da Conceição
5537	Rio dos Bois
5538	Rio Sono
5539	Sampaio
5540	Sandolândia
5541	Santa Fé do Araguaia
5542	Santa Maria do Tocantins
5543	Santa Rita do Tocantins
5544	Santa Rosa do Tocantins
5545	Santa Tereza do Tocantins
5546	Santa Terezinha do Tocantins
5547	São Bento do Tocantins
5548	São Félix do Tocantins
5549	São Miguel do Tocantins
5550	São Salvador do Tocantins
5551	São Sebastião do Tocantins
5552	São Valério da Natividade
5553	Silvanópolis
5554	Sítio Novo do Tocantins
5555	Sucupira
5556	Taguatinga
5557	Taipas do Tocantins
5558	Talismã
5559	Tocantínia
5560	Tocantinópolis
5561	Tupirama
5562	Tupiratins
5563	Wanderlândia
5564	Xambioá
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, "imageUrl") FROM stdin;
72	Tanoodle	http://dummyimage.com/248x100.png/5fa2dd/ffffff
73	Oyondu	http://dummyimage.com/118x100.png/dddddd/000000
74	Skyba	http://dummyimage.com/113x100.png/cc0000/ffffff
75	Centidel	http://dummyimage.com/134x100.png/cc0000/ffffff
76	Dynabox	http://dummyimage.com/166x100.png/cc0000/ffffff
77	Npath	http://dummyimage.com/192x100.png/dddddd/000000
78	Eare	http://dummyimage.com/214x100.png/5fa2dd/ffffff
79	Teklist	http://dummyimage.com/111x100.png/ff4444/ffffff
80	Eabox	http://dummyimage.com/102x100.png/ff4444/ffffff
81	Tagcat	http://dummyimage.com/181x100.png/5fa2dd/ffffff
82	Topicshots	http://dummyimage.com/126x100.png/dddddd/000000
83	Brightdog	http://dummyimage.com/171x100.png/5fa2dd/ffffff
84	Edgeblab	http://dummyimage.com/212x100.png/ff4444/ffffff
85	Kwinu	http://dummyimage.com/228x100.png/ff4444/ffffff
86	Skiptube	http://dummyimage.com/235x100.png/5fa2dd/ffffff
87	Oyonder	http://dummyimage.com/220x100.png/cc0000/ffffff
88	Katz	http://dummyimage.com/135x100.png/cc0000/ffffff
89	Snaptags	http://dummyimage.com/116x100.png/5fa2dd/ffffff
90	Lazz	http://dummyimage.com/118x100.png/ff4444/ffffff
91	Devpulse	http://dummyimage.com/238x100.png/5fa2dd/ffffff
92	Oyoloo	http://dummyimage.com/239x100.png/ff4444/ffffff
93	Blognation	http://dummyimage.com/142x100.png/dddddd/000000
94	Topicblab	http://dummyimage.com/245x100.png/dddddd/000000
95	Eazzy	http://dummyimage.com/103x100.png/cc0000/ffffff
96	Trudoo	http://dummyimage.com/236x100.png/5fa2dd/ffffff
97	Wordify	http://dummyimage.com/219x100.png/5fa2dd/ffffff
98	Tazzy	http://dummyimage.com/197x100.png/cc0000/ffffff
99	Rhynoodle	http://dummyimage.com/203x100.png/cc0000/ffffff
100	Jabberstorm	http://dummyimage.com/217x100.png/ff4444/ffffff
101	Quinu	http://dummyimage.com/193x100.png/cc0000/ffffff
102	Lazzy	http://dummyimage.com/188x100.png/cc0000/ffffff
103	Talane	http://dummyimage.com/228x100.png/cc0000/ffffff
104	Shuffledrive	http://dummyimage.com/136x100.png/5fa2dd/ffffff
105	Plajo	http://dummyimage.com/177x100.png/ff4444/ffffff
106	Photospace	http://dummyimage.com/202x100.png/dddddd/000000
107	Tagtune	http://dummyimage.com/109x100.png/5fa2dd/ffffff
108	Zoomlounge	http://dummyimage.com/130x100.png/5fa2dd/ffffff
109	Trudeo	http://dummyimage.com/113x100.png/5fa2dd/ffffff
110	Tekfly	http://dummyimage.com/117x100.png/5fa2dd/ffffff
111	Divanoodle	http://dummyimage.com/169x100.png/dddddd/000000
113	Linkbridge	http://dummyimage.com/141x100.png/ff4444/ffffff
114	Meezzy	http://dummyimage.com/117x100.png/5fa2dd/ffffff
115	Blogtag	http://dummyimage.com/186x100.png/dddddd/000000
116	Ozu	http://dummyimage.com/200x100.png/cc0000/ffffff
117	Rhynyx	http://dummyimage.com/103x100.png/dddddd/000000
118	Brainverse	http://dummyimage.com/241x100.png/dddddd/000000
119	Camimbo	http://dummyimage.com/107x100.png/ff4444/ffffff
120	Driven	http://dummyimage.com/107x100.png/ff5444/ffffff
121	Responde Aí	http://dummyimage.com/107x100.png/ff5444/f4ffff
10	Fadeo	http://dummyimage.com/124x100.png/ff4444/ffffff
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, name) FROM stdin;
1	Computer Science
2	Linguistics
3	Psychology
4	Philosophy
5	Software Engineering
6	Math
7	Architecture
8	Business
9	Biology
10	Engineering
\.


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.educations (id, "userId", "schoolId", "courseId", "startDate", "endDate", status) FROM stdin;
1	117	45	28	1982-03-12	1980-07-24	ongoing
2	34	22	8	1982-04-08	2003-09-17	time off
3	112	19	4	1991-04-09	2013-05-01	ongoing
4	52	5	24	2007-11-02	2013-04-29	finished
5	176	47	15	2013-01-25	2020-11-29	finished
6	40	10	47	2011-05-03	2000-12-21	finished
7	80	22	45	1990-10-09	1986-09-03	ongoing
8	172	23	25	2003-10-24	1985-11-25	time off
9	96	14	32	1979-06-10	1983-09-22	ongoing
10	6	41	23	2021-03-02	2014-09-21	time off
11	163	23	49	2010-12-31	2016-01-21	finished
12	188	17	10	1992-02-17	2001-03-14	time off
13	68	11	27	1991-12-14	2001-03-03	time off
14	32	40	32	2016-03-13	2016-10-15	ongoing
15	191	22	32	2018-08-28	2020-08-18	time off
16	193	22	48	1979-10-09	1996-09-06	ongoing
17	67	27	16	2000-07-19	2019-06-30	time off
18	26	42	47	1985-11-07	2008-08-17	finished
19	97	11	2	1989-04-13	2002-04-05	ongoing
20	182	16	42	2003-08-14	2019-07-03	time off
21	110	26	20	1987-05-24	1989-02-03	ongoing
22	79	46	36	2008-08-10	2020-01-02	finished
23	129	2	45	2016-04-29	2018-06-07	finished
24	170	10	29	2011-11-15	1989-11-06	ongoing
25	74	26	4	1993-04-17	1987-04-27	time off
26	128	43	48	1987-01-15	1980-03-12	finished
27	121	12	46	1982-05-31	2014-11-25	time off
28	88	1	25	1996-10-30	1991-11-05	time off
29	96	13	21	2021-07-16	1986-07-06	ongoing
30	131	29	22	2004-09-21	1994-03-29	time off
31	59	16	39	2018-09-04	2020-10-23	ongoing
32	72	14	39	1997-07-20	1983-11-17	ongoing
33	49	15	7	1977-04-06	1992-03-21	ongoing
34	181	21	6	2007-06-22	2016-12-22	finished
35	48	27	4	2014-08-19	1994-11-21	time off
36	40	3	44	1980-06-07	1994-03-15	time off
37	45	41	48	2007-05-01	2005-07-11	finished
38	116	40	26	1999-01-09	1982-07-14	finished
39	161	30	23	1981-11-22	2008-08-17	time off
40	23	24	9	1999-05-23	1988-03-06	ongoing
41	62	30	26	2016-11-22	1998-04-06	ongoing
42	165	11	3	1999-02-05	1983-02-13	ongoing
43	85	46	49	2013-07-23	1980-08-11	ongoing
44	29	35	38	2020-09-10	2013-10-23	finished
45	178	45	37	1989-08-16	2006-07-07	finished
46	4	4	6	2020-10-11	2021-05-17	time off
47	110	34	35	1983-01-30	2014-03-24	time off
48	40	3	38	1990-07-17	2018-03-13	ongoing
49	38	43	14	2005-12-19	1991-01-07	time off
50	44	50	8	1992-08-01	1986-01-30	ongoing
54	30	10	3	2000-01-03	2004-12-21	finished
55	30	10	5	2005-01-03	2008-12-21	finished
56	30	10	10	2009-05-01	2011-06-30	finished
\.


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences (id, "userId", "companyId", "roleId", "startDate", "endDate") FROM stdin;
1	466	35	13	1982-12-12	2019-12-17
2	474	47	3	1991-02-06	2004-12-28
3	317	9	12	2003-10-20	2021-05-11
4	352	4	10	1986-11-22	2013-03-04
5	307	49	9	2006-12-10	1995-05-21
6	461	49	1	2014-03-07	2012-03-19
7	430	13	10	1980-04-14	\N
8	254	10	10	1995-12-28	2011-07-01
9	92	37	13	1995-04-13	2016-12-17
10	114	19	7	1986-05-01	2013-03-11
11	355	28	7	1983-10-17	1994-05-11
12	424	21	4	2002-09-17	1992-12-07
13	453	1	5	1981-03-25	2000-05-09
14	100	14	1	1993-07-07	2017-05-28
15	173	42	12	2021-12-07	2002-03-21
16	484	40	3	1987-05-18	1991-11-10
17	64	42	10	1980-11-03	2018-06-28
18	460	16	12	2018-08-29	2022-01-26
19	265	48	10	2013-09-03	2000-08-10
20	392	14	12	1991-11-26	1991-07-29
21	211	45	10	1998-07-16	1990-05-24
22	196	15	11	2020-12-02	2019-02-24
23	157	23	7	2001-04-25	2000-11-19
24	288	40	12	2021-02-08	2019-04-30
25	314	12	11	1984-09-26	\N
26	107	7	4	2018-11-22	2000-12-05
27	402	15	12	1980-09-26	2014-03-25
28	97	23	11	2006-10-12	1995-11-24
29	239	27	3	2021-06-12	1995-06-21
30	211	42	10	1988-09-28	2010-05-17
31	110	18	5	2010-02-15	\N
32	412	31	1	1982-09-05	2004-08-20
33	327	35	12	1986-12-17	2018-03-23
34	92	18	9	1985-01-30	\N
35	131	11	9	1984-08-03	2002-04-20
36	490	43	12	2000-04-26	\N
37	453	22	10	1981-11-20	2001-10-29
38	484	15	5	2015-07-16	1998-01-18
39	279	4	12	2002-07-29	1995-08-25
40	464	47	2	2015-05-29	2009-07-09
41	273	37	4	2008-09-11	\N
42	87	35	9	1996-05-05	\N
43	359	39	1	2004-02-14	1998-05-29
44	152	27	10	2019-08-09	2021-04-25
45	231	36	10	1995-09-19	2005-02-21
46	178	30	1	1993-11-07	\N
47	269	44	5	2004-11-20	1990-06-23
48	47	29	10	2015-06-28	2013-11-30
49	479	30	12	2014-03-26	2016-05-30
50	484	20	1	1987-03-16	\N
51	266	4	4	2009-07-31	2020-10-22
52	471	37	7	1995-07-25	1991-04-07
53	130	1	8	1990-10-23	\N
54	346	32	8	2004-12-17	1995-11-19
55	372	21	8	2003-05-30	1997-10-24
56	150	13	9	2005-02-26	1996-02-14
57	180	5	1	1999-04-29	2011-11-03
58	217	25	9	1990-01-08	2008-11-30
59	119	4	11	1986-11-07	2010-08-19
60	224	49	10	2007-08-10	\N
61	360	3	2	1998-03-12	2001-10-15
62	466	29	7	2009-10-19	1997-10-31
63	158	21	1	1986-09-03	2011-04-21
64	390	10	9	1990-10-31	2012-09-12
65	499	2	1	2019-06-20	1996-11-07
66	58	50	11	1991-03-28	1999-03-19
67	25	16	1	1985-06-25	2017-10-20
68	350	50	6	1998-06-19	2017-05-04
69	458	42	5	2007-03-13	1999-09-12
70	282	37	2	2007-03-29	2020-08-11
71	20	35	11	2006-10-04	2008-09-08
72	383	14	2	2001-08-11	2016-05-27
73	291	10	6	2009-10-01	\N
74	105	23	13	1988-05-01	2006-10-01
75	32	22	7	1995-09-28	2013-12-21
76	333	39	8	1995-07-02	\N
77	395	38	9	1998-01-02	2004-10-17
78	173	44	5	1986-07-17	2004-10-22
79	110	34	8	2016-04-27	2005-07-07
80	336	12	13	2000-10-04	\N
81	280	12	13	2012-02-10	2002-09-04
82	13	21	2	1995-03-11	\N
83	11	15	4	2002-08-08	1995-03-11
84	89	36	11	2001-08-28	\N
85	383	25	2	2010-05-26	1991-07-08
86	51	16	7	2016-02-15	2012-06-11
87	322	43	5	1999-10-13	1992-09-14
88	309	5	13	2002-06-16	\N
89	197	44	4	1995-12-05	2020-03-28
90	135	9	7	2013-09-16	\N
91	361	43	5	1989-11-09	2017-11-06
92	419	32	8	2021-01-08	\N
93	212	17	3	1999-02-28	\N
94	52	41	4	1989-09-17	\N
95	64	7	10	2018-09-25	2015-07-10
96	224	18	2	2018-12-06	2012-09-16
97	464	50	7	2003-02-09	2014-07-21
98	101	27	9	2009-03-27	\N
99	380	35	10	2011-05-20	1996-05-22
100	227	27	10	2018-08-18	2004-09-10
101	50	90	1	2000-01-01	2004-01-01
102	50	30	2	2004-01-02	2007-01-01
103	50	120	2	2007-03-22	\N
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, "companyId", "roleId", description, salary, active) FROM stdin;
1	11	1	Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.	100712	f
2	68	9	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.	162147	f
3	9	8	Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.	246764	t
4	66	4	In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.	241739	t
5	116	5	Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.	25360	t
6	77	5	Aenean lectus. Pellentesque eget nunc.	129843	t
7	121	8	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.	137443	t
8	120	7	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.	187741	f
9	25	11	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.	253347	f
10	23	3	Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	36100	t
11	2	2	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	65816	t
12	59	10	Pellentesque at nulla. Suspendisse potenti.	89362	t
13	4	4	Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.	33229	f
14	17	4	Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.	52111	f
15	36	5	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.	185647	f
16	114	4	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.	221560	t
17	103	10	Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.	190740	t
18	120	3	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.	213239	f
19	61	5	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.	66086	f
20	89	12	Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.	104174	t
21	55	1	Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.	73227	f
22	60	6	Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.	124776	t
23	43	3	Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.	118186	f
24	15	6	Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.	246298	f
25	48	3	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.	245390	f
26	120	13	Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	40090	f
27	62	1	Phasellus sit amet erat. Nulla tempus.	95113	t
28	81	11	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.	185460	t
29	61	4	Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	38062	t
30	89	5	Duis bibendum. Morbi non quam nec dui luctus rutrum.	31226	f
31	32	6	Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	173776	f
32	93	13	Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	53091	f
33	108	11	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	230539	t
34	93	10	Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	229468	f
35	119	6	Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	201682	f
36	99	5	Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.	64786	f
37	64	4	Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.	137374	t
38	67	11	In hac habitasse platea dictumst.	26324	f
39	97	13	Aliquam erat volutpat.	177161	f
40	117	11	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.	143962	t
41	107	9	Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	29747	t
42	36	11	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.	133504	t
43	43	12	Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.	80848	t
44	24	3	Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.	265869	f
45	19	9	Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.	37541	t
46	111	6	Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.	214167	t
47	66	13	Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	108330	t
48	104	4	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.	213225	f
49	78	3	Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.	78214	t
50	74	10	Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.	137951	f
51	69	4	Phasellus in felis. Donec semper sapien a libero.	74448	t
52	84	5	Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	171386	t
53	59	8	Vestibulum ac est lacinia nisi venenatis tristique.	74463	f
54	121	13	Integer a nibh.	183445	f
55	62	9	Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.	123415	t
56	6	12	Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	105404	f
57	71	3	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	45159	t
58	85	10	Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.	92944	f
59	24	4	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.	88095	t
60	35	2	Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.	183405	t
61	65	9	In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.	99305	t
62	43	5	Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.	49012	f
63	108	7	Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	257172	t
64	75	13	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.	219857	f
65	14	13	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	261307	t
66	115	7	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.	160448	t
67	7	7	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.	36191	f
68	9	7	Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.	133989	t
69	81	3	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.	68651	t
70	8	3	Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.	71539	t
71	118	9	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.	154046	f
72	37	4	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	93583	f
73	116	13	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.	178635	t
74	78	11	Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.	267886	f
75	118	7	Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.	130481	f
76	59	10	Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	201025	t
77	26	2	Nulla facilisi. Cras non velit nec nisi vulputate nonummy.	100402	f
78	3	11	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	41967	f
79	70	11	Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.	252163	f
80	100	7	Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.	171839	f
81	57	3	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	165869	t
82	55	2	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	37570	t
83	31	6	Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.	125020	t
84	65	11	Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.	128563	t
85	72	4	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	130826	f
86	25	3	Proin interdum mauris non ligula pellentesque ultrices.	134317	t
87	121	4	Fusce posuere felis sed lacus.	256310	t
88	81	3	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.	142188	f
89	43	10	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.	201209	f
90	120	10	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.	79536	f
91	40	10	Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.	120446	t
92	16	11	Vivamus in felis eu sapien cursus vestibulum.	89442	t
93	46	6	Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.	163724	f
94	91	1	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.	107981	t
95	55	13	Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.	27570	t
96	8	12	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.	86981	t
97	76	9	Mauris ullamcorper purus sit amet nulla.	215640	t
98	22	9	Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.	174565	t
99	4	9	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.	30864	f
100	13	3	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.	110307	t
101	10	2	Lorem ipsum dolor sit amet.	90000	t
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	Junior Software Engineer
2	Software Engineer
3	Senior Software Engineer
4	Tech Lead
5	CTO
6	VP of Technology
7	Product Manager
8	Scrum Master
9	QA Analyst
10	Data Analyst
11	Back-end developer
12	Front-end developer
13	DevOps Analyst
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schools (id, name, "imageUrl") FROM stdin;
2	Asian Management Institute	http://dummyimage.com/109x100.png/dddddd/000000
3	American University of Beirut	http://dummyimage.com/146x100.png/ff4444/ffffff
4	Universidad Fermin Toro	http://dummyimage.com/117x100.png/cc0000/ffffff
5	Escola Nautica Infante D. Henrique	http://dummyimage.com/161x100.png/ff4444/ffffff
6	Czech Technical University of Prague	http://dummyimage.com/214x100.png/5fa2dd/ffffff
7	Queen Arwa University	http://dummyimage.com/114x100.png/dddddd/000000
8	Universiteit Antwerpen	http://dummyimage.com/125x100.png/ff4444/ffffff
9	Campus Bio-Medico University of Rome	http://dummyimage.com/248x100.png/dddddd/000000
10	Universitas Slamet Riyadi Surakarta	http://dummyimage.com/209x100.png/5fa2dd/ffffff
11	Universidad de Los Andes	http://dummyimage.com/166x100.png/5fa2dd/ffffff
12	Gifu Keizai University	http://dummyimage.com/120x100.png/ff4444/ffffff
13	Indian School of Business Management and Administration	http://dummyimage.com/168x100.png/dddddd/000000
14	University of Mumbai	http://dummyimage.com/245x100.png/ff4444/ffffff
15	Hue University of Agriculture and Forestry 	http://dummyimage.com/231x100.png/dddddd/000000
16	Toho Gakuen School of Music	http://dummyimage.com/116x100.png/ff4444/ffffff
17	Letourneau University	http://dummyimage.com/214x100.png/5fa2dd/ffffff
18	Business and Hotel Management School	http://dummyimage.com/107x100.png/cc0000/ffffff
19	Universidad Católica Cecilio Acosta	http://dummyimage.com/217x100.png/5fa2dd/ffffff
20	United Nations University	http://dummyimage.com/197x100.png/5fa2dd/ffffff
21	Camberwell College of Arts	http://dummyimage.com/133x100.png/cc0000/ffffff
22	European University	http://dummyimage.com/103x100.png/ff4444/ffffff
23	Universidade Estadual do Ceará	http://dummyimage.com/221x100.png/5fa2dd/ffffff
24	University of Santo Tomas	http://dummyimage.com/155x100.png/5fa2dd/ffffff
25	Universidade Católica de Santos	http://dummyimage.com/151x100.png/5fa2dd/ffffff
26	American International College	http://dummyimage.com/152x100.png/ff4444/ffffff
27	Makhanlal Chaturvedi National University of Journalism and Communication	http://dummyimage.com/159x100.png/cc0000/ffffff
28	Sapporo University	http://dummyimage.com/132x100.png/5fa2dd/ffffff
29	Academy of International Economic and Political Relations, Gdynia	http://dummyimage.com/100x100.png/5fa2dd/ffffff
30	Trisakti Institute of Tourism 	http://dummyimage.com/165x100.png/5fa2dd/ffffff
31	Capitol University	http://dummyimage.com/162x100.png/cc0000/ffffff
32	Point Loma Nazarene College	http://dummyimage.com/169x100.png/5fa2dd/ffffff
33	Universidad de Gerona	http://dummyimage.com/148x100.png/5fa2dd/ffffff
34	Université d'Etat d'Haiti	http://dummyimage.com/122x100.png/5fa2dd/ffffff
35	National Theatre Conservatory	http://dummyimage.com/102x100.png/dddddd/000000
36	Barry University	http://dummyimage.com/120x100.png/cc0000/ffffff
37	Dickinson State University	http://dummyimage.com/113x100.png/ff4444/ffffff
38	Chengdu Institute of Sichuan International Studies University	http://dummyimage.com/243x100.png/ff4444/ffffff
39	Asahi University	http://dummyimage.com/101x100.png/ff4444/ffffff
40	Shanghai TieDao University	http://dummyimage.com/179x100.png/dddddd/000000
41	Medical Academy in Wroclaw	http://dummyimage.com/189x100.png/ff4444/ffffff
42	Rhode Island College	http://dummyimage.com/121x100.png/cc0000/ffffff
43	Gordon College	http://dummyimage.com/224x100.png/ff4444/ffffff
44	China Three Gorges University	http://dummyimage.com/230x100.png/5fa2dd/ffffff
45	University of Naples Federico II	http://dummyimage.com/171x100.png/dddddd/000000
46	Arts, Sciences and Technology University	http://dummyimage.com/148x100.png/dddddd/000000
47	Duksung Women's University	http://dummyimage.com/152x100.png/dddddd/000000
48	State University of Tetova	http://dummyimage.com/207x100.png/ff4444/ffffff
49	Notre Dame University	http://dummyimage.com/160x100.png/5fa2dd/ffffff
50	Nangarhar University	http://dummyimage.com/184x100.png/cc0000/ffffff
51	University of Veterinary Medicine in Kosice	http://dummyimage.com/100x100.png/5fa2dd/ffffff
\.


--
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testimonials (id, "writerId", "recipientId", message, "publicationDate") FROM stdin;
1	272	327	Adorei trabalhar com o Justis	2006-07-28
2	272	327	Adorei trabalhar com o Justis	2006-07-28
3	7	464	Adorei trabalhar com o Antonio	2018-12-20
4	110	395	Adorei trabalhar com o Antone	2000-09-07
5	263	382	Adorei trabalhar com o Chaddy	1995-06-07
6	377	254	Adorei trabalhar com o Gregory	2003-03-06
7	375	166	Adorei trabalhar com o Dana	2012-07-19
8	141	226	Adorei trabalhar com o Vivyan	2002-05-17
9	297	457	Adorei trabalhar com o Gayle	2000-12-25
10	235	251	Adorei trabalhar com o Matias	2003-05-26
11	151	241	Adorei trabalhar com o Alexandr	2013-12-19
12	400	104	Adorei trabalhar com o Gian	1999-07-14
13	162	171	Adorei trabalhar com o Frieda	1994-11-16
14	241	264	Adorei trabalhar com o Egor	1996-04-04
15	494	135	Adorei trabalhar com o Adan	2008-03-10
16	291	275	Adorei trabalhar com o Robin	1984-08-15
17	24	73	Adorei trabalhar com o Gert	2007-01-18
18	243	156	Adorei trabalhar com o Kennan	1982-04-19
19	124	365	Adorei trabalhar com o Leonard	2001-12-02
20	203	14	Adorei trabalhar com o Glenden	1993-01-21
21	125	25	Adorei trabalhar com o Gianni	1981-06-02
22	108	385	Adorei trabalhar com o Virgil	2018-09-14
23	136	97	Adorei trabalhar com o Sam	2004-08-10
24	500	253	Adorei trabalhar com o Ame	2010-03-05
25	42	487	Adorei trabalhar com o Alexander	1986-11-20
26	56	426	Adorei trabalhar com o Merci	2005-11-29
27	7	273	Adorei trabalhar com o Fenelia	1991-04-02
28	46	83	Adorei trabalhar com o Chloette	1993-08-08
29	388	423	Adorei trabalhar com o Thorvald	2021-01-27
30	495	53	Adorei trabalhar com o Ivar	2003-05-19
31	98	494	Adorei trabalhar com o Virginia	2015-11-09
32	6	164	Adorei trabalhar com o Terri	2003-02-11
33	485	379	Adorei trabalhar com o Hanni	2018-10-17
34	233	109	Adorei trabalhar com o Phillip	2003-11-22
35	201	306	Adorei trabalhar com o Conny	2001-11-27
36	216	92	Adorei trabalhar com o Diego	1985-07-24
37	213	74	Adorei trabalhar com o Nissa	2010-12-15
38	69	133	Adorei trabalhar com o Haily	2008-08-02
39	388	470	Adorei trabalhar com o Garland	2007-03-15
40	164	136	Adorei trabalhar com o Catherin	1991-12-17
41	170	192	Adorei trabalhar com o Reed	2007-02-16
42	86	423	Adorei trabalhar com o Thorvald	1996-09-06
43	312	112	Adorei trabalhar com o Malory	2016-05-19
44	445	272	Adorei trabalhar com o Freddi	1984-05-13
45	299	463	Adorei trabalhar com o Cyndi	2016-02-12
46	4	354	Adorei trabalhar com o Joelly	1990-03-23
47	376	437	Adorei trabalhar com o Stewart	2006-10-14
48	308	262	Adorei trabalhar com o Verna	2013-02-11
49	216	258	Adorei trabalhar com o Kaine	1983-01-22
50	40	478	Adorei trabalhar com o Jo-ann	2003-05-24
51	41	112	Adorei trabalhar com o Malory	2008-10-25
52	327	72	Adorei trabalhar com o Loreen	1982-02-09
53	421	359	Adorei trabalhar com o Filberte	2017-06-06
54	40	120	Adorei trabalhar com o Tammie	1997-06-24
55	157	106	Adorei trabalhar com o Becki	2010-05-21
56	459	29	Adorei trabalhar com o Marsiella	1993-08-23
57	456	186	Adorei trabalhar com o Karlotta	1982-07-11
58	283	299	Adorei trabalhar com o Denny	2001-01-03
59	180	68	Adorei trabalhar com o Phillip	1991-06-26
60	435	452	Adorei trabalhar com o Rufe	1996-08-21
61	254	218	Adorei trabalhar com o Hinze	1993-10-07
62	18	206	Adorei trabalhar com o Falkner	1998-08-13
63	42	4	Adorei trabalhar com o Otho	2003-03-14
64	267	108	Adorei trabalhar com o Rodi	2000-12-03
65	245	285	Adorei trabalhar com o Steffie	2004-05-15
66	425	202	Adorei trabalhar com o Gilbertine	2004-12-05
67	154	495	Adorei trabalhar com o Nevins	1992-11-08
68	345	304	Adorei trabalhar com o Marlon	1990-08-22
69	48	257	Adorei trabalhar com o Lela	1991-12-17
70	87	253	Adorei trabalhar com o Ame	2020-07-02
71	85	211	Adorei trabalhar com o Dell	2018-02-02
72	80	96	Adorei trabalhar com o Northrup	2015-03-11
73	127	186	Adorei trabalhar com o Karlotta	1985-08-18
74	433	19	Adorei trabalhar com o Zechariah	2009-04-15
75	254	353	Adorei trabalhar com o Carmelina	1998-08-22
76	443	104	Adorei trabalhar com o Gian	2019-08-05
77	88	305	Adorei trabalhar com o Arturo	2022-02-23
78	4	76	Adorei trabalhar com o Forrest	1988-11-11
79	155	241	Adorei trabalhar com o Alexandr	1998-03-24
80	46	85	Adorei trabalhar com o Renell	1995-02-15
81	57	106	Adorei trabalhar com o Becki	2002-03-18
82	296	350	Adorei trabalhar com o Jaclyn	1993-12-12
83	497	381	Adorei trabalhar com o Manuel	1989-05-23
84	146	100	Adorei trabalhar com o Ryon	2019-10-22
85	487	482	Adorei trabalhar com o Hayden	1984-08-12
86	221	159	Adorei trabalhar com o Keith	2012-12-05
87	391	371	Adorei trabalhar com o Tally	1985-04-20
88	412	309	Adorei trabalhar com o Odelle	2013-02-12
89	435	472	Adorei trabalhar com o Nicolas	2017-03-23
90	260	496	Adorei trabalhar com o Thalia	2013-07-28
91	217	348	Adorei trabalhar com o Hilary	2014-09-28
92	72	322	Adorei trabalhar com o Wolf	1989-03-03
93	372	239	Adorei trabalhar com o Rickie	2021-10-20
94	487	464	Adorei trabalhar com o Antonio	1980-09-25
95	489	467	Adorei trabalhar com o Amalle	1987-12-16
96	435	154	Adorei trabalhar com o Abby	1997-11-10
97	464	119	Adorei trabalhar com o Malanie	2009-09-05
98	193	251	Adorei trabalhar com o Matias	1994-06-07
99	225	39	Adorei trabalhar com o Hastie	1980-11-16
100	494	89	Adorei trabalhar com o Lolita	1981-04-28
101	331	86	Adorei trabalhar com o Chadwick	2016-07-31
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "birthDate", "imageUrl", "cityId") FROM stdin;
1	Galina	gseson0@google.nl	L5fLjIAte	1964-11-08	http://dummyimage.com/142x100.png/dddddd/000000	3827
2	Siusan	skeilloh1@berkeley.edu	K6RFi7pCkM	1993-01-01	http://dummyimage.com/117x100.png/ff4444/ffffff	1336
3	Kara-lynn	kbohling2@nydailynews.com	ngv4qIjHJh	1993-04-26	http://dummyimage.com/152x100.png/ff4444/ffffff	2033
5	Webb	wdundin4@cbsnews.com	s3C2okBDrpTw	1960-09-13	http://dummyimage.com/134x100.png/cc0000/ffffff	4923
6	Bertha	bsimonel5@discuz.net	x8dFCo8CHQB	1973-03-07	http://dummyimage.com/225x100.png/5fa2dd/ffffff	2890
7	Chicky	cfilde6@examiner.com	R2NC6II0	1997-04-12	http://dummyimage.com/204x100.png/dddddd/000000	3498
8	Lin	leliaz7@theguardian.com	qmtAW1AbBJT	1993-11-24	http://dummyimage.com/155x100.png/ff4444/ffffff	4515
9	Catie	chanwright8@statcounter.com	AiPbTTLw3cF	1973-10-06	http://dummyimage.com/144x100.png/cc0000/ffffff	4142
10	Sophi	sluparti9@spiegel.de	XNb30I4	1983-01-30	http://dummyimage.com/200x100.png/ff4444/ffffff	940
11	Kenneth	keadona@cpanel.net	opdqQ7i	1965-06-02	http://dummyimage.com/218x100.png/5fa2dd/ffffff	1970
12	Wendel	wbossb@mysql.com	5qfaa3B	1980-03-14	http://dummyimage.com/139x100.png/5fa2dd/ffffff	1038
13	Sloane	snuttc@netlog.com	xRgHfrSTSZcl	1980-03-03	http://dummyimage.com/173x100.png/cc0000/ffffff	4985
14	Glenden	gheiningd@berkeley.edu	kv978ewVWL	1978-02-04	http://dummyimage.com/237x100.png/cc0000/ffffff	43
15	Rubi	rpachee@reuters.com	NmyvFRfkSCFR	1975-08-05	http://dummyimage.com/222x100.png/5fa2dd/ffffff	3461
16	Robby	rcantuaf@51.la	te3pcy	1981-04-08	http://dummyimage.com/103x100.png/5fa2dd/ffffff	1944
17	Virginie	vmcnelisg@bbb.org	3fxQCCs1FX	1994-07-26	http://dummyimage.com/129x100.png/cc0000/ffffff	1140
18	Carmelia	cdebillh@bloomberg.com	SMobCdQf36w	1990-07-29	http://dummyimage.com/192x100.png/dddddd/000000	334
19	Zechariah	zpennai@w3.org	AAYLqpfL	1987-04-21	http://dummyimage.com/148x100.png/cc0000/ffffff	2102
20	Eddie	eblockwellj@jigsy.com	Ei3wL2Wul	1991-07-16	http://dummyimage.com/178x100.png/ff4444/ffffff	4822
21	Janna	jpresdeek@sbwire.com	VpWsrbe	2000-10-11	http://dummyimage.com/179x100.png/cc0000/ffffff	4329
22	Willetta	wbourchierl@samsung.com	dhWe7qqRo4	1999-01-12	http://dummyimage.com/210x100.png/dddddd/000000	350
23	Ryon	rmquhargm@scribd.com	5hqHX2f8H2je	1991-07-21	http://dummyimage.com/209x100.png/5fa2dd/ffffff	3683
24	Bev	bhaccletonn@kickstarter.com	aT3NAVNOh65s	1962-09-10	http://dummyimage.com/211x100.png/ff4444/ffffff	572
25	Gianni	gshieldso@cmu.edu	QjIFXM8PZ	1986-06-14	http://dummyimage.com/166x100.png/5fa2dd/ffffff	2033
26	Reinald	rcrootep@xing.com	z8fPAo	1974-01-03	http://dummyimage.com/125x100.png/cc0000/ffffff	152
27	Jacquelyn	jspitaroq@pinterest.com	6hrLzixWO	1978-12-21	http://dummyimage.com/144x100.png/cc0000/ffffff	3782
28	Margarette	mdymoker@surveymonkey.com	EH9EUJnfzQru	1997-02-19	http://dummyimage.com/191x100.png/cc0000/ffffff	289
29	Marsiella	mgladdolphs@salon.com	jly5orUfONC	1989-07-01	http://dummyimage.com/191x100.png/cc0000/ffffff	1053
31	Alwin	aadamczewskiu@who.int	9XMbCii	1985-03-19	http://dummyimage.com/235x100.png/ff4444/ffffff	916
32	Eldredge	emortenv@cargocollective.com	kzP2I4wVAFa	1980-10-21	http://dummyimage.com/102x100.png/dddddd/000000	2977
33	Shirley	sfaltinw@ask.com	xKVMtAQBOk3X	1967-09-08	http://dummyimage.com/124x100.png/dddddd/000000	5059
34	Elva	efilipputtix@mapquest.com	tZFFh6esxa	1996-04-14	http://dummyimage.com/194x100.png/dddddd/000000	2412
35	Ricki	rwhiteny@patch.com	AYfQ1c0	1981-09-26	http://dummyimage.com/170x100.png/ff4444/ffffff	4668
36	Glen	gmossomz@npr.org	qEBbswvh	1977-12-21	http://dummyimage.com/178x100.png/dddddd/000000	866
37	Ransom	rstrathern10@1und1.de	ZrhmHGQ	1967-10-21	http://dummyimage.com/167x100.png/cc0000/ffffff	3294
38	Olav	omenicomb11@xing.com	Xk137qaTDG7W	1990-03-07	http://dummyimage.com/128x100.png/ff4444/ffffff	5071
39	Hastie	hclooney12@histats.com	TAejw3ZQx4i	1969-01-27	http://dummyimage.com/145x100.png/5fa2dd/ffffff	1629
40	Magnum	mpieroni13@jalbum.net	IFSr3POMby3	1991-10-14	http://dummyimage.com/226x100.png/ff4444/ffffff	1147
41	Bruce	blyffe14@so-net.ne.jp	GgjYYvgeMMGX	1985-06-14	http://dummyimage.com/158x100.png/cc0000/ffffff	3988
42	Sidnee	sabbess15@51.la	nmZx03Uid	1970-02-26	http://dummyimage.com/220x100.png/5fa2dd/ffffff	2324
43	Michaelina	msquier16@facebook.com	VUPHZ3	1988-08-07	http://dummyimage.com/146x100.png/cc0000/ffffff	800
44	Ellynn	ewincott17@apache.org	prarwPvD2r	2000-04-08	http://dummyimage.com/180x100.png/5fa2dd/ffffff	2683
45	Coleman	ciacavone18@kickstarter.com	Alk3NHDEp	1981-06-09	http://dummyimage.com/112x100.png/ff4444/ffffff	1190
46	Axel	acregg19@zdnet.com	fFGUdYc6jU	1971-10-31	http://dummyimage.com/156x100.png/ff4444/ffffff	3055
47	Concettina	cdews1a@jiathis.com	VUlXRljhFvCE	1981-08-25	http://dummyimage.com/185x100.png/5fa2dd/ffffff	4094
48	Catherine	cattree1b@jalbum.net	hbs07CU2tf	1982-04-10	http://dummyimage.com/117x100.png/5fa2dd/ffffff	1159
49	Phaidra	pglencross1c@php.net	wV9NW6nc7DU0	1988-01-21	http://dummyimage.com/102x100.png/ff4444/ffffff	3707
50	Pam	paspinal1d@shutterfly.com	DAjewK2T0	1979-09-22	http://dummyimage.com/247x100.png/ff4444/ffffff	340
51	Dori	dalday1e@state.gov	VMiFUz0akaDA	1997-03-16	http://dummyimage.com/169x100.png/5fa2dd/ffffff	5524
52	Heywood	hmelarkey1f@home.pl	oxqSdBULpBwd	1993-01-26	http://dummyimage.com/158x100.png/cc0000/ffffff	5102
53	Ivar	itackley1g@netvibes.com	6RhJDhkAf2	1962-08-31	http://dummyimage.com/130x100.png/ff4444/ffffff	2840
54	Ludvig	lnealey1h@techcrunch.com	qXy4GHPc9H	1994-10-11	http://dummyimage.com/226x100.png/dddddd/000000	4766
55	Burnard	bleupold1i@discovery.com	WyrNhzrJiTe	1993-06-23	http://dummyimage.com/132x100.png/ff4444/ffffff	1636
56	Evelina	etidder1j@tmall.com	mGFZ82jgxip	1966-11-22	http://dummyimage.com/180x100.png/ff4444/ffffff	3410
57	Merwyn	mkindle1k@washingtonpost.com	MQTB6sSper	1992-11-08	http://dummyimage.com/231x100.png/dddddd/000000	3429
58	Bordy	bomar1l@google.ca	RWGg0V4GN	1996-08-15	http://dummyimage.com/195x100.png/5fa2dd/ffffff	4278
59	Jennica	jmetcalf1m@so-net.ne.jp	PmYz5t4BVu	1974-12-19	http://dummyimage.com/175x100.png/ff4444/ffffff	5026
61	Ingmar	iwaghorne1o@clickbank.net	lOxrrQ	1993-04-24	http://dummyimage.com/155x100.png/cc0000/ffffff	4211
62	Leroi	lbenes1p@china.com.cn	wvkBwqo7dne	1968-12-27	http://dummyimage.com/169x100.png/cc0000/ffffff	4625
63	Flin	fhedau1q@engadget.com	jorRL8lO55	1998-01-01	http://dummyimage.com/158x100.png/ff4444/ffffff	2699
64	Glyn	gsmail1r@clickbank.net	nNZj8RwKMZSM	1966-04-11	http://dummyimage.com/150x100.png/dddddd/000000	3618
65	Beryl	bnoraway1s@dedecms.com	7x1qhFvsB8p	1967-09-03	http://dummyimage.com/222x100.png/ff4444/ffffff	5555
66	Aubree	adurdle1t@linkedin.com	dQmf8il4R	1971-01-09	http://dummyimage.com/190x100.png/cc0000/ffffff	1071
67	Hilliard	hwastell1u@dyndns.org	mi8yC8oHY6	1979-11-20	http://dummyimage.com/179x100.png/cc0000/ffffff	3954
68	Phillip	pcapun1v@cnet.com	2VgFnKeaBN3	1982-06-03	http://dummyimage.com/194x100.png/cc0000/ffffff	442
69	Nyssa	nmaxfield1w@freewebs.com	HFxElX	1969-01-13	http://dummyimage.com/144x100.png/dddddd/000000	2643
70	Daffie	dsee1x@amazon.de	1MeCzDLGET	2000-08-25	http://dummyimage.com/165x100.png/cc0000/ffffff	1456
71	Napoleon	ntummons1y@51.la	dabWTKQVWonw	1975-04-21	http://dummyimage.com/112x100.png/dddddd/000000	2941
72	Loreen	lgange1z@ovh.net	PIxsrGovLCe	1963-06-17	http://dummyimage.com/120x100.png/ff4444/ffffff	1379
73	Gert	gtulip20@senate.gov	YtpwZUDe	1963-03-03	http://dummyimage.com/134x100.png/ff4444/ffffff	2377
74	Nissa	nseabourne21@gravatar.com	v0NxDRga4T	1976-01-20	http://dummyimage.com/226x100.png/ff4444/ffffff	3755
75	Jillayne	jkissick22@sciencedirect.com	v3q0VUWtuNBQ	1984-12-12	http://dummyimage.com/140x100.png/5fa2dd/ffffff	4875
76	Forrest	fscay23@google.com	7MyawWR	1962-04-29	http://dummyimage.com/175x100.png/ff4444/ffffff	1029
77	Anet	apidon24@usda.gov	71QDJT1o7K	1974-10-19	http://dummyimage.com/246x100.png/dddddd/000000	641
78	Aube	awhewell25@ebay.com	EYaaqqsq3	1984-09-14	http://dummyimage.com/226x100.png/5fa2dd/ffffff	1058
79	Pepillo	pandren26@google.com.au	aUTE7M398	1998-02-18	http://dummyimage.com/182x100.png/5fa2dd/ffffff	4002
80	Oralie	ocasserly27@va.gov	fkL6soV9rh	1975-06-20	http://dummyimage.com/200x100.png/5fa2dd/ffffff	1880
81	Britni	bmaden28@home.pl	gOdGTp	1990-07-19	http://dummyimage.com/187x100.png/dddddd/000000	145
82	Marten	mlevitt29@kickstarter.com	YU21XkuBo	1996-10-15	http://dummyimage.com/195x100.png/5fa2dd/ffffff	2134
83	Chloette	cpanter2a@mysql.com	1IzITwlLT	1988-11-25	http://dummyimage.com/194x100.png/dddddd/000000	1735
84	Jelene	jreville2b@nhs.uk	jYjdukvt	1968-03-24	http://dummyimage.com/198x100.png/cc0000/ffffff	3445
85	Renell	rnellies2c@nbcnews.com	UXNu9ZOYYy	1982-01-05	http://dummyimage.com/170x100.png/cc0000/ffffff	1207
86	Chadwick	ccullip2d@amazon.de	5oHQ2aj	1995-02-21	http://dummyimage.com/103x100.png/dddddd/000000	2584
87	Julissa	jdekeyser2e@addtoany.com	fGk4If0E	1987-08-22	http://dummyimage.com/134x100.png/cc0000/ffffff	3001
88	Gail	grawlingson2f@goo.ne.jp	IcUSthGi	1979-02-15	http://dummyimage.com/169x100.png/5fa2dd/ffffff	4287
89	Lolita	lruberti2g@imageshack.us	vqqlufVQhh7	1983-09-26	http://dummyimage.com/211x100.png/5fa2dd/ffffff	2753
90	Harcourt	hwebley2h@prlog.org	nmat0NXUe	1971-11-04	http://dummyimage.com/151x100.png/ff4444/ffffff	2087
91	Nickolas	nleving2i@google.com.au	H2iMwKyd	1990-10-03	http://dummyimage.com/162x100.png/ff4444/ffffff	2290
92	Diego	dbrabbins2j@imageshack.us	8eYmXpxbI	1968-11-12	http://dummyimage.com/165x100.png/dddddd/000000	5054
93	Tammy	tfilipponi2k@weibo.com	3lPF6J	1987-08-28	http://dummyimage.com/218x100.png/5fa2dd/ffffff	337
94	Melodee	mheinert2l@wikipedia.org	2mKArZ	2001-07-13	http://dummyimage.com/112x100.png/cc0000/ffffff	4723
95	Demott	dizkoveski2m@bloomberg.com	sUAwMenl	1996-01-17	http://dummyimage.com/166x100.png/ff4444/ffffff	5204
96	Northrup	nterzza2n@google.co.jp	FUTqyTg29m	1994-10-13	http://dummyimage.com/116x100.png/dddddd/000000	4243
97	Sam	sbrunskill2o@pinterest.com	MLjyFoRo9KlA	1965-12-23	http://dummyimage.com/197x100.png/cc0000/ffffff	3479
98	Boycey	bbarreau2p@hud.gov	10RKJbQ32m	1989-10-20	http://dummyimage.com/143x100.png/cc0000/ffffff	1890
99	Carmine	codriscoll2q@mapy.cz	pgH3dW	1980-03-07	http://dummyimage.com/116x100.png/ff4444/ffffff	718
101	Rafi	rburdekin2s@delicious.com	q0Jdpj31q	1987-03-10	http://dummyimage.com/109x100.png/cc0000/ffffff	4437
102	Duky	dwarrack2t@nydailynews.com	xS0VdjQ	1975-08-06	http://dummyimage.com/200x100.png/cc0000/ffffff	3054
103	Bartholomew	bwhorall2u@home.pl	7vkeOwV1fy	1967-07-18	http://dummyimage.com/194x100.png/cc0000/ffffff	3893
104	Gian	ghamblen2v@drupal.org	CNeuHE5Aoi5	1998-09-02	http://dummyimage.com/202x100.png/cc0000/ffffff	3157
105	Nanice	nenefer2w@loc.gov	HxI9hB	1964-07-16	http://dummyimage.com/132x100.png/dddddd/000000	3495
106	Becki	bharmeston2x@rakuten.co.jp	5YuKkh1WUJN	1967-06-09	http://dummyimage.com/112x100.png/5fa2dd/ffffff	2864
107	Keir	khaskell2y@i2i.jp	iEHa7mT	1986-06-03	http://dummyimage.com/203x100.png/5fa2dd/ffffff	4118
108	Rodi	rbrooker2z@barnesandnoble.com	6G3zVZpSm5sk	1964-08-18	http://dummyimage.com/156x100.png/5fa2dd/ffffff	5193
109	Phillip	ppeever30@nytimes.com	J0wuZdZCqK	1960-06-16	http://dummyimage.com/132x100.png/dddddd/000000	4982
110	Devlen	dtrundler31@opera.com	VdfyT7NiIXj	1999-09-06	http://dummyimage.com/165x100.png/dddddd/000000	3925
111	Kevon	kcolecrough32@stanford.edu	0unnlxmA	1980-01-23	http://dummyimage.com/229x100.png/ff4444/ffffff	623
112	Malory	mshorthouse33@java.com	tece241XQj	1991-04-04	http://dummyimage.com/104x100.png/dddddd/000000	1247
113	Tabatha	tfroggatt34@last.fm	7mGQW5J6h3	1981-11-15	http://dummyimage.com/246x100.png/ff4444/ffffff	3626
114	Sharity	sisham35@exblog.jp	L8fIA9mA1h	1982-08-08	http://dummyimage.com/114x100.png/5fa2dd/ffffff	2623
115	Terry	tvreiberg36@so-net.ne.jp	Ujl7QP8YisQ	1991-10-24	http://dummyimage.com/233x100.png/5fa2dd/ffffff	312
116	Eve	emendoza37@google.cn	8ZSkBHS	1971-04-06	http://dummyimage.com/151x100.png/dddddd/000000	859
117	Debera	dbostick38@a8.net	hvLomO	1992-07-30	http://dummyimage.com/165x100.png/cc0000/ffffff	5296
118	Kingsly	kpearson39@intel.com	Dy5aHR2	1966-09-12	http://dummyimage.com/101x100.png/dddddd/000000	3475
119	Malanie	mwrathmell3a@yolasite.com	Qz4YDlEMXF	1969-10-17	http://dummyimage.com/156x100.png/5fa2dd/ffffff	65
120	Tammie	tcurtois3b@nifty.com	7XCxVTn8QXJ	1967-04-06	http://dummyimage.com/165x100.png/dddddd/000000	1613
121	Gilda	ghicken3c@abc.net.au	1uLMbpnt7	1985-03-22	http://dummyimage.com/182x100.png/dddddd/000000	5531
122	Kirk	khenrique3d@foxnews.com	MfUuDDoWPs	1993-08-09	http://dummyimage.com/210x100.png/5fa2dd/ffffff	30
123	Ediva	elundon3e@liveinternet.ru	jHNqlc8gU	1965-05-31	http://dummyimage.com/170x100.png/ff4444/ffffff	100
124	Elicia	edencs3f@blogspot.com	8sJPk0xXGKJ	1963-11-25	http://dummyimage.com/148x100.png/cc0000/ffffff	273
125	Gregoor	gduke3g@list-manage.com	y8TkbGhooU4N	1962-04-02	http://dummyimage.com/140x100.png/5fa2dd/ffffff	3421
126	Teresita	tdarwood3h@accuweather.com	PlnJSHGWgqG	1962-06-13	http://dummyimage.com/127x100.png/ff4444/ffffff	2777
128	Whitney	wkrzyzaniak3j@ustream.tv	EEqZBUmrs	1968-05-21	http://dummyimage.com/196x100.png/ff4444/ffffff	1608
129	Ronni	rcharlon3k@netlog.com	e4ilDO5EDmY	1980-01-28	http://dummyimage.com/136x100.png/dddddd/000000	1651
130	Joice	jmccarter3l@cyberchimps.com	8FnbpaZQIofI	1986-11-02	http://dummyimage.com/125x100.png/cc0000/ffffff	5211
131	Belvia	bvanin3m@wired.com	R2PHWNAh5C	1976-07-04	http://dummyimage.com/235x100.png/dddddd/000000	3532
132	Dulcia	djasper3n@utexas.edu	G1MstR	1975-04-22	http://dummyimage.com/198x100.png/5fa2dd/ffffff	2835
133	Haily	hdeye3o@reverbnation.com	2m2ElRw0	1964-05-08	http://dummyimage.com/237x100.png/cc0000/ffffff	939
134	Erhard	edecruse3p@irs.gov	C4qk5V6ts	1992-09-17	http://dummyimage.com/238x100.png/cc0000/ffffff	2658
135	Adan	abehne3q@google.de	N32a1Wlv	1976-09-23	http://dummyimage.com/238x100.png/ff4444/ffffff	5492
136	Catherin	cfallanche3r@cbslocal.com	Z3dy4AytHLl	1998-03-12	http://dummyimage.com/129x100.png/ff4444/ffffff	4217
137	Andonis	akaines3s@mediafire.com	8YTqiuH6Rq8	1999-01-28	http://dummyimage.com/206x100.png/5fa2dd/ffffff	5110
138	Kellsie	kscroggins3t@prweb.com	kbvPftye	1960-05-06	http://dummyimage.com/121x100.png/cc0000/ffffff	2113
139	Lauren	lhorstead3u@jugem.jp	uymun5	1965-04-28	http://dummyimage.com/164x100.png/5fa2dd/ffffff	5206
140	Katya	kzimmerman3v@google.fr	jtqaER	1988-01-03	http://dummyimage.com/102x100.png/ff4444/ffffff	307
141	Noelyn	ngaishson3w@umn.edu	h2jRRCRNMhfC	1983-02-10	http://dummyimage.com/183x100.png/dddddd/000000	3545
142	Drew	dkeough3x@joomla.org	PadmsU	1978-05-26	http://dummyimage.com/205x100.png/cc0000/ffffff	977
143	Alisha	alante3y@bizjournals.com	obuwaU	1999-09-08	http://dummyimage.com/119x100.png/5fa2dd/ffffff	439
144	Aubree	acelloni3z@1688.com	nwR51y	1998-03-18	http://dummyimage.com/190x100.png/cc0000/ffffff	97
145	Bendite	bbaillie40@jiathis.com	qqzAhBDa	1999-12-19	http://dummyimage.com/156x100.png/cc0000/ffffff	1592
146	Sianna	sswyer41@newyorker.com	xACUnJtuOj	1972-09-22	http://dummyimage.com/126x100.png/cc0000/ffffff	1773
147	Borden	bberrow42@infoseek.co.jp	8fM9X6Fi	2001-02-08	http://dummyimage.com/100x100.png/cc0000/ffffff	1841
148	Brian	baizikovitz43@va.gov	gq8x1Y	1995-06-06	http://dummyimage.com/145x100.png/cc0000/ffffff	5339
149	Deeyn	dmacvaugh44@macromedia.com	zJU7eSq	1987-05-07	http://dummyimage.com/130x100.png/5fa2dd/ffffff	39
150	Clive	cberkelay45@moonfruit.com	MsyFDft	2001-05-13	http://dummyimage.com/168x100.png/dddddd/000000	2615
151	Ailina	alinkie46@about.me	M8WZSA	1977-04-08	http://dummyimage.com/233x100.png/5fa2dd/ffffff	3714
152	Adel	alivermore47@home.pl	m0VHKF	1986-10-09	http://dummyimage.com/120x100.png/dddddd/000000	4923
153	Shell	sescalante48@sbwire.com	hrEtd6s	1970-12-23	http://dummyimage.com/163x100.png/cc0000/ffffff	324
154	Abby	aponceford49@dropbox.com	CN8PWa	1971-10-09	http://dummyimage.com/147x100.png/ff4444/ffffff	2767
155	Sigmund	saccombe4a@purevolume.com	iXsHBI	1975-11-08	http://dummyimage.com/108x100.png/cc0000/ffffff	3422
156	Kennan	kbown4b@spiegel.de	qUB9mFGcl	1988-12-24	http://dummyimage.com/201x100.png/dddddd/000000	3314
157	Caresa	creuben4c@berkeley.edu	Fx9SxujBZPdk	1989-05-26	http://dummyimage.com/200x100.png/cc0000/ffffff	4451
158	Trixy	tdodridge4d@1und1.de	75yWpxs	1995-05-05	http://dummyimage.com/107x100.png/dddddd/000000	4136
159	Keith	ktuckerman4e@hugedomains.com	tZZnOXDo	1973-06-08	http://dummyimage.com/109x100.png/ff4444/ffffff	1613
160	Della	dselway4f@deliciousdays.com	ZFSQsWzRGA1	1961-08-18	http://dummyimage.com/222x100.png/cc0000/ffffff	4337
161	Vania	vbenza4g@seesaa.net	aqFZx3Wzy	1982-07-21	http://dummyimage.com/108x100.png/5fa2dd/ffffff	693
162	Nil	nespinho4h@ezinearticles.com	Ez3tlBvT42us	1988-04-21	http://dummyimage.com/126x100.png/ff4444/ffffff	5124
163	Ida	iwodeland4i@xrea.com	biSnSrAr	2000-09-23	http://dummyimage.com/177x100.png/dddddd/000000	979
164	Terri	tjaniak4j@a8.net	CgSleHgUz3	1966-01-30	http://dummyimage.com/168x100.png/dddddd/000000	4521
165	Janaya	jcann4k@ucsd.edu	f8A8PZuTHoml	1999-11-10	http://dummyimage.com/170x100.png/dddddd/000000	4360
166	Dana	dmattiacci4l@github.io	AhxZK7zqLc	1978-09-14	http://dummyimage.com/139x100.png/ff4444/ffffff	97
167	Jaclyn	jerwin4m@so-net.ne.jp	L0WXVJ8pYwQY	1984-06-05	http://dummyimage.com/204x100.png/ff4444/ffffff	3574
168	Arlan	awoolward4n@timesonline.co.uk	E981LIe7k	1980-03-08	http://dummyimage.com/160x100.png/ff4444/ffffff	3459
169	Sally	squaltro4o@umn.edu	cY3VeAJPVz	1971-01-15	http://dummyimage.com/171x100.png/ff4444/ffffff	2784
170	Chadd	cyellowley4p@edublogs.org	TfKkgdTbrN	1983-10-17	http://dummyimage.com/191x100.png/5fa2dd/ffffff	5562
171	Frieda	ffleischmann4q@phoca.cz	rtwFqW0M	1978-01-28	http://dummyimage.com/222x100.png/cc0000/ffffff	3122
172	Adelaide	abyrne4r@unicef.org	tSrdlPoYLhMj	1993-10-05	http://dummyimage.com/237x100.png/dddddd/000000	3539
173	Brander	bhindshaw4s@weather.com	QcTAjuero1ix	2000-10-07	http://dummyimage.com/215x100.png/ff4444/ffffff	3603
174	Jere	jschuricke4t@soup.io	hiOcnp	1979-04-07	http://dummyimage.com/183x100.png/cc0000/ffffff	2290
175	Elberta	ewilloway4u@addthis.com	cAefRFTcdoZ	1972-11-07	http://dummyimage.com/246x100.png/cc0000/ffffff	994
176	Deloris	dcorssen4v@timesonline.co.uk	pxeg0UVI	1997-11-11	http://dummyimage.com/184x100.png/5fa2dd/ffffff	1437
177	Amalee	ablaase4w@npr.org	UXKbSK0b7cNK	1993-04-04	http://dummyimage.com/230x100.png/ff4444/ffffff	2553
178	Raine	rgreedyer4x@digg.com	afnC8xdXIH	1970-12-22	http://dummyimage.com/132x100.png/cc0000/ffffff	3594
179	Dena	dharris4y@cbsnews.com	tnAI4dtlF	1986-01-28	http://dummyimage.com/165x100.png/cc0000/ffffff	582
180	Freddy	fcowling4z@netvibes.com	fM98HgG4	1966-08-30	http://dummyimage.com/242x100.png/dddddd/000000	2117
181	Jarrid	jandric50@craigslist.org	6joBox8J	1997-03-13	http://dummyimage.com/243x100.png/dddddd/000000	1166
182	Maurizio	mbanbrick51@opera.com	5YVWrKv	1971-09-26	http://dummyimage.com/247x100.png/dddddd/000000	1293
183	Trescha	tbeetham52@domainmarket.com	MwRHvTbwI	2001-03-31	http://dummyimage.com/152x100.png/5fa2dd/ffffff	2431
184	Sophronia	sdorset53@scientificamerican.com	sLYVcCYlkOz	1975-09-29	http://dummyimage.com/119x100.png/5fa2dd/ffffff	5464
185	Myriam	mtume54@multiply.com	7lrmLTB	1982-02-25	http://dummyimage.com/245x100.png/ff4444/ffffff	5375
186	Karlotta	kdarrington55@sogou.com	BiiYBP2	1999-09-25	http://dummyimage.com/160x100.png/5fa2dd/ffffff	2275
187	Daisy	dlewry56@nifty.com	nnQDonjKWa	1994-12-24	http://dummyimage.com/200x100.png/ff4444/ffffff	5001
188	Olly	osibray57@walmart.com	idnEDmuxX	1994-06-01	http://dummyimage.com/191x100.png/dddddd/000000	5525
189	Alberik	aridings58@blogs.com	VAwF44	1989-02-11	http://dummyimage.com/104x100.png/ff4444/ffffff	4424
190	Blinni	bcanero59@chron.com	rlT7J8s	1977-06-11	http://dummyimage.com/141x100.png/ff4444/ffffff	5435
191	Tilda	tgaiford5a@mtv.com	KwpPASNAu	1994-06-24	http://dummyimage.com/247x100.png/5fa2dd/ffffff	4149
192	Reed	rofield5b@alexa.com	N0ZDQ2m	2000-03-17	http://dummyimage.com/107x100.png/ff4444/ffffff	2950
193	Spense	swyllie5c@cocolog-nifty.com	rR6ZSIId	1999-07-28	http://dummyimage.com/177x100.png/5fa2dd/ffffff	1526
194	Barbara-anne	btallach5d@ocn.ne.jp	wChdEX	1970-09-16	http://dummyimage.com/184x100.png/ff4444/ffffff	3690
195	Cacilia	ceastop5e@auda.org.au	2istSs	1969-01-19	http://dummyimage.com/197x100.png/5fa2dd/ffffff	941
196	Sue	ssinncock5f@wikimedia.org	OmC0E1r	1985-01-29	http://dummyimage.com/155x100.png/cc0000/ffffff	1084
197	Jed	jpage5g@webeden.co.uk	XfxLm17	1985-12-19	http://dummyimage.com/237x100.png/dddddd/000000	4444
198	Hodge	hcranmer5h@illinois.edu	0YxbqsIrm	1993-02-11	http://dummyimage.com/203x100.png/5fa2dd/ffffff	2788
199	Wilhelm	wlevings5i@amazon.co.uk	1m9sTe	1969-11-28	http://dummyimage.com/250x100.png/ff4444/ffffff	5403
200	Joan	jcalliss5j@g.co	l7jm8B	1979-10-09	http://dummyimage.com/144x100.png/ff4444/ffffff	1783
201	Jeanelle	jdobbison5k@addthis.com	olk2tQV6p	1996-07-10	http://dummyimage.com/220x100.png/5fa2dd/ffffff	4908
202	Gilbertine	gshevill5l@vinaora.com	2QJIOp	1976-01-31	http://dummyimage.com/166x100.png/ff4444/ffffff	5281
203	Ambur	aswinley5m@devhub.com	NtUnwbTSR	1985-12-30	http://dummyimage.com/160x100.png/dddddd/000000	4548
204	Dorie	dadlington5n@uol.com.br	JlZ5tUXuV	1993-09-22	http://dummyimage.com/100x100.png/ff4444/ffffff	2442
205	Jayme	jmathivat5o@cornell.edu	z7kx94p	1964-01-08	http://dummyimage.com/182x100.png/ff4444/ffffff	772
206	Falkner	fbidder5p@myspace.com	rJWOdGwFRo4	1988-11-19	http://dummyimage.com/191x100.png/5fa2dd/ffffff	906
207	Horten	hmcallister5q@a8.net	B4D1u9	1968-07-27	http://dummyimage.com/126x100.png/cc0000/ffffff	3461
208	Leena	lwhittingham5r@4shared.com	Z8SWtrk5Sve	1978-07-20	http://dummyimage.com/247x100.png/5fa2dd/ffffff	2062
209	Mal	mhartness5s@moonfruit.com	umpjejd	1960-03-18	http://dummyimage.com/179x100.png/5fa2dd/ffffff	2416
210	Warden	wwatmough5t@zdnet.com	d0ABkc	1981-07-31	http://dummyimage.com/100x100.png/cc0000/ffffff	5079
211	Dell	dupwood5u@vinaora.com	mfnhyYB3t7G	1995-08-29	http://dummyimage.com/125x100.png/cc0000/ffffff	2520
212	Ethel	emeadowcroft5v@mysql.com	OYTZmfDM8m	1993-04-27	http://dummyimage.com/132x100.png/ff4444/ffffff	845
213	Kath	kplinck5w@chronoengine.com	6GnMfRc93R	1980-09-25	http://dummyimage.com/136x100.png/cc0000/ffffff	4957
214	Dorelle	dwyllcock5x@cdbaby.com	Y71R6VXKR	1994-04-02	http://dummyimage.com/126x100.png/5fa2dd/ffffff	2318
215	Adrian	afewster5y@wisc.edu	UjdIIqma2K	1991-12-20	http://dummyimage.com/215x100.png/dddddd/000000	163
216	Ileane	imorratt5z@parallels.com	tyvptR	1982-03-08	http://dummyimage.com/178x100.png/dddddd/000000	9
217	Jack	jcodlin60@list-manage.com	V8PSBWC3o	1982-02-27	http://dummyimage.com/249x100.png/5fa2dd/ffffff	3217
218	Hinze	hrenn61@sourceforge.net	oBFXgCD5avL	1996-06-16	http://dummyimage.com/124x100.png/cc0000/ffffff	2071
219	Cassondra	cgiacomucci62@cocolog-nifty.com	c2gkzWuQo7A	1980-11-15	http://dummyimage.com/196x100.png/5fa2dd/ffffff	4846
220	Shirlee	smcfaul63@wired.com	81ynrbuNNEjk	1963-01-29	http://dummyimage.com/230x100.png/dddddd/000000	4640
221	Philippe	pyeates64@imdb.com	azySp08FbC	1987-02-12	http://dummyimage.com/172x100.png/cc0000/ffffff	2785
222	Julianna	jwescott65@bravesites.com	gVjKIuCCRp	1997-12-08	http://dummyimage.com/206x100.png/dddddd/000000	5411
223	Shara	sscantleberry66@bandcamp.com	UFzOjpsxRg	1969-05-09	http://dummyimage.com/232x100.png/5fa2dd/ffffff	3243
224	Deane	dbonelle67@wikia.com	L4LovmT09	1993-09-06	http://dummyimage.com/246x100.png/ff4444/ffffff	3701
225	Lexis	lscopham68@joomla.org	C42ZJJ9	1974-12-28	http://dummyimage.com/150x100.png/5fa2dd/ffffff	510
226	Vivyan	vdepietri69@yahoo.co.jp	8ApZ7OZoDcD	1989-10-27	http://dummyimage.com/198x100.png/cc0000/ffffff	3411
227	Ozzie	ogregoli6a@ucoz.ru	1e7qTV7IMNcZ	1987-04-25	http://dummyimage.com/228x100.png/ff4444/ffffff	3368
228	Lottie	lloraine6b@topsy.com	iJef4vdDE	1974-10-29	http://dummyimage.com/161x100.png/ff4444/ffffff	289
229	Phedra	pswyn6c@yale.edu	jr86KQDG	1961-01-21	http://dummyimage.com/184x100.png/5fa2dd/ffffff	950
230	Tessa	tilsley6d@dagondesign.com	jZBWYmK09d35	1995-12-07	http://dummyimage.com/212x100.png/cc0000/ffffff	43
231	Corby	cdietmar6e@desdev.cn	PO3GKb	1996-09-24	http://dummyimage.com/168x100.png/dddddd/000000	2867
232	Dicky	dallaker6f@diigo.com	p1GzT7Sr	1980-04-14	http://dummyimage.com/188x100.png/cc0000/ffffff	369
233	Marga	mhayhow6g@dyndns.org	gZtNU7BXur	1987-05-20	http://dummyimage.com/177x100.png/dddddd/000000	3977
234	Randall	rdaw6h@eventbrite.com	NlAW3q1cQI	1960-12-15	http://dummyimage.com/242x100.png/ff4444/ffffff	5367
235	Earvin	eorgan6i@yellowpages.com	vyGoFirffC	1989-09-14	http://dummyimage.com/106x100.png/cc0000/ffffff	2355
236	Kayla	khubbart6j@soundcloud.com	6sY2EAiFbX	1973-09-02	http://dummyimage.com/219x100.png/5fa2dd/ffffff	475
237	Marilee	mlagne6k@amazonaws.com	Jl5htFx	1988-07-11	http://dummyimage.com/203x100.png/ff4444/ffffff	1887
238	Moreen	mclawsley6l@diigo.com	foSB053Wj	1976-08-23	http://dummyimage.com/228x100.png/5fa2dd/ffffff	4802
239	Rickie	rkerne6m@biblegateway.com	IEf6BG	2001-10-03	http://dummyimage.com/109x100.png/dddddd/000000	5421
240	Mandi	mrossin6n@shinystat.com	wRNxSqDg1qm	1975-11-01	http://dummyimage.com/112x100.png/ff4444/ffffff	4025
241	Alexandr	avaud6o@chronoengine.com	ZT949mhL	1968-03-12	http://dummyimage.com/153x100.png/ff4444/ffffff	3533
242	Odie	oprowse6p@google.ca	pPz6sZGyy	1971-07-30	http://dummyimage.com/150x100.png/cc0000/ffffff	278
243	Marvin	mogelbe6q@amazon.co.jp	L3QWjgigLBNB	1969-08-28	http://dummyimage.com/110x100.png/cc0000/ffffff	2892
244	Carlen	cthulborn6r@slideshare.net	DF7hkQ	1979-01-31	http://dummyimage.com/115x100.png/ff4444/ffffff	3145
245	Baird	bbroxholme6s@ucoz.com	v8RWCMl	1983-07-07	http://dummyimage.com/228x100.png/cc0000/ffffff	4636
246	Riannon	rbradbeer6t@instagram.com	KyHXT1	1990-06-03	http://dummyimage.com/245x100.png/dddddd/000000	1335
247	Zea	zleppingwell6u@cloudflare.com	YJCGPI26ATB	1963-05-16	http://dummyimage.com/175x100.png/ff4444/ffffff	2113
248	Armand	amundell6v@networksolutions.com	jViRmK	1972-09-18	http://dummyimage.com/197x100.png/dddddd/000000	3104
249	Margarete	mballinger6w@senate.gov	VlOzXiMM	2001-06-02	http://dummyimage.com/158x100.png/cc0000/ffffff	865
250	Rebe	resposito6x@upenn.edu	e9HD3bDO0fKH	1986-11-04	http://dummyimage.com/236x100.png/cc0000/ffffff	4722
251	Matias	mfeehely6y@msn.com	aApeye	1993-07-25	http://dummyimage.com/157x100.png/dddddd/000000	4460
252	Zelma	zhalbard6z@storify.com	e4Sv9H2hs	1961-05-21	http://dummyimage.com/193x100.png/dddddd/000000	1917
253	Ame	abarrack70@goo.gl	SB25xdmWQAg	1971-08-13	http://dummyimage.com/179x100.png/cc0000/ffffff	1597
254	Gregory	granner71@digg.com	dGgYPrL	1973-05-29	http://dummyimage.com/158x100.png/dddddd/000000	3770
255	Kiah	kmccoy72@answers.com	XxjMAVQqJJOP	1965-04-17	http://dummyimage.com/118x100.png/ff4444/ffffff	4803
256	Anni	agerriessen73@epa.gov	0av9wfs	1986-03-16	http://dummyimage.com/144x100.png/ff4444/ffffff	4733
257	Lela	lmeaking74@patch.com	5obX6kgZduw	1994-03-18	http://dummyimage.com/227x100.png/dddddd/000000	2854
258	Kaine	ktreweek75@naver.com	5SNjYi9hQv	1991-10-21	http://dummyimage.com/193x100.png/cc0000/ffffff	559
259	Alfie	abassingden76@ft.com	Ax14CH	1994-12-29	http://dummyimage.com/172x100.png/ff4444/ffffff	2794
260	Sabrina	sszapiro77@state.gov	8lU094S	1963-12-10	http://dummyimage.com/186x100.png/dddddd/000000	4045
261	Henrie	hdrohane78@wunderground.com	f9yB3zw5qFh	1988-11-28	http://dummyimage.com/191x100.png/ff4444/ffffff	1259
262	Verna	vmowling79@drupal.org	UlzE81y5t	1989-05-22	http://dummyimage.com/210x100.png/ff4444/ffffff	809
263	Carlos	cmealing7a@istockphoto.com	e4LxJeEuk	1978-09-22	http://dummyimage.com/224x100.png/cc0000/ffffff	5514
264	Egor	ejouhan7b@howstuffworks.com	R7ezNbKGt	1967-12-20	http://dummyimage.com/237x100.png/dddddd/000000	235
265	Milty	mlehrian7c@mit.edu	PoJABfK	1964-11-24	http://dummyimage.com/111x100.png/5fa2dd/ffffff	744
266	Sibylle	svalentinetti7d@foxnews.com	yNGJfiO	1981-03-10	http://dummyimage.com/129x100.png/ff4444/ffffff	870
267	Davey	dcare7e@feedburner.com	0383Rznf6UrR	1994-10-23	http://dummyimage.com/178x100.png/cc0000/ffffff	1742
268	Marley	mfaber7f@jugem.jp	qA1yEGn	2000-08-01	http://dummyimage.com/100x100.png/5fa2dd/ffffff	300
269	Annette	abeldom7g@blog.com	59ueDy	1999-07-27	http://dummyimage.com/164x100.png/ff4444/ffffff	3601
270	Giuditta	gsatch7h@icq.com	w6iM3RyIktqI	1961-03-01	http://dummyimage.com/186x100.png/cc0000/ffffff	447
271	Myrta	mmerryweather7i@harvard.edu	2GLDQcx	1993-02-05	http://dummyimage.com/137x100.png/5fa2dd/ffffff	833
272	Freddi	fcantopher7j@wordpress.org	tkrMF7	1982-11-27	http://dummyimage.com/190x100.png/5fa2dd/ffffff	4812
273	Fenelia	fpedrozzi7k@jugem.jp	zy2UXLJQ	1963-11-09	http://dummyimage.com/227x100.png/5fa2dd/ffffff	3294
274	Baxy	bmaccheyne7l@noaa.gov	a6yAm0kXm	1984-04-11	http://dummyimage.com/204x100.png/cc0000/ffffff	3019
275	Robin	rlipscombe7m@sitemeter.com	k55aFdG	2001-04-05	http://dummyimage.com/112x100.png/cc0000/ffffff	4826
276	Garnet	gweine7n@google.com.hk	BdGy3r05	1994-02-10	http://dummyimage.com/170x100.png/dddddd/000000	3658
277	Sapphira	sstanbro7o@army.mil	VRKG0z	1999-08-27	http://dummyimage.com/113x100.png/dddddd/000000	2905
278	Freedman	frideout7p@wikia.com	DMIrIEdNafSn	1971-07-15	http://dummyimage.com/159x100.png/cc0000/ffffff	391
279	Joyann	jpunshon7q@google.it	mvrtndLtbE6a	1980-03-13	http://dummyimage.com/130x100.png/dddddd/000000	3817
280	Dino	depilet7r@indiatimes.com	wOw5jdx	1988-05-15	http://dummyimage.com/221x100.png/ff4444/ffffff	3020
281	Madeleine	mloney7s@liveinternet.ru	gUp8Rh6l	1973-10-16	http://dummyimage.com/127x100.png/cc0000/ffffff	367
282	Rik	rcoonihan7t@webs.com	D8pnDsvqg	1975-06-29	http://dummyimage.com/111x100.png/dddddd/000000	5368
283	Sibelle	sram7u@census.gov	hPTeFzFr1	1965-01-19	http://dummyimage.com/131x100.png/cc0000/ffffff	4142
284	Grata	gpittson7v@ox.ac.uk	XFelmRnfoe7	1991-10-18	http://dummyimage.com/130x100.png/dddddd/000000	3893
285	Steffie	shumpherston7w@amazon.com	nn6sExM8DX	2000-03-31	http://dummyimage.com/236x100.png/5fa2dd/ffffff	934
286	Rochelle	rouver7x@hibu.com	nZRjgsl6KkI	1970-09-20	http://dummyimage.com/161x100.png/dddddd/000000	5075
287	Niki	nbowick7y@thetimes.co.uk	B2UGZR	1993-06-10	http://dummyimage.com/126x100.png/cc0000/ffffff	5551
288	Midge	mburhill7z@gravatar.com	ndN8JDwLnTb6	1998-10-29	http://dummyimage.com/193x100.png/5fa2dd/ffffff	2887
289	Philippa	porring80@alibaba.com	mPQWuF	1999-05-27	http://dummyimage.com/194x100.png/dddddd/000000	3387
290	Fidelio	fduchart81@eepurl.com	G8cxh6DmJJh	1977-03-06	http://dummyimage.com/156x100.png/cc0000/ffffff	5490
291	Shandra	sproske82@gizmodo.com	SyMzx13	1967-04-15	http://dummyimage.com/201x100.png/5fa2dd/ffffff	3451
292	Kerry	kanger83@jalbum.net	lUgX6He	1967-05-01	http://dummyimage.com/205x100.png/cc0000/ffffff	1149
293	Emmet	eknowlys84@intel.com	CpWZ4U4flpVA	1995-05-08	http://dummyimage.com/206x100.png/cc0000/ffffff	2906
294	Brandise	bgavin85@discovery.com	adPfVjfrL	1998-07-27	http://dummyimage.com/189x100.png/5fa2dd/ffffff	4348
295	Dianemarie	dbredgeland86@howstuffworks.com	9VjncwWqo	1971-07-26	http://dummyimage.com/130x100.png/cc0000/ffffff	2078
296	Lisha	lmuneely87@dot.gov	b9AGgSM	1967-03-06	http://dummyimage.com/208x100.png/dddddd/000000	243
297	Orson	ovaliant88@sbwire.com	XS4rSipdIt	1989-09-21	http://dummyimage.com/166x100.png/ff4444/ffffff	1014
298	Idalina	ibasilone89@alexa.com	JkZMRe76C	1976-07-28	http://dummyimage.com/201x100.png/ff4444/ffffff	5127
299	Denny	dthying8a@delicious.com	HjPLb00xPNmL	1984-02-15	http://dummyimage.com/250x100.png/cc0000/ffffff	5409
300	Ellwood	elampet8b@yelp.com	v5sqZY6O9	1985-09-29	http://dummyimage.com/236x100.png/ff4444/ffffff	4866
301	Neala	nmcgrudder8c@examiner.com	QcIUBmJrA	1992-11-21	http://dummyimage.com/110x100.png/5fa2dd/ffffff	2009
302	Elmer	edickins8d@skype.com	zQzoIt	1991-11-29	http://dummyimage.com/167x100.png/5fa2dd/ffffff	4653
303	Christophorus	cschohier8e@google.ru	UpNxQm	2001-02-20	http://dummyimage.com/166x100.png/ff4444/ffffff	2731
304	Marlon	mbatchellor8f@etsy.com	RKA98xWMN	1967-07-21	http://dummyimage.com/236x100.png/5fa2dd/ffffff	280
305	Arturo	acorde8g@about.me	sIs8jsHOjM	1966-06-11	http://dummyimage.com/149x100.png/cc0000/ffffff	3672
306	Conny	cfrift8h@tinypic.com	UXZplNOZV0H	1990-06-06	http://dummyimage.com/129x100.png/5fa2dd/ffffff	1445
307	Bondon	bwalpole8i@trellian.com	kWftlOg	1988-03-09	http://dummyimage.com/154x100.png/dddddd/000000	4452
308	Emiline	ethorogood8j@home.pl	euqeEn32cO	1993-08-18	http://dummyimage.com/120x100.png/dddddd/000000	5067
309	Odelle	okeetch8k@princeton.edu	WeAEOGd	1998-10-31	http://dummyimage.com/181x100.png/dddddd/000000	1845
310	Clem	csexty8l@wiley.com	1qmuOW	1979-06-12	http://dummyimage.com/207x100.png/ff4444/ffffff	4911
311	Georgeanna	gflett8m@accuweather.com	kBygpPA6nfd	1967-04-21	http://dummyimage.com/203x100.png/cc0000/ffffff	585
312	Chance	croswarn8n@etsy.com	Id2dhWH	1999-06-25	http://dummyimage.com/126x100.png/cc0000/ffffff	5138
313	Sheridan	sswayte8o@histats.com	nPBIeyDYO	1969-01-26	http://dummyimage.com/209x100.png/cc0000/ffffff	1599
314	Ellerey	econnaughton8p@homestead.com	fUmUAZ81	1983-06-08	http://dummyimage.com/192x100.png/ff4444/ffffff	2221
315	Atalanta	aoneil8q@wsj.com	2gsPXZ	1979-09-09	http://dummyimage.com/185x100.png/5fa2dd/ffffff	724
316	Ashil	avowles8r@wikia.com	H5RxtuR3oL	1978-09-04	http://dummyimage.com/162x100.png/5fa2dd/ffffff	3474
317	Lynea	ldightham8s@kickstarter.com	eLkwlR	1977-08-02	http://dummyimage.com/144x100.png/dddddd/000000	1570
318	Cami	cwilsey8t@github.io	XOl3P82pd9	1984-01-30	http://dummyimage.com/166x100.png/dddddd/000000	3621
319	Donetta	dducaen8u@squarespace.com	dYWAse9tz	1993-12-20	http://dummyimage.com/231x100.png/ff4444/ffffff	734
320	Felice	fdunsmore8v@scientificamerican.com	hWWT8Hf	1972-05-18	http://dummyimage.com/187x100.png/dddddd/000000	3737
321	Ross	rpiell8w@tmall.com	LFHLBB	1972-12-18	http://dummyimage.com/145x100.png/dddddd/000000	5392
322	Wolf	wspawforth8x@artisteer.com	mUxIToI	1999-07-31	http://dummyimage.com/143x100.png/dddddd/000000	1997
323	Drusilla	dmingo8y@devhub.com	LgcXV5R	1975-02-22	http://dummyimage.com/187x100.png/cc0000/ffffff	1180
324	Melva	msabbins8z@tmall.com	35H5IfzJRBXp	1994-03-26	http://dummyimage.com/198x100.png/dddddd/000000	4699
325	Ollie	oallans90@marriott.com	Molv7H6	1998-11-09	http://dummyimage.com/194x100.png/ff4444/ffffff	333
326	Constantia	ctrevena91@instagram.com	DBJxqPdi0j	1997-07-20	http://dummyimage.com/179x100.png/ff4444/ffffff	2376
327	Justis	jhowick92@bloomberg.com	4logUmBfHk	1978-08-27	http://dummyimage.com/205x100.png/dddddd/000000	682
328	Eadmund	ecanizares93@tinyurl.com	QnPIgO2	1995-05-17	http://dummyimage.com/146x100.png/dddddd/000000	568
329	Fiann	fmaffi94@google.co.uk	z0SJhjYA	1997-06-26	http://dummyimage.com/154x100.png/cc0000/ffffff	920
330	Gustave	gfrancklin95@microsoft.com	X5lB8VhGK	1964-05-09	http://dummyimage.com/164x100.png/cc0000/ffffff	4211
331	Syman	sdismore96@studiopress.com	FLbFYHUiD	1970-08-15	http://dummyimage.com/178x100.png/dddddd/000000	2647
332	Leigh	lwillavoys97@flickr.com	ZggVAT3U3B2	1962-03-24	http://dummyimage.com/248x100.png/cc0000/ffffff	2642
333	Camala	cchesterfield98@cam.ac.uk	ZYeYtuN76	1991-10-12	http://dummyimage.com/250x100.png/ff4444/ffffff	518
334	Judy	jshelsher99@nps.gov	q4Fx0UbFV3	1995-01-07	http://dummyimage.com/119x100.png/ff4444/ffffff	3650
335	Camellia	cpleace9a@reddit.com	gV1ydSitKkK	1965-03-26	http://dummyimage.com/185x100.png/ff4444/ffffff	5562
336	Brena	bshalcros9b@cnet.com	LcYRKHGG8L	1978-07-11	http://dummyimage.com/249x100.png/ff4444/ffffff	4368
337	Loni	lavard9c@mozilla.com	35Ku83	2001-08-15	http://dummyimage.com/188x100.png/ff4444/ffffff	614
338	Kellia	kharwick9d@springer.com	4izhbok2Dw	1987-09-25	http://dummyimage.com/185x100.png/5fa2dd/ffffff	1081
339	Isis	ikain9e@phoca.cz	a7POauoQAy	1978-04-09	http://dummyimage.com/231x100.png/cc0000/ffffff	4773
340	Alaric	amclean9f@acquirethisname.com	4ET54U	1961-03-04	http://dummyimage.com/102x100.png/dddddd/000000	2851
341	Bastian	bwinkless9g@plala.or.jp	uvncudpiPS0	1978-11-16	http://dummyimage.com/183x100.png/5fa2dd/ffffff	2833
342	Rodge	rdanilovic9h@t.co	DMb1tu	1996-07-27	http://dummyimage.com/157x100.png/ff4444/ffffff	912
343	Tallia	tmalpas9i@paypal.com	7I1MqksKETup	1997-08-03	http://dummyimage.com/220x100.png/cc0000/ffffff	367
344	Lizette	lashfold9j@phpbb.com	Yj624ki	1998-10-18	http://dummyimage.com/103x100.png/dddddd/000000	5419
345	Gar	gdeble9k@vistaprint.com	ZVeqKP	1981-04-14	http://dummyimage.com/159x100.png/ff4444/ffffff	1776
346	Kelila	ktretter9l@opensource.org	q4C513t33Ij	1973-10-31	http://dummyimage.com/164x100.png/dddddd/000000	1413
347	Lenci	ljosovich9m@bloglovin.com	iQDCoeJ7	1983-10-26	http://dummyimage.com/116x100.png/ff4444/ffffff	1574
348	Hilary	hbutterfill9n@sphinn.com	pfcOtnnzBq1	1984-06-25	http://dummyimage.com/182x100.png/5fa2dd/ffffff	2919
349	Leslie	lpaffot9o@fc2.com	yC14dtkc	1984-03-30	http://dummyimage.com/169x100.png/ff4444/ffffff	4832
350	Jaclyn	jtrussler9p@forbes.com	sqUhRs02U	1986-09-05	http://dummyimage.com/196x100.png/ff4444/ffffff	4722
351	Minnnie	mbetteson9q@purevolume.com	PB21uzdI5yi	1964-08-30	http://dummyimage.com/138x100.png/ff4444/ffffff	2312
352	Dre	ddearden9r@trellian.com	wPDiXsidr	1996-10-24	http://dummyimage.com/227x100.png/ff4444/ffffff	5211
353	Carmelina	ctanton9s@yahoo.co.jp	1ecvTt6y1p	1977-07-08	http://dummyimage.com/180x100.png/ff4444/ffffff	1973
354	Joelly	jhunnywell9t@bloomberg.com	iYu6ykzcKF	2001-08-31	http://dummyimage.com/159x100.png/ff4444/ffffff	2434
355	Ivy	imulmuray9u@businessinsider.com	W7W8KGE2DqIo	1970-09-24	http://dummyimage.com/127x100.png/5fa2dd/ffffff	1024
356	Jourdain	jyorston9v@sbwire.com	aOhycNfCHk	2000-09-27	http://dummyimage.com/152x100.png/ff4444/ffffff	2701
357	Ely	eleguey9w@wikipedia.org	v4DvfhvyPyQ	1970-11-13	http://dummyimage.com/162x100.png/dddddd/000000	957
358	Tasha	tblackmoor9x@wired.com	8w0vQDvA	1982-01-10	http://dummyimage.com/146x100.png/ff4444/ffffff	4564
359	Filberte	fmarritt9y@smugmug.com	e9qlpLLq	1995-04-10	http://dummyimage.com/163x100.png/cc0000/ffffff	4734
360	Becki	beccleston9z@github.io	6EPuhgAV	1976-08-22	http://dummyimage.com/211x100.png/cc0000/ffffff	293
361	Dorey	dpenbarthya0@shop-pro.jp	NUg3XQglKX	1984-01-06	http://dummyimage.com/108x100.png/cc0000/ffffff	1631
362	Ellie	etrainera1@irs.gov	Z2wHRl	1964-01-30	http://dummyimage.com/240x100.png/dddddd/000000	5197
363	Sada	scollougha2@deliciousdays.com	2mx8gK	1966-11-26	http://dummyimage.com/147x100.png/5fa2dd/ffffff	4868
364	Rhett	rverduna3@google.pl	wIEfyiHbeKE3	2000-11-12	http://dummyimage.com/161x100.png/ff4444/ffffff	3057
365	Leonard	lcavanaugha4@twitpic.com	xJQkdB	1971-12-20	http://dummyimage.com/208x100.png/ff4444/ffffff	2032
366	Kellby	kchataina5@nymag.com	Jx8PRBAKT	1969-09-26	http://dummyimage.com/179x100.png/ff4444/ffffff	1043
367	Ronalda	rdawksa6@rambler.ru	OnsGEQdeFTq	2000-09-13	http://dummyimage.com/100x100.png/ff4444/ffffff	3657
368	Frannie	fdanbrooka7@com.com	faYGxSkVkMXL	1961-05-17	http://dummyimage.com/223x100.png/dddddd/000000	4420
369	Randell	rcanwella8@wp.com	CJK9xPw	1986-01-19	http://dummyimage.com/172x100.png/dddddd/000000	1878
370	Glennis	gscophama9@ftc.gov	iBDX0kdafHP	1993-12-16	http://dummyimage.com/180x100.png/cc0000/ffffff	2961
371	Tally	tstoodleyaa@fc2.com	db25WCEYmVHi	1999-09-10	http://dummyimage.com/207x100.png/cc0000/ffffff	2231
372	Bartie	bbirkettab@e-recht24.de	WnnFGsaTJjw1	1964-09-20	http://dummyimage.com/212x100.png/dddddd/000000	4029
373	Frederico	fgensavageac@networksolutions.com	e1wxrCRZ	1971-05-23	http://dummyimage.com/110x100.png/ff4444/ffffff	4719
374	Marigold	mgaviganad@histats.com	NkLG2BANoQ	1977-08-27	http://dummyimage.com/173x100.png/5fa2dd/ffffff	3621
375	Granville	gtarrierae@so-net.ne.jp	NGngKZTC	2000-10-27	http://dummyimage.com/247x100.png/ff4444/ffffff	2502
376	Mortimer	minggallaf@intel.com	u4X73UmoQsG	1968-05-04	http://dummyimage.com/224x100.png/cc0000/ffffff	3323
377	Ferguson	fjanekag@seattletimes.com	8Zpuio3Guv	1961-01-20	http://dummyimage.com/240x100.png/cc0000/ffffff	5437
378	Sollie	sfrawleyah@jigsy.com	shBWYquFE	1967-06-25	http://dummyimage.com/170x100.png/cc0000/ffffff	1859
379	Hanni	hdudmanai@wired.com	k5zevNHw	1965-06-11	http://dummyimage.com/141x100.png/dddddd/000000	5409
380	Vania	vhenrikssonaj@unblog.fr	UpjRC5Bp1S	1988-10-28	http://dummyimage.com/119x100.png/ff4444/ffffff	414
381	Manuel	mroddellak@yahoo.com	j0K3UNj	1982-01-07	http://dummyimage.com/105x100.png/5fa2dd/ffffff	610
382	Chaddy	ccarderal@facebook.com	crXE3CCGvR	1982-02-02	http://dummyimage.com/147x100.png/cc0000/ffffff	1646
383	Humphrey	hwallsam@europa.eu	W3QyEnYDwK9	1970-08-17	http://dummyimage.com/143x100.png/dddddd/000000	4810
384	Gabie	gdorricottan@ovh.net	o1gMY5K	1989-01-31	http://dummyimage.com/203x100.png/ff4444/ffffff	4757
385	Virgil	vcluerao@mlb.com	HCKyT5QbFac	1960-07-24	http://dummyimage.com/146x100.png/cc0000/ffffff	3085
386	William	wrobuchonap@quantcast.com	pcXd9lIFOO1	1983-03-10	http://dummyimage.com/139x100.png/5fa2dd/ffffff	3700
387	Crista	cmiereaq@reference.com	xdxCTO5D	1971-11-24	http://dummyimage.com/159x100.png/dddddd/000000	87
388	Lana	lrussenar@pbs.org	QsffgY6Ny7	1987-08-15	http://dummyimage.com/134x100.png/5fa2dd/ffffff	2707
389	Avrit	ahazelhurstas@sphinn.com	Qf66FbZt	1976-04-01	http://dummyimage.com/248x100.png/cc0000/ffffff	2340
390	Carina	cdwireat@archive.org	TGUWuj7ufS	1995-02-14	http://dummyimage.com/204x100.png/ff4444/ffffff	4707
391	Vivi	vnerneau@engadget.com	KhP83ay	1962-02-07	http://dummyimage.com/122x100.png/ff4444/ffffff	4159
392	Katlin	kklischav@123-reg.co.uk	EJlRyYMSIefl	1996-06-07	http://dummyimage.com/222x100.png/ff4444/ffffff	1065
393	Seline	spattesallaw@earthlink.net	Jg2VgYZG4	1970-02-27	http://dummyimage.com/140x100.png/ff4444/ffffff	1572
394	Jess	jrunciemanax@newyorker.com	Jx1oYW	1974-02-07	http://dummyimage.com/130x100.png/5fa2dd/ffffff	2914
395	Antone	adrifeay@squidoo.com	9v72axf	1977-03-06	http://dummyimage.com/151x100.png/ff4444/ffffff	3783
396	Arly	acahnaz@latimes.com	1id21E	1968-09-24	http://dummyimage.com/248x100.png/cc0000/ffffff	1794
397	Lenard	lwardingleyb0@shutterfly.com	nCGgzxzXX2R	1967-01-18	http://dummyimage.com/136x100.png/dddddd/000000	3370
398	Tybalt	tdenziloeb1@cbsnews.com	O8yLwl	1970-03-24	http://dummyimage.com/123x100.png/5fa2dd/ffffff	3617
399	Idell	inormanvilleb2@si.edu	kqKw5hpDnXY	1993-07-30	http://dummyimage.com/235x100.png/ff4444/ffffff	1300
401	Constantia	cgethingb4@free.fr	T3Ggd2Wrl	1989-01-01	http://dummyimage.com/113x100.png/5fa2dd/ffffff	2277
402	Jenilee	jtotherb5@sina.com.cn	bm74r4g5	1965-07-18	http://dummyimage.com/218x100.png/ff4444/ffffff	2083
403	Karola	kforkanb6@oakley.com	oJYXkCAkFiVA	1979-08-23	http://dummyimage.com/215x100.png/ff4444/ffffff	5407
404	Any	aworkesb7@businessinsider.com	GRLKUA2pul	1969-08-16	http://dummyimage.com/179x100.png/dddddd/000000	99
405	Astrid	apaceb8@google.nl	Xhgg61atf	1972-10-01	http://dummyimage.com/163x100.png/dddddd/000000	3128
406	Craggie	ctetleyb9@360.cn	eNjcqJr	1980-12-03	http://dummyimage.com/207x100.png/ff4444/ffffff	3031
407	Faye	fdaldryba@cdc.gov	O7Pq6EGPobDj	1979-11-12	http://dummyimage.com/176x100.png/cc0000/ffffff	5353
408	Barthel	bseeleybb@mtv.com	HIL2XOm	1968-01-07	http://dummyimage.com/214x100.png/cc0000/ffffff	3590
409	Halley	handrzejewskibc@redcross.org	w94bsvitUD	1989-12-30	http://dummyimage.com/102x100.png/cc0000/ffffff	4358
410	Aubry	anunnbd@ezinearticles.com	DaAiXxpGt	1982-06-14	http://dummyimage.com/113x100.png/ff4444/ffffff	1528
411	Alicea	arouxbe@utexas.edu	o1O54inh	1962-04-11	http://dummyimage.com/245x100.png/ff4444/ffffff	499
412	Carroll	civainbf@mashable.com	CucAOoSZibRO	1995-08-26	http://dummyimage.com/115x100.png/dddddd/000000	52
413	Glynis	ghuittbg@mtv.com	hCKnEM4fqi	1977-01-17	http://dummyimage.com/227x100.png/ff4444/ffffff	2878
414	Alverta	apeerybh@imgur.com	kHip1mUz76A	1960-12-19	http://dummyimage.com/172x100.png/5fa2dd/ffffff	1331
415	Francine	franybi@spiegel.de	mw0hMxFsgY4	1985-04-03	http://dummyimage.com/151x100.png/dddddd/000000	1177
416	Finn	fpashbabj@live.com	ygz12R0	1988-01-12	http://dummyimage.com/237x100.png/5fa2dd/ffffff	64
417	Lorant	lketchellbk@mysql.com	b9UVxr	1980-06-01	http://dummyimage.com/153x100.png/dddddd/000000	3590
418	Thalia	tgoodybl@samsung.com	Y9OTUi	1991-08-08	http://dummyimage.com/123x100.png/5fa2dd/ffffff	1361
419	Andre	ahaddenbm@usatoday.com	s2ybjL	1971-01-22	http://dummyimage.com/125x100.png/dddddd/000000	737
420	Alanson	aashfordbn@skyrock.com	memkZlUkU	1975-01-22	http://dummyimage.com/109x100.png/cc0000/ffffff	3483
421	Dolf	dhendonsonbo@ameblo.jp	QWXorGCoOt	1969-07-18	http://dummyimage.com/102x100.png/cc0000/ffffff	485
422	Ralph	rhanssmannbp@com.com	LuSplb	1981-05-05	http://dummyimage.com/121x100.png/dddddd/000000	1030
423	Thorvald	tlochbq@jiathis.com	2pJd8G4	1995-06-07	http://dummyimage.com/152x100.png/cc0000/ffffff	3283
424	Coletta	cbraxtonbr@php.net	e3CPfRWGtXV	1978-10-20	http://dummyimage.com/188x100.png/ff4444/ffffff	851
425	Maribelle	mlingbs@dot.gov	7mrF6qIfs	1973-06-24	http://dummyimage.com/117x100.png/dddddd/000000	349
426	Merci	mdartnallbt@vistaprint.com	xyHuCM	1995-09-26	http://dummyimage.com/196x100.png/cc0000/ffffff	219
427	Pansy	preambu@ameblo.jp	QZatckr	1981-06-03	http://dummyimage.com/234x100.png/dddddd/000000	3016
428	Teddy	tscoltsbv@nature.com	6pMLaiMK7N	1997-08-25	http://dummyimage.com/209x100.png/ff4444/ffffff	2667
429	Bill	bgoadebw@blogtalkradio.com	6pXsC4Bspi	1961-06-16	http://dummyimage.com/154x100.png/cc0000/ffffff	3527
430	Emylee	egudemanbx@redcross.org	ZB00js	1986-12-27	http://dummyimage.com/142x100.png/dddddd/000000	1851
431	Blake	bgoodburby@booking.com	e7rqAcAzK	1973-02-17	http://dummyimage.com/117x100.png/cc0000/ffffff	1650
432	Allene	acopcuttbz@earthlink.net	auuuCE	1969-05-12	http://dummyimage.com/221x100.png/ff4444/ffffff	2555
433	Karleen	kbrendishc0@slideshare.net	001v4AS	1978-01-14	http://dummyimage.com/239x100.png/cc0000/ffffff	5264
434	Timothy	tfleethamc1@blogger.com	uXOmWaCkDn	1987-06-12	http://dummyimage.com/238x100.png/cc0000/ffffff	86
435	Jesus	jcoughc2@sfgate.com	iZve7Lz8Hbq	1972-06-21	http://dummyimage.com/183x100.png/cc0000/ffffff	3678
436	Eduino	ealthamc3@usda.gov	6aihafAKTUB	1985-09-26	http://dummyimage.com/186x100.png/dddddd/000000	1456
437	Stewart	sainscowc4@economist.com	G4lDYR2G6	1977-02-01	http://dummyimage.com/214x100.png/cc0000/ffffff	4851
438	Fabian	fthundermanc5@skype.com	4pnpuasjKr	2001-05-29	http://dummyimage.com/150x100.png/ff4444/ffffff	4363
439	Corrie	csabiec6@globo.com	QaGkR0	1999-08-19	http://dummyimage.com/145x100.png/cc0000/ffffff	5093
440	Sebastien	ssieghardc7@last.fm	7yEBjFg	1970-04-26	http://dummyimage.com/217x100.png/cc0000/ffffff	3797
441	Eldridge	ekneathc8@blog.com	lfWuLsxIF1V	1992-10-16	http://dummyimage.com/190x100.png/cc0000/ffffff	2955
442	Derick	dduberryc9@unesco.org	NwwnnMG	1989-09-24	http://dummyimage.com/168x100.png/cc0000/ffffff	1089
443	Oren	oimasonca@pen.io	1lFPMS	1986-01-10	http://dummyimage.com/109x100.png/dddddd/000000	4088
444	Carolan	cmerancb@godaddy.com	yqI8m5lYKf	1993-02-18	http://dummyimage.com/228x100.png/dddddd/000000	2357
445	Chalmers	calmakcc@paypal.com	0HLn6XN36El2	1982-08-18	http://dummyimage.com/117x100.png/5fa2dd/ffffff	2007
446	Crosby	caleswellcd@accuweather.com	g6nYoyYqApVU	1990-06-02	http://dummyimage.com/211x100.png/dddddd/000000	2060
447	Vasily	vhuguenetce@smugmug.com	g9BTteKxs9xr	1969-05-01	http://dummyimage.com/133x100.png/ff4444/ffffff	5308
448	Ilise	igonnincf@biblegateway.com	LIiWm3Vd3x6	1963-10-22	http://dummyimage.com/137x100.png/dddddd/000000	4507
449	Mikkel	mmyhancg@ucsd.edu	NHRnfIjQxY1s	1979-05-12	http://dummyimage.com/241x100.png/dddddd/000000	5109
450	Massimiliano	mozannech@google.co.uk	UGkKrg	1991-02-28	http://dummyimage.com/115x100.png/5fa2dd/ffffff	3488
451	Ab	aharnimanci@dyndns.org	Ra7rypPv1jO	2000-12-16	http://dummyimage.com/165x100.png/5fa2dd/ffffff	3634
452	Rufe	rrosenauercj@bbb.org	dst7hrTZMPpc	1981-07-13	http://dummyimage.com/130x100.png/ff4444/ffffff	4033
453	Anthe	asprigingsck@free.fr	8pwDlu	1990-07-19	http://dummyimage.com/127x100.png/dddddd/000000	1543
454	Emlynne	ejuggingscl@gravatar.com	PsSgZEy6gR	1982-10-26	http://dummyimage.com/119x100.png/ff4444/ffffff	510
455	Riki	rcolvincm@illinois.edu	rjGgs2tfC	1988-08-25	http://dummyimage.com/158x100.png/5fa2dd/ffffff	3744
456	Staffard	sacremancn@github.com	z0G3gdIW	1974-09-21	http://dummyimage.com/126x100.png/ff4444/ffffff	2554
457	Gayle	gmassenhoveco@vistaprint.com	Htb7eF	1989-07-05	http://dummyimage.com/141x100.png/5fa2dd/ffffff	2215
458	Burgess	bbeateycp@oakley.com	tkkaZeg	1988-04-23	http://dummyimage.com/201x100.png/ff4444/ffffff	3188
459	Adele	abeckittcq@altervista.org	F1HBq7auZ42t	1973-10-23	http://dummyimage.com/215x100.png/ff4444/ffffff	1467
460	Peggie	pwootoncr@imgur.com	o3tuqVlkSVn6	1998-06-17	http://dummyimage.com/226x100.png/dddddd/000000	1822
461	Mill	melmarcs@google.es	NKT2apDmIbc	1993-07-10	http://dummyimage.com/249x100.png/5fa2dd/ffffff	4738
462	Ronica	rmellishct@hud.gov	CWHO5CaN3t	1994-02-15	http://dummyimage.com/128x100.png/ff4444/ffffff	2688
463	Cyndi	csisselotcu@oaic.gov.au	9881ulPQ	1972-08-23	http://dummyimage.com/170x100.png/dddddd/000000	3851
464	Antonio	aranscombcv@nydailynews.com	vwW7ib	1998-06-07	http://dummyimage.com/238x100.png/5fa2dd/ffffff	590
465	Jacky	jyettoncw@wikispaces.com	tM5rMVhtB	1992-07-26	http://dummyimage.com/132x100.png/dddddd/000000	653
466	Theobald	tvinaucx@answers.com	udwavzOqCoVR	1962-12-13	http://dummyimage.com/228x100.png/ff4444/ffffff	533
467	Amalle	amoughtincy@wired.com	Ej3naQ	1995-09-08	http://dummyimage.com/216x100.png/dddddd/000000	5303
468	Karlan	kbruslecz@cornell.edu	Hi8JNyonJW	1971-11-19	http://dummyimage.com/213x100.png/dddddd/000000	3566
469	Travers	tburdelld0@reference.com	VyzDNaN	1961-01-20	http://dummyimage.com/142x100.png/5fa2dd/ffffff	821
470	Garland	gspurryerd1@ocn.ne.jp	ZEwmhx	1971-09-11	http://dummyimage.com/123x100.png/5fa2dd/ffffff	4253
471	Brennan	bheapsd2@youtube.com	eDKTdbxb	2001-08-15	http://dummyimage.com/170x100.png/5fa2dd/ffffff	2084
472	Nicolas	nmissond3@cnn.com	xJgJWPCViU	1963-10-03	http://dummyimage.com/238x100.png/ff4444/ffffff	2765
473	Marcella	mbarehamd4@ocn.ne.jp	n8Ebi5Jnii1	1976-09-22	http://dummyimage.com/145x100.png/ff4444/ffffff	4204
474	Husain	hnapierd5@toplist.cz	mo31PvK5Rh	1990-09-13	http://dummyimage.com/102x100.png/5fa2dd/ffffff	984
475	Monah	mcoggilld6@shareasale.com	5exvaDOeKsg	1961-09-26	http://dummyimage.com/160x100.png/ff4444/ffffff	3486
476	Dorella	dnorwayd7@alibaba.com	ubpiJhPAk3F	1961-07-24	http://dummyimage.com/194x100.png/5fa2dd/ffffff	98
477	Olympia	osangsterd8@t.co	3y3lyED	1972-05-18	http://dummyimage.com/208x100.png/5fa2dd/ffffff	4099
478	Jo-ann	jhaymand9@amazon.de	pnZYHV	1986-08-23	http://dummyimage.com/217x100.png/ff4444/ffffff	3169
479	Wiatt	wseacroftda@google.co.jp	wwL8PTF0TFE	1986-01-10	http://dummyimage.com/212x100.png/dddddd/000000	2432
480	Troy	ttubbledb@is.gd	5u3njw	1967-04-26	http://dummyimage.com/169x100.png/dddddd/000000	2030
481	Rickard	rcastellettodc@google.cn	LKu8hZqL5c35	1960-03-08	http://dummyimage.com/192x100.png/5fa2dd/ffffff	39
482	Hayden	hproudmandd@craigslist.org	LKJPNaPKcx4X	1986-04-18	http://dummyimage.com/101x100.png/cc0000/ffffff	2347
483	Fayina	fputtockde@reverbnation.com	5nqAcODOnYN	1978-06-11	http://dummyimage.com/106x100.png/5fa2dd/ffffff	743
484	Aimil	amacconnechiedf@csmonitor.com	fMsSrJG5	2000-07-24	http://dummyimage.com/109x100.png/ff4444/ffffff	2316
485	Rochella	renderwickdg@hc360.com	rY4uZU0	1989-04-01	http://dummyimage.com/156x100.png/cc0000/ffffff	3331
486	Regan	rshortalldh@oracle.com	ZkKBPg1C	1995-08-18	http://dummyimage.com/228x100.png/dddddd/000000	3984
487	Alexander	awrethamdi@theatlantic.com	8FQbLEgmICtv	2000-11-13	http://dummyimage.com/199x100.png/cc0000/ffffff	1819
488	Barty	bcockhilldj@google.ru	JD0aGG	1998-05-27	http://dummyimage.com/236x100.png/dddddd/000000	634
489	Andrei	asyrettdk@china.com.cn	ceeaKO	1995-12-19	http://dummyimage.com/191x100.png/5fa2dd/ffffff	712
490	Latrena	lgrunwalldl@google.co.jp	Af8auP80e3	1987-02-25	http://dummyimage.com/156x100.png/5fa2dd/ffffff	5262
491	Kasper	kstorredm@oracle.com	A9Ncn4j9xBz	1992-03-23	http://dummyimage.com/142x100.png/cc0000/ffffff	1631
492	Daisie	dkindlesidedn@technorati.com	yhqk53szhxR0	1960-05-31	http://dummyimage.com/185x100.png/cc0000/ffffff	2255
493	Arni	adevonalddo@amazonaws.com	M4FYAF	1983-08-09	http://dummyimage.com/189x100.png/ff4444/ffffff	55
494	Virginia	vpiggottdp@amazon.co.uk	BhqKHN3Km0Ih	1976-02-09	http://dummyimage.com/156x100.png/cc0000/ffffff	1262
495	Nevins	nrasordq@marketwatch.com	Vuwg71	1971-06-22	http://dummyimage.com/179x100.png/ff4444/ffffff	4030
496	Thalia	tgerydr@shinystat.com	9wj0HlYi3	1981-08-31	http://dummyimage.com/153x100.png/ff4444/ffffff	3676
497	Barrett	brookwellds@last.fm	q3U1mxC	1968-07-13	http://dummyimage.com/149x100.png/5fa2dd/ffffff	3752
498	Jessey	jniesedt@xing.com	a8Cx8gv	1973-08-05	http://dummyimage.com/122x100.png/cc0000/ffffff	884
499	Lexis	llambaldu@seesaa.net	ZLT1qrO2PG1	2001-07-05	http://dummyimage.com/149x100.png/dddddd/000000	649
500	Parrnell	psevindv@nih.gov	vNCGjvFVbDn	1985-04-28	http://dummyimage.com/155x100.png/dddddd/000000	1768
4	Otho	ojays3@php.net	fJNQxhGO	1980-11-01	http://dummyimage.com/241x100.png/cc0000/ffffff	3658
30	Tildi	tchavest@nytimes.com	YOhMHS6	1978-03-30	http://dummyimage.com/234x100.png/ff4444/ffffff	3658
60	Dianna	dchilles1n@diigo.com	j2Z9XDSjJXfB	1998-06-27	http://dummyimage.com/100x100.png/ff4444/ffffff	3658
100	Ryon	rmungan2r@symantec.com	6RpxB0dBUw	2001-08-12	http://dummyimage.com/172x100.png/cc0000/ffffff	3658
127	Butch	bhulles3i@ask.com	3kROOr	1969-05-24	http://dummyimage.com/234x100.png/cc0000/ffffff	3658
400	Nowell	nkingsmillb3@cyberchimps.com	XJQXki89oum	1984-09-24	http://dummyimage.com/108x100.png/ff4444/ffffff	3658
\.


--
-- Name: applicants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicants_id_seq', 104, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 5564, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.educations_id_seq', 1, false);


--
-- Name: experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiences_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_id_seq', 1, false);


--
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 101, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 500, true);


--
-- Name: applicants applicants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants
    ADD CONSTRAINT applicants_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: experiences experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: companies name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: schools name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "linkr" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: linkr; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE linkr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE linkr OWNER TO postgres;

\connect linkr

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.hashtags OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    date integer NOT NULL,
    text text NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts-hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."posts-hashtags" (
    id integer NOT NULL,
    "post-id" integer NOT NULL,
    "hashtag-id" integer NOT NULL
);


ALTER TABLE public."posts-hashtags" OWNER TO postgres;

--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."posts-hashtags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."posts-hashtags_id_seq" OWNER TO postgres;

--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."posts-hashtags_id_seq" OWNED BY public."posts-hashtags".id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    token uuid NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: sessions_user-id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."sessions_user-id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."sessions_user-id_seq" OWNER TO postgres;

--
-- Name: sessions_user-id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."sessions_user-id_seq" OWNED BY public.sessions."user-id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    image text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users-like-posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."users-like-posts" (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    "post-id" integer NOT NULL
);


ALTER TABLE public."users-like-posts" OWNER TO postgres;

--
-- Name: users-like-posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users-like-posts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-like-posts_id_seq" OWNER TO postgres;

--
-- Name: users-like-posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users-like-posts_id_seq" OWNED BY public."users-like-posts".id;


--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users-like-posts_post-id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-like-posts_post-id_seq" OWNER TO postgres;

--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users-like-posts_post-id_seq" OWNED BY public."users-like-posts"."post-id";


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts-hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags" ALTER COLUMN id SET DEFAULT nextval('public."posts-hashtags_id_seq"'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: sessions user-id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN "user-id" SET DEFAULT nextval('public."sessions_user-id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users-like-posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts" ALTER COLUMN id SET DEFAULT nextval('public."users-like-posts_id_seq"'::regclass);


--
-- Name: users-like-posts post-id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts" ALTER COLUMN "post-id" SET DEFAULT nextval('public."users-like-posts_post-id_seq"'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashtags (id, name) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, "user-id", date, text, url) FROM stdin;
\.


--
-- Data for Name: posts-hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."posts-hashtags" (id, "post-id", "hashtag-id") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "user-id", token) FROM stdin;
1	1	5ed4f08d-cff6-406a-ad59-27d3322cd191
2	2	0053ef57-e873-48be-ba9a-a8066dfb5648
3	3	97a4882e-6ace-440c-b66d-837793b3b8e9
4	3	0c8a9498-f8ab-4c6d-aca3-a766363ee2c7
5	3	67ca7d59-50ee-4980-bf73-aabf11019290
6	11	703f520d-2a39-495b-be94-e7951c5d9000
7	11	d42fdf98-1e09-4774-b3fb-9ebd3908e6a3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, image, email, password) FROM stdin;
1	Brasil	https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/2000px-Flag_of_Brazil.svg.png	aaa@aa.com	$2b$10$ZATUmNqx23C29EdoDW3S.uFXssmicvC29Ao2IZY1ywyXHcUuVoJ.G
2	Alemanha	data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAP8AAACZCAMAAADXexy/AAAACVBMVEUAAADdAAD/zgDGIigcAAAAjklEQVR4nO3PAQ0AIAAEodf+oa3hdtCADQAAAAAAAAAAAAAAAD522vzb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zbdtv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82x4uIZho613S3wAAAABJRU5ErkJggg==	sss@aa.com	$2b$10$eFcp1hZNcJmfOThTGbbiNuFfEggz1M73qn7t2dvNbOuUY4QnmIL/S
3	Espanha	https://s2.static.brasilescola.uol.com.br/be/2022/02/bandeira-da-espanha.jpg	aaaa@aa.com	$2b$10$xXloeRrTSjF2RJHnkM495esgEMrAtFmlGaaaRPLTjs8h620pGK0ky
4	gggg	dddd	bb@bb.com	$2b$10$ouQiKgM5KG2TDkmGVu22p.l3KWpZnmL1c6LvZ//Y0tr9IHrlmYlH.
5	rafael	https://s4.static.brasilescola.uol.com.br/be/2022/01/bandeira-da-argentina.png	ccc@cc.com	$2b$10$GFSK0ecgFllGvX/yKvL0.OkK1GYApWs.iXGmeNTIpCQiH7bx6.pAi
6	fff	https://s4.static.brasilescola.uol.com.br/be/2022/01/bandeira-da-argentina.png	ccc1@cc.com	$2b$10$6mMOOuyLVyXz5PE7AKnmtOFf35EA/jhUGrvOAKDPUTqm1wDO9xe/6
7	abacaxi	data:image/jpeg;base64,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	dd@dd.com	$2b$10$uKRUaHP2ahFD6Jl9GVhZ4u4zRKFzAh/j2rrnZ5J41JvtET.rITAV6
8	ddd	https://conteudo.imguol.com.br/c/entretenimento/04/2017/12/11/abacaxi-1513012505452_v2_3x4.jpg	yy@yy.com	$2b$10$myfszJXu.BmfRkUm60BDZeQ9FmrLJ3RIgM5mWZV.lOcCSPQUffqjm
9	pp	https://www.netvasco.com.br/img/destaques/custom/destaque-20230108-113344.jpg	pp@pp.com	$2b$10$KF8ZB3iaa644S8fVeMVGNere6bSwTp0mez5/Vk56JcYOd/LoyfIDu
10	aaa	https://s2.glbimg.com/rl2qA0jqm8CYvBh7ZTnAu8NG6ds=/0x0:1999x3000/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_b58693ed41d04a39826739159bf600a0/internal_photos/bs/2021/N/1/8FdLsPS2G4uiUV4a8MOg/abacaxi.jpg	qq@qq.com	$2b$10$nDNraQ/l5/WrrghmQs1B1..SCNaGy/a4EE.JY6BgucoVnQcFwgmVC
11	dd	https://s2.glbimg.com/rl2qA0jqm8CYvBh7ZTnAu8NG6ds=/0x0:1999x3000/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_b58693ed41d04a39826739159bf600a0/internal_photos/bs/2021/N/1/8FdLsPS2G4uiUV4a8MOg/abacaxi.jpg	hh@hh.com	$2b$10$f8LT.g4RcG/KyghLO1N3Ru1n3QJmXVi0/xGhVD6EiAdLxODFBOPdG
\.


--
-- Data for Name: users-like-posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."users-like-posts" (id, "user-id", "post-id") FROM stdin;
\.


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."posts-hashtags_id_seq"', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 7, true);


--
-- Name: sessions_user-id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."sessions_user-id_seq"', 1, false);


--
-- Name: users-like-posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users-like-posts_id_seq"', 1, false);


--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users-like-posts_post-id_seq"', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: hashtags hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pk PRIMARY KEY (id);


--
-- Name: posts-hashtags posts-hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_pk" PRIMARY KEY (id);


--
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: users-like-posts users-like-posts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_pk" PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: posts-hashtags posts-hashtags_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_fk0" FOREIGN KEY ("post-id") REFERENCES public.posts(id);


--
-- Name: posts-hashtags posts-hashtags_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_fk1" FOREIGN KEY ("hashtag-id") REFERENCES public.hashtags(id);


--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: users-like-posts users-like-posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_fk0" FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: users-like-posts users-like-posts_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_fk1" FOREIGN KEY ("post-id") REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "linkrdriven" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: linkrdriven; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE linkrdriven WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE linkrdriven OWNER TO postgres;

\connect linkrdriven

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    comment text NOT NULL,
    "user-id" integer NOT NULL,
    "post-id" integer NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    "followed-id" integer NOT NULL
);


ALTER TABLE public.followers OWNER TO postgres;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.followers_id_seq OWNER TO postgres;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.hashtags OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    date timestamp with time zone DEFAULT '2023-01-10 10:26:02.958328+00'::timestamp with time zone NOT NULL,
    text text NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts-hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."posts-hashtags" (
    id integer NOT NULL,
    "post-id" integer NOT NULL,
    "hashtag-id" integer NOT NULL
);


ALTER TABLE public."posts-hashtags" OWNER TO postgres;

--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."posts-hashtags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."posts-hashtags_id_seq" OWNER TO postgres;

--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."posts-hashtags_id_seq" OWNED BY public."posts-hashtags".id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: reposts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reposts (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    "reposted-post-id" integer NOT NULL,
    date time with time zone DEFAULT '10:26:03.241919+00'::time with time zone NOT NULL
);


ALTER TABLE public.reposts OWNER TO postgres;

--
-- Name: reposts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reposts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reposts_id_seq OWNER TO postgres;

--
-- Name: reposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reposts_id_seq OWNED BY public.reposts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    token uuid NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: sessions_user-id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."sessions_user-id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."sessions_user-id_seq" OWNER TO postgres;

--
-- Name: sessions_user-id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."sessions_user-id_seq" OWNED BY public.sessions."user-id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    image text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users-like-posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."users-like-posts" (
    id integer NOT NULL,
    "user-id" integer NOT NULL,
    "post-id" integer NOT NULL
);


ALTER TABLE public."users-like-posts" OWNER TO postgres;

--
-- Name: users-like-posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users-like-posts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-like-posts_id_seq" OWNER TO postgres;

--
-- Name: users-like-posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users-like-posts_id_seq" OWNED BY public."users-like-posts".id;


--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users-like-posts_post-id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-like-posts_post-id_seq" OWNER TO postgres;

--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users-like-posts_post-id_seq" OWNED BY public."users-like-posts"."post-id";


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts-hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags" ALTER COLUMN id SET DEFAULT nextval('public."posts-hashtags_id_seq"'::regclass);


--
-- Name: reposts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reposts ALTER COLUMN id SET DEFAULT nextval('public.reposts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: sessions user-id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN "user-id" SET DEFAULT nextval('public."sessions_user-id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users-like-posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts" ALTER COLUMN id SET DEFAULT nextval('public."users-like-posts_id_seq"'::regclass);


--
-- Name: users-like-posts post-id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts" ALTER COLUMN "post-id" SET DEFAULT nextval('public."users-like-posts_post-id_seq"'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, comment, "user-id", "post-id") FROM stdin;
1	Triste Notícia	1	1
2	Importante	1	2
3	Importante	1	2
4	Importante	1	2
5	O cara é doido kkkk	3	1
6	Sim	6	4
7	olá	6	4
8	sim	6	4
9	sim	6	4
10	grande jogador	6	1
11	Que notícia	6	2
12	olá	7	4
13	doido	8	3
14	bom site	8	5
15	oi	9	3
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.followers (id, "user-id", "followed-id") FROM stdin;
1	9	8
2	9	2
\.


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashtags (id, name) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, "user-id", date, text, url) FROM stdin;
1	2	2023-01-10 20:39:58.961847+00	Dinamite	https://ge.globo.com/futebol/times/vasco/noticia/2023/01/09/em-velorio-de-roberto-dinamite-cafu-comenta-ausencia-de-jogadores-em-adeus-a-pele.ghtml
2	2	2023-01-11 02:15:47.378549+00	Messi	https://www.uol.com.br/esporte/futebol/ultimas-noticias/2023/01/10/psg-prepara-novo-contrato-de-campeao-do-mundo-para-messi-diz-jornal.htm
3	2	2023-01-12 01:43:42.788332+00	Esse é o Neto!	https://aaronturatv.ig.com.br/neto-aparece-vai-ao-ar-na-globo-e-na-band-ao-mesmo-tempo/
4	6	2023-01-12 16:18:22.97624+00	globo	https://www.globo.com/
5	8	2023-01-13 01:13:31.075959+00	yahoo	https://br.yahoo.com/
\.


--
-- Data for Name: posts-hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."posts-hashtags" (id, "post-id", "hashtag-id") FROM stdin;
\.


--
-- Data for Name: reposts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reposts (id, "user-id", "reposted-post-id", date) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "user-id", token) FROM stdin;
1	2	9ec75c41-4f31-4859-9fd0-a9d1dc7dd67c
2	2	14641223-a6ce-4502-a4a3-b36a6ff42bba
3	4	cb1789bb-fbcb-43d4-be61-095a0b1f6975
4	4	cc46913b-c22b-4a7b-9550-30f6cb89f8d9
5	5	8f0b2a8a-5b70-43f6-8d86-82b5a8075d0d
6	6	4a0a5eae-ba2f-4730-b5c6-49312613bcf0
7	6	e3440e82-905e-49ea-888b-be6e54100420
8	7	5425386b-f329-4bb9-80f9-b276189fc4a9
9	8	075eb26c-03a5-4739-bb33-99bf2f30f2ed
12	9	6fda8726-9fae-4a61-8658-112a67428355
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, image, email, password) FROM stdin;
1	Guilherme	https://upload.wikimedia.org/wikipedia/pt/a/ac/CRVascodaGama.png	zz@zz.com	$2b$10$bBiQgp.ovoFkYh.JwvNiY.l61QItxdIduLlp0yvR6kAiMtQP.2sg2
2	Guilherme1	https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/3454.png	ii@ii.com	$2b$10$pOJBlzNufvEE1mzPbqS7cegCfccLjsJXlw7eRilFu6LD9cjR27naC
3	Yan	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1200px-Flag_of_Argentina.svg.png	yy@yy.com	$2b$10$XvYA8dxcfjIHu6wSnEVUFO8A91SK/Ug6d62Za/.ucm7T6a7z/UD2y
4	aaaaa	data:image/png;base64,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	aa1@aa.com	$2b$10$cgDlNkig8XM2ASNXzSxH0.oQqQDF/.FpzR7G8iaCVGXuw1ds5wFES
5	bb1	data:image/png;base64,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	bb1@bb.com	$2b$10$qnSfnJ17uugV5BZ3z3YIYuwNVhMRCObKNx/lSE5sp6KD4GPlr4QMG
6	123	data:image/jpeg;base64,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	ss1@ss.com	$2b$10$85OTeWjGAUPMQDEzlsr72uWL9XEKjdMb8NBC3i0KbIkQ999kRUsrO
7	ddd	https://www.figueiralaser.com.br/site/fotoTexturaMaterial?id_recorte_personalizado=828&id_materia_prima=1612&tamanho=290x290	dd1@dd.com	$2b$10$/ObOjdwb4nlf9vdbLpr4heQZBX/dQ.eeYBau9oUEUis0r34ZYd0Ha
8	hh1	https://s2.glbimg.com/tntiJmTl-z23c7UsDRJgUI7n6i8=/0x107:2048x1259/1080x608/smart/filters:max_age(3600)/https://i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2022/N/v/YL8QOiS4q2nOQAdT53Sg/52489844595-dba2d94a39-k.jpg	hh1@hh.com	$2b$10$xnqO.y.vH8er4/IBYl9k7O0QGNgP2deT5uU/3pjnBLYlYuiEbDllK
9	yy1	https://s2.glbimg.com/jKfRC6QIe_a4-admtiuBW8mKgZQ=/0x0:757x426/fit-in/515x290/middle/smart/filters:strip_icc():strip_exif():format(webp)/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/A/f/MAhtkPR6i47yBIQyAljQ/americanas-loja-divulgacao.jpg	yy1@yy.com	$2b$10$FN8SjFUidANKCGUu/GoxcugrVl087bstgJjUj41MaDIR/TDDDnU66
10	gg1	https://s2.glbimg.com/jKfRC6QIe_a4-admtiuBW8mKgZQ=/0x0:757x426/fit-in/515x290/middle/smart/filters:strip_icc():strip_exif():format(webp)/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/A/f/MAhtkPR6i47yBIQyAljQ/americanas-loja-divulgacao.jpg	gg1@gg.com	$2b$10$noR0Kmb.sr7qqdtb9YXN4uyZWs9aOt8QtaAtWiwazK0JNfBFTOaG2
\.


--
-- Data for Name: users-like-posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."users-like-posts" (id, "user-id", "post-id") FROM stdin;
6	6	1
10	8	1
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 15, true);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.followers_id_seq', 2, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: posts-hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."posts-hashtags_id_seq"', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 5, true);


--
-- Name: reposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reposts_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 12, true);


--
-- Name: sessions_user-id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."sessions_user-id_seq"', 1, false);


--
-- Name: users-like-posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users-like-posts_id_seq"', 10, true);


--
-- Name: users-like-posts_post-id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users-like-posts_post-id_seq"', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: followers followers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pk PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pk PRIMARY KEY (id);


--
-- Name: posts-hashtags posts-hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_pk" PRIMARY KEY (id);


--
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: users-like-posts users-like-posts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_pk" PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: comments comments_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: comments comments_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_fk1 FOREIGN KEY ("post-id") REFERENCES public.posts(id);


--
-- Name: followers followers_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: followers followers_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_fk1 FOREIGN KEY ("followed-id") REFERENCES public.users(id);


--
-- Name: posts-hashtags posts-hashtags_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_fk0" FOREIGN KEY ("post-id") REFERENCES public.posts(id);


--
-- Name: posts-hashtags posts-hashtags_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."posts-hashtags"
    ADD CONSTRAINT "posts-hashtags_fk1" FOREIGN KEY ("hashtag-id") REFERENCES public.hashtags(id);


--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: reposts reposts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT reposts_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: reposts reposts_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT reposts_fk1 FOREIGN KEY ("reposted-post-id") REFERENCES public.posts(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: users-like-posts users-like-posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_fk0" FOREIGN KEY ("user-id") REFERENCES public.users(id);


--
-- Name: users-like-posts users-like-posts_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."users-like-posts"
    ADD CONSTRAINT "users-like-posts_fk1" FOREIGN KEY ("post-id") REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "ola" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ola; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ola WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE ola OWNER TO postgres;

\connect ola

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cakes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cakes (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric NOT NULL,
    image character varying NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.cakes OWNER TO postgres;

--
-- Name: cakes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cakes_id_seq OWNER TO postgres;

--
-- Name: cakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cakes_id_seq OWNED BY public.cakes.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "clientId" integer NOT NULL,
    "cakeId" integer NOT NULL,
    quantity integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "totalPrice" numeric NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: cakes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes ALTER COLUMN id SET DEFAULT nextval('public.cakes_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Data for Name: cakes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cakes (id, name, price, image, description) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, address, phone) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, "clientId", "cakeId", quantity, "createdAt", "totalPrice") FROM stdin;
\.


--
-- Name: cakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cakes_id_seq', 1, false);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: cakes cakes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "operacoes" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: operacoes; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE operacoes WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE operacoes OWNER TO postgres;

\connect operacoes

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf character varying(11) NOT NULL,
    numero_compras integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, cpf, numero_compras) FROM stdin;
1	Allana Fidalgo Moreira	12345678900	4
3	Orlando Pequeno Jesus	10293847560	1
4	Olga Cascais Fortunato	01928374650	2
5	Martinha Lima Zambujal	11992288445	2
6	Anabela Baptista Soverosa	22883377446	6
7	Raul Arouca Pederneiras	11889922385	1
8	Chico Buarque de Holanda	65719484743	10
10	Patrícia Toste Prudente	19847457596	3
11	Renato Caldeira Falcão	46761645912	1
9	Lucca Santarém Branco	48769275911	5
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 11, true);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: tipo_condicao; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_condicao AS ENUM (
    'novo',
    'seminovo',
    'usado'
);


ALTER TYPE public.tipo_condicao OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cakes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cakes (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric NOT NULL,
    mage character varying NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.cakes OWNER TO postgres;

--
-- Name: cakes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cakes_id_seq OWNER TO postgres;

--
-- Name: cakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cakes_id_seq OWNED BY public.cakes.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "clientId" integer NOT NULL,
    "cakeId" integer NOT NULL,
    quantity integer NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "totalPrice" numeric NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome text NOT NULL,
    preco integer NOT NULL,
    condicao public.tipo_condicao NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    visits integer DEFAULT 0 NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cakes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes ALTER COLUMN id SET DEFAULT nextval('public.cakes_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cakes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cakes (id, name, price, mage, description) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, address, phone) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, "clientId", "cakeId", quantity, "createdAt", "totalPrice") FROM stdin;
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome, preco, condicao) FROM stdin;
1	Televisão 43"	139997	novo
2	Televisão 55"	250000	seminovo
3	Notebook Entrada	200000	seminovo
4	Notebook Intermediário	350000	novo
5	Notebook Topo de Linha	600000	novo
6	Celular Entrada	80000	seminovo
7	Celular Intermediário	160000	usado
8	Celular Topo de Linha	340000	usado
9	Pelúcia Strange Planet com Gatinho	7051	novo
10	Violão Lava ME 2	860000	seminovo
11	Bicicleta Elétrica	370000	usado
12	Fone Entrada	2000	novo
13	Fone Intermediário	20000	seminovo
14	Fone Topo de Linha	80000	usado
15	Televisão 32"	100000	usado
16	Televisão 75"	700000	seminovo
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, url, "shortUrl", visits, "userId", "createdAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, "createdAt") FROM stdin;
\.


--
-- Name: cakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cakes_id_seq', 1, false);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 16, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: cakes cakes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_name_key UNIQUE (name);


--
-- Name: cakes cakes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: orders FK_CAKE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_CAKE" FOREIGN KEY ("cakeId") REFERENCES public.cakes(id) ON DELETE CASCADE;


--
-- Name: orders FK_CLIENT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_CLIENT" FOREIGN KEY ("clientId") REFERENCES public.clients(id) ON DELETE CASCADE;


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "shortly" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: shortly; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shortly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE shortly OWNER TO postgres;

\connect shortly

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    visits integer DEFAULT 0 NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "userId") FROM stdin;
2	2
3	2
4	1
5	1
6	1
7	1
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, url, "shortUrl", visits, "userId", "createdAt") FROM stdin;
1	https://vasco.com.br/	FnT_UkcUwskSh_RXpzoBd	0	2	2023-02-22 14:51:53.555944
2	https://vasco.com.br/	Qbq-HvQww9EycLjOevtUl	0	2	2023-02-22 14:52:16.766619
3	https://vasco.com.br/	JVPpBk6q2ABpT2NnSeC8i	0	1	2023-02-22 14:52:40.314667
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
1	Guiii	aa@aa.com	$2b$10$k56hNxekq9R5DzBbG2Vncemv6SbUQMqUBYAEuTFjwZ0L6E3CINSN6
2	Guwww	ab@aa.com	$2b$10$8uChFklb..q98sH0omNiB.w5xCq2HUGjROC2qPt9jcxfe1qcZ9IM.
3	Guwww	bb@bb.com	$2b$10$tDKwJGCONRS/XUzxJs954umesP85RUfmRmEifpCRJ5CiQuIL08TrG
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 7, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE test OWNER TO postgres;

\connect test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

