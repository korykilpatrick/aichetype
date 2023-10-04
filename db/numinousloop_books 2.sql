--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Homebrew)
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-03 17:20:17 CDT

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
-- TOC entry 217 (class 1259 OID 16870)
-- Name: books; Type: TABLE; Schema: public; Owner: numinousloop
--

CREATE TABLE public.books (
    id integer NOT NULL,
    img_url character varying(255),
    img_url_small character varying(255),
    title character varying(255) NOT NULL,
    book_link character varying(255),
    author character varying(255) NOT NULL,
    author_link character varying(255),
    num_pages integer,
    avg_rating double precision,
    num_ratings integer,
    date_pub character varying(30),
    rating integer,
    blurb text,
    date_added character varying(30),
    date_started character varying(30),
    date_read character varying(30),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.books OWNER TO numinousloop;

--
-- TOC entry 216 (class 1259 OID 16869)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: numinousloop
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO numinousloop;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 216
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: numinousloop
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 221 (class 1259 OID 16889)
-- Name: books_shelves; Type: TABLE; Schema: public; Owner: numinousloop
--

CREATE TABLE public.books_shelves (
    id integer NOT NULL,
    book_id integer,
    shelf_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.books_shelves OWNER TO numinousloop;

--
-- TOC entry 220 (class 1259 OID 16888)
-- Name: books_shelves_id_seq; Type: SEQUENCE; Schema: public; Owner: numinousloop
--

CREATE SEQUENCE public.books_shelves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_shelves_id_seq OWNER TO numinousloop;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 220
-- Name: books_shelves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: numinousloop
--

ALTER SEQUENCE public.books_shelves_id_seq OWNED BY public.books_shelves.id;


--
-- TOC entry 219 (class 1259 OID 16881)
-- Name: bookshelves; Type: TABLE; Schema: public; Owner: numinousloop
--

CREATE TABLE public.bookshelves (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bookshelves OWNER TO numinousloop;

--
-- TOC entry 218 (class 1259 OID 16880)
-- Name: bookshelves_id_seq; Type: SEQUENCE; Schema: public; Owner: numinousloop
--

CREATE SEQUENCE public.bookshelves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookshelves_id_seq OWNER TO numinousloop;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 218
-- Name: bookshelves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: numinousloop
--

ALTER SEQUENCE public.bookshelves_id_seq OWNED BY public.bookshelves.id;


--
-- TOC entry 215 (class 1259 OID 16859)
-- Name: projects; Type: TABLE; Schema: public; Owner: numinousloop
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.projects OWNER TO numinousloop;

--
-- TOC entry 214 (class 1259 OID 16858)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: numinousloop
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO numinousloop;

--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 214
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: numinousloop
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 3479 (class 2604 OID 16873)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3484 (class 2604 OID 16892)
-- Name: books_shelves id; Type: DEFAULT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.books_shelves ALTER COLUMN id SET DEFAULT nextval('public.books_shelves_id_seq'::regclass);


--
-- TOC entry 3482 (class 2604 OID 16884)
-- Name: bookshelves id; Type: DEFAULT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.bookshelves ALTER COLUMN id SET DEFAULT nextval('public.bookshelves_id_seq'::regclass);


--
-- TOC entry 3476 (class 2604 OID 16862)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3643 (class 0 OID 16870)
-- Dependencies: 217
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: numinousloop
--

COPY public.books (id, img_url, img_url_small, title, book_link, author, author_link, num_pages, avg_rating, num_ratings, date_pub, rating, blurb, date_added, date_started, date_read, created_at, updated_at) FROM stdin;
1	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1606002779i/54860573.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1606002779l/54860573._SY75_.jpg	Once There Were Wolves	https://www.goodreads.com/book/show/54860573-once-there-were-wolves	McConaghy, Charlotte	https://www.goodreads.com/author/show/2869149.Charlotte_McConaghy	258	4.12	75707	Aug 03, 2021	\N		Sep 19, 2023	Sep 19, 2023	\N	2023-09-30 18:13:16.411132	2023-09-30 18:13:16.411132
2	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1389237037i/1404609.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1389237037l/1404609._SX50_.jpg	The Problem of the Puer Aeternus\n        (Studies in Jungian Psychology by Jungian Analysts, 87)	https://www.goodreads.com/book/show/1404609.The_Problem_of_the_Puer_Aeternus	Franz, Marie-Louise von	https://www.goodreads.com/author/show/27903.Marie_Louise_von_Franz	288	4.23	523	1970	\N		Sep 16, 2023	Sep 16, 2023	\N	2023-09-30 18:13:16.411132	2023-09-30 18:13:16.411132
3	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1663707011i/60965426.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1663707011l/60965426._SX50_.jpg	The Creative Act: A Way of Being	https://www.goodreads.com/book/show/60965426-the-creative-act	Rubin, Rick	https://www.goodreads.com/author/show/427020.Rick_Rubin	406	4.14	13713	Jan 17, 2023	\N		Sep 05, 2023	Sep 05, 2023	\N	2023-09-30 18:13:16.411132	2023-09-30 18:13:16.411132
4	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1600097225i/54900051.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1600097225l/54900051._SY75_.jpg	Madhouse at the End of the Earth: The Belgica's Journey into the Dark Antarctic Night	https://www.goodreads.com/book/show/54900051-madhouse-at-the-end-of-the-earth	Sancton, Julian	https://www.goodreads.com/author/show/20588963.Julian_Sancton	354	4.27	11439	May 04, 2021	5		Sep 05, 2023	Sep 05, 2023	Sep 26, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
5	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1440621221i/16884.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1440621221l/16884._SX50_.jpg	The Making of the Atomic Bomb	https://www.goodreads.com/book/show/16884.The_Making_of_the_Atomic_Bomb	Rhodes, Richard	https://www.goodreads.com/author/show/10263.Richard_Rhodes	886	4.38	21116	Sep 18, 1986	\N		Jul 26, 2023	Jul 26, 2023	Sep 16, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
6	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1351213453i/15798078.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1351213453l/15798078._SX50_.jpg	Decisive: How to Make Better Choices in Life and Work	https://www.goodreads.com/book/show/15798078-decisive	Heath, Chip	https://www.goodreads.com/author/show/39021.Chip_Heath	336	3.96	16963	Mar 26, 2013	4		Jun 14, 2023	Jun 14, 2023	Jun 18, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
7	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1686079247i/80571.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1686079247l/80571._SY75_.jpg	American Prometheus: The Triumph and Tragedy of J. Robert Oppenheimer	https://www.goodreads.com/book/show/80571.American_Prometheus	Bird, Kai	https://www.goodreads.com/author/show/45879.Kai_Bird	721	4.26	29321	Apr 05, 2005	5		Jun 14, 2023	Jun 14, 2023	Jul 26, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
8	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387708094i/829182.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387708094l/829182._SX50_.jpg	Computer Systems: A Programmer's Perspective	https://www.goodreads.com/book/show/829182.Computer_Systems	Bryant, Randal E.	https://www.goodreads.com/author/show/431738.Randal_E_Bryant	978	4.44	1007	Feb 01, 2002	\N		May 09, 2023	May 09, 2023	Sep 16, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
9	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1520258755i/18512.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1520258755l/18512._SY75_.jpg	The Return of the King\n        (The Lord of the Rings, #3)	https://www.goodreads.com/book/show/18512.The_Return_of_the_King	Tolkien, J.R.R.	https://www.goodreads.com/author/show/656983.J_R_R_Tolkien	404	4.56	855899	Oct 20, 1955	5		Mar 26, 2023	Mar 26, 2023	Sep 05, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
10	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388255319i/67891.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388255319l/67891._SY75_.jpg	The Undiscovered Self	https://www.goodreads.com/book/show/67891.The_Undiscovered_Self	Jung, Carl	https://www.goodreads.com/author/show/38285.C_G_Jung	112	4.14	10424	1961	5		Mar 26, 2023	Mar 26, 2023	Jun 14, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
11	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1535419394i/4069.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1535419394l/4069._SY75_.jpg	Man's Search for Meaning	https://www.goodreads.com/book/show/4069.Man_s_Search_for_Meaning	Frankl, Viktor E.	https://www.goodreads.com/author/show/2782.Viktor_E_Frankl	165	4.37	657497	1959	5		Jan 19, 2023	\N	Jan 19, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
12	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1634158558i/59344312.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1634158558l/59344312._SY75_.jpg	Verity	https://www.goodreads.com/book/show/59344312-verity	Hoover, Colleen	https://www.goodreads.com/author/show/5430144.Colleen_Hoover	336	4.34	2213236	Dec 07, 2018	3		Dec 28, 2022	\N	\N	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
13	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1608557750i/45300567.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1608557750l/45300567._SY75_.jpg	The Maidens	https://www.goodreads.com/book/show/45300567-the-maidens	Michaelides, Alex	https://www.goodreads.com/author/show/17621440.Alex_Michaelides	337	3.62	288456	Jun 03, 2021	4		Nov 18, 2022	Nov 18, 2022	Nov 22, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
16	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1312474060i/1633.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1312474060l/1633._SX50_.jpg	Getting Things Done: The Art of Stress-Free Productivity	https://www.goodreads.com/book/show/1633.Getting_Things_Done	Allen, David	https://www.goodreads.com/author/show/1058.David_Allen	267	4	154389	2001	5		Oct 31, 2022	Oct 31, 2022	Oct 31, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
17	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1655988385i/40121378.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1655988385l/40121378._SY75_.jpg	Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones	https://www.goodreads.com/book/show/40121378-atomic-habits	Clear, James	https://www.goodreads.com/author/show/7327369.James_Clear	319	4.37	708842	Oct 16, 2018	5		Sep 15, 2022	Sep 15, 2022	Sep 15, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
18	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327867727i/480204.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327867727l/480204._SY75_.jpg	The Phantom of the Opera	https://www.goodreads.com/book/show/480204.The_Phantom_of_the_Opera	Leroux, Gaston	https://www.goodreads.com/author/show/9057.Gaston_Leroux	360	3.96	233426	1909	5		Sep 14, 2022	Sep 14, 2022	Oct 31, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
19	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1654216149i/61215372.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1654216149l/61215372._SY75_.jpg	The Two Towers\n        (The Lord of the Rings, #2)	https://www.goodreads.com/book/show/61215372-the-two-towers	Tolkien, J.R.R.	https://www.goodreads.com/author/show/656983.J_R_R_Tolkien	448	4.48	919853	Nov 11, 1954	5		Sep 12, 2022	Sep 12, 2022	Mar 16, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
20	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1654215925i/61215351.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1654215925l/61215351._SY75_.jpg	The Fellowship of the Ring\n        (The Lord of the Rings, #1)	https://www.goodreads.com/book/show/61215351-the-fellowship-of-the-ring	Tolkien, J.R.R.	https://www.goodreads.com/author/show/656983.J_R_R_Tolkien	432	4.39	2731987	Jul 29, 1954	5		Aug 28, 2022	Aug 28, 2022	Sep 12, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
21	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1561407201i/135486.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1561407201l/135486._SY75_.jpg	In the Shadow of Man	https://www.goodreads.com/book/show/135486.In_the_Shadow_of_Man	Goodall, Jane	https://www.goodreads.com/author/show/18163.Jane_Goodall	297	4.36	7756	1971	5		Jul 13, 2022	Jul 13, 2022	Oct 31, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
22	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386924581i/13661.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1386924581l/13661._SY75_.jpg	Tehanu\n        (Earthsea Cycle, #4)	https://www.goodreads.com/book/show/13661.Tehanu	Le Guin, Ursula K.	https://www.goodreads.com/author/show/874602.Ursula_K_Le_Guin	281	4.02	47596	Jun 20, 1990	4		Jul 06, 2022	Jul 06, 2022	Jul 26, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
23	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1580794624i/51778153.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1580794624l/51778153._SX50_SY75_.jpg	Livewired: The Inside Story of the Ever-Changing Brain	https://www.goodreads.com/book/show/51778153-livewired	Eagleman, David	https://www.goodreads.com/author/show/2883386.David_Eagleman	352	4.18	3668	Aug 25, 2020	5		Jun 28, 2022	Jun 28, 2022	Aug 23, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
24	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1546071216i/5907.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546071216l/5907._SY75_.jpg	The Hobbit\n        (The Lord of the Rings, #0)	https://www.goodreads.com/book/show/5907.The_Hobbit	Tolkien, J.R.R.	https://www.goodreads.com/author/show/656983.J_R_R_Tolkien	366	4.28	3767499	Sep 21, 1937	5		Jun 22, 2022	Jun 22, 2022	Jul 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
25	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388200537i/13667.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388200537l/13667._SY75_.jpg	The Farthest Shore\n        (Earthsea Cycle, #3)	https://www.goodreads.com/book/show/13667.The_Farthest_Shore	Le Guin, Ursula K.	https://www.goodreads.com/author/show/874602.Ursula_K_Le_Guin	259	4.12	109911	Sep 1972	4		Jun 20, 2022	\N	\N	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
26	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1513836885i/36556202.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1513836885l/36556202._SY75_.jpg	The Coddling of the American Mind: How Good Intentions and Bad Ideas Are Setting Up a Generation for Failure	https://www.goodreads.com/book/show/36556202-the-coddling-of-the-american-mind	Haidt, Jonathan	https://www.goodreads.com/author/show/55727.Jonathan_Haidt	352	4.25	38436	Jul 17, 2018	4		Jun 11, 2022	Jun 11, 2022	Jun 12, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
27	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1659761935i/13662.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1659761935l/13662._SY75_.jpg	The Tombs of Atuan\n        (Earthsea Cycle, #2)	https://www.goodreads.com/book/show/13662.The_Tombs_of_Atuan	Le Guin, Ursula K.	https://www.goodreads.com/author/show/874602.Ursula_K_Le_Guin	180	4.12	112476	1970	5		Jun 06, 2022	Jun 06, 2022	Jun 12, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
28	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1357701652i/17054323.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1357701652l/17054323._SY75_.jpg	Unlocking the Emotional Brain: Eliminating Symptoms at Their Roots Using Memory Reconsolidation	https://www.goodreads.com/book/show/17054323-unlocking-the-emotional-brain	Ecker, Bruce	https://www.goodreads.com/author/show/252620.Bruce_Ecker	265	4.48	191	Jan 01, 2012	4		Jun 03, 2022	Jun 03, 2022	Jul 26, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
29	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327128714i/28921.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327128714l/28921._SY75_.jpg	The Remains of the Day	https://www.goodreads.com/book/show/28921.The_Remains_of_the_Day	Ishiguro, Kazuo	https://www.goodreads.com/author/show/4280.Kazuo_Ishiguro	258	4.14	286596	May 01, 1989	4		May 23, 2022	May 23, 2022	May 25, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
30	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1353424536i/13642.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1353424536l/13642._SY75_.jpg	A Wizard of Earthsea\n        (Earthsea Cycle, #1)	https://www.goodreads.com/book/show/13642.A_Wizard_of_Earthsea	Le Guin, Ursula K.	https://www.goodreads.com/author/show/874602.Ursula_K_Le_Guin	183	4.01	303390	Jan 01, 1968	5		May 21, 2022	May 25, 2022	Jun 03, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
31	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1574272133i/1319.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1574272133l/1319._SY75_.jpg	The War of Art: Winning the Inner Creative Battle	https://www.goodreads.com/book/show/1319.The_War_of_Art	Pressfield, Steven	https://www.goodreads.com/author/show/867.Steven_Pressfield	168	3.99	99144	2002	4		May 14, 2022	\N	\N	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
32	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1503806495i/3985.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1503806495l/3985._SY75_.jpg	The Amazing Adventures of Kavalier & Clay	https://www.goodreads.com/book/show/3985.The_Amazing_Adventures_of_Kavalier_Clay	Chabon, Michael	https://www.goodreads.com/author/show/2715.Michael_Chabon	639	4.18	199883	Sep 19, 2000	5		Apr 18, 2022	Apr 18, 2022	May 21, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
33	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347234766i/604360.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1347234766l/604360._SY75_.jpg	The Flying Boy: Healing the Wounded Man	https://www.goodreads.com/book/show/604360.The_Flying_Boy	Lee, John H.	https://www.goodreads.com/author/show/328227.John_H_Lee	111	3.63	83	Mar 28, 1987	4		Apr 18, 2022	\N	\N	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
34	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348052112i/122600.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348052112l/122600._SX50_.jpg	Iron John: A Book About Men	https://www.goodreads.com/book/show/122600.Iron_John	Bly, Robert	https://www.goodreads.com/author/show/5424911.Robert_Bly	288	3.9	6332	1984	5		Mar 22, 2022	Mar 22, 2022	Apr 18, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
35	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1529041799i/40242274.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1529041799l/40242274._SY75_.jpg	A Random Walk Down Wall Street: The Time-Tested Strategy for Successful Investing	https://www.goodreads.com/book/show/40242274-a-random-walk-down-wall-street	Malkiel, Burton G.	https://www.goodreads.com/author/show/14600.Burton_G_Malkiel	432	4.13	34632	Apr 01, 1973	5		Mar 10, 2022	Mar 10, 2022	May 14, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
36	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1452624392i/1215032.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1452624392l/1215032._SY75_.jpg	The Wise Man's Fear\n        (The Kingkiller Chronicle, #2)	https://www.goodreads.com/book/show/1215032.The_Wise_Man_s_Fear	Rothfuss, Patrick	https://www.goodreads.com/author/show/108424.Patrick_Rothfuss	994	4.55	533415	Mar 01, 2011	5		Feb 19, 2022	Feb 19, 2022	Apr 03, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
37	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1270352123i/186074.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1270352123l/186074._SX50_.jpg	The Name of the Wind\n        (The Kingkiller Chronicle, #1)	https://www.goodreads.com/book/show/186074.The_Name_of_the_Wind	Rothfuss, Patrick	https://www.goodreads.com/author/show/108424.Patrick_Rothfuss	662	4.52	917540	Mar 27, 2007	5		Feb 11, 2022	Feb 11, 2022	Feb 19, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
38	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388272410i/976211.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388272410l/976211._SY75_.jpg	Swamplands of the Soul: New Life in Dismal Places\n        (Studies in Jungian Psychology by Jungian Analysts, 73)	https://www.goodreads.com/book/show/976211.Swamplands_of_the_Soul	Hollis, James	https://www.goodreads.com/author/show/18159.James_Hollis	160	4.38	691	Aug 1996	4		Feb 07, 2022	Feb 07, 2022	Apr 03, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
39	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388344056i/579455.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388344056l/579455._SY75_.jpg	Inner Work: Using Dreams and Active Imagination for Personal Growth	https://www.goodreads.com/book/show/579455.Inner_Work	Johnson, Robert A.	https://www.goodreads.com/author/show/6258.Robert_A_Johnson	221	4.28	2528	1986	4		Jan 25, 2022	Jan 25, 2022	Feb 06, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
40	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388185497i/1858013.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388185497l/1858013._SX50_.jpg	The Reason for God: Belief in an Age of Skepticism	https://www.goodreads.com/book/show/1858013.The_Reason_for_God	Keller, Timothy J.	https://www.goodreads.com/author/show/847789.Timothy_J_Keller	293	4.21	64363	Feb 14, 2008	4		Jan 06, 2022	Jan 06, 2022	Jan 14, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
42	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1668782119i/40097951.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1668782119l/40097951._SY75_.jpg	The Silent Patient	https://www.goodreads.com/book/show/40097951-the-silent-patient	Michaelides, Alex	https://www.goodreads.com/author/show/17621440.Alex_Michaelides	336	4.18	1761469	Feb 05, 2019	4		Dec 26, 2021	\N	\N	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
43	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1410136019i/629.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1410136019l/629._SY75_.jpg	Zen and the Art of Motorcycle Maintenance: An Inquiry Into Values\n        (Phaedrus, #1)	https://www.goodreads.com/book/show/629.Zen_and_the_Art_of_Motorcycle_Maintenance	Pirsig, Robert M.	https://www.goodreads.com/author/show/401.Robert_M_Pirsig	540	3.78	225744	Apr 1974	4		Oct 10, 2021	Oct 10, 2021	Nov 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
44	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387151694i/17245.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387151694l/17245._SY75_.jpg	Dracula	https://www.goodreads.com/book/show/17245.Dracula	Stoker, Bram	https://www.goodreads.com/author/show/6988.Bram_Stoker	488	4.01	1208092	1897	5		Sep 28, 2021	Sep 28, 2021	Dec 15, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
45	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1503617349i/36118741.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1503617349l/36118741._SY75_.jpg	Notes From The Underground	https://www.goodreads.com/book/show/36118741-notes-from-the-underground	Dostoevsky, Fyodor	https://www.goodreads.com/author/show/3137322.Fyodor_Dostoevsky	124	4.18	142751	1864	5		Sep 06, 2021	Sep 06, 2021	Sep 28, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
46	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1441230921i/27539.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1441230921l/27539._SY75_.jpg	On Intelligence	https://www.goodreads.com/book/show/27539.On_Intelligence	Hawkins, Jeff	https://www.goodreads.com/author/show/15461.Jeff_Hawkins	261	4.11	6729	2004	4		Aug 23, 2021	Aug 23, 2021	Sep 03, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
47	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1610894755i/54968118.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1610894755l/54968118._SY75_.jpg	The Code Breaker: Jennifer Doudna, Gene Editing, and the Future of the Human Race	https://www.goodreads.com/book/show/54968118-the-code-breaker	Isaacson, Walter	https://www.goodreads.com/author/show/7111.Walter_Isaacson	536	4.29	32257	Mar 09, 2021	5		Jul 29, 2021	Jul 31, 2021	Aug 23, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
48	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348991775i/6601267.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348991775l/6601267._SY75_.jpg	The Machinery of Life	https://www.goodreads.com/book/show/6601267-the-machinery-of-life	Goodsell, David S.	https://www.goodreads.com/author/show/1029848.David_S_Goodsell	179	4.41	656	Jan 01, 1992	4		Jul 29, 2021	Jul 29, 2021	Aug 19, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
49	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1617705566i/55411738.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1617705566l/55411738._SY75_.jpg	Projections: A Story of Human Emotions	https://www.goodreads.com/book/show/55411738-projections	Deisseroth, Karl	https://www.goodreads.com/author/show/20337039.Karl_Deisseroth	256	4.03	1128	Jun 15, 2021	5		Jul 23, 2021	Sep 06, 2021	Sep 19, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
50	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1639969375i/4406.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1639969375l/4406._SY75_.jpg	East of Eden	https://www.goodreads.com/book/show/4406.East_of_Eden	Steinbeck, John	https://www.goodreads.com/author/show/585.John_Steinbeck	601	4.4	517983	1952	5		Jul 23, 2021	Jul 23, 2021	Sep 03, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
52	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1563164003i/43723901.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1563164003l/43723901._SY75_.jpg	Lifespan: Why We Age―and Why We Don't Have To	https://www.goodreads.com/book/show/43723901-lifespan	Sinclair, David	https://www.goodreads.com/author/show/19155774.David_A_Sinclair	432	4.18	19657	Sep 10, 2019	4		Jul 18, 2021	Jul 18, 2021	Jul 23, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
53	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388956566i/140963.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388956566l/140963._SY75_.jpg	O Pioneers!\n        (Great Plains Trilogy, #1)	https://www.goodreads.com/book/show/140963.O_Pioneers_	Cather, Willa	https://www.goodreads.com/author/show/881203.Willa_Cather	159	3.89	52441	1913	4		Jun 27, 2021	Jun 27, 2021	Jul 18, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
54	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1384152213i/126061.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1384152213l/126061._SY75_.jpg	The Double Helix	https://www.goodreads.com/book/show/126061.The_Double_Helix	Watson, James D.	https://www.goodreads.com/author/show/14313.James_D_Watson	143	3.85	18551	Jan 1968	4		Jun 27, 2021	Jun 27, 2021	Jul 08, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
55	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1650680709i/529326.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1650680709l/529326._SY75_.jpg	Beyond Good and Evil	https://www.goodreads.com/book/show/529326.Beyond_Good_and_Evil	Nietzsche, Friedrich	https://www.goodreads.com/author/show/1938.Friedrich_Nietzsche	257	4.02	90335	1886	4		Jun 27, 2021	\N	\N	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
56	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1175565523i/530415.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1175565523l/530415._SX50_.jpg	The Art of Doing Science and Engineering: Learning to Learn	https://www.goodreads.com/book/show/530415.The_Art_of_Doing_Science_and_Engineering	Hamming, Richard	https://www.goodreads.com/author/show/83670.Richard_Hamming	376	4.17	980	Jan 31, 1996	4		Jun 04, 2021	Jun 04, 2021	Jul 23, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
57	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1422811281i/22318382.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1422811281l/22318382._SX50_.jpg	Becoming Steve Jobs: The Evolution of a Reckless Upstart into a Visionary Leader	https://www.goodreads.com/book/show/22318382-becoming-steve-jobs	Schlender, Brent	https://www.goodreads.com/author/show/8268936.Brent_Schlender	464	4.13	16389	Mar 24, 2015	5		May 29, 2021	Aug 23, 2022	Aug 26, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
58	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1545581290i/38746152.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545581290l/38746152._SX50_.jpg	The Book of Delights: Essays	https://www.goodreads.com/book/show/38746152-the-book-of-delights	Gay, Ross	https://www.goodreads.com/author/show/457563.Ross_Gay	274	4.18	13387	Feb 12, 2019	4		May 29, 2021	Aug 02, 2021	Oct 10, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
59	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1330669823i/135409.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1330669823l/135409._SX50_.jpg	Courage to Change: One Day at a Time in Al-Anon II	https://www.goodreads.com/book/show/135409.Courage_to_Change	Groups, Al-Anon Family	https://www.goodreads.com/author/show/8200751.Al_Anon_Family_Groups	380	4.5	2515	Jun 1992	5		May 29, 2021	\N	\N	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
60	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1389332672i/16631.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1389332672l/16631._SY75_.jpg	Steppenwolf	https://www.goodreads.com/book/show/16631.Steppenwolf	Hesse, Hermann	https://www.goodreads.com/author/show/1113469.Hermann_Hesse	256	4.13	176695	1927	5		Mar 18, 2021	Mar 18, 2021	Jun 27, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
76	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1639106809i/59716.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1639106809l/59716._SY75_.jpg	To the Lighthouse	https://www.goodreads.com/book/show/59716.To_the_Lighthouse	Woolf, Virginia	https://www.goodreads.com/author/show/6765.Virginia_Woolf	209	3.8	174234	May 05, 1927	4		Jun 22, 2020	Jun 22, 2020	Jul 19, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
61	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1320343404i/6524831.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320343404l/6524831._SY75_.jpg	You Are The One You've Been Waiting For: Bringing Courageous Love To Intimate Relationships	https://www.goodreads.com/book/show/6524831-you-are-the-one-you-ve-been-waiting-for	Schwartz, Richard C.	https://www.goodreads.com/author/show/98013.Richard_C_Schwartz	\N	4.49	722	Jan 01, 2008	5		Feb 26, 2021	Feb 26, 2021	May 31, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
62	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1390365973i/168349.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1390365973l/168349._SY75_.jpg	Internal Family Systems Therapy	https://www.goodreads.com/book/show/168349.Internal_Family_Systems_Therapy	Schwartz, Richard C.	https://www.goodreads.com/author/show/98013.Richard_C_Schwartz	248	4.36	1063	1994	5		Feb 07, 2021	Feb 07, 2021	Feb 23, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
63	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1593228147i/54283901.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1593228147l/54283901._SX50_.jpg	The Complete Poetry of Henry Wadsworth Longfellow	https://www.goodreads.com/book/show/54283901-the-complete-poetry-of-henry-wadsworth-longfellow	Longfellow, Henry Wadsworth	https://www.goodreads.com/author/show/2697.Henry_Wadsworth_Longfellow	879	4.21	323	1859	4		Jan 23, 2021	Jan 23, 2021	May 29, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
64	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1589842551i/40651883.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1589842551l/40651883._SX50_.jpg	Snow Crash	https://www.goodreads.com/book/show/40651883-snow-crash	Stephenson, Neal	https://www.goodreads.com/author/show/545.Neal_Stephenson	559	4.02	273383	Jun 1992	4		Jan 09, 2021	Jan 09, 2021	Mar 18, 2021	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
65	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1410384062i/18762043.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1410384062l/18762043._SX50_.jpg	A Winner's Guide to Negotiating: How Conversation Gets Deals Done	https://www.goodreads.com/book/show/18762043-a-winner-s-guide-to-negotiating	Fletcher, Molly	https://www.goodreads.com/author/show/2736385.Molly_Fletcher	224	3.91	47	Sep 16, 2014	3		Dec 15, 2020	Dec 15, 2020	Dec 15, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
66	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348218030i/14318.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348218030l/14318._SY75_.jpg	Chronicles, Volume One	https://www.goodreads.com/book/show/14318.Chronicles_Volume_One	Dylan, Bob	https://www.goodreads.com/author/show/8898.Bob_Dylan	320	3.97	55904	Nov 12, 2004	4		Oct 30, 2020	Oct 30, 2020	Nov 10, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
67	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1318116526i/51496.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1318116526l/51496._SY75_.jpg	Dr. Jekyll and Mr. Hyde	https://www.goodreads.com/book/show/51496.Dr_Jekyll_and_Mr_Hyde	Stevenson, Robert Louis	https://www.goodreads.com/author/show/854076.Robert_Louis_Stevenson	139	3.83	544410	Jan 05, 1886	5		Oct 25, 2020	Oct 25, 2020	Nov 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
68	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1631088473i/35031085.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1631088473l/35031085._SY75_.jpg	Frankenstein: The 1818 Text	https://www.goodreads.com/book/show/35031085-frankenstein	Shelley, Mary	https://www.goodreads.com/author/show/11139.Mary_Wollstonecraft_Shelley	260	3.86	1514490	Jan 01, 1818	5		Oct 11, 2020	Oct 11, 2020	Oct 25, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
69	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347923725i/98399.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1347923725l/98399._SY75_.jpg	Healing the Shame that Binds You	https://www.goodreads.com/book/show/98399.Healing_the_Shame_that_Binds_You	Bradshaw, John	https://www.goodreads.com/author/show/7705.John_Bradshaw	316	4.08	10708	Oct 01, 1988	5		Sep 15, 2020	Sep 15, 2020	Oct 15, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
70	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1475474209i/11438.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1475474209l/11438._SY75_.jpg	What We Talk About When We Talk About Love	https://www.goodreads.com/book/show/11438.What_We_Talk_About_When_We_Talk_About_Love	Carver, Raymond	https://www.goodreads.com/author/show/7363.Raymond_Carver	159	4.06	63209	Apr 20, 1981	4		Sep 02, 2020	Sep 02, 2020	Sep 28, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
71	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1536125624i/40796145.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1536125624l/40796145._SY75_.jpg	Down From The Mountain: The Life and Death of a Grizzly Bear	https://www.goodreads.com/book/show/40796145-down-from-the-mountain	Andrews, Bryce	https://www.goodreads.com/author/show/6984749.Bryce_Andrews	288	4.14	1127	Apr 16, 2019	4		Aug 20, 2020	Aug 20, 2020	Aug 23, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
72	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1657562670i/49455.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1657562670l/49455._SY75_.jpg	Notes from Underground	https://www.goodreads.com/book/show/49455.Notes_from_Underground	Dostoevsky, Fyodor	https://www.goodreads.com/author/show/3137322.Fyodor_Dostoevsky	136	4.18	142751	1864	4		Jul 19, 2020	\N	\N	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
73	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1646148284i/12854.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1646148284l/12854._SY75_.jpg	The Idiot	https://www.goodreads.com/book/show/12854.The_Idiot	Dostoevsky, Fyodor	https://www.goodreads.com/author/show/3137322.Fyodor_Dostoevsky	633	4.2	173084	1868	4		Jul 19, 2020	Jul 19, 2020	Jan 03, 2021	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
74	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1434682864i/92057.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1434682864l/92057._SY75_.jpg	The Autobiography of Malcolm X	https://www.goodreads.com/book/show/92057.The_Autobiography_of_Malcolm_X	X, Malcolm	https://www.goodreads.com/author/show/17435.Malcolm_X	466	4.35	259431	Oct 29, 1965	5		Jul 01, 2020	Jul 2020	Aug 12, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
75	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1436155034i/189989.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1436155034l/189989._SY75_.jpg	Finite and Infinite Games: A Vision of Life as Play and Possibility	https://www.goodreads.com/book/show/189989.Finite_and_Infinite_Games	Carse, James P.	https://www.goodreads.com/author/show/54828.James_P_Carse	180	3.8	6067	1986	5		Jul 01, 2020	Jul 2020	Nov 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
77	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1393447237i/18528190.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1393447237l/18528190._SX50_.jpg	Men Explain Things to Me	https://www.goodreads.com/book/show/18528190-men-explain-things-to-me	Solnit, Rebecca	https://www.goodreads.com/author/show/15811.Rebecca_Solnit	130	3.84	74865	Apr 14, 2014	5		Jun 16, 2020	\N	\N	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
78	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1320531289i/93426.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320531289l/93426._SY75_.jpg	Genghis Khan and the Making of the Modern World	https://www.goodreads.com/book/show/93426.Genghis_Khan_and_the_Making_of_the_Modern_World	Weatherford, Jack	https://www.goodreads.com/author/show/2497.Jack_Weatherford	312	4.05	70942	Mar 16, 2004	3		May 18, 2020	May 18, 2020	Jun 18, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
79	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1394305788i/12319.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1394305788l/12319._SY75_.jpg	Basic Writings of Nietzsche	https://www.goodreads.com/book/show/12319.Basic_Writings_of_Nietzsche	Nietzsche, Friedrich	https://www.goodreads.com/author/show/1938.Friedrich_Nietzsche	862	4.12	3755	1967	5		May 11, 2020	\N	\N	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
80	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1481675986i/24582662.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1481675986l/24582662._SY75_.jpg	Neural Networks and Deep Learning	https://www.goodreads.com/book/show/24582662-neural-networks-and-deep-learning	Nielsen, Michael	https://www.goodreads.com/author/show/4685525.Michael_Nielsen	224	4.56	387	Nov 25, 2013	5		May 06, 2020	May 06, 2020	May 18, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
81	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1575509280i/5129.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1575509280l/5129._SY75_.jpg	Brave New World	https://www.goodreads.com/book/show/5129.Brave_New_World	Huxley, Aldous	https://www.goodreads.com/author/show/3487.Aldous_Huxley	268	3.99	1783510	1932	4		Apr 14, 2020	Apr 14, 2020	May 06, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
82	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1334138184i/11012.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1334138184l/11012._SX50_.jpg	Dubliners	https://www.goodreads.com/book/show/11012.Dubliners	Joyce, James	https://www.goodreads.com/author/show/5144.James_Joyce	207	3.84	150163	Jun 15, 1914	5		Apr 11, 2020	Apr 11, 2020	May 06, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
83	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1493479268i/22613.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1493479268l/22613._SY75_.jpg	Simulacra and Simulation	https://www.goodreads.com/book/show/22613.Simulacra_and_Simulation	Baudrillard, Jean	https://www.goodreads.com/author/show/1264.Jean_Baudrillard	164	3.99	13981	1981	4		Mar 29, 2020	Apr 12, 2020	May 06, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
85	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386922806i/16634.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1386922806l/16634._SX50_.jpg	The Glass Bead Game	https://www.goodreads.com/book/show/16634.The_Glass_Bead_Game	Hesse, Hermann	https://www.goodreads.com/author/show/1113469.Hermann_Hesse	558	4.11	37528	1943	5		Feb 28, 2020	May 09, 2020	Jun 16, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
86	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388205307i/72912.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388205307l/72912._SY75_.jpg	I Heard God Laughing: Poems of Hope and Joy	https://www.goodreads.com/book/show/72912.I_Heard_God_Laughing	Hafez	https://www.goodreads.com/author/show/15291385.Hafez	93	4.49	1872	Aug 1996	4		Feb 24, 2020	Feb 24, 2020	May 06, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
87	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1361113128i/17255186.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361113128l/17255186._SX50_.jpg	The Phoenix Project: A Novel About IT, DevOps, and Helping Your Business Win	https://www.goodreads.com/book/show/17255186-the-phoenix-project	Kim, Gene	https://www.goodreads.com/author/show/328437.Gene_Kim	345	4.26	42940	Jan 10, 2013	5		Feb 24, 2020	Jan 31, 2023	Feb 04, 2023	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
88	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1462924585i/30165203.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1462924585l/30165203._SY75_.jpg	American Gods	https://www.goodreads.com/book/show/30165203-american-gods	Gaiman, Neil	https://www.goodreads.com/author/show/1221698.Neil_Gaiman	635	4.11	901284	Jun 19, 2001	4		Feb 24, 2020	Feb 24, 2020	Feb 28, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
89	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1470282863i/29101479.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1470282863l/29101479._SY75_.jpg	The Trainable Cat: A Practical Guide to Making Life Happier for You and Your Cat	https://www.goodreads.com/book/show/29101479-the-trainable-cat	Bradshaw, John	https://www.goodreads.com/author/show/14196952.John_Bradshaw	352	3.71	814	Aug 04, 2016	3		Dec 28, 2019	Dec 28, 2019	Jan 03, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
90	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348753833i/859807.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348753833l/859807._SY75_.jpg	Answer to Job	https://www.goodreads.com/book/show/859807.Answer_to_Job	Jung, Carl	https://www.goodreads.com/author/show/38285.C_G_Jung	121	4.17	1824	1952	4		Dec 19, 2019	Mar 09, 2020	Jul 02, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
91	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348953683i/4749235.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348953683l/4749235._SX50_.jpg	The Myth of the Rational Market: A History of Risk, Reward, and Delusion on Wall Street	https://www.goodreads.com/book/show/4749235-the-myth-of-the-rational-market	Fox, Justin	https://www.goodreads.com/author/show/8581368.Justin_Fox	400	3.85	2075	Sep 01, 2008	4		Nov 01, 2019	Nov 2019	Feb 24, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
92	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1516128292i/37903770.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1516128292l/37903770._SX50_.jpg	Norse Mythology	https://www.goodreads.com/book/show/37903770-norse-mythology	Gaiman, Neil	https://www.goodreads.com/author/show/1221698.Neil_Gaiman	301	4.1	305220	Feb 07, 2017	3		Nov 01, 2019	\N	Nov 2019	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
94	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1364057072i/2218102.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1364057072l/2218102._SX50_.jpg	Maps of Meaning: The Architecture of Belief	https://www.goodreads.com/book/show/2218102.Maps_of_Meaning	Peterson, Jordan B.	https://www.goodreads.com/author/show/282885.Jordan_B_Peterson	564	4.07	5292	Mar 01, 1999	\N		Oct 10, 2019	Oct 10, 2019	Oct 22, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
95	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1389571948i/823733.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1389571948l/823733._SY75_.jpg	The Creation of Consciousness: Jung's Myth for Modern Man\n        (Studies in Jungian Psychology by Jungian Analysts, 14)	https://www.goodreads.com/book/show/823733.The_Creation_of_Consciousness	Edinger, Edward F.	https://www.goodreads.com/author/show/1634.Edward_F_Edinger	128	4.33	117	Feb 01, 1984	5		Oct 10, 2019	Oct 10, 2019	Jan 03, 2020	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
96	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327582271i/646175.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327582271l/646175._SY75_.jpg	Modern Man in Search of a Soul	https://www.goodreads.com/book/show/646175.Modern_Man_in_Search_of_a_Soul	Jung, Carl	https://www.goodreads.com/author/show/38285.C_G_Jung	244	4.2	11614	1931	4		Oct 10, 2019	Oct 10, 2019	Oct 22, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
97	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387708713i/129909.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387708713l/129909._SY75_.jpg	The Boy Who Was Raised as a Dog: And Other Stories from a Child Psychiatrist's Notebook	https://www.goodreads.com/book/show/129909.The_Boy_Who_Was_Raised_as_a_Dog	Perry, Bruce D.	https://www.goodreads.com/author/show/74693.Bruce_D_Perry	288	4.58	29635	Jan 08, 2007	5		Oct 10, 2019	\N	Oct 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
98	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388263090i/224832.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388263090l/224832._SX50_.jpg	Attachment in Psychotherapy	https://www.goodreads.com/book/show/224832.Attachment_in_Psychotherapy	Wallin, David J.	https://www.goodreads.com/author/show/131560.David_J_Wallin	366	4.36	1600	Feb 01, 2007	5		Sep 06, 2019	Jan 18, 2021	Feb 07, 2021	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
99	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348837009i/4129848.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348837009l/4129848._SY75_.jpg	Mastering the Core Teachings of the Buddha: An Unusually Hardcore Dharma Book	https://www.goodreads.com/book/show/4129848-mastering-the-core-teachings-of-the-buddha	Ingram, Daniel M.	https://www.goodreads.com/author/show/1751825.Daniel_M_Ingram	406	4.26	996	Apr 2007	4		Aug 28, 2019	Aug 28, 2019	Feb 24, 2020	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
100	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1427728126i/4934.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1427728126l/4934._SX50_.jpg	The Brothers Karamazov	https://www.goodreads.com/book/show/4934.The_Brothers_Karamazov	Dostoevsky, Fyodor	https://www.goodreads.com/author/show/3137322.Fyodor_Dostoevsky	796	4.36	315562	1880	5		Aug 28, 2019	Aug 28, 2019	Apr 11, 2020	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
102	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1615817367i/139864.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1615817367l/139864._SX50_.jpg	The Collected Poems of Frank O'Hara	https://www.goodreads.com/book/show/139864.The_Collected_Poems_of_Frank_O_Hara	O'Hara, Frank	https://www.goodreads.com/author/show/80892.Frank_O_Hara	624	4.34	5509	1971	4		Jun 26, 2019	\N	\N	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
103	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1320391549i/136981.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320391549l/136981._SX50_.jpg	Practicing Peace in Times of War	https://www.goodreads.com/book/show/136981.Practicing_Peace_in_Times_of_War	Chödrön, Pema	https://www.goodreads.com/author/show/8052.Pema_Ch_dr_n	128	4.37	1379	Aug 29, 2006	4		Jun 22, 2019	\N	Jul 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
104	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1345767609i/754174.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1345767609l/754174._SY75_.jpg	Myth and Meaning: Cracking the Code of Culture	https://www.goodreads.com/book/show/754174.Myth_and_Meaning	Lévi-Strauss, Claude	https://www.goodreads.com/author/show/33321.Claude_L_vi_Strauss	80	3.76	2224	1978	4		Jun 22, 2019	\N	Jun 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
105	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347488806i/306940.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1347488806l/306940._SY75_.jpg	Impro: Improvisation and the Theatre	https://www.goodreads.com/book/show/306940.Impro	Johnstone, Keith	https://www.goodreads.com/author/show/154721.Keith_Johnstone	208	4.24	3287	Jun 18, 1979	5		May 09, 2019	May 09, 2019	Jun 03, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
106	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1410140241i/74456.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1410140241l/74456._SY75_.jpg	The Awakening of Intelligence	https://www.goodreads.com/book/show/74456.The_Awakening_of_Intelligence	Krishnamurti, Jiddu	https://www.goodreads.com/author/show/850512.J_Krishnamurti	544	4.38	1702	Jan 01, 1973	5		May 01, 2019	May 2019	Feb 24, 2020	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
107	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1184554102i/1515582.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1184554102l/1515582._SY75_.jpg	A Descent into the Maelstrom - an Edgar Allan Poe Short Story	https://www.goodreads.com/book/show/1515582.A_Descent_into_the_Maelstrom_an_Edgar_Allan_Poe_Short_Story	Poe, Edgar Allan	https://www.goodreads.com/author/show/4624490.Edgar_Allan_Poe	36	3.5	3037	1841	4		Apr 25, 2019	\N	Apr 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
108	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388799397i/14705.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388799397l/14705._SY75_.jpg	Faust, Part One	https://www.goodreads.com/book/show/14705.Faust_Part_One	Goethe, Johann Wolfgang von	https://www.goodreads.com/author/show/285217.Johann_Wolfgang_von_Goethe	240	3.87	73241	1808	4		Apr 25, 2019	Apr 25, 2019	May 09, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
109	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1500590815i/2800.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1500590815l/2800._SX50_.jpg	The Mechanical Bride : Folklore of Industrial Man	https://www.goodreads.com/book/show/2800.The_Mechanical_Bride_	McLuhan, Marshall	https://www.goodreads.com/author/show/455.Marshall_McLuhan	160	4.02	305	1951	5		Apr 17, 2019	Apr 17, 2019	Oct 22, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
110	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327336291i/123632.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327336291l/123632._SY75_.jpg	Man and His Symbols	https://www.goodreads.com/book/show/123632.Man_and_His_Symbols	Jung, Carl	https://www.goodreads.com/author/show/38285.C_G_Jung	415	4.19	27499	1964	5		Apr 17, 2019	Apr 17, 2019	Jun 26, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
111	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327881361i/320.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327881361l/320._SX50_.jpg	One Hundred Years of Solitude	https://www.goodreads.com/book/show/320.One_Hundred_Years_of_Solitude	García Márquez, Gabriel	https://www.goodreads.com/author/show/13450.Gabriel_Garc_a_M_rquez	417	4.11	935338	May 1967	3		Mar 03, 2019	Mar 03, 2019	May 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
112	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1321994947i/46199.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1321994947l/46199._SY75_.jpg	Letters to a Young Poet	https://www.goodreads.com/book/show/46199.Letters_to_a_Young_Poet	Rilke, Rainer Maria	https://www.goodreads.com/author/show/7906.Rainer_Maria_Rilke	80	4.29	83855	1929	5		Mar 03, 2019	Mar 03, 2019	Mar 29, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
113	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1447957962i/25744928.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447957962l/25744928._SY75_.jpg	Deep Work: Rules for Focused Success in a Distracted World	https://www.goodreads.com/book/show/25744928-deep-work	Newport, Cal	https://www.goodreads.com/author/show/147891.Cal_Newport	296	4.19	143117	Jan 05, 2016	4		Mar 01, 2019	Mar 2019	Mar 29, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
114	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1311705552i/9547888.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1311705552l/9547888._SX50_.jpg	Attached: The New Science of Adult Attachment and How It Can Help You Find—and Keep—Love	https://www.goodreads.com/book/show/9547888-attached	Levine, Amir	https://www.goodreads.com/author/show/4417525.Amir_Levine	304	4.15	73853	Dec 30, 2010	3		Mar 01, 2019	Mar 2019	Mar 29, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
115	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1434908555i/234225.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1434908555l/234225._SY75_.jpg	Dune\n        (Dune, #1)	https://www.goodreads.com/book/show/234225.Dune	Herbert, Frank	https://www.goodreads.com/author/show/58.Frank_Herbert	604	4.26	1257049	Jun 01, 1965	4		Feb 27, 2019	Feb 27, 2019	Mar 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
116	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1549433350i/40672036.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1549433350l/40672036._SY75_.jpg	Digital Minimalism: Choosing a Focused Life in a Noisy World	https://www.goodreads.com/book/show/40672036-digital-minimalism	Newport, Cal	https://www.goodreads.com/author/show/147891.Cal_Newport	302	4.06	72968	2019	3		Feb 06, 2019	Feb 06, 2019	Feb 27, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
117	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1396830687i/12075.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1396830687l/12075._SY75_.jpg	Tractatus Logico-Philosophicus	https://www.goodreads.com/book/show/12075.Tractatus_Logico_Philosophicus	Wittgenstein, Ludwig	https://www.goodreads.com/author/show/7672.Ludwig_Wittgenstein	142	4.09	19334	1921	\N		Jan 11, 2019	\N	\N	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
118	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1627644403i/58661468.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1627644403l/58661468._SX50_.jpg	Crafting Interpreters	https://www.goodreads.com/book/show/58661468-crafting-interpreters	Nystrom, Robert	https://www.goodreads.com/author/show/6332712.Robert_Nystrom	865	4.7	243	Jul 27, 2021	5		Jan 11, 2019	Jan 11, 2019	Mar 03, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
119	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1382220562i/13545165.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1382220562l/13545165._SY75_.jpg	What Makes Love Last?: How to Build Trust and Avoid Betrayal	https://www.goodreads.com/book/show/13545165-what-makes-love-last	Gottman, John M.	https://www.goodreads.com/author/show/14734208.John_M_Gottman	304	4.23	2418	Sep 04, 2012	4		Jan 11, 2019	Jan 11, 2019	Feb 06, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
120	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1427163007i/23848190.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1427163007l/23848190._SX50_.jpg	Extreme Ownership: How U.S. Navy SEALs Lead and Win	https://www.goodreads.com/book/show/23848190-extreme-ownership	Willink, Jocko	https://www.goodreads.com/author/show/10803973.Jocko_Willink	320	4.25	74547	Oct 20, 2015	4		Jan 11, 2019	Jan 11, 2019	Feb 06, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
121	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1311705051i/10483171.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1311705051l/10483171._SY75_.jpg	The Beginning of Infinity: Explanations That Transform the World	https://www.goodreads.com/book/show/10483171-the-beginning-of-infinity	Deutsch, David	https://www.goodreads.com/author/show/103190.David_Deutsch	487	4.18	7307	Mar 01, 2011	\N		Nov 05, 2018	Feb 23, 2021	May 29, 2021	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
122	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1483232988i/33652490.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1483232988l/33652490._SX50_.jpg	Men Without Women	https://www.goodreads.com/book/show/33652490-men-without-women	Murakami, Haruki	https://www.goodreads.com/author/show/3354.Haruki_Murakami	242	3.76	97202	Apr 18, 2014	3		Oct 05, 2018	\N	Mar 2017	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
123	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1585220820i/64710.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1585220820l/64710._SY75_.jpg	The First and Last Freedom	https://www.goodreads.com/book/show/64710.The_First_and_Last_Freedom	Krishnamurti, Jiddu	https://www.goodreads.com/author/show/850512.J_Krishnamurti	288	4.21	3947	1954	5		Oct 05, 2018	Oct 05, 2018	Apr 17, 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
124	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1352422827i/13530973.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1352422827l/13530973._SY75_.jpg	Antifragile: Things That Gain from Disorder	https://www.goodreads.com/book/show/13530973-antifragile	Taleb, Nassim Nicholas	https://www.goodreads.com/author/show/21559.Nassim_Nicholas_Taleb	426	4.09	49579	Nov 27, 2012	5		Sep 18, 2018	\N	Jan 2014	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
125	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386925471i/242472.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1386925471l/242472._SY75_.jpg	The Black Swan: The Impact of the Highly Improbable	https://www.goodreads.com/book/show/242472.The_Black_Swan	Taleb, Nassim Nicholas	https://www.goodreads.com/author/show/21559.Nassim_Nicholas_Taleb	366	3.96	108619	Apr 17, 2007	5		Sep 18, 2018	\N	Jan 2012	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
126	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1312827620i/920607.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1312827620l/920607._SX50_.jpg	The Arrival	https://www.goodreads.com/book/show/920607.The_Arrival	Tan, Shaun	https://www.goodreads.com/author/show/38954.Shaun_Tan	132	4.35	55461	Oct 12, 2007	4		Sep 18, 2018	Sep 18, 2018	Nov 05, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
127	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1510319798i/36064445.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1510319798l/36064445._SY75_.jpg	Skin in the Game: The Hidden Asymmetries in Daily Life	https://www.goodreads.com/book/show/36064445-skin-in-the-game	Taleb, Nassim Nicholas	https://www.goodreads.com/author/show/21559.Nassim_Nicholas_Taleb	272	3.9	25746	Jun 2018	5		Aug 20, 2018	\N	Sep 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
128	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328776199i/11172069.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328776199l/11172069._SY75_.jpg	Sacrifice	https://www.goodreads.com/book/show/11172069-sacrifice	Girard, René	https://www.goodreads.com/author/show/193536.Ren_Girard	104	3.88	202	2003	4		Aug 20, 2018	Aug 20, 2018	Sep 18, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
129	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327878742i/35519.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327878742l/35519._SY75_.jpg	The Power of Myth	https://www.goodreads.com/book/show/35519.The_Power_of_Myth	Campbell, Joseph	https://www.goodreads.com/author/show/20105.Joseph_Campbell	293	4.26	50290	Jun 01, 1988	5		Jul 29, 2018	\N	Jul 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
130	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1442885694i/588138.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442885694l/588138._SY75_.jpg	The Hero With a Thousand Faces	https://www.goodreads.com/book/show/588138.The_Hero_With_a_Thousand_Faces	Campbell, Joseph	https://www.goodreads.com/author/show/20105.Joseph_Campbell	416	4.13	40253	Jun 10, 1949	5		Jul 29, 2018	Aug 27, 2018	Sep 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
131	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1483412266i/865.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1483412266l/865._SY75_.jpg	The Alchemist	https://www.goodreads.com/book/show/865.The_Alchemist	Coelho, Paulo	https://www.goodreads.com/author/show/566.Paulo_Coelho	197	3.9	2887957	1988	4		Jul 15, 2018	\N	Feb 2017	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
132	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387737217i/910789.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387737217l/910789._SX50_.jpg	The Elements of Computing Systems: Building a Modern Computer from First Principles	https://www.goodreads.com/book/show/910789.The_Elements_of_Computing_Systems	Nisan, Noam	https://www.goodreads.com/author/show/465984.Noam_Nisan	341	4.55	842	Apr 01, 2005	5		Jul 15, 2018	\N	Mar 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
133	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1175898541i/572498.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1175898541l/572498._SY75_.jpg	Is It Love or Is It Addiction?	https://www.goodreads.com/book/show/572498.Is_It_Love_or_Is_It_Addiction_	Schaeffer, Brenda	https://www.goodreads.com/author/show/305299.Brenda_Schaeffer	193	4.02	395	Apr 30, 1989	3		Jul 10, 2018	\N	Sep 2016	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
134	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1442818386i/823467.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442818386l/823467._SY75_.jpg	Facing Codependence: What It Is, Where It Comes from, How It Sabotages Our Lives	https://www.goodreads.com/book/show/823467.Facing_Codependence	Mellody, Pia	https://www.goodreads.com/author/show/55264.Pia_Mellody	222	4.08	2515	1989	4		Jul 10, 2018	\N	Nov 2016	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
135	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1515964026i/36794489.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1515964026l/36794489._SX50_.jpg	When Einstein Walked with Gödel: Excursions to the Edge of Thought	https://www.goodreads.com/book/show/36794489-when-einstein-walked-with-g-del	Holt, Jim	https://www.goodreads.com/author/show/1418923.Jim_Holt	368	4.05	2075	May 15, 2018	4		Jul 09, 2018	Jul 09, 2018	Aug 20, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
136	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1495386506i/32919530.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1495386506l/32919530._SY75_.jpg	A Mind at Play: How Claude Shannon Invented the Information Age	https://www.goodreads.com/book/show/32919530-a-mind-at-play	Soni, Jimmy	https://www.goodreads.com/author/show/5773552.Jimmy_Soni	384	4.17	2290	Jul 18, 2017	4		Jul 09, 2018	Jan 17, 2019	Jan 26, 2019	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
137	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1497285423i/35239798.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1497285423l/35239798._SX50_.jpg	The Courage to be Disliked	https://www.goodreads.com/book/show/35239798-the-courage-to-be-disliked	Kishimi, Ichiro	https://www.goodreads.com/author/show/14541046.Ichiro_Kishimi	288	4.04	60381	Dec 12, 2013	4		Jul 09, 2018	Jan 19, 2019	Feb 06, 2019	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
138	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1442775722i/123471.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442775722l/123471._SX50_.jpg	I Am a Strange Loop	https://www.goodreads.com/book/show/123471.I_Am_a_Strange_Loop	Hofstadter, Douglas R.	https://www.goodreads.com/author/show/3034502.Douglas_R_Hofstadter	436	3.95	7488	Mar 26, 2007	5		Jul 09, 2018	Jul 09, 2018	Aug 20, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
139	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1414351487i/23398748.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1414351487l/23398748._SY75_.jpg	Doing Good Better: How Effective Altruism Can Help You Make a Difference	https://www.goodreads.com/book/show/23398748-doing-good-better	MacAskill, William	https://www.goodreads.com/author/show/9761990.William_MacAskill	272	4.22	6721	Jul 28, 2015	4		Jun 08, 2018	\N	Jul 2016	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
140	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1559986152i/386162.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1559986152l/386162._SX50_SY75_.jpg	The Hitchhiker's Guide to the Galaxy\n        (The Hitchhiker's Guide to the Galaxy, #1)	https://www.goodreads.com/book/show/386162.The_Hitchhiker_s_Guide_to_the_Galaxy	Adams, Douglas	https://www.goodreads.com/author/show/4.Douglas_Adams	193	4.23	1777932	Oct 12, 1979	5		Jun 01, 2018	Jun 2018	Jul 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
141	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1435790827i/24612233.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1435790827l/24612233._SY75_.jpg	The Master Algorithm: How the Quest for the Ultimate Learning Machine Will Remake Our World	https://www.goodreads.com/book/show/24612233-the-master-algorithm	Domingos, Pedro	https://www.goodreads.com/author/show/3242685.Pedro_Domingos	352	3.75	5901	Sep 08, 2015	\N		May 24, 2018	\N	May 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
142	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347784020i/22404.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1347784020l/22404._SY75_.jpg	The Invisible Partner: How the Male and Female in Each of Us Affects Our Relationships	https://www.goodreads.com/book/show/22404.The_Invisible_Partner	Sanford, John A.	https://www.goodreads.com/author/show/12765.John_A_Sanford	139	4.05	429	Jan 01, 1979	4		May 24, 2018	May 24, 2018	Jun 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
143	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386925474i/83895.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1386925474l/83895._SX50_.jpg	Computer Organization & Design: The Hardware/Software Interface	https://www.goodreads.com/book/show/83895.Computer_Organization_Design	Patterson, David A.	https://www.goodreads.com/author/show/39505.David_A_Patterson	965	3.97	1620	1993	5		Mar 03, 2018	Mar 03, 2018	Mar 03, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
144	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1391032531i/515601.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1391032531l/515601._SX50_.jpg	The C Programming Language	https://www.goodreads.com/book/show/515601.The_C_Programming_Language	Kernighan, Brian W.	https://www.goodreads.com/author/show/153350.Brian_W_Kernighan	272	4.43	10540	1978	5		Mar 03, 2018	Mar 03, 2018	May 24, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
145	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348195310i/81939.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348195310l/81939._SX50_.jpg	The Mastery of Love: A Practical Guide to the Art of Relationship: A Toltec Wisdom Book	https://www.goodreads.com/book/show/81939.The_Mastery_of_Love	Ruiz, Miguel	https://www.goodreads.com/author/show/4402.Miguel_Ruiz	248	4.26	50721	1999	4		Feb 21, 2018	Feb 21, 2018	Mar 03, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
146	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1344721272i/10144324.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1344721272l/10144324._SX50_.jpg	The Algorithm Design Manual	https://www.goodreads.com/book/show/10144324-the-algorithm-design-manual	Skiena, Steven S.	https://www.goodreads.com/author/show/518918.Steven_S_Skiena	730	4.35	2571	Nov 14, 1997	5		Jan 20, 2018	Jan 20, 2018	Feb 09, 2018	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
147	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1659761696i/10016013.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1659761696l/10016013._SY75_.jpg	Harry Potter and the Methods of Rationality	https://www.goodreads.com/book/show/10016013-harry-potter-and-the-methods-of-rationality	Yudkowsky, Eliezer	https://www.goodreads.com/author/show/4533716.Eliezer_Yudkowsky	2	4.39	16656	Mar 14, 2015	5		Jan 20, 2018	\N	Feb 16, 2016	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
149	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1410981914i/22174460.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1410981914l/22174460._SY75_.jpg	The Age of Cryptocurrency: How Bitcoin and Digital Money Are Challenging the Global Economic Order	https://www.goodreads.com/book/show/22174460-the-age-of-cryptocurrency	Vigna, Paul	https://www.goodreads.com/author/show/8225349.Paul_Vigna	368	3.85	2753	Jan 27, 2015	5		Jan 20, 2018	\N	May 04, 2017	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
151	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1461534296i/29878354.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1461534296l/29878354._SY75_.jpg	The Business Blockchain: Promise, Practice, and Application of the Next Internet Technology	https://www.goodreads.com/book/show/29878354-the-business-blockchain	Mougayar, William	https://www.goodreads.com/author/show/15172416.William_Mougayar	208	3.46	876	Apr 2016	3		Jan 20, 2018	\N	Jun 2017	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
152	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1366556178i/17675009.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1366556178l/17675009._SY75_.jpg	Mozart	https://www.goodreads.com/book/show/17675009-mozart	Johnson, Paul	https://www.goodreads.com/author/show/3494705.Paul_Johnson	176	3.64	823	Nov 2013	3		Jan 20, 2018	\N	Jun 2017	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
150	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1473282681i/31869077.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1473282681l/31869077._SY75_.jpg	The Internet of Money	https://www.goodreads.com/book/show/31869077-the-internet-of-money	Antonopoulos, Andreas M.	https://www.goodreads.com/author/show/8115718.Andreas_M_Antonopoulos	200	4.06	3760	August 29, 2016	5		Jan 20, 2018	\N	May 2017	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
153	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1630510455i/10883.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1630510455l/10883._SX50_.jpg	Benjamin Franklin: An American Life	https://www.goodreads.com/book/show/10883.Benjamin_Franklin	Isaacson, Walter	https://www.goodreads.com/author/show/7111.Walter_Isaacson	586	4.03	136814	Jul 01, 2003	4		Jan 20, 2018	\N	Jul 2017	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
154	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1511288482i/11084145.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1511288482l/11084145._SY75_.jpg	Steve Jobs	https://www.goodreads.com/book/show/11084145-steve-jobs	Isaacson, Walter	https://www.goodreads.com/author/show/7111.Walter_Isaacson	630	4.16	1210005	Oct 01, 2011	4		Jan 20, 2018	\N	Feb 2015	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
156	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1333578746i/3869.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1333578746l/3869._SX50_.jpg	A Brief History of Time	https://www.goodreads.com/book/show/3869.A_Brief_History_of_Time	Hawking, Stephen	https://www.goodreads.com/author/show/1401.Stephen_Hawking	226	4.21	415571	Sep 1988	5		Jan 20, 2018	\N	Jul 2008	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
157	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388180506i/38315.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388180506l/38315._SY75_.jpg	Fooled by Randomness: The Hidden Role of Chance in Life and in the Markets	https://www.goodreads.com/book/show/38315.Fooled_by_Randomness	Taleb, Nassim Nicholas	https://www.goodreads.com/author/show/21559.Nassim_Nicholas_Taleb	368	4.08	62380	2001	4		Jan 20, 2018	\N	Sep 18, 2013	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
158	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1320399438i/17690.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320399438l/17690._SY75_.jpg	The Trial	https://www.goodreads.com/book/show/17690.The_Trial	Kafka, Franz	https://www.goodreads.com/author/show/5223.Franz_Kafka	255	3.96	305581	Apr 26, 1925	5		Jan 20, 2018	\N	Mar 2017	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
160	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387714650i/17897406.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387714650l/17897406._SX50_.jpg	Applications of No-Limit Hold em	https://www.goodreads.com/book/show/17897406-applications-of-no-limit-hold-em	Janda, Matthew	https://www.goodreads.com/author/show/7081162.Matthew_Janda	494	4.42	233	May 01, 2013	5		Jan 20, 2018	\N	Nov 2013	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
161	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1452898522i/8045789.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1452898522l/8045789._SY75_.jpg	Ender's Game\n        (Ender's Saga, #1)	https://www.goodreads.com/book/show/8045789-ender-s-game	Card, Orson Scott	https://www.goodreads.com/author/show/589.Orson_Scott_Card	226	4.31	1334687	Jan 15, 1985	5		Jan 20, 2018	\N	Apr 2013	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
162	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328135600i/11053520.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328135600l/11053520._SX50_.jpg	The Man Who Folded Himself	https://www.goodreads.com/book/show/11053520-the-man-who-folded-himself	Gerrold, David	https://www.goodreads.com/author/show/5786.David_Gerrold	146	3.81	5763	1973	5		Jan 20, 2018	\N	Feb 2015	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
163	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328331012i/8385952.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328331012l/8385952._SY75_.jpg	Ender's Shadow\n        (Shadow, #1)	https://www.goodreads.com/book/show/8385952-ender-s-shadow	Card, Orson Scott	https://www.goodreads.com/author/show/589.Orson_Scott_Card	484	4.31	169279	Oct 01, 1999	5		Jan 20, 2018	\N	Jan 2013	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
164	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1465239691i/8251464.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1465239691l/8251464._SY75_.jpg	Speaker for the Dead\n        (Ender's Saga, #2)	https://www.goodreads.com/book/show/8251464-speaker-for-the-dead	Card, Orson Scott	https://www.goodreads.com/author/show/589.Orson_Scott_Card	419	4.09	249410	Mar 1986	5		Jan 20, 2018	\N	Jan 2013	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
165	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328301817i/8126003.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328301817l/8126003._SY75_.jpg	Xenocide\n        (Ender's Saga, #3)	https://www.goodreads.com/book/show/8126003-xenocide	Card, Orson Scott	https://www.goodreads.com/author/show/589.Orson_Scott_Card	612	3.81	154703	Aug 1991	5		Jan 20, 2018	\N	Aug 2013	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
166	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1367609201i/16089813.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1367609201l/16089813._SY75_.jpg	Daring Greatly: How the Courage to Be Vulnerable Transforms the Way We Live, Love, Parent, and Lead	https://www.goodreads.com/book/show/16089813-daring-greatly	Brown, Brené	https://www.goodreads.com/author/show/162578.Bren_Brown	290	4.29	201986	Sep 11, 2012	5		Jan 20, 2018	\N	Jan 2015	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
167	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1357616741i/9413297.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1357616741l/9413297._SY75_.jpg	Shantaram	https://www.goodreads.com/book/show/9413297-shantaram	Roberts, Gregory David	https://www.goodreads.com/author/show/18907.Gregory_David_Roberts	946	4.27	208521	2003	5		Jan 20, 2018	\N	Nov 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
183	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328325720i/6584842.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328325720l/6584842._SY75_.jpg	Vagabonding: An Uncommon Guide to the Art of Long-Term World Travel	https://www.goodreads.com/book/show/6584842-vagabonding	Potts, Rolf	https://www.goodreads.com/author/show/57862.Rolf_Potts	224	3.95	25271	Jan 01, 2002	5		Jan 20, 2018	\N	Nov 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
159	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348081175i/612188.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348081175l/612188._SY75_.jpg	Memories, Dreams, Reflections	https://www.goodreads.com/book/show/612188.Memories_Dreams_Reflections	Jung, Carl	https://www.goodreads.com/author/show/38285.C_G_Jung	430	4.15	33386	1961	5		Jan 20, 2018	\N	Jun 2018	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
168	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1503703565i/8205855.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1503703565l/8205855._SY75_.jpg	The 4 Hour Workweek, Expanded And Updated: Expanded And Updated, With Over 100 New Pages Of Cutting Edge Content	https://www.goodreads.com/book/show/8205855-the-4-hour-workweek-expanded-and-updated	Ferriss, Timothy	https://www.goodreads.com/author/show/210456.Timothy_Ferriss	416	3.92	283337	Jun 25, 2007	4		Jan 20, 2018	\N	Jan 2013	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
169	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1384913568i/18867923.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1384913568l/18867923._SY75_.jpg	Siddhartha	https://www.goodreads.com/book/show/18867923-siddhartha	Hesse, Hermann	https://www.goodreads.com/author/show/1113469.Hermann_Hesse	140	4.06	740082	1922	5		Jan 20, 2018	\N	Oct 2014	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
170	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1614366774i/36680837.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1614366774l/36680837._SY75_.jpg	Meditations	https://www.goodreads.com/book/show/36680837-meditations	Marcus Aurelius	https://www.goodreads.com/author/show/17212.Marcus_Aurelius	256	4.27	219031	180	5		Jan 20, 2018	\N	Jan 2015	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
171	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328317167i/8216968.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328317167l/8216968._SY75_.jpg	The Art of Learning: An Inner Journey to Optimal Performance	https://www.goodreads.com/book/show/8216968-the-art-of-learning	Waitzkin, Josh	https://www.goodreads.com/author/show/48788.Josh_Waitzkin	292	4.04	18847	2007	5		Jan 20, 2018	\N	Mar 09, 2014	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
172	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1447351611i/20554127.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447351611l/20554127._SX50_.jpg	The Obstacle Is the Way: The Timeless Art of Turning Trials into Triumph	https://www.goodreads.com/book/show/20554127-the-obstacle-is-the-way	Holiday, Ryan	https://www.goodreads.com/author/show/5775580.Ryan_Holiday	202	4.15	74998	May 2014	3		Jan 20, 2018	\N	Mar 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
173	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1420563257i/23533786.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1420563257l/23533786._SY75_.jpg	The Art of Asking; or, How I Learned to Stop Worrying and Let People Help	https://www.goodreads.com/book/show/23533786-the-art-of-asking-or-how-i-learned-to-stop-worrying-and-let-people-hel	Palmer, Amanda	https://www.goodreads.com/author/show/1010543.Amanda_Palmer	342	3.93	35823	Nov 11, 2014	2		Jan 20, 2018	\N	May 2015	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
174	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1394749483i/20874659.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1394749483l/20874659._SX50_.jpg	Show Your Work!: 10 Ways to Share Your Creativity and Get Discovered	https://www.goodreads.com/book/show/20874659-show-your-work	Kleon, Austin	https://www.goodreads.com/author/show/2985039.Austin_Kleon	131	4.12	48680	Mar 06, 2014	2		Jan 20, 2018	\N	Jan 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
175	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1607205491i/30245389.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1607205491l/30245389._SY75_.jpg	Night Sky with Exit Wounds	https://www.goodreads.com/book/show/30245389-night-sky-with-exit-wounds	Vuong, Ocean	https://www.goodreads.com/author/show/4456871.Ocean_Vuong	93	4.21	35506	Apr 05, 2016	4		Jan 20, 2018	\N	Jul 11, 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
176	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1448611979i/7796228.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1448611979l/7796228._SX50_.jpg	The Checklist Manifesto: How to Get Things Right	https://www.goodreads.com/book/show/7796228-the-checklist-manifesto	Gawande, Atul	https://www.goodreads.com/author/show/3078.Atul_Gawande	225	4.03	66007	Dec 22, 2009	2		Jan 20, 2018	\N	May 2014	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
177	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1563806134i/6483174.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1563806134l/6483174._SY75_.jpg	Radical Acceptance: Embracing Your Life with the Heart of a Buddha	https://www.goodreads.com/book/show/6483174-radical-acceptance	Brach, Tara	https://www.goodreads.com/author/show/101301.Tara_Brach	352	4.16	26469	Oct 01, 2000	5		Jan 20, 2018	\N	Aug 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
178	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1433930311i/20873740.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1433930311l/20873740._SY75_.jpg	Sapiens: A Brief History of Humankind	https://www.goodreads.com/book/show/20873740-sapiens	Harari, Yuval Noah	https://www.goodreads.com/author/show/395812.Yuval_Noah_Harari	414	4.37	949537	2011	5		Jan 20, 2018	\N	Jan 2017	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
179	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1344432724i/9804.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1344432724l/9804._SY75_.jpg	The Baron in the Trees	https://www.goodreads.com/book/show/9804.The_Baron_in_the_Trees	Calvino, Italo	https://www.goodreads.com/author/show/155517.Italo_Calvino	217	4.02	42413	1957	4		Jan 20, 2018	\N	Feb 2017	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
180	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1450002427i/22570477.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1450002427l/22570477._SY75_.jpg	The Truth: An Uncomfortable Book about Relationships	https://www.goodreads.com/book/show/22570477-the-truth	Strauss, Neil	https://www.goodreads.com/author/show/588.Neil_Strauss	448	4.12	7115	Jan 01, 2015	5		Jan 20, 2018	\N	Aug 13, 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
181	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1560757089i/6512869.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1560757089l/6512869._SY75_.jpg	The Power of Now: A Guide to Spiritual Enlightenment	https://www.goodreads.com/book/show/6512869-the-power-of-now	Tolle, Eckhart	https://www.goodreads.com/author/show/4493.Eckhart_Tolle	258	4.15	334343	1997	5		Jan 20, 2018	\N	Oct 11, 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
182	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1385123936i/18884829.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1385123936l/18884829._SY75_.jpg	Tao Te Ching	https://www.goodreads.com/book/show/18884829-tao-te-ching	Lao Tzu	https://www.goodreads.com/author/show/2622245.Lao_Tzu	162	4.3	151157	-400	4		Jan 20, 2018	\N	Mar 2016	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
184	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1407177776i/20371395.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1407177776l/20371395._SX50_.jpg	God's Debris: A Thought Experiement	https://www.goodreads.com/book/show/20371395-god-s-debris	Adams, Scott	https://www.goodreads.com/author/show/5282.Scott_Adams	132	3.95	7711	Sep 15, 2001	3		Jan 20, 2018	\N	Jun 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
185	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1504027900i/36146011.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1504027900l/36146011._SX50_.jpg	Tools of Titans: The Tactics, Routines, and Habits of Billionaires, Icons, and World-Class Performers	https://www.goodreads.com/book/show/36146011-tools-of-titans	Ferriss, Timothy	https://www.goodreads.com/author/show/210456.Timothy_Ferriss	707	4.1	40652	Dec 06, 2016	5		Jan 20, 2018	\N	Jan 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
186	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328364898i/9803995.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328364898l/9803995._SY75_.jpg	Surely You're Joking, Mr. Feynman!  Adventures of a Curious Character	https://www.goodreads.com/book/show/9803995-surely-you-re-joking-mr-feynman-adventures-of-a-curious-character	Feynman, Richard	https://www.goodreads.com/author/show/1429989.Richard_P_Feynman	352	4.27	195468	1985	5		Jan 20, 2018	\N	Apr 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
187	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1480724838i/33229792.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1480724838l/33229792._SX50_.jpg	80,000 Hours: Find a fulfilling career that does good	https://www.goodreads.com/book/show/33229792-80-000-hours	Todd, Benjamin	https://www.goodreads.com/author/show/7438890.Benjamin_Todd	276	4.01	1416	Nov 28, 2016	3		Jan 20, 2018	\N	Jan 03, 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
188	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1390275705i/20603758.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1390275705l/20603758._SY75_.jpg	Ready Player One\n        (Ready Player One, #1)	https://www.goodreads.com/book/show/20603758-ready-player-one	Cline, Ernest	https://www.goodreads.com/author/show/31712.Ernest_Cline	386	4.23	1117909	Aug 16, 2011	4		Jan 20, 2018	\N	Feb 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
189	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1467251477i/30814913.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1467251477l/30814913._SY75_.jpg	Emotional Agility: Get Unstuck, Embrace Change, and Thrive in Work and Life	https://www.goodreads.com/book/show/30814913-emotional-agility	David, Susan A.	https://www.goodreads.com/author/show/7118701.Susan_David	281	3.98	11567	Sep 2016	3		Jan 20, 2018	\N	Sep 2016	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
190	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1415677371i/180116.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1415677371l/180116._SY75_.jpg	Awaken the Giant Within: How to Take Immediate Control of Your Mental, Emotional, Physical and Financial Destiny!	https://www.goodreads.com/book/show/180116.Awaken_the_Giant_Within	Robbins, Tony	https://www.goodreads.com/author/show/14545796.Tony_Robbins	544	4.15	69300	1992	5		Jan 20, 2018	\N	Jul 2016	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
191	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386924021i/32274.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1386924021l/32274._SY75_.jpg	Eden Project: In Search of the Magical Other\n        (Studies in Jungian Psychology By Jungian Analysts, 79)	https://www.goodreads.com/book/show/32274.Eden_Project	Hollis, James	https://www.goodreads.com/author/show/18159.James_Hollis	155	4.5	861	Sep 1998	5		Jan 20, 2018	\N	Jun 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
192	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1400863577i/18077903.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1400863577l/18077903._SY75_.jpg	Creativity, Inc.: Overcoming the Unseen Forces That Stand in the Way of True Inspiration	https://www.goodreads.com/book/show/18077903-creativity-inc	Catmull, Ed	https://www.goodreads.com/author/show/5618463.Ed_Catmull	368	4.21	89657	Sep 2014	4		Jan 20, 2018	\N	Aug 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
194	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347665681i/9483886.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1347665681l/9483886._SY75_.jpg	Rational Optimist	https://www.goodreads.com/book/show/9483886-rational-optimist	Ridley, Matt	https://www.goodreads.com/author/show/3151.Matt_Ridley	480	3.98	11602	2010	4		Jan 20, 2018	\N	Jul 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
195	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1464281905i/28256439.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1464281905l/28256439._SX50_.jpg	The Hidden Life of Trees: What They Feel, How They Communicate: Discoveries from a Secret World	https://www.goodreads.com/book/show/28256439-the-hidden-life-of-trees	Wohlleben, Peter	https://www.goodreads.com/author/show/4110912.Peter_Wohlleben	272	4.07	69067	May 25, 2015	3	Quit half way through - not enough information to make up for the more elementary writing style	Jan 20, 2018	\N	Jul 07, 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
196	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1491237796i/34767839.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1491237796l/34767839._SY75_.jpg	When Breath Becomes Air	https://www.goodreads.com/book/show/34767839-when-breath-becomes-air	Kalanithi, Paul	https://www.goodreads.com/author/show/14031444.Paul_Kalanithi	228	4.39	620126	Jan 12, 2016	4		Jan 20, 2018	\N	Feb 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
197	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1429638085i/4929.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1429638085l/4929._SY75_.jpg	Kafka on the Shore	https://www.goodreads.com/book/show/4929.Kafka_on_the_Shore	Murakami, Haruki	https://www.goodreads.com/author/show/3354.Haruki_Murakami	467	4.13	443823	Sep 2002	5		Jan 20, 2018	\N	Feb 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
198	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1453060509i/26109408.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1453060509l/26109408._SY75_.jpg	Blockchain Revolution: How the Technology Behind Bitcoin Is Changing Money, Business, and the World	https://www.goodreads.com/book/show/26109408-blockchain-revolution	Tapscott, Don	https://www.goodreads.com/author/show/54875.Don_Tapscott	348	3.39	4414	2016	4		Jan 20, 2018	\N	May 05, 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
199	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1547125681i/24113.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1547125681l/24113._SY75_.jpg	Gödel, Escher, Bach: An Eternal Golden Braid	https://www.goodreads.com/book/show/24113.G_del_Escher_Bach	Hofstadter, Douglas R.	https://www.goodreads.com/author/show/3034502.Douglas_R_Hofstadter	756	4.29	48419	Apr 1979	5		Jan 20, 2018	May 24, 2018	May 24, 2018	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
200	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1460946708i/29936790.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1460946708l/29936790._SY75_.jpg	Make Your Own Neural Network	https://www.goodreads.com/book/show/29936790-make-your-own-neural-network	Rashid, Tariq	https://www.goodreads.com/author/show/8224485.Tariq_Rashid	222	4.34	637	Mar 2016	5	great, accessible intro to neural nets	Jan 20, 2018	Dec 17, 2017	Dec 20, 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
201	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387700719i/83847.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387700719l/83847._SX50_.jpg	Computer Networking: A Top-Down Approach	https://www.goodreads.com/book/show/83847.Computer_Networking	Kurose, James F.	https://www.goodreads.com/author/show/48003.James_F_Kurose	880	4.06	2070	Nov 2000	5		Jan 20, 2018	Jan 20, 2018	Feb 09, 2018	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
202	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1349086333i/1101290.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1349086333l/1101290._SX50_.jpg	Dealers of Lightning: Xerox PARC and the Dawn of the Computer Age	https://www.goodreads.com/book/show/1101290.Dealers_of_Lightning	Hiltzik, Michael A.	https://www.goodreads.com/author/show/206718.Michael_A_Hiltzik	480	4.13	2207	Apr 05, 2000	5		Jan 20, 2018	Feb 21, 2018	Mar 2018	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
203	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1513355864i/28820444.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1513355864l/28820444._SY75_.jpg	The Elephant in the Brain: Hidden Motives in Everyday Life	https://www.goodreads.com/book/show/28820444-the-elephant-in-the-brain	Simler, Kevin	https://www.goodreads.com/author/show/14932232.Kevin_Simler	408	4	6635	Dec 01, 2017	5		Jan 20, 2018	\N	Mar 03, 2018	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
204	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1309212000i/722412.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1309212000l/722412._SX50_.jpg	The Dream Machine: J.C.R. Licklider and the Revolution That Made Computing Personal	https://www.goodreads.com/book/show/722412.The_Dream_Machine	Waldrop, M. Mitchell	https://www.goodreads.com/author/show/113943.M_Mitchell_Waldrop	512	4.57	1219	2001	5		Jan 20, 2018	Jan 20, 2018	Feb 21, 2018	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
155	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1561519649i/28781189.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1561519649l/28781189._SX50_.jpg	The 21st Century Case for Gold: A New Information Theory of Money	https://www.goodreads.com/book/show/28781189-the-21st-century-case-for-gold	Gilder, George	https://www.goodreads.com/author/show/274999.George_Gilder	3	3.56	127	2016	4		Jan 20, 2018	\N	Jun 2017	2023-09-30 18:13:26.240779	2023-09-30 18:13:26.240779
148	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1453500322i/28676323.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1453500322l/28676323._SX50_.jpg	The Tao of Seneca: Practical Letters from a Stoic Master, Volume 1	https://www.goodreads.com/book/show/28676323-the-tao-of-seneca	Ferriss, Timothy	https://www.goodreads.com/author/show/210456.Timothy_Ferriss	\N	4.19	1193	1917	4		Jan 20, 2018	\N	Apr 2016	2023-09-30 18:13:24.909114	2023-09-30 18:13:24.909114
101	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1526991277i/40192383.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1526991277l/40192383._SY75_.jpg	The Four Noble Truths of Love: Buddhist Wisdom for Modern Relationships	https://www.goodreads.com/book/show/40192383-the-four-noble-truths-of-love	Piver, Susan	https://www.goodreads.com/author/show/135648.Susan_Piver	194	4.23	495	2018	4		Aug 28, 2019	\N	Sep 2019	2023-09-30 18:13:23.332384	2023-09-30 18:13:23.332384
93	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328826802i/6968772.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1328826802l/6968772._SX50_.jpg	The Master and His Emissary: The Divided Brain and the Making of the Western World	https://www.goodreads.com/book/show/6968772-the-master-and-his-emissary	McGilchrist, Iain	https://www.goodreads.com/author/show/1045743.Iain_McGilchrist	608	4.35	2818	2009	5		Oct 22, 2019	Jan 18, 2021	May 31, 2021	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
84	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1646339380i/7588.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1646339380l/7588._SY75_.jpg	A Portrait of the Artist as a Young Man	https://www.goodreads.com/book/show/7588.A_Portrait_of_the_Artist_as_a_Young_Man	Joyce, James	https://www.goodreads.com/author/show/5144.James_Joyce	329	3.63	147815	1916	5		Mar 02, 2020	Mar 02, 2020	Mar 09, 2020	2023-09-30 18:13:21.948204	2023-09-30 18:13:21.948204
51	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1575714157i/48944693.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1575714157l/48944693._SY75_.jpg	David Whyte: Essentials	https://www.goodreads.com/book/show/48944693-david-whyte	Whyte, David	https://www.goodreads.com/author/show/87686.David_Whyte	119	4.68	592	2020	5		Jul 23, 2021	Jul 23, 2021	Nov 24, 2021	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
41	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1601345749i/50884536.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1601345749l/50884536._SY75_.jpg	Models of the Mind: How Physics, Engineering and Mathematics Have Shaped Our Understanding of the Brain	https://www.goodreads.com/book/show/50884536-models-of-the-mind	Lindsay, Grace	https://www.goodreads.com/author/show/14830722.Grace_Lindsay	400	4.4	386	May 04, 2021	5		Jan 06, 2022	Jan 06, 2022	Feb 06, 2022	2023-09-30 18:13:20.051001	2023-09-30 18:13:20.051001
15	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1568310839i/50204643.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1568310839l/50204643._SX50_SY75_.jpg	Deep Learning for Coders with Fastai and Pytorch: AI Applications Without a PhD	https://www.goodreads.com/book/show/50204643-deep-learning-for-coders-with-fastai-and-pytorch	Howard, Jeremy	https://www.goodreads.com/author/show/15455224.Jeremy_Howard	350	4.49	184	February 04, 2020	5		Oct 31, 2022	Oct 31, 2022	Jan 19, 2023	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
14	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1601481119i/55120630.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1601481119l/55120630._SY75_.jpg	The Comfort Crisis: Embrace Discomfort To Reclaim Your Wild, Happy, Healthy Self	https://www.goodreads.com/book/show/55120630-the-comfort-crisis	Easter, Michael	https://www.goodreads.com/author/show/4336509.Michael_Easter	304	4.36	11176	May 11, 2021	4		Nov 18, 2022	Nov 18, 2022	Nov 20, 2022	2023-09-30 18:13:18.661973	2023-09-30 18:13:18.661973
193	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1363586501i/3544063.jpg	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1363586501l/3544063._SY75_.jpg	The Art of Being	https://www.goodreads.com/book/show/3544063-the-art-of-being	Fromm, Erich	https://www.goodreads.com/author/show/8788.Erich_Fromm	176	4.04	4899	1989	4		Jan 20, 2018	\N	Jun 2017	2023-09-30 18:13:27.419787	2023-09-30 18:13:27.419787
\.


--
-- TOC entry 3647 (class 0 OID 16889)
-- Dependencies: 221
-- Data for Name: books_shelves; Type: TABLE DATA; Schema: public; Owner: numinousloop
--

COPY public.books_shelves (id, book_id, shelf_id, created_at) FROM stdin;
1	4	1	2023-09-30 18:14:26.059304
2	5	1	2023-09-30 18:14:26.059304
3	6	1	2023-09-30 18:14:26.059304
4	7	1	2023-09-30 18:14:26.059304
5	8	1	2023-09-30 18:14:26.059304
6	9	1	2023-09-30 18:14:26.059304
7	10	1	2023-09-30 18:14:26.059304
8	11	1	2023-09-30 18:14:26.059304
9	12	1	2023-09-30 18:14:26.059304
10	13	1	2023-09-30 18:14:26.059304
11	14	1	2023-09-30 18:14:26.059304
12	15	1	2023-09-30 18:14:26.059304
13	16	1	2023-09-30 18:14:26.059304
14	17	1	2023-09-30 18:14:26.059304
15	18	1	2023-09-30 18:14:26.059304
16	19	1	2023-09-30 18:14:26.059304
17	20	1	2023-09-30 18:14:26.059304
18	21	1	2023-09-30 18:14:26.059304
19	22	1	2023-09-30 18:14:26.059304
20	23	1	2023-09-30 18:14:26.059304
21	24	1	2023-09-30 18:14:26.059304
22	25	1	2023-09-30 18:14:26.059304
23	26	1	2023-09-30 18:14:26.059304
24	27	1	2023-09-30 18:14:26.059304
25	28	1	2023-09-30 18:14:26.059304
26	29	1	2023-09-30 18:14:26.059304
27	30	1	2023-09-30 18:14:26.059304
28	31	1	2023-09-30 18:14:26.059304
29	32	1	2023-09-30 18:14:26.059304
30	33	1	2023-09-30 18:14:26.059304
31	34	1	2023-09-30 18:14:26.059304
32	35	1	2023-09-30 18:14:26.059304
33	36	1	2023-09-30 18:14:26.059304
34	37	1	2023-09-30 18:14:26.059304
35	38	1	2023-09-30 18:14:26.059304
36	39	1	2023-09-30 18:14:26.059304
37	40	1	2023-09-30 18:14:26.059304
38	41	1	2023-09-30 18:14:26.059304
39	42	1	2023-09-30 18:14:26.059304
40	43	1	2023-09-30 18:14:26.059304
41	44	1	2023-09-30 18:14:26.059304
42	45	1	2023-09-30 18:14:26.059304
43	46	1	2023-09-30 18:14:26.059304
44	47	1	2023-09-30 18:14:26.059304
45	48	1	2023-09-30 18:14:26.059304
46	49	1	2023-09-30 18:14:26.059304
47	50	1	2023-09-30 18:14:26.059304
48	51	1	2023-09-30 18:14:26.059304
49	52	1	2023-09-30 18:14:26.059304
50	53	1	2023-09-30 18:14:26.059304
51	54	1	2023-09-30 18:14:26.059304
52	55	1	2023-09-30 18:14:26.059304
53	56	1	2023-09-30 18:14:26.059304
54	57	1	2023-09-30 18:14:26.059304
55	58	1	2023-09-30 18:14:26.059304
56	59	1	2023-09-30 18:14:26.059304
57	60	1	2023-09-30 18:14:26.059304
58	61	1	2023-09-30 18:14:26.059304
59	62	1	2023-09-30 18:14:26.059304
60	63	1	2023-09-30 18:14:26.059304
61	64	1	2023-09-30 18:14:26.059304
62	65	1	2023-09-30 18:14:26.059304
63	66	1	2023-09-30 18:14:26.059304
64	67	1	2023-09-30 18:14:26.059304
65	68	1	2023-09-30 18:14:26.059304
66	69	1	2023-09-30 18:14:26.059304
67	70	1	2023-09-30 18:14:26.059304
68	71	1	2023-09-30 18:14:26.059304
69	72	1	2023-09-30 18:14:26.059304
70	73	1	2023-09-30 18:14:26.059304
71	74	1	2023-09-30 18:14:26.059304
72	75	1	2023-09-30 18:14:26.059304
73	76	1	2023-09-30 18:14:26.059304
74	77	1	2023-09-30 18:14:26.059304
75	78	1	2023-09-30 18:14:26.059304
76	79	1	2023-09-30 18:14:26.059304
77	80	1	2023-09-30 18:14:26.059304
78	81	1	2023-09-30 18:14:26.059304
79	82	1	2023-09-30 18:14:26.059304
80	83	1	2023-09-30 18:14:26.059304
81	84	1	2023-09-30 18:14:26.059304
82	85	1	2023-09-30 18:14:26.059304
83	86	1	2023-09-30 18:14:26.059304
84	87	1	2023-09-30 18:14:26.059304
85	88	1	2023-09-30 18:14:26.059304
86	89	1	2023-09-30 18:14:26.059304
87	90	1	2023-09-30 18:14:26.059304
88	91	1	2023-09-30 18:14:26.059304
89	92	1	2023-09-30 18:14:26.059304
90	93	1	2023-09-30 18:14:26.059304
91	94	1	2023-09-30 18:14:26.059304
92	95	1	2023-09-30 18:14:26.059304
93	96	1	2023-09-30 18:14:26.059304
94	97	1	2023-09-30 18:14:26.059304
95	98	1	2023-09-30 18:14:26.059304
96	99	1	2023-09-30 18:14:26.059304
97	100	1	2023-09-30 18:14:26.059304
98	101	1	2023-09-30 18:14:26.059304
99	102	1	2023-09-30 18:14:26.059304
100	103	1	2023-09-30 18:14:26.059304
101	104	1	2023-09-30 18:14:26.059304
102	105	1	2023-09-30 18:14:26.059304
103	106	1	2023-09-30 18:14:26.059304
104	107	1	2023-09-30 18:14:26.059304
105	108	1	2023-09-30 18:14:26.059304
106	109	1	2023-09-30 18:14:26.059304
107	110	1	2023-09-30 18:14:26.059304
108	111	1	2023-09-30 18:14:26.059304
109	112	1	2023-09-30 18:14:26.059304
110	113	1	2023-09-30 18:14:26.059304
111	114	1	2023-09-30 18:14:26.059304
112	115	1	2023-09-30 18:14:26.059304
113	116	1	2023-09-30 18:14:26.059304
114	117	1	2023-09-30 18:14:26.059304
115	118	1	2023-09-30 18:14:26.059304
116	119	1	2023-09-30 18:14:26.059304
117	120	1	2023-09-30 18:14:26.059304
118	121	1	2023-09-30 18:14:26.059304
119	122	1	2023-09-30 18:14:26.059304
120	123	1	2023-09-30 18:14:26.059304
121	124	1	2023-09-30 18:14:26.059304
122	125	1	2023-09-30 18:14:26.059304
123	126	1	2023-09-30 18:14:26.059304
124	127	1	2023-09-30 18:14:26.059304
125	128	1	2023-09-30 18:14:26.059304
126	129	1	2023-09-30 18:14:26.059304
127	130	1	2023-09-30 18:14:26.059304
128	131	1	2023-09-30 18:14:26.059304
129	132	1	2023-09-30 18:14:26.059304
130	133	1	2023-09-30 18:14:26.059304
131	134	1	2023-09-30 18:14:26.059304
132	135	1	2023-09-30 18:14:26.059304
133	136	1	2023-09-30 18:14:26.059304
134	137	1	2023-09-30 18:14:26.059304
135	138	1	2023-09-30 18:14:26.059304
136	139	1	2023-09-30 18:14:26.059304
137	140	1	2023-09-30 18:14:26.059304
138	141	1	2023-09-30 18:14:26.059304
139	142	1	2023-09-30 18:14:26.059304
140	143	1	2023-09-30 18:14:26.059304
141	144	1	2023-09-30 18:14:26.059304
142	145	1	2023-09-30 18:14:26.059304
143	146	1	2023-09-30 18:14:26.059304
144	147	1	2023-09-30 18:14:26.059304
145	148	1	2023-09-30 18:14:26.059304
146	149	1	2023-09-30 18:14:26.059304
147	150	1	2023-09-30 18:14:26.059304
148	151	1	2023-09-30 18:14:26.059304
149	152	1	2023-09-30 18:14:26.059304
150	153	1	2023-09-30 18:14:26.059304
151	154	1	2023-09-30 18:14:26.059304
152	155	1	2023-09-30 18:14:26.059304
153	156	1	2023-09-30 18:14:26.059304
154	157	1	2023-09-30 18:14:26.059304
155	158	1	2023-09-30 18:14:26.059304
156	159	1	2023-09-30 18:14:26.059304
157	160	1	2023-09-30 18:14:26.059304
158	161	1	2023-09-30 18:14:26.059304
159	162	1	2023-09-30 18:14:26.059304
160	163	1	2023-09-30 18:14:26.059304
161	164	1	2023-09-30 18:14:26.059304
162	165	1	2023-09-30 18:14:26.059304
163	166	1	2023-09-30 18:14:26.059304
164	167	1	2023-09-30 18:14:26.059304
165	168	1	2023-09-30 18:14:26.059304
166	169	1	2023-09-30 18:14:26.059304
167	170	1	2023-09-30 18:14:26.059304
168	171	1	2023-09-30 18:14:26.059304
169	172	1	2023-09-30 18:14:26.059304
170	173	1	2023-09-30 18:14:26.059304
171	174	1	2023-09-30 18:14:26.059304
172	175	1	2023-09-30 18:14:26.059304
173	176	1	2023-09-30 18:14:26.059304
174	177	1	2023-09-30 18:14:26.059304
175	178	1	2023-09-30 18:14:26.059304
176	179	1	2023-09-30 18:14:26.059304
177	180	1	2023-09-30 18:14:26.059304
178	181	1	2023-09-30 18:14:26.059304
179	182	1	2023-09-30 18:14:26.059304
180	183	1	2023-09-30 18:14:26.059304
181	184	1	2023-09-30 18:14:26.059304
182	185	1	2023-09-30 18:14:26.059304
183	186	1	2023-09-30 18:14:26.059304
184	187	1	2023-09-30 18:14:26.059304
185	188	1	2023-09-30 18:14:26.059304
186	189	1	2023-09-30 18:14:26.059304
187	190	1	2023-09-30 18:14:26.059304
188	191	1	2023-09-30 18:14:26.059304
189	192	1	2023-09-30 18:14:26.059304
190	193	1	2023-09-30 18:14:26.059304
191	194	1	2023-09-30 18:14:26.059304
192	195	1	2023-09-30 18:14:26.059304
193	196	1	2023-09-30 18:14:26.059304
194	197	1	2023-09-30 18:14:26.059304
195	198	1	2023-09-30 18:14:26.059304
196	199	1	2023-09-30 18:14:26.059304
197	200	1	2023-09-30 18:14:26.059304
198	201	1	2023-09-30 18:14:26.059304
199	202	1	2023-09-30 18:14:26.059304
200	203	1	2023-09-30 18:14:26.059304
201	204	1	2023-09-30 18:14:26.059304
202	1	2	2023-09-30 18:14:26.059304
203	2	2	2023-09-30 18:14:26.059304
204	3	2	2023-09-30 18:14:26.059304
205	9	3	2023-09-30 18:14:26.059304
206	19	3	2023-09-30 18:14:26.059304
207	20	3	2023-09-30 18:14:26.059304
208	34	3	2023-09-30 18:14:26.059304
209	44	3	2023-09-30 18:14:26.059304
210	50	3	2023-09-30 18:14:26.059304
211	67	3	2023-09-30 18:14:26.059304
212	68	3	2023-09-30 18:14:26.059304
213	83	3	2023-09-30 18:14:26.059304
214	85	3	2023-09-30 18:14:26.059304
215	93	3	2023-09-30 18:14:26.059304
216	95	3	2023-09-30 18:14:26.059304
217	100	3	2023-09-30 18:14:26.059304
218	105	3	2023-09-30 18:14:26.059304
219	109	3	2023-09-30 18:14:26.059304
220	112	3	2023-09-30 18:14:26.059304
221	123	3	2023-09-30 18:14:26.059304
222	130	3	2023-09-30 18:14:26.059304
223	159	3	2023-09-30 18:14:26.059304
224	170	3	2023-09-30 18:14:26.059304
225	177	3	2023-09-30 18:14:26.059304
226	199	3	2023-09-30 18:14:26.059304
227	204	3	2023-09-30 18:14:26.059304
228	23	4	2023-09-30 18:14:26.059304
229	28	4	2023-09-30 18:14:26.059304
230	41	4	2023-09-30 18:14:26.059304
231	46	4	2023-09-30 18:14:26.059304
232	47	4	2023-09-30 18:14:26.059304
233	48	4	2023-09-30 18:14:26.059304
234	49	4	2023-09-30 18:14:26.059304
235	52	4	2023-09-30 18:14:26.059304
236	54	4	2023-09-30 18:14:26.059304
237	93	4	2023-09-30 18:14:26.059304
238	7	5	2023-09-30 18:14:26.059304
239	47	5	2023-09-30 18:14:26.059304
240	54	5	2023-09-30 18:14:26.059304
241	57	5	2023-09-30 18:14:26.059304
242	66	5	2023-09-30 18:14:26.059304
243	74	5	2023-09-30 18:14:26.059304
244	78	5	2023-09-30 18:14:26.059304
245	136	5	2023-09-30 18:14:26.059304
246	152	5	2023-09-30 18:14:26.059304
247	153	5	2023-09-30 18:14:26.059304
248	154	5	2023-09-30 18:14:26.059304
249	170	5	2023-09-30 18:14:26.059304
250	186	5	2023-09-30 18:14:26.059304
251	196	5	2023-09-30 18:14:26.059304
252	202	5	2023-09-30 18:14:26.059304
253	204	5	2023-09-30 18:14:26.059304
254	6	6	2023-09-30 18:14:26.059304
255	16	6	2023-09-30 18:14:26.059304
256	35	6	2023-09-30 18:14:26.059304
257	56	6	2023-09-30 18:14:26.059304
258	65	6	2023-09-30 18:14:26.059304
259	87	6	2023-09-30 18:14:26.059304
260	91	6	2023-09-30 18:14:26.059304
261	124	6	2023-09-30 18:14:26.059304
262	125	6	2023-09-30 18:14:26.059304
263	127	6	2023-09-30 18:14:26.059304
264	155	6	2023-09-30 18:14:26.059304
265	157	6	2023-09-30 18:14:26.059304
266	160	6	2023-09-30 18:14:26.059304
267	168	6	2023-09-30 18:14:26.059304
268	187	6	2023-09-30 18:14:26.059304
269	190	6	2023-09-30 18:14:26.059304
270	18	7	2023-09-30 18:14:26.059304
271	44	7	2023-09-30 18:14:26.059304
272	45	7	2023-09-30 18:14:26.059304
273	50	7	2023-09-30 18:14:26.059304
274	53	7	2023-09-30 18:14:26.059304
275	60	7	2023-09-30 18:14:26.059304
276	67	7	2023-09-30 18:14:26.059304
277	68	7	2023-09-30 18:14:26.059304
278	73	7	2023-09-30 18:14:26.059304
279	76	7	2023-09-30 18:14:26.059304
280	81	7	2023-09-30 18:14:26.059304
281	82	7	2023-09-30 18:14:26.059304
282	84	7	2023-09-30 18:14:26.059304
283	85	7	2023-09-30 18:14:26.059304
284	100	7	2023-09-30 18:14:26.059304
285	108	7	2023-09-30 18:14:26.059304
286	1	8	2023-09-30 18:14:26.059304
287	12	8	2023-09-30 18:14:26.059304
288	13	8	2023-09-30 18:14:26.059304
289	18	8	2023-09-30 18:14:26.059304
290	42	8	2023-09-30 18:14:26.059304
291	44	8	2023-09-30 18:14:26.059304
292	67	8	2023-09-30 18:14:26.059304
293	68	8	2023-09-30 18:14:26.059304
294	8	9	2023-09-30 18:14:26.059304
295	15	9	2023-09-30 18:14:26.059304
296	56	9	2023-09-30 18:14:26.059304
297	80	9	2023-09-30 18:14:26.059304
298	87	9	2023-09-30 18:14:26.059304
299	118	9	2023-09-30 18:14:26.059304
300	132	9	2023-09-30 18:14:26.059304
301	141	9	2023-09-30 18:14:26.059304
302	143	9	2023-09-30 18:14:26.059304
303	144	9	2023-09-30 18:14:26.059304
304	146	9	2023-09-30 18:14:26.059304
305	199	9	2023-09-30 18:14:26.059304
306	200	9	2023-09-30 18:14:26.059304
307	201	9	2023-09-30 18:14:26.059304
308	202	9	2023-09-30 18:14:26.059304
309	204	9	2023-09-30 18:14:26.059304
310	9	10	2023-09-30 18:14:26.059304
311	19	10	2023-09-30 18:14:26.059304
312	20	10	2023-09-30 18:14:26.059304
313	22	10	2023-09-30 18:14:26.059304
314	24	10	2023-09-30 18:14:26.059304
315	25	10	2023-09-30 18:14:26.059304
316	27	10	2023-09-30 18:14:26.059304
317	30	10	2023-09-30 18:14:26.059304
318	36	10	2023-09-30 18:14:26.059304
319	37	10	2023-09-30 18:14:26.059304
320	1	11	2023-09-30 18:14:26.059304
321	9	11	2023-09-30 18:14:26.059304
322	12	11	2023-09-30 18:14:26.059304
323	13	11	2023-09-30 18:14:26.059304
324	18	11	2023-09-30 18:14:26.059304
325	19	11	2023-09-30 18:14:26.059304
326	20	11	2023-09-30 18:14:26.059304
327	22	11	2023-09-30 18:14:26.059304
328	24	11	2023-09-30 18:14:26.059304
329	25	11	2023-09-30 18:14:26.059304
330	27	11	2023-09-30 18:14:26.059304
331	29	11	2023-09-30 18:14:26.059304
332	30	11	2023-09-30 18:14:26.059304
333	32	11	2023-09-30 18:14:26.059304
334	36	11	2023-09-30 18:14:26.059304
335	37	11	2023-09-30 18:14:26.059304
336	42	11	2023-09-30 18:14:26.059304
337	43	11	2023-09-30 18:14:26.059304
338	44	11	2023-09-30 18:14:26.059304
339	45	11	2023-09-30 18:14:26.059304
340	50	11	2023-09-30 18:14:26.059304
341	53	11	2023-09-30 18:14:26.059304
342	60	11	2023-09-30 18:14:26.059304
343	67	11	2023-09-30 18:14:26.059304
344	68	11	2023-09-30 18:14:26.059304
345	70	11	2023-09-30 18:14:26.059304
346	72	11	2023-09-30 18:14:26.059304
347	73	11	2023-09-30 18:14:26.059304
348	76	11	2023-09-30 18:14:26.059304
349	81	11	2023-09-30 18:14:26.059304
350	82	11	2023-09-30 18:14:26.059304
351	84	11	2023-09-30 18:14:26.059304
352	85	11	2023-09-30 18:14:26.059304
353	87	11	2023-09-30 18:14:26.059304
354	88	11	2023-09-30 18:14:26.059304
355	92	11	2023-09-30 18:14:26.059304
356	100	11	2023-09-30 18:14:26.059304
357	107	11	2023-09-30 18:14:26.059304
358	108	11	2023-09-30 18:14:26.059304
359	111	11	2023-09-30 18:14:26.059304
360	122	11	2023-09-30 18:14:26.059304
361	126	11	2023-09-30 18:14:26.059304
362	131	11	2023-09-30 18:14:26.059304
363	158	11	2023-09-30 18:14:26.059304
364	162	11	2023-09-30 18:14:26.059304
365	167	11	2023-09-30 18:14:26.059304
366	179	11	2023-09-30 18:14:26.059304
367	197	11	2023-09-30 18:14:26.059304
368	94	12	2023-09-30 18:14:26.059304
369	117	12	2023-09-30 18:14:26.059304
370	121	12	2023-09-30 18:14:26.059304
371	141	12	2023-09-30 18:14:26.059304
372	195	12	2023-09-30 18:14:26.059304
373	4	13	2023-09-30 18:14:26.059304
374	5	13	2023-09-30 18:14:26.059304
375	7	13	2023-09-30 18:14:26.059304
376	178	13	2023-09-30 18:14:26.059304
377	2	14	2023-09-30 18:14:26.059304
378	4	14	2023-09-30 18:14:26.059304
379	3	14	2023-09-30 18:14:26.059304
380	5	14	2023-09-30 18:14:26.059304
381	6	14	2023-09-30 18:14:26.059304
382	7	14	2023-09-30 18:14:26.059304
383	8	14	2023-09-30 18:14:26.059304
384	10	14	2023-09-30 18:14:26.059304
385	11	14	2023-09-30 18:14:26.059304
386	14	14	2023-09-30 18:14:26.059304
387	15	14	2023-09-30 18:14:26.059304
388	16	14	2023-09-30 18:14:26.059304
389	17	14	2023-09-30 18:14:26.059304
390	21	14	2023-09-30 18:14:26.059304
391	23	14	2023-09-30 18:14:26.059304
392	26	14	2023-09-30 18:14:26.059304
393	28	14	2023-09-30 18:14:26.059304
394	31	14	2023-09-30 18:14:26.059304
395	34	14	2023-09-30 18:14:26.059304
396	35	14	2023-09-30 18:14:26.059304
397	38	14	2023-09-30 18:14:26.059304
398	39	14	2023-09-30 18:14:26.059304
399	40	14	2023-09-30 18:14:26.059304
400	41	14	2023-09-30 18:14:26.059304
401	46	14	2023-09-30 18:14:26.059304
402	47	14	2023-09-30 18:14:26.059304
403	48	14	2023-09-30 18:14:26.059304
404	49	14	2023-09-30 18:14:26.059304
405	52	14	2023-09-30 18:14:26.059304
406	54	14	2023-09-30 18:14:26.059304
407	57	14	2023-09-30 18:14:26.059304
408	58	14	2023-09-30 18:14:26.059304
409	65	14	2023-09-30 18:14:26.059304
410	71	14	2023-09-30 18:14:26.059304
411	77	14	2023-09-30 18:14:26.059304
412	89	14	2023-09-30 18:14:26.059304
413	105	14	2023-09-30 18:14:26.059304
414	113	14	2023-09-30 18:14:26.059304
415	116	14	2023-09-30 18:14:26.059304
416	120	14	2023-09-30 18:14:26.059304
417	121	14	2023-09-30 18:14:26.059304
418	130	14	2023-09-30 18:14:26.059304
419	135	14	2023-09-30 18:14:26.059304
420	139	14	2023-09-30 18:14:26.059304
421	149	14	2023-09-30 18:14:26.059304
422	150	14	2023-09-30 18:14:26.059304
423	151	14	2023-09-30 18:14:26.059304
424	156	14	2023-09-30 18:14:26.059304
425	159	14	2023-09-30 18:14:26.059304
426	166	14	2023-09-30 18:14:26.059304
427	171	14	2023-09-30 18:14:26.059304
428	173	14	2023-09-30 18:14:26.059304
429	174	14	2023-09-30 18:14:26.059304
430	176	14	2023-09-30 18:14:26.059304
431	178	14	2023-09-30 18:14:26.059304
432	183	14	2023-09-30 18:14:26.059304
433	184	14	2023-09-30 18:14:26.059304
434	185	14	2023-09-30 18:14:26.059304
435	187	14	2023-09-30 18:14:26.059304
436	189	14	2023-09-30 18:14:26.059304
437	192	14	2023-09-30 18:14:26.059304
438	194	14	2023-09-30 18:14:26.059304
439	198	14	2023-09-30 18:14:26.059304
440	199	14	2023-09-30 18:14:26.059304
441	204	14	2023-09-30 18:14:26.059304
442	3	15	2023-09-30 18:14:26.059304
443	11	15	2023-09-30 18:14:26.059304
444	55	15	2023-09-30 18:14:26.059304
445	75	15	2023-09-30 18:14:26.059304
446	79	15	2023-09-30 18:14:26.059304
447	83	15	2023-09-30 18:14:26.059304
448	93	15	2023-09-30 18:14:26.059304
449	109	15	2023-09-30 18:14:26.059304
450	117	15	2023-09-30 18:14:26.059304
451	128	15	2023-09-30 18:14:26.059304
452	138	15	2023-09-30 18:14:26.059304
453	148	15	2023-09-30 18:14:26.059304
454	170	15	2023-09-30 18:14:26.059304
455	172	15	2023-09-30 18:14:26.059304
456	182	15	2023-09-30 18:14:26.059304
457	184	15	2023-09-30 18:14:26.059304
458	193	15	2023-09-30 18:14:26.059304
459	196	15	2023-09-30 18:14:26.059304
460	199	15	2023-09-30 18:14:26.059304
461	51	16	2023-09-30 18:14:26.059304
462	58	16	2023-09-30 18:14:26.059304
463	63	16	2023-09-30 18:14:26.059304
464	86	16	2023-09-30 18:14:26.059304
465	102	16	2023-09-30 18:14:26.059304
466	112	16	2023-09-30 18:14:26.059304
467	175	16	2023-09-30 18:14:26.059304
468	6	17	2023-09-30 18:14:26.059304
469	14	17	2023-09-30 18:14:26.059304
470	16	17	2023-09-30 18:14:26.059304
471	17	17	2023-09-30 18:14:26.059304
472	113	17	2023-09-30 18:14:26.059304
473	116	17	2023-09-30 18:14:26.059304
474	185	17	2023-09-30 18:14:26.059304
475	189	17	2023-09-30 18:14:26.059304
476	190	17	2023-09-30 18:14:26.059304
477	2	18	2023-09-30 18:14:26.059304
478	10	18	2023-09-30 18:14:26.059304
479	11	18	2023-09-30 18:14:26.059304
480	28	18	2023-09-30 18:14:26.059304
481	38	18	2023-09-30 18:14:26.059304
482	39	18	2023-09-30 18:14:26.059304
483	49	18	2023-09-30 18:14:26.059304
484	61	18	2023-09-30 18:14:26.059304
485	62	18	2023-09-30 18:14:26.059304
486	69	18	2023-09-30 18:14:26.059304
487	90	18	2023-09-30 18:14:26.059304
488	93	18	2023-09-30 18:14:26.059304
489	95	18	2023-09-30 18:14:26.059304
490	96	18	2023-09-30 18:14:26.059304
491	97	18	2023-09-30 18:14:26.059304
492	98	18	2023-09-30 18:14:26.059304
493	109	18	2023-09-30 18:14:26.059304
494	110	18	2023-09-30 18:14:26.059304
495	138	18	2023-09-30 18:14:26.059304
496	142	18	2023-09-30 18:14:26.059304
497	159	18	2023-09-30 18:14:26.059304
498	191	18	2023-09-30 18:14:26.059304
499	199	18	2023-09-30 18:14:26.059304
500	203	18	2023-09-30 18:14:26.059304
501	8	19	2023-09-30 18:14:26.059304
502	59	19	2023-09-30 18:14:26.059304
503	79	19	2023-09-30 18:14:26.059304
504	102	19	2023-09-30 18:14:26.059304
505	61	20	2023-09-30 18:14:26.059304
506	62	20	2023-09-30 18:14:26.059304
507	69	20	2023-09-30 18:14:26.059304
508	98	20	2023-09-30 18:14:26.059304
509	101	20	2023-09-30 18:14:26.059304
510	114	20	2023-09-30 18:14:26.059304
511	119	20	2023-09-30 18:14:26.059304
512	133	20	2023-09-30 18:14:26.059304
513	134	20	2023-09-30 18:14:26.059304
514	142	20	2023-09-30 18:14:26.059304
515	145	20	2023-09-30 18:14:26.059304
516	180	20	2023-09-30 18:14:26.059304
517	191	20	2023-09-30 18:14:26.059304
518	64	21	2023-09-30 18:14:26.059304
519	115	21	2023-09-30 18:14:26.059304
520	140	21	2023-09-30 18:14:26.059304
521	147	21	2023-09-30 18:14:26.059304
522	161	21	2023-09-30 18:14:26.059304
523	163	21	2023-09-30 18:14:26.059304
524	164	21	2023-09-30 18:14:26.059304
525	165	21	2023-09-30 18:14:26.059304
526	188	21	2023-09-30 18:14:26.059304
527	34	22	2023-09-30 18:14:26.059304
528	40	22	2023-09-30 18:14:26.059304
529	43	22	2023-09-30 18:14:26.059304
530	59	22	2023-09-30 18:14:26.059304
531	90	22	2023-09-30 18:14:26.059304
532	94	22	2023-09-30 18:14:26.059304
533	99	22	2023-09-30 18:14:26.059304
534	103	22	2023-09-30 18:14:26.059304
535	104	22	2023-09-30 18:14:26.059304
536	106	22	2023-09-30 18:14:26.059304
537	123	22	2023-09-30 18:14:26.059304
538	129	22	2023-09-30 18:14:26.059304
539	130	22	2023-09-30 18:14:26.059304
540	137	22	2023-09-30 18:14:26.059304
541	169	22	2023-09-30 18:14:26.059304
542	177	22	2023-09-30 18:14:26.059304
543	181	22	2023-09-30 18:14:26.059304
544	5	23	2023-09-30 18:14:26.059304
545	79	23	2023-09-30 18:14:26.059304
\.


--
-- TOC entry 3645 (class 0 OID 16881)
-- Dependencies: 219
-- Data for Name: bookshelves; Type: TABLE DATA; Schema: public; Owner: numinousloop
--

COPY public.bookshelves (id, name, created_at) FROM stdin;
1	read	2023-09-30 18:13:04.133948
2	currently-reading	2023-09-30 18:13:04.133948
3	all-time	2023-09-30 18:13:04.133948
4	bio-neuro	2023-09-30 18:13:04.133948
5	biography	2023-09-30 18:13:04.133948
6	biz	2023-09-30 18:13:04.133948
7	classics	2023-09-30 18:13:04.133948
8	co-read	2023-09-30 18:13:04.133948
9	cs	2023-09-30 18:13:04.133948
10	fantasy	2023-09-30 18:13:04.133948
11	fiction	2023-09-30 18:13:04.133948
12	gave-up	2023-09-30 18:13:04.133948
13	history	2023-09-30 18:13:04.133948
14	non-fiction	2023-09-30 18:13:04.133948
15	philosophy	2023-09-30 18:13:04.133948
16	poetry	2023-09-30 18:13:04.133948
17	productivity	2023-09-30 18:13:04.133948
18	psychology	2023-09-30 18:13:04.133948
19	randomly-pickup	2023-09-30 18:13:04.133948
20	relationships	2023-09-30 18:13:04.133948
21	sci-fi	2023-09-30 18:13:04.133948
22	spirituality	2023-09-30 18:13:04.133948
23	unfinished	2023-09-30 18:13:04.133948
24	up-next	2023-09-30 18:13:04.133948
\.


--
-- TOC entry 3641 (class 0 OID 16859)
-- Dependencies: 215
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: numinousloop
--

COPY public.projects (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 216
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: numinousloop
--

SELECT pg_catalog.setval('public.books_id_seq', 204, true);


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 220
-- Name: books_shelves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: numinousloop
--

SELECT pg_catalog.setval('public.books_shelves_id_seq', 545, true);


--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 218
-- Name: bookshelves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: numinousloop
--

SELECT pg_catalog.setval('public.bookshelves_id_seq', 24, true);


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 214
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: numinousloop
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- TOC entry 3489 (class 2606 OID 16879)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3493 (class 2606 OID 16897)
-- Name: books_shelves books_shelves_book_id_shelf_id_key; Type: CONSTRAINT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.books_shelves
    ADD CONSTRAINT books_shelves_book_id_shelf_id_key UNIQUE (book_id, shelf_id);


--
-- TOC entry 3495 (class 2606 OID 16895)
-- Name: books_shelves books_shelves_pkey; Type: CONSTRAINT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.books_shelves
    ADD CONSTRAINT books_shelves_pkey PRIMARY KEY (id);


--
-- TOC entry 3491 (class 2606 OID 16887)
-- Name: bookshelves bookshelves_pkey; Type: CONSTRAINT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.bookshelves
    ADD CONSTRAINT bookshelves_pkey PRIMARY KEY (id);


--
-- TOC entry 3487 (class 2606 OID 16868)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 16898)
-- Name: books_shelves books_shelves_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.books_shelves
    ADD CONSTRAINT books_shelves_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 3497 (class 2606 OID 16903)
-- Name: books_shelves books_shelves_shelf_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: numinousloop
--

ALTER TABLE ONLY public.books_shelves
    ADD CONSTRAINT books_shelves_shelf_id_fkey FOREIGN KEY (shelf_id) REFERENCES public.bookshelves(id);


-- Completed on 2023-10-03 17:20:18 CDT

--
-- PostgreSQL database dump complete
--

