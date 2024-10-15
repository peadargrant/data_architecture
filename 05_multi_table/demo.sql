--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-1.pgdg18.04+1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-1.pgdg18.04+1)

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
-- Name: amount; Type: DOMAIN; Schema: public; Owner: grantp
--

CREATE DOMAIN public.amount AS numeric(6,2);


ALTER DOMAIN public.amount OWNER TO grantp;

--
-- Name: rate; Type: DOMAIN; Schema: public; Owner: grantp
--

CREATE DOMAIN public.rate AS numeric(6,4);


ALTER DOMAIN public.rate OWNER TO grantp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: producer; Type: TABLE; Schema: public; Owner: grantp
--

CREATE TABLE public.producer (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.producer OWNER TO grantp;

--
-- Name: producer_id_seq; Type: SEQUENCE; Schema: public; Owner: grantp
--

CREATE SEQUENCE public.producer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producer_id_seq OWNER TO grantp;

--
-- Name: producer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grantp
--

ALTER SEQUENCE public.producer_id_seq OWNED BY public.producer.id;


--
-- Name: producer_total; Type: VIEW; Schema: public; Owner: grantp
--

CREATE VIEW public.producer_total AS
SELECT
    NULL::text AS name,
    NULL::bigint AS item_count,
    NULL::numeric AS total_sales;


ALTER TABLE public.producer_total OWNER TO grantp;

--
-- Name: sale; Type: TABLE; Schema: public; Owner: grantp
--

CREATE TABLE public.sale (
    id integer NOT NULL,
    producer integer NOT NULL,
    description text NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    total_price public.amount NOT NULL,
    tender integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sale OWNER TO grantp;

--
-- Name: sale_id_seq; Type: SEQUENCE; Schema: public; Owner: grantp
--

CREATE SEQUENCE public.sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_id_seq OWNER TO grantp;

--
-- Name: sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grantp
--

ALTER SEQUENCE public.sale_id_seq OWNED BY public.sale.id;


--
-- Name: tender; Type: TABLE; Schema: public; Owner: grantp
--

CREATE TABLE public.tender (
    id integer NOT NULL,
    name text NOT NULL,
    rate public.rate DEFAULT 0 NOT NULL
);


ALTER TABLE public.tender OWNER TO grantp;

--
-- Name: tender_id_seq; Type: SEQUENCE; Schema: public; Owner: grantp
--

CREATE SEQUENCE public.tender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tender_id_seq OWNER TO grantp;

--
-- Name: tender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grantp
--

ALTER SEQUENCE public.tender_id_seq OWNED BY public.tender.id;


--
-- Name: today_tender; Type: VIEW; Schema: public; Owner: grantp
--

CREATE VIEW public.today_tender AS
SELECT
    NULL::text AS name,
    NULL::numeric AS total;


ALTER TABLE public.today_tender OWNER TO grantp;

--
-- Name: producer id; Type: DEFAULT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.producer ALTER COLUMN id SET DEFAULT nextval('public.producer_id_seq'::regclass);


--
-- Name: sale id; Type: DEFAULT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.sale ALTER COLUMN id SET DEFAULT nextval('public.sale_id_seq'::regclass);


--
-- Name: tender id; Type: DEFAULT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.tender ALTER COLUMN id SET DEFAULT nextval('public.tender_id_seq'::regclass);


--
-- Data for Name: producer; Type: TABLE DATA; Schema: public; Owner: grantp
--

COPY public.producer (id, name) FROM stdin;
1	Maeve
2	Jim
3	Pat
\.


--
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: grantp
--

COPY public.sale (id, producer, description, quantity, total_price, tender, "timestamp") FROM stdin;
1	1	Mug	1	10.00	1	2024-10-15 16:36:33.705057
2	1	Mug	1	10.00	1	2024-10-15 16:36:33.705057
3	1	Set of plates	1	50.00	1	2024-10-15 16:36:33.705057
4	1	Plate	1	15.00	2	2024-10-15 16:36:33.705057
5	1	Jug	1	15.00	2	2024-10-15 16:36:33.705057
6	2	Wooden toy	1	15.00	2	2024-10-15 16:36:33.705057
7	2	Wooden spoon	1	15.00	2	2024-10-15 16:36:33.705057
8	2	Wooden egg cup	1	5.00	2	2024-10-15 16:36:33.705057
9	2	Wooden fork	1	5.00	3	2024-10-15 16:36:33.705057
10	3	Wicker basket	1	5.00	3	2024-10-15 16:36:33.705057
11	3	Wicker basket large	1	50.00	1	2024-10-15 16:36:33.705057
\.


--
-- Data for Name: tender; Type: TABLE DATA; Schema: public; Owner: grantp
--

COPY public.tender (id, name, rate) FROM stdin;
1	Cash	0.0000
2	Card	0.0000
3	Revolut	0.0000
\.


--
-- Name: producer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grantp
--

SELECT pg_catalog.setval('public.producer_id_seq', 3, true);


--
-- Name: sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grantp
--

SELECT pg_catalog.setval('public.sale_id_seq', 11, true);


--
-- Name: tender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grantp
--

SELECT pg_catalog.setval('public.tender_id_seq', 3, true);


--
-- Name: producer producer_name_key; Type: CONSTRAINT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.producer
    ADD CONSTRAINT producer_name_key UNIQUE (name);


--
-- Name: producer producer_pkey; Type: CONSTRAINT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.producer
    ADD CONSTRAINT producer_pkey PRIMARY KEY (id);


--
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- Name: tender tender_name_key; Type: CONSTRAINT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.tender
    ADD CONSTRAINT tender_name_key UNIQUE (name);


--
-- Name: tender tender_pkey; Type: CONSTRAINT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.tender
    ADD CONSTRAINT tender_pkey PRIMARY KEY (id);


--
-- Name: today_tender _RETURN; Type: RULE; Schema: public; Owner: grantp
--

CREATE OR REPLACE VIEW public.today_tender AS
 SELECT tender.name,
    sum((sale.total_price)::numeric) AS total
   FROM (public.sale
     JOIN public.tender ON ((tender.id = sale.tender)))
  WHERE ((sale."timestamp")::date = (now())::date)
  GROUP BY tender.id
  ORDER BY tender.id;


--
-- Name: producer_total _RETURN; Type: RULE; Schema: public; Owner: grantp
--

CREATE OR REPLACE VIEW public.producer_total AS
 SELECT producer.name,
    sum(sale.quantity) AS item_count,
    sum((sale.total_price)::numeric) AS total_sales
   FROM (public.sale
     JOIN public.producer ON ((producer.id = sale.producer)))
  GROUP BY producer.id
  ORDER BY (sum((sale.total_price)::numeric)) DESC;


--
-- Name: sale sale_producer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_producer_fkey FOREIGN KEY (producer) REFERENCES public.producer(id);


--
-- Name: sale sale_tender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grantp
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_tender_fkey FOREIGN KEY (tender) REFERENCES public.tender(id);


--
-- PostgreSQL database dump complete
--

