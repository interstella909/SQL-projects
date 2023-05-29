--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -;
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public;
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    shape text NOT NULL,
    has_dark_matter boolean NOT NULL,
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; 
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public;
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; 
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    is_tidal_locked boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    has_life boolean NOT NULL,
    is_inhabitable boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; 
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    is_main_sequence boolean NOT NULL,
    is_binary boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; 
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; 
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; 
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; 
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; 
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 'Barred spiral', true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 23000, 'Spiral', true, 1);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 10000, 'Elliptical', true, 2);
INSERT INTO public.galaxy VALUES (4, 'M82', 10000, 'Irregular', false, 3);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 11000, 'Lenticular', true, 2);
INSERT INTO public.galaxy VALUES (6, 'Tadpole', 2000, 'Irregular', false, 3);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; 
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Spiral galaxies are characterized by a rotating disk of stars and gas, with a central bulge and spiral arms.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Elliptical galaxies are characterized by an ellipsoidal shape and a lack of visible structure or spiral arms.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Irregular galaxies have no particular shape or structure, and are often the result of interactions or mergers between other galaxies.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; 
--

INSERT INTO public.moon VALUES (1, 'Luna', 4470, 7342000.00, true, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4470, 1080000.00, false, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4470, 2400000.00, false, true, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4550, 1481900.00, true, true, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 4510, 4800000.00, true, true, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 4560, 1075900.00, true, true, 3);
INSERT INTO public.moon VALUES (7, 'Titan', 4530, 1345200.00, true, true, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', 4500, 108000.00, true, true, 4);
INSERT INTO public.moon VALUES (9, 'Mimas', 4570, 3750000.00, false, true, 4);
INSERT INTO public.moon VALUES (10, 'Charon', 4430, 1520000.00, true, true, 5);
INSERT INTO public.moon VALUES (11, 'Nix', 4440, 4500000.00, false, true, 5);
INSERT INTO public.moon VALUES (12, 'Hydra', 4440, 4200000.00, false, true, 5);
INSERT INTO public.moon VALUES (13, 'Phoebe', 4600, 8292000.00, false, false, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 4560, 5620000.00, false, true, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 4560, 1805000.00, true, true, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 4520, 6590000.00, true, true, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 4580, 1290000.00, true, true, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 4580, 1270000.00, true, true, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 4450, 2140000.00, true, true, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 4430, 2060000.00, false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public;
--

INSERT INTO public.planet VALUES (1, 'Earth', 5, 5.97, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 5, 0.64, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 5, 1898.00, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 5, 568.00, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 5, 102.00, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 5, 86.80, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-10b', 10, 3.70, false, true, 2);
INSERT INTO public.planet VALUES (8, 'HD 209458 b', 5, 0.69, false, true, 2);
INSERT INTO public.planet VALUES (9, 'Gliese 581d', 7, 5.60, true, true, 2);
INSERT INTO public.planet VALUES (10, 'PSR B1620-26 b', 13, 2.50, false, false, 3);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 1, 1.40, false, false, 3);
INSERT INTO public.planet VALUES (12, 'KELT-9b', 0, 2.88, false, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; 
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 1.99, true, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 8600, 20.00, false, false, 1);
INSERT INTO public.star VALUES (3, 'Vega', 455, 2.14, true, false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 6200, 1.10, true, true, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 2300, 2.02, true, false, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 6000, 0.12, true, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; 
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; 
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; 
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_type unique_name; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

