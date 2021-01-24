SET client_encoding = 'UTF8';



CREATE SCHEMA cars;


ALTER SCHEMA cars OWNER TO postgres;

--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA cars; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA cars IS 'Схема домашней работы машины';


SET search_path = cars, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;


CREATE TABLE body_car (
    id integer NOT NULL,
    name character varying NOT NULL
);
ALTER TABLE body_car OWNER TO postgres;
COMMENT ON TABLE body_car IS 'Кузов автомобиля';
COMMENT ON COLUMN body_car.id IS 'Идентификатор кузова автомобиля';
COMMENT ON COLUMN body_car.name IS 'Наименование кузова автомобиля';

CREATE SEQUENCE body_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE body_car_id_seq OWNER TO postgres;
ALTER SEQUENCE body_car_id_seq OWNED BY body_car.id;

CREATE TABLE brand_car (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE brand_car OWNER TO postgres;

COMMENT ON TABLE brand_car IS 'Марка автомобиля';


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN brand_car.id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN brand_car.id IS 'Идентификатор марки автомобиля';


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN brand_car.name; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN brand_car.name IS 'Наименование марки автомобиля';


--
-- TOC entry 181 (class 1259 OID 184486)
-- Name: brand_car_id_seq; Type: SEQUENCE; Schema: cars; Owner: postgres
--

CREATE SEQUENCE brand_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brand_car_id_seq OWNER TO postgres;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 181
-- Name: brand_car_id_seq; Type: SEQUENCE OWNED BY; Schema: cars; Owner: postgres
--

ALTER SEQUENCE brand_car_id_seq OWNED BY brand_car.id;


--
-- TOC entry 186 (class 1259 OID 192624)
-- Name: cars; Type: TABLE; Schema: cars; Owner: postgres; Tablespace:
--

CREATE TABLE cars (
    id integer NOT NULL,
    model character varying DEFAULT ''::character varying NOT NULL,
    release_date date DEFAULT '1980-01-01'::date NOT NULL,
    engine_displacement double precision DEFAULT 0.0 NOT NULL,
    turbocharger boolean DEFAULT false NOT NULL,
    horsepower double precision DEFAULT 0.0 NOT NULL,
    brand_id integer NOT NULL,
    transmission_id integer NOT NULL,
    drive_id integer NOT NULL,
    body_id integer NOT NULL,
    colour_id integer NOT NULL
);


ALTER TABLE cars OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE cars; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON TABLE cars IS 'Машины';


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.id IS 'Идентификатор машины ';


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.model; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.model IS 'Модель автомобиля';


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.release_date; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.release_date IS 'Дата выпуска';


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.engine_displacement; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.engine_displacement IS 'Рабочий объём двигателя';


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.turbocharger; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.turbocharger IS 'Наличие турбонагнетателя';


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.horsepower; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.horsepower IS 'Лошадиная сила';


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.brand_id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.brand_id IS 'Идентификатор марки';


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.transmission_id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.transmission_id IS 'Идентификатор трансмиссии';


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.drive_id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.drive_id IS 'Идентификатор привода машины';


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.body_id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.body_id IS 'Идентификатор кузова ';


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cars.colour_id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN cars.colour_id IS 'Идентификатор цвета';


--
-- TOC entry 185 (class 1259 OID 192622)
-- Name: cars_id_seq; Type: SEQUENCE; Schema: cars; Owner: postgres
--

CREATE SEQUENCE cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cars_id_seq OWNER TO postgres;

--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 185
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: cars; Owner: postgres
--

ALTER SEQUENCE cars_id_seq OWNED BY cars.id;


--
-- TOC entry 184 (class 1259 OID 192613)
-- Name: characteristics_car; Type: TABLE; Schema: cars; Owner: postgres; Tablespace:
--

CREATE TABLE characteristics_car (
    id integer NOT NULL,
    characteristic jsonb NOT NULL
);


ALTER TABLE characteristics_car OWNER TO postgres;

--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE characteristics_car; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON TABLE characteristics_car IS 'Характеристики машины';


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN characteristics_car.id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN characteristics_car.id IS 'Идентификатор характеристики машины';


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN characteristics_car.characteristic; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN characteristics_car.characteristic IS 'Характеристика';


--
-- TOC entry 183 (class 1259 OID 192611)
-- Name: characteristics_car_id_seq; Type: SEQUENCE; Schema: cars; Owner: postgres
--

CREATE SEQUENCE characteristics_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characteristics_car_id_seq OWNER TO postgres;

--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 183
-- Name: characteristics_car_id_seq; Type: SEQUENCE OWNED BY; Schema: cars; Owner: postgres
--

ALTER SEQUENCE characteristics_car_id_seq OWNED BY characteristics_car.id;


--
-- TOC entry 188 (class 1259 OID 192667)
-- Name: characteristics_car_links; Type: TABLE; Schema: cars; Owner: postgres; Tablespace:
--

CREATE TABLE characteristics_car_links (
    id integer NOT NULL,
    car_id integer NOT NULL,
    characteristic_id integer
);


ALTER TABLE characteristics_car_links OWNER TO postgres;

--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE characteristics_car_links; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON TABLE characteristics_car_links IS 'Ссылки на характеристики';


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN characteristics_car_links.id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN characteristics_car_links.id IS 'Идентификатор ссылки';


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN characteristics_car_links.car_id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN characteristics_car_links.car_id IS 'Идентификатор машины';


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN characteristics_car_links.characteristic_id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN characteristics_car_links.characteristic_id IS 'Идентификатор характеристики';


--
-- TOC entry 187 (class 1259 OID 192665)
-- Name: characteristics_car_links_id_seq; Type: SEQUENCE; Schema: cars; Owner: postgres
--

CREATE SEQUENCE characteristics_car_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characteristics_car_links_id_seq OWNER TO postgres;

--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 187
-- Name: characteristics_car_links_id_seq; Type: SEQUENCE OWNED BY; Schema: cars; Owner: postgres
--

ALTER SEQUENCE characteristics_car_links_id_seq OWNED BY characteristics_car_links.id;


--
-- TOC entry 174 (class 1259 OID 184423)
-- Name: colours_car; Type: TABLE; Schema: cars; Owner: postgres; Tablespace:
--

CREATE TABLE colours_car (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE colours_car OWNER TO postgres;

--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE colours_car; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON TABLE colours_car IS 'Цвета машин';


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN colours_car.id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN colours_car.id IS 'Идентификатор';


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN colours_car.name; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN colours_car.name IS 'Наименование цвета';


--
-- TOC entry 173 (class 1259 OID 184421)
-- Name: colours_id_seq; Type: SEQUENCE; Schema: cars; Owner: postgres
--

CREATE SEQUENCE colours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE colours_id_seq OWNER TO postgres;

--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 173
-- Name: colours_id_seq; Type: SEQUENCE OWNED BY; Schema: cars; Owner: postgres
--

ALTER SEQUENCE colours_id_seq OWNED BY colours_car.id;


--
-- TOC entry 178 (class 1259 OID 184449)
-- Name: drive_car; Type: TABLE; Schema: cars; Owner: postgres; Tablespace:
--

CREATE TABLE drive_car (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE drive_car OWNER TO postgres;

--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 178
-- Name: TABLE drive_car; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON TABLE drive_car IS 'Привод автомобиля';


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN drive_car.id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN drive_car.id IS 'Идентификатор привода автомобиля';


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN drive_car.name; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN drive_car.name IS 'Наименование привода автомобиля';


--
-- TOC entry 177 (class 1259 OID 184447)
-- Name: drive_car_id_seq; Type: SEQUENCE; Schema: cars; Owner: postgres
--

CREATE SEQUENCE drive_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE drive_car_id_seq OWNER TO postgres;

--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 177
-- Name: drive_car_id_seq; Type: SEQUENCE OWNED BY; Schema: cars; Owner: postgres
--

ALTER SEQUENCE drive_car_id_seq OWNED BY drive_car.id;


--
-- TOC entry 180 (class 1259 OID 184462)
-- Name: transmission_car; Type: TABLE; Schema: cars; Owner: postgres; Tablespace:
--

CREATE TABLE transmission_car (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE transmission_car OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 180
-- Name: TABLE transmission_car; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON TABLE transmission_car IS 'Трансмиссия автомобиля';


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN transmission_car.id; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN transmission_car.id IS 'Идентификатор трансмиссии автомобиля';


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN transmission_car.name; Type: COMMENT; Schema: cars; Owner: postgres
--

COMMENT ON COLUMN transmission_car.name IS 'Наименование трансмиссии автомобиля';


--
-- TOC entry 179 (class 1259 OID 184460)
-- Name: transmission_car_id_seq; Type: SEQUENCE; Schema: cars; Owner: postgres
--

CREATE SEQUENCE transmission_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transmission_car_id_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 179
-- Name: transmission_car_id_seq; Type: SEQUENCE OWNED BY; Schema: cars; Owner: postgres
--

ALTER SEQUENCE transmission_car_id_seq OWNED BY transmission_car.id;


--
-- TOC entry 1972 (class 2604 OID 184439)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY body_car ALTER COLUMN id SET DEFAULT nextval('body_car_id_seq'::regclass);


--
-- TOC entry 1975 (class 2604 OID 184491)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY brand_car ALTER COLUMN id SET DEFAULT nextval('brand_car_id_seq'::regclass);


--
-- TOC entry 1977 (class 2604 OID 192627)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY cars ALTER COLUMN id SET DEFAULT nextval('cars_id_seq'::regclass);


--
-- TOC entry 1976 (class 2604 OID 192616)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY characteristics_car ALTER COLUMN id SET DEFAULT nextval('characteristics_car_id_seq'::regclass);


--
-- TOC entry 1983 (class 2604 OID 192670)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY characteristics_car_links ALTER COLUMN id SET DEFAULT nextval('characteristics_car_links_id_seq'::regclass);


--
-- TOC entry 1971 (class 2604 OID 184426)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY colours_car ALTER COLUMN id SET DEFAULT nextval('colours_id_seq'::regclass);


--
-- TOC entry 1973 (class 2604 OID 184452)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY drive_car ALTER COLUMN id SET DEFAULT nextval('drive_car_id_seq'::regclass);


--
-- TOC entry 1974 (class 2604 OID 184465)
-- Name: id; Type: DEFAULT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY transmission_car ALTER COLUMN id SET DEFAULT nextval('transmission_car_id_seq'::regclass);


--
-- TOC entry 2131 (class 0 OID 184436)
-- Dependencies: 176
-- Data for Name: body_car; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY body_car (id, name) FROM stdin;
\.


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 175
-- Name: body_car_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('body_car_id_seq', 1, false);


--
-- TOC entry 2137 (class 0 OID 184488)
-- Dependencies: 182
-- Data for Name: brand_car; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY brand_car (id, name) FROM stdin;
\.


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 181
-- Name: brand_car_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('brand_car_id_seq', 1, false);


--
-- TOC entry 2141 (class 0 OID 192624)
-- Dependencies: 186
-- Data for Name: cars; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY cars (id, model, release_date, engine_displacement, turbocharger, horsepower, brand_id, transmission_id, drive_id, body_id, colour_id) FROM stdin;
\.


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 185
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('cars_id_seq', 1, false);


--
-- TOC entry 2139 (class 0 OID 192613)
-- Dependencies: 184
-- Data for Name: characteristics_car; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY characteristics_car (id, characteristic) FROM stdin;
\.


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 183
-- Name: characteristics_car_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('characteristics_car_id_seq', 1, false);


--
-- TOC entry 2143 (class 0 OID 192667)
-- Dependencies: 188
-- Data for Name: characteristics_car_links; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY characteristics_car_links (id, car_id, characteristic_id) FROM stdin;
\.


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 187
-- Name: characteristics_car_links_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('characteristics_car_links_id_seq', 1, false);


--
-- TOC entry 2129 (class 0 OID 184423)
-- Dependencies: 174
-- Data for Name: colours_car; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY colours_car (id, name) FROM stdin;
\.


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 173
-- Name: colours_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('colours_id_seq', 1, false);


--
-- TOC entry 2133 (class 0 OID 184449)
-- Dependencies: 178
-- Data for Name: drive_car; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY drive_car (id, name) FROM stdin;
\.


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 177
-- Name: drive_car_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('drive_car_id_seq', 1, false);


--
-- TOC entry 2135 (class 0 OID 184462)
-- Dependencies: 180
-- Data for Name: transmission_car; Type: TABLE DATA; Schema: cars; Owner: postgres
--

COPY transmission_car (id, name) FROM stdin;
\.


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 179
-- Name: transmission_car_id_seq; Type: SEQUENCE SET; Schema: cars; Owner: postgres
--

SELECT pg_catalog.setval('transmission_car_id_seq', 1, false);


--
-- TOC entry 1989 (class 2606 OID 184444)
-- Name: body_car_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY body_car
    ADD CONSTRAINT body_car_id_pk PRIMARY KEY (id);


--
-- TOC entry 1991 (class 2606 OID 184446)
-- Name: body_car_name_unique; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY body_car
    ADD CONSTRAINT body_car_name_unique UNIQUE (name);


--
-- TOC entry 2001 (class 2606 OID 184496)
-- Name: brand_car_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY brand_car
    ADD CONSTRAINT brand_car_id_pk PRIMARY KEY (id);


--
-- TOC entry 2003 (class 2606 OID 184498)
-- Name: brand_car_name_unique; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY brand_car
    ADD CONSTRAINT brand_car_name_unique UNIQUE (name);


--
-- TOC entry 2007 (class 2606 OID 192636)
-- Name: cars_all_unique_columns_except_id; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_all_unique_columns_except_id UNIQUE (model, release_date, engine_displacement, turbocharger, horsepower, brand_id, transmission_id, drive_id, body_id, colour_id);


--
-- TOC entry 2009 (class 2606 OID 192634)
-- Name: cars_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_id_pk PRIMARY KEY (id);


--
-- TOC entry 2011 (class 2606 OID 192672)
-- Name: characteristic_car_links_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY characteristics_car_links
    ADD CONSTRAINT characteristic_car_links_id_pk PRIMARY KEY (id);


--
-- TOC entry 2005 (class 2606 OID 192621)
-- Name: characteristics_cars_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY characteristics_car
    ADD CONSTRAINT characteristics_cars_id_pk PRIMARY KEY (id);


--
-- TOC entry 1985 (class 2606 OID 184431)
-- Name: colours_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY colours_car
    ADD CONSTRAINT colours_id_pk PRIMARY KEY (id);


--
-- TOC entry 1993 (class 2606 OID 184457)
-- Name: drive_car_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY drive_car
    ADD CONSTRAINT drive_car_id_pk PRIMARY KEY (id);


--
-- TOC entry 1995 (class 2606 OID 184459)
-- Name: drive_car_name_unique; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY drive_car
    ADD CONSTRAINT drive_car_name_unique UNIQUE (name);


--
-- TOC entry 1997 (class 2606 OID 184470)
-- Name: transmission_car_id_pk; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY transmission_car
    ADD CONSTRAINT transmission_car_id_pk PRIMARY KEY (id);


--
-- TOC entry 1999 (class 2606 OID 184472)
-- Name: transmission_car_name_unique; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY transmission_car
    ADD CONSTRAINT transmission_car_name_unique UNIQUE (name);


--
-- TOC entry 1987 (class 2606 OID 184433)
-- Name: unique_colours_name; Type: CONSTRAINT; Schema: cars; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY colours_car
    ADD CONSTRAINT unique_colours_name UNIQUE (name);


--
-- TOC entry 2015 (class 2606 OID 192652)
-- Name: cars_body_id_body_car_id_fk; Type: FK CONSTRAINT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_body_id_body_car_id_fk FOREIGN KEY (body_id) REFERENCES body_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2012 (class 2606 OID 192637)
-- Name: cars_brand_id_brand_id_fk; Type: FK CONSTRAINT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_brand_id_brand_id_fk FOREIGN KEY (brand_id) REFERENCES brand_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2016 (class 2606 OID 192657)
-- Name: cars_clour_id_colours_car_id_fk; Type: FK CONSTRAINT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_clour_id_colours_car_id_fk FOREIGN KEY (colour_id) REFERENCES colours_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2014 (class 2606 OID 192647)
-- Name: cars_drive_id_drive_car_id_fk; Type: FK CONSTRAINT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_drive_id_drive_car_id_fk FOREIGN KEY (drive_id) REFERENCES drive_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2013 (class 2606 OID 192642)
-- Name: cars_transmission_id_transmission_car_id_fk; Type: FK CONSTRAINT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_transmission_id_transmission_car_id_fk FOREIGN KEY (transmission_id) REFERENCES transmission_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2017 (class 2606 OID 192673)
-- Name: characteristic_car_links_car_id_cars_id; Type: FK CONSTRAINT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY characteristics_car_links
    ADD CONSTRAINT characteristic_car_links_car_id_cars_id FOREIGN KEY (car_id) REFERENCES cars(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2018 (class 2606 OID 192678)
-- Name: characteristic_car_links_characteristic_id_characteristic_car_i; Type: FK CONSTRAINT; Schema: cars; Owner: postgres
--

ALTER TABLE ONLY characteristics_car_links
    ADD CONSTRAINT characteristic_car_links_characteristic_id_characteristic_car_i FOREIGN KEY (characteristic_id) REFERENCES characteristics_car(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-01-24 19:40:33 MSK

--
-- PostgreSQL database dump complete
--
