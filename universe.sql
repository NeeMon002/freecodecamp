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
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    magnitude numeric(4,1),
    distance_in_kly integer,
    constellation character varying(50),
    more_info_id integer
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
    name character varying(60) NOT NULL,
    planet_id integer,
    mass_in_1020_kg numeric(8,3),
    diamter_in_km integer,
    orbit_period_in_days numeric(8,5),
    eccentricity numeric(10,9),
    more_info_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
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
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(60) NOT NULL,
    notes text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_in_au numeric(5,3),
    mass numeric(8,5),
    diameter_in_km integer,
    density numeric(5,3),
    has_water boolean,
    has_life boolean,
    star_id integer,
    more_info_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
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
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    minimum_temperature_in_k integer,
    maximum_temperature_in_k integer,
    fraction numeric(8,5),
    galaxy_id integer,
    more_info_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
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
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 999999999, -6.5, 0, 'Sagittarius', 1);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 999999999, 0.9, 160, 'Dorado/Mensa', 2);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 999999999, 2.7, 200, 'Tucana', 3);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 999999999, 3.4, 2500, 'Andromeda', 4);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 999999999, 5.7, 2900, 'Triangulum', 5);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 999999999, 6.8, 13700, 'Centaurus', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 734.600, 3475, 27.32170, 0.054900000, NULL);
INSERT INTO public.moon VALUES (2, 'Io', 5, 893.200, 3643, 1.76914, 0.004000000, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 480.000, 3122, 3.55118, 0.009000000, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1481.900, 5262, 7.15455, 0.001000000, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1075.900, 4821, 16.68902, 0.007000000, NULL);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 1345.500, 5150, 15.94542, 0.029200000, NULL);
INSERT INTO public.moon VALUES (7, 'Enceladus', 6, 1.080, 504, 1.37022, 0.004500000, NULL);
INSERT INTO public.moon VALUES (8, 'Iapetus', 6, 18.100, 1469, 79.33018, 0.028300000, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 23.100, 1527, 4.51750, 0.001000000, NULL);
INSERT INTO public.moon VALUES (10, 'Triton', 8, 214.000, 2707, 5.87685, 0.000016000, NULL);
INSERT INTO public.moon VALUES (11, 'Moon 1', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon 2', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Moon 3', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Moon 4', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon 5', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Moon 6', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Moon 7', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Moon 8', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Moon 9', 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Moon A', 10, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Galaxy Note 01', 'This is the galaxy containing the Sun and its Solar System, and therefore Earth. Most things visible to the naked eye in the sky are part of it, including the Milky Way composing the Zone of Avoidance.');
INSERT INTO public.more_info VALUES (2, 'Galaxy Note 02', 'Visible only from the southern hemisphere. It is also the brightest patch of nebulosity in the sky.');
INSERT INTO public.more_info VALUES (3, 'Galaxy Note 03', 'Visible only from the southern hemisphere.');
INSERT INTO public.more_info VALUES (4, 'Galaxy Note 04', 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation');
INSERT INTO public.more_info VALUES (5, 'Galaxy Note 05', 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution, ranging from easily visible in direct vision in truly dark skies to a difficult averted vision object in rural/suburban skies.');
INSERT INTO public.more_info VALUES (6, 'Galaxy Note 06', 'Centaurus A has been spotted with the naked eye by Stephen James O''Meara.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.387, 0.05530, 4879, 5.427, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 0.723, 0.81500, 12104, 5.243, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1.000, 1.00000, 12742, 5.515, true, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1.524, 0.10700, 6779, 3.933, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.203, 317.83000, 139822, 1.326, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.537, 95.15900, 116464, 0.687, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 19.191, 14.53600, 50724, 1.270, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 30.069, 17.14700, 49244, 1.638, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 39.482, 0.00220, 2376, 1.854, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (10, 'planet10', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (11, 'planet11', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (12, 'planet12', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'O', 30000, NULL, 0.00003, 1, NULL);
INSERT INTO public.star VALUES (2, 'B', 10000, 30000, 0.13000, 1, NULL);
INSERT INTO public.star VALUES (3, 'A', 7500, 10000, 0.60000, 1, NULL);
INSERT INTO public.star VALUES (4, 'F', 6000, 7500, 3.00000, 1, NULL);
INSERT INTO public.star VALUES (5, 'G', 5200, 6000, 7.60000, 1, NULL);
INSERT INTO public.star VALUES (6, 'K', 3700, 5200, 12.10000, 1, NULL);
INSERT INTO public.star VALUES (7, 'M', 2400, 3700, 76.45000, 1, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- Name: moon moon_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- PostgreSQL database dump complete
--
