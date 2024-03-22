--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying,
    galaxy_distance_inmillions numeric NOT NULL,
    galaxy_diameter_inlightyears integer NOT NULL,
    galaxy_mass_inlightyears integer,
    galaxy_hassmbh boolean,
    galaxy_hasagn boolean,
    name character varying,
    galaxy_description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
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
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying,
    moon_radius integer NOT NULL,
    moon_mass numeric NOT NULL,
    moon_distance integer,
    planet_id integer,
    name character varying,
    moon_description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying,
    planet_orbitingstar character varying,
    planet_radius numeric NOT NULL,
    planet_mass integer NOT NULL,
    planet_distance integer NOT NULL,
    star_id integer,
    name character varying,
    planet_description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    satellite_name character varying,
    satellite_moon character varying,
    satellite_radius integer NOT NULL,
    satellite_mass numeric NOT NULL,
    satellite_distance integer,
    moon_id integer,
    name character varying,
    satellite_description text
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellites_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying,
    star_spectraltype character varying,
    star_magnitude integer NOT NULL,
    star_distance_lightyears integer NOT NULL,
    star_mass numeric,
    galaxy_id integer,
    name character varying,
    star_description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellites_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 100, 1, true, false, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2, 220, 1, true, true, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 60, 40, false, false, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 53, 120, 6, true, true, NULL, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23, 60, 160, false, false, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 28, 50, 800, true, true, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 500, 150, 200, true, false, NULL, 'Ring');
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', 21, 170, 100, true, false, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (9, 'Cigar', 12, 30, 200, true, true, NULL, 'Elliptical');
INSERT INTO public.galaxy VALUES (10, 'Sunflower', 27, 100, 120, false, false, NULL, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 1, 384, 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Charon', 0, 0.117, 19571, 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Kepler-186f-b', 1, 0.1, 13000, 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'KOI-3284.01-b', 1, 0.2, 900, 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'HD 189733b-b', 0, 0.02, 1250, 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'PSR B1620-26 b-b', 1, 0.08, 300, 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Kepler-16b-b', 1, 0.03, 1500, 7, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Kepler-20e-b', 0, 0.005, 600, 8, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Kepler-62e-b', 0, 0.008, 800, 9, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Kepler-62f-b', 1, 0.015, 1000, 10, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Kepler-442b-b', 1, 0.3, 1200, 11, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Kepler-20f-b', 1, 0.1, 1400, 12, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Io', 0, 0.015, 421, 12, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Europa', 0, 0.008, 670, 12, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Ganymede', 0, 0.025, 1070, 12, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Callisto', 0, 0.018, 1882, 12, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Titan', 0, 0.022, 1221, 12, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Triton', 0, 0.003, 354, 12, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Phobos', 0, 0.0005, 937, 12, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Deimos', 0, 0.0002, 234, 12, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Sun', 1, 1, 1, 10, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Proxima b', 'Proxima Centauri', 1.1, 1, 0, 11, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Kepler-186f', 'Kepler-186', 1.2, 1, 0, 18, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'KOI-3284.01', 'KOI-3284', 2.3, 8, 0, 18, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'HD 189733b', 'HD 189733', 1.138, 1, 0, 18, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'PSR B1620-26 b', 'PSR B1620-26', 1.8, 3, 23, 18, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Kepler-16b', 'Kepler-16', 0.753, 0, 1, 18, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Kepler-20e', 'Kepler-20', 0.87, 0, 0, 18, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Kepler-62e', 'Kepler-62', 1.61, 0, 0, 18, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-62f', 'Kepler-62', 1.41, 1, 0, 18, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-442b', 'Kepler-442', 1.34, 2, 0, 18, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-20f', 'Kepler-20', 1.03, 1, 0, 18, NULL, NULL);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Sputnik 1', 'Luna', 0, 0.00084, 945, 1, NULL, NULL);
INSERT INTO public.satellite VALUES (2, 'Sputnik Planum', 'Charon', 0, 0.0005, 5200, 2, NULL, NULL);
INSERT INTO public.satellite VALUES (3, 'Kepler-186f-b''s moon 1', 'Kepler-186f-b', 0, 0.0001, 2000, 3, NULL, NULL);
INSERT INTO public.satellite VALUES (4, 'KOI-3284.01-b''s moon 1', 'KOI-3284.01-b', 0, 0.002, 8000, 4, NULL, NULL);
INSERT INTO public.satellite VALUES (5, 'HD 189733b-b''s moon 1', 'HD 189733b-b', 0, 0.0002, 1500, 5, NULL, NULL);
INSERT INTO public.satellite VALUES (6, 'PSR B1620-26 b-b''s moon 1', 'PSR B1620-26 b-b', 0, 0.001, 5000, 6, NULL, NULL);
INSERT INTO public.satellite VALUES (7, 'Kepler-16b-b''s moon 1', 'Kepler-16b-b', 0, 0.0008, 2500, 7, NULL, NULL);
INSERT INTO public.satellite VALUES (8, 'Kepler-20e-b''s moon 1', 'Kepler-20e-b', 0, 0.0003, 1200, 8, NULL, NULL);
INSERT INTO public.satellite VALUES (9, 'Kepler-62e-b''s moon 1', 'Kepler-62e-b', 0, 0.0001, 8000, 9, NULL, NULL);
INSERT INTO public.satellite VALUES (10, 'Kepler-62f-b''s moon 1', 'Kepler-62f-b', 0, 0.0005, 1600, 10, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (10, 'Sun', 'G2V', -27, 0, 1, 1, NULL, NULL);
INSERT INTO public.star VALUES (11, 'Proxima Centauri', 'M5.5Ve', 11, 4, 0.12, 1, NULL, NULL);
INSERT INTO public.star VALUES (12, 'Alpheratz', 'B8IV', 2, 97000, 4, 2, NULL, NULL);
INSERT INTO public.star VALUES (13, 'Mirach', 'M0IIIa', 2, 199000, 3, 2, NULL, NULL);
INSERT INTO public.star VALUES (14, 'Spica', 'B1V', 1, 250000, 10, 6, NULL, NULL);
INSERT INTO public.star VALUES (15, 'Regulus', 'B7V', 1, 77000, 3.5, 7, NULL, NULL);
INSERT INTO public.star VALUES (16, 'Deneb', 'A2Ia', 1, 2600, 19, 8, NULL, NULL);
INSERT INTO public.star VALUES (17, 'Vega', 'A0Va', 0, 25, 2.1, 9, NULL, NULL);
INSERT INTO public.star VALUES (18, 'Sirius', 'A1V', -1, 9, 2.02, 5, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 20, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 12, true);


--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellites_satellite_id_seq', 11, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 18, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moons_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planets_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_planet_name_key UNIQUE (planet_name);


--
-- Name: satellite satellites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite satellites_satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_satellite_name_key UNIQUE (satellite_name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: star stars_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_star_name_key UNIQUE (star_name);


--
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellites_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

