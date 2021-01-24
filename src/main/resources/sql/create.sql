SET client_encoding = 'UTF8';

CREATE SCHEMA cars;

ALTER SCHEMA cars OWNER TO postgres;
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


COMMENT ON COLUMN brand_car.id IS 'Идентификатор марки автомобиля';
COMMENT ON COLUMN brand_car.name IS 'Наименование марки автомобиля';

CREATE SEQUENCE brand_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brand_car_id_seq OWNER TO postgres;
ALTER SEQUENCE brand_car_id_seq OWNED BY brand_car.id;
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
COMMENT ON TABLE cars IS 'Машины';
COMMENT ON COLUMN cars.id IS 'Идентификатор машины ';
COMMENT ON COLUMN cars.model IS 'Модель автомобиля';
COMMENT ON COLUMN cars.release_date IS 'Дата выпуска';
COMMENT ON COLUMN cars.engine_displacement IS 'Рабочий объём двигателя';
COMMENT ON COLUMN cars.turbocharger IS 'Наличие турбонагнетателя';
COMMENT ON COLUMN cars.horsepower IS 'Лошадиная сила';
COMMENT ON COLUMN cars.brand_id IS 'Идентификатор марки';
COMMENT ON COLUMN cars.transmission_id IS 'Идентификатор трансмиссии';
COMMENT ON COLUMN cars.drive_id IS 'Идентификатор привода машины';
COMMENT ON COLUMN cars.body_id IS 'Идентификатор кузова ';
COMMENT ON COLUMN cars.colour_id IS 'Идентификатор цвета';

CREATE SEQUENCE cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cars_id_seq OWNER TO postgres;
ALTER SEQUENCE cars_id_seq OWNED BY cars.id;

CREATE TABLE characteristics_car (
    id integer NOT NULL,
    characteristic jsonb NOT NULL
);


ALTER TABLE characteristics_car OWNER TO postgres;
COMMENT ON TABLE characteristics_car IS 'Характеристики машины';
COMMENT ON COLUMN characteristics_car.id IS 'Идентификатор характеристики машины';
COMMENT ON COLUMN characteristics_car.characteristic IS 'Характеристика';
CREATE SEQUENCE characteristics_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE characteristics_car_id_seq OWNER TO postgres;
ALTER SEQUENCE characteristics_car_id_seq OWNED BY characteristics_car.id;

CREATE TABLE characteristics_car_links (
    id integer NOT NULL,
    car_id integer NOT NULL,
    characteristic_id integer
);

ALTER TABLE characteristics_car_links OWNER TO postgres;
COMMENT ON TABLE characteristics_car_links IS 'Ссылки на характеристики';
COMMENT ON COLUMN characteristics_car_links.id IS 'Идентификатор ссылки';
COMMENT ON COLUMN characteristics_car_links.car_id IS 'Идентификатор машины';
COMMENT ON COLUMN characteristics_car_links.characteristic_id IS 'Идентификатор характеристики';

CREATE SEQUENCE characteristics_car_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE characteristics_car_links_id_seq OWNER TO postgres;
ALTER SEQUENCE characteristics_car_links_id_seq OWNED BY characteristics_car_links.id;

CREATE TABLE colours_car (
    id integer NOT NULL,
    name character varying NOT NULL
);

ALTER TABLE colours_car OWNER TO postgres;
COMMENT ON TABLE colours_car IS 'Цвета машин';
COMMENT ON COLUMN colours_car.id IS 'Идентификатор';
COMMENT ON COLUMN colours_car.name IS 'Наименование цвета';

