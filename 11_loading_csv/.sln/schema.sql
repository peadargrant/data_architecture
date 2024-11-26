
CREATE TABLE public.cities (
    city text NOT NULL,
    city_ascii text NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    country text NOT NULL,
    iso2 text NOT NULL,
    iso3 text NOT NULL,
    admin_name text NOT NULL,
    capital text NOT NULL,
    population double precision,
    id bigint NOT NULL
);


ALTER TABLE public.cities OWNER TO grantp;


ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_id_key UNIQUE (id);
