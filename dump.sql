--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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
    user_id integer,
    token text
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
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    id_cliente integer,
    date date,
    description text,
    value numeric,
    type text
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    email text,
    password text
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
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, token) FROM stdin;
10	1	f98adc2e-b7ff-4de2-9abe-7009c32e0d15
11	3	db1d58f0-7d74-4441-8462-4da97371bbe1
12	3	79316670-dc38-4a00-bbbf-1f71e389b096
13	3	e4410ae6-bfb9-49ae-9c21-468a58ae15e5
14	3	539dd77d-3c96-40c8-89f4-4ac8736d26bf
15	1	25aa5a0a-4725-4ab3-9e3e-44e777018a33
16	1	4ce5f17d-1735-4f78-9d7d-28bdfa773ea5
17	1	5889eb57-1434-4e74-811f-b47b27f5da53
18	1	0aeac377-0786-4c9b-845e-2b836b07164f
19	1	048a67cc-c681-46c7-961f-eef0d13d85ee
20	1	eb68259b-bcfc-4e5a-bf59-33736ed32fca
22	3	a4061546-b7a8-4fbb-8731-cb838cf25de5
23	1	7d45992b-8273-4213-bbc1-28fdc6afec61
24	1	4eb8b304-810f-4861-b47d-76013529a1fb
25	1	7af42fba-0c55-4fed-8e3d-7bef929c4e23
26	1	ef307b77-65ca-4275-b4fe-81dc316e4636
27	1	dc8370e8-20cd-4eea-a73e-b791a4d7bf17
28	1	6ef31a36-1a3e-465b-93ea-7d6af6bb50bb
29	1	47342f36-3d13-44a5-8d1f-a228c3da07d5
31	3	3f045b2c-adb2-4f7b-a42c-28fafebbcce9
35	1	e58d290a-4680-491f-96a0-1aafc12a2f74
36	1	2e759dac-43a0-403f-b195-cd5cc7294892
37	1	b9e749f0-0209-404b-b538-1c8fc90510be
40	1	ce22fc6f-b4c6-424f-ba6f-ce74bb2cee30
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, id_cliente, date, description, value, type) FROM stdin;
3	1	2021-10-24	jantar com o lucas	60	positive
4	1	2021-10-24	jantar com o lucas	60	negative
5	1	2021-10-24	jantar com o lucas	60	negative
6	1	2021-10-24	jantar com o lucas	60	negative
7	1	2021-10-24	jantar com o lucas	60	negative
8	1	2021-10-24	jantar com o lucas	60	negative
9	1	2021-10-24	jantar com o lucas	60.00	negative
10	3	2021-10-24	jantar com o lucas	60.00	positive
11	3	2021-10-24	jantar com o lucas	60.00	positive
12	3	2021-10-24	jantar com o lucas	30.00	negative
13	1	2021-10-24	testando	70	negative
14	1	2021-10-24	oi	14	negative
15	1	2021-10-24	loteria	400	positive
16	1	2021-10-24	hey	2.51	positive
17	1	2021-10-24	h	4	negative
18	1	2021-10-24	h	2.4	negative
19	1	2021-10-24	gaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	0.6	negative
20	1	2021-10-24	mae	2	positive
21	1	2021-10-24	h	4.77	positive
22	1	2021-10-24	real	1	negative
23	1	2021-10-24	lulu	90.00	negative
24	1	2021-10-24	loteriaaaa	400	positive
25	1	2021-10-25	batata	4.000000000000	negative
26	1	2021-10-25	batatinha	4.00000001	negative
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
1	abacate	abacate@salgado.com	$2b$10$N/U9UlASzSMrnhuq1.PPs.2hRY4gedby3BQ1z7JEXnP69em11XFO2
3	abacate	abacate@doce.com	$2b$10$MlYQ.Fr4Con1jd1WAqnnv.LGjc0ZQ5f4xut93wrvkS44FkdQU6Sia
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 40, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 26, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- PostgreSQL database dump complete
--