CREATE SEQUENCE colours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE colours_id_seq OWNER TO postgres;
ALTER SEQUENCE colours_id_seq OWNED BY colours_car.id;
CREATE TABLE drive_car (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE drive_car OWNER TO postgres;

COMMENT ON TABLE drive_car IS 'Привод автомобиля';
COMMENT ON COLUMN drive_car.id IS 'Идентификатор привода автомобиля';
COMMENT ON COLUMN drive_car.name IS 'Наименование привода автомобиля';

CREATE SEQUENCE drive_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE drive_car_id_seq OWNER TO postgres;
ALTER SEQUENCE drive_car_id_seq OWNED BY drive_car.id;

CREATE TABLE transmission_car (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE transmission_car OWNER TO postgres;
COMMENT ON TABLE transmission_car IS 'Трансмиссия автомобиля';
COMMENT ON COLUMN transmission_car.id IS 'Идентификатор трансмиссии автомобиля';
COMMENT ON COLUMN transmission_car.name IS 'Наименование трансмиссии автомобиля';

CREATE SEQUENCE transmission_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transmission_car_id_seq OWNER TO postgres;
ALTER SEQUENCE transmission_car_id_seq OWNED BY transmission_car.id;
ALTER TABLE ONLY body_car ALTER COLUMN id SET DEFAULT nextval('body_car_id_seq'::regclass);
ALTER TABLE ONLY brand_car ALTER COLUMN id SET DEFAULT nextval('brand_car_id_seq'::regclass);
ALTER TABLE ONLY cars ALTER COLUMN id SET DEFAULT nextval('cars_id_seq'::regclass);
ALTER TABLE ONLY characteristics_car ALTER COLUMN id SET DEFAULT nextval('characteristics_car_id_seq'::regclass);
ALTER TABLE ONLY characteristics_car_links ALTER COLUMN id SET DEFAULT nextval('characteristics_car_links_id_seq'::regclass);
ALTER TABLE ONLY colours_car ALTER COLUMN id SET DEFAULT nextval('colours_id_seq'::regclass);
ALTER TABLE ONLY drive_car ALTER COLUMN id SET DEFAULT nextval('drive_car_id_seq'::regclass);
ALTER TABLE ONLY transmission_car ALTER COLUMN id SET DEFAULT nextval('transmission_car_id_seq'::regclass);
SELECT pg_catalog.setval('body_car_id_seq', 1, false);
SELECT pg_catalog.setval('brand_car_id_seq', 1, false);
SELECT pg_catalog.setval('cars_id_seq', 1, false);
SELECT pg_catalog.setval('characteristics_car_id_seq', 1, false);
SELECT pg_catalog.setval('characteristics_car_links_id_seq', 1, false);
SELECT pg_catalog.setval('colours_id_seq', 1, false);
SELECT pg_catalog.setval('drive_car_id_seq', 1, false);
SELECT pg_catalog.setval('transmission_car_id_seq', 1, false);

ALTER TABLE ONLY body_car
    ADD CONSTRAINT body_car_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY body_car
    ADD CONSTRAINT body_car_name_unique UNIQUE (name);

ALTER TABLE ONLY brand_car
    ADD CONSTRAINT brand_car_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY brand_car
    ADD CONSTRAINT brand_car_name_unique UNIQUE (name);

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_all_unique_columns_except_id UNIQUE (model, release_date, engine_displacement, turbocharger, horsepower, brand_id, transmission_id, drive_id, body_id, colour_id);

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY cars
  ADD CONSTRAINT cars_release_date_check_max_min CHECK (to_char(release_date::timestamp with time zone, 'YYYYMM'::text)::integer >= 198001 AND to_char(release_date::timestamp with time zone, 'YYYYMM'::text)::integer <= 201912);


ALTER TABLE ONLY characteristics_car_links
    ADD CONSTRAINT characteristic_car_links_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY characteristics_car
    ADD CONSTRAINT characteristics_cars_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY colours_car
    ADD CONSTRAINT colours_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY drive_car
    ADD CONSTRAINT drive_car_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY drive_car
    ADD CONSTRAINT drive_car_name_unique UNIQUE (name);

ALTER TABLE ONLY transmission_car
    ADD CONSTRAINT transmission_car_id_pk PRIMARY KEY (id);

ALTER TABLE ONLY transmission_car
    ADD CONSTRAINT transmission_car_name_unique UNIQUE (name);

ALTER TABLE ONLY colours_car
    ADD CONSTRAINT unique_colours_name UNIQUE (name);

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_body_id_body_car_id_fk FOREIGN KEY (body_id) REFERENCES body_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_brand_id_brand_id_fk FOREIGN KEY (brand_id) REFERENCES brand_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_colour_id_colours_car_id_fk FOREIGN KEY (colour_id) REFERENCES colours_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_drive_id_drive_car_id_fk FOREIGN KEY (drive_id) REFERENCES drive_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_transmission_id_transmission_car_id_fk FOREIGN KEY (transmission_id) REFERENCES transmission_car(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY characteristics_car_links
    ADD CONSTRAINT characteristic_car_links_car_id_cars_id FOREIGN KEY (car_id) REFERENCES cars(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY characteristics_car_links
    ADD CONSTRAINT characteristic_car_links_characteristic_id_characteristic_car_i FOREIGN KEY (characteristic_id) REFERENCES characteristics_car(id) ON UPDATE CASCADE ON DELETE CASCADE;
