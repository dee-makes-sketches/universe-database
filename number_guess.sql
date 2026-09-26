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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 506, 1);
INSERT INTO public.games VALUES (2, 522, 1);
INSERT INTO public.games VALUES (3, 701, 2);
INSERT INTO public.games VALUES (4, 679, 2);
INSERT INTO public.games VALUES (5, 834, 1);
INSERT INTO public.games VALUES (6, 770, 1);
INSERT INTO public.games VALUES (7, 270, 1);
INSERT INTO public.games VALUES (8, 11, 3);
INSERT INTO public.games VALUES (9, 757, 4);
INSERT INTO public.games VALUES (10, 924, 4);
INSERT INTO public.games VALUES (11, 194, 5);
INSERT INTO public.games VALUES (12, 573, 5);
INSERT INTO public.games VALUES (13, 628, 4);
INSERT INTO public.games VALUES (14, 169, 4);
INSERT INTO public.games VALUES (15, 709, 4);
INSERT INTO public.games VALUES (16, 541, 6);
INSERT INTO public.games VALUES (17, 981, 6);
INSERT INTO public.games VALUES (18, 792, 7);
INSERT INTO public.games VALUES (19, 409, 7);
INSERT INTO public.games VALUES (20, 158, 6);
INSERT INTO public.games VALUES (21, 576, 6);
INSERT INTO public.games VALUES (22, 938, 6);
INSERT INTO public.games VALUES (23, 712, 8);
INSERT INTO public.games VALUES (24, 569, 8);
INSERT INTO public.games VALUES (25, 192, 9);
INSERT INTO public.games VALUES (26, 645, 9);
INSERT INTO public.games VALUES (27, 234, 8);
INSERT INTO public.games VALUES (28, 664, 8);
INSERT INTO public.games VALUES (29, 66, 8);
INSERT INTO public.games VALUES (30, 595, 10);
INSERT INTO public.games VALUES (31, 948, 10);
INSERT INTO public.games VALUES (32, 885, 11);
INSERT INTO public.games VALUES (33, 885, 11);
INSERT INTO public.games VALUES (34, 612, 10);
INSERT INTO public.games VALUES (35, 604, 10);
INSERT INTO public.games VALUES (36, 386, 10);
INSERT INTO public.games VALUES (37, 644, 12);
INSERT INTO public.games VALUES (38, 817, 12);
INSERT INTO public.games VALUES (39, 530, 13);
INSERT INTO public.games VALUES (40, 402, 13);
INSERT INTO public.games VALUES (41, 416, 12);
INSERT INTO public.games VALUES (42, 84, 12);
INSERT INTO public.games VALUES (43, 611, 12);
INSERT INTO public.games VALUES (44, 330, 14);
INSERT INTO public.games VALUES (45, 721, 14);
INSERT INTO public.games VALUES (46, 169, 15);
INSERT INTO public.games VALUES (47, 453, 15);
INSERT INTO public.games VALUES (48, 33, 14);
INSERT INTO public.games VALUES (49, 917, 14);
INSERT INTO public.games VALUES (50, 48, 14);
INSERT INTO public.games VALUES (51, 903, 16);
INSERT INTO public.games VALUES (52, 600, 16);
INSERT INTO public.games VALUES (53, 564, 17);
INSERT INTO public.games VALUES (54, 208, 17);
INSERT INTO public.games VALUES (55, 335, 16);
INSERT INTO public.games VALUES (56, 886, 16);
INSERT INTO public.games VALUES (57, 780, 16);
INSERT INTO public.games VALUES (58, 837, 18);
INSERT INTO public.games VALUES (59, 394, 18);
INSERT INTO public.games VALUES (60, 935, 19);
INSERT INTO public.games VALUES (61, 347, 19);
INSERT INTO public.games VALUES (62, 841, 18);
INSERT INTO public.games VALUES (63, 393, 18);
INSERT INTO public.games VALUES (64, 116, 18);
INSERT INTO public.games VALUES (65, 223, 20);
INSERT INTO public.games VALUES (66, 173, 20);
INSERT INTO public.games VALUES (67, 903, 21);
INSERT INTO public.games VALUES (68, 281, 21);
INSERT INTO public.games VALUES (69, 661, 20);
INSERT INTO public.games VALUES (70, 418, 20);
INSERT INTO public.games VALUES (71, 698, 20);
INSERT INTO public.games VALUES (72, 373, 22);
INSERT INTO public.games VALUES (73, 770, 22);
INSERT INTO public.games VALUES (74, 709, 23);
INSERT INTO public.games VALUES (75, 21, 23);
INSERT INTO public.games VALUES (76, 917, 22);
INSERT INTO public.games VALUES (77, 996, 22);
INSERT INTO public.games VALUES (78, 917, 22);
INSERT INTO public.games VALUES (79, 16, 24);
INSERT INTO public.games VALUES (80, 564, 24);
INSERT INTO public.games VALUES (81, 852, 25);
INSERT INTO public.games VALUES (82, 267, 25);
INSERT INTO public.games VALUES (83, 628, 24);
INSERT INTO public.games VALUES (84, 991, 24);
INSERT INTO public.games VALUES (85, 853, 24);
INSERT INTO public.games VALUES (86, 7, 26);
INSERT INTO public.games VALUES (87, 906, 26);
INSERT INTO public.games VALUES (88, 26, 27);
INSERT INTO public.games VALUES (89, 745, 27);
INSERT INTO public.games VALUES (90, 439, 26);
INSERT INTO public.games VALUES (91, 934, 26);
INSERT INTO public.games VALUES (92, 382, 26);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1790437720882');
INSERT INTO public.users VALUES (2, 'user_1790437720881');
INSERT INTO public.users VALUES (3, 'deepak');
INSERT INTO public.users VALUES (4, 'user_1790437890435');
INSERT INTO public.users VALUES (5, 'user_1790437890434');
INSERT INTO public.users VALUES (6, 'user_1790438006551');
INSERT INTO public.users VALUES (7, 'user_1790438006550');
INSERT INTO public.users VALUES (8, 'user_1790438021713');
INSERT INTO public.users VALUES (9, 'user_1790438021712');
INSERT INTO public.users VALUES (10, 'user_1790438107630');
INSERT INTO public.users VALUES (11, 'user_1790438107629');
INSERT INTO public.users VALUES (12, 'user_1790438518849');
INSERT INTO public.users VALUES (13, 'user_1790438518848');
INSERT INTO public.users VALUES (14, 'user_1790438630116');
INSERT INTO public.users VALUES (15, 'user_1790438630115');
INSERT INTO public.users VALUES (16, 'user_1790438674563');
INSERT INTO public.users VALUES (17, 'user_1790438674562');
INSERT INTO public.users VALUES (18, 'user_1790438861660');
INSERT INTO public.users VALUES (19, 'user_1790438861659');
INSERT INTO public.users VALUES (20, 'user_1790438886987');
INSERT INTO public.users VALUES (21, 'user_1790438886986');
INSERT INTO public.users VALUES (22, 'user_1790438993465');
INSERT INTO public.users VALUES (23, 'user_1790438993464');
INSERT INTO public.users VALUES (24, 'user_1790439111019');
INSERT INTO public.users VALUES (25, 'user_1790439111018');
INSERT INTO public.users VALUES (26, 'user_1790439188871');
INSERT INTO public.users VALUES (27, 'user_1790439188869');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 92, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 27, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

