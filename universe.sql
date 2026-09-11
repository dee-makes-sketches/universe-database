--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    distance_from_earth integer NOT NULL,
    has_black_hole boolean NOT NULL,
    galaxy_type character varying(50) NOT NULL
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
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_id integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature numeric(5,2) NOT NULL,
    has_atmosphere boolean NOT NULL,
    star_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 0, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way', 2537000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A nearby spiral galaxy', 3000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A famous interacting galaxy', 23000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a bright central bulge', 29000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy', 53500000, true, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth natural satellite', 4500, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Small moon of Mars', 4500, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Small moon of Mars', 4500, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', 4500, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter', 4500, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', 4500, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Outer moon of Jupiter', 4500, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 4500, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy moon of Saturn', 4500, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 'Moon of Saturn', 4500, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Moon of Saturn', 4500, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Two-toned moon of Saturn', 4500, 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 'Small moon of Uranus', 4500, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Moon of Uranus', 4500, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'Dark moon of Uranus', 4500, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'Largest moon of Uranus', 4500, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Outer moon of Uranus', 4500, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Largest moon of Neptune', 4500, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Moon of Neptune', 4500, 8);
INSERT INTO public.moon VALUES (20, 'Larissa', 'Small moon of Neptune', 4500, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the solar system', 4500, 167.00, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hot planet with a thick atmosphere', 4500, 464.00, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 4500, 15.00, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', 4500, -63.00, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the solar system', 4500, -110.00, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Planet famous for its rings', 4500, -140.00, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis', 4500, -195.00, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'A distant blue ice giant', 4500, -200.00, true, 1);
INSERT INTO public.planet VALUES (9, 'Vega-b', 'A fictional exoplanet for this project', 1000, 25.00, true, 3);
INSERT INTO public.planet VALUES (10, 'Rigel-b', 'A fictional planet orbiting Rigel', 900, 500.00, true, 5);
INSERT INTO public.planet VALUES (11, 'Deneb-b', 'A fictional exoplanet', 1200, 100.00, true, 6);
INSERT INTO public.planet VALUES (12, 'Sirius-b', 'A fictional planet for the project', 2000, 80.00, true, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets primarily made of hydrogen and helium');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Large planets containing significant amounts of water, ammonia, and methane');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star at the center of our solar system', 4600, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', 242, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'A bright star in the constellation Lyra', 455, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star', 10, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant star', 8, 2);
INSERT INTO public.star VALUES (6, 'Deneb', 'A distant blue-white supergiant', 10, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key1 UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--

