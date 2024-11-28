CREATE DOMAIN public.amount AS numeric(10,2);
CREATE DOMAIN public.rate AS numeric(3,2);

CREATE TABLE public.department (
    id bigint NOT NULL,
    name text NOT NULL,
    discount public.rate DEFAULT 0 NOT NULL
);

CREATE SEQUENCE public.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;


CREATE TABLE public.product (
    id bigint NOT NULL,
    department bigint,
    name text NOT NULL,
    price public.amount NOT NULL
);

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;

ALTER TABLE ONLY public.department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);
ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);

COPY public.department (id, name, discount) FROM stdin;
1	Paintings	0.00
2	Pottery	0.00
3	Knitwear	0.00
4	Candles	0.00
5	Woodwork	0.00
\.

COPY public.product (id, department, name, price) FROM stdin;
1	1	Mountains painting	200.00
2	1	River painting	200.00
3	1	Seaside painting	200.00
4	2	Mug	20.00
5	2	Plate	20.00
6	2	Cup	20.00
7	2	Saucer	20.00
8	2	Bowl	20.00
9	2	Side plate	20.00
10	2	Pizza plate	30.00
11	3	Childs hat	10.00
12	3	Adults hat	15.00
13	3	Blue scarf	25.00
14	3	Multi-colour scarf	30.00
15	4	Lemongrass candle	15.00
16	4	Orange and bergamot candle	15.00
17	\N	Clearance item	10.00
18	\N	Damaged item	10.00
\.

SELECT pg_catalog.setval('public.department_id_seq', 5, true);
SELECT pg_catalog.setval('public.product_id_seq', 18, true);


ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_name_key UNIQUE (name);

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_name_key UNIQUE (name);

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_department_fkey FOREIGN KEY (department) REFERENCES public.department(id);


