--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-10 00:51:56

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 28104)
-- Name: myapp; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA myapp;


ALTER SCHEMA myapp OWNER TO postgres;

SET search_path = myapp, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 459 (class 1259 OID 28119)
-- Name: countries; Type: TABLE; Schema: myapp; Owner: postgres; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    code character varying(5),
    description character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nationality_name character varying(255),
    region_id integer,
    idd integer,
    state_label character varying(255) DEFAULT 'state'::character varying,
    currency_id integer,
    states_count integer
);


ALTER TABLE myapp.countries OWNER TO postgres;

--
-- TOC entry 458 (class 1259 OID 28117)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: myapp; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE myapp.countries_id_seq OWNER TO postgres;

--
-- TOC entry 2777 (class 0 OID 0)
-- Dependencies: 458
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: myapp; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- TOC entry 465 (class 1259 OID 36337)
-- Name: ninja_li; Type: TABLE; Schema: myapp; Owner: postgres; Tablespace: 
--

CREATE TABLE ninja_li (
    li_id integer NOT NULL,
    li_name character varying(128),
    li_description character varying(256)
);


ALTER TABLE myapp.ninja_li OWNER TO postgres;

--
-- TOC entry 2778 (class 0 OID 0)
-- Dependencies: 465
-- Name: TABLE ninja_li; Type: COMMENT; Schema: myapp; Owner: postgres
--

COMMENT ON TABLE ninja_li IS '忍者里';


--
-- TOC entry 2779 (class 0 OID 0)
-- Dependencies: 465
-- Name: COLUMN ninja_li.li_description; Type: COMMENT; Schema: myapp; Owner: postgres
--

COMMENT ON COLUMN ninja_li.li_description IS '忍者里简介';


--
-- TOC entry 464 (class 1259 OID 36335)
-- Name: ninja_li_li_id_seq; Type: SEQUENCE; Schema: myapp; Owner: postgres
--

CREATE SEQUENCE ninja_li_li_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE myapp.ninja_li_li_id_seq OWNER TO postgres;

--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 464
-- Name: ninja_li_li_id_seq; Type: SEQUENCE OWNED BY; Schema: myapp; Owner: postgres
--

ALTER SEQUENCE ninja_li_li_id_seq OWNED BY ninja_li.li_id;


--
-- TOC entry 462 (class 1259 OID 28143)
-- Name: player; Type: TABLE; Schema: myapp; Owner: postgres; Tablespace: 
--

CREATE TABLE player (
    player_id integer NOT NULL,
    player_name character varying(32),
    player_password character varying(16),
    login_time timestamp without time zone,
    register_time timestamp without time zone,
    last_active_time timestamp without time zone,
    hp integer,
    exp bigint,
    power integer,
    speed integer,
    wisdom integer,
    blood integer,
    mood character varying(128),
    skill_point integer,
    level integer,
    li_id integer,
    sex character varying(4)
);


ALTER TABLE myapp.player OWNER TO postgres;

--
-- TOC entry 2781 (class 0 OID 0)
-- Dependencies: 462
-- Name: COLUMN player.exp; Type: COMMENT; Schema: myapp; Owner: postgres
--

COMMENT ON COLUMN player.exp IS 'experience';


--
-- TOC entry 2782 (class 0 OID 0)
-- Dependencies: 462
-- Name: COLUMN player.skill_point; Type: COMMENT; Schema: myapp; Owner: postgres
--

COMMENT ON COLUMN player.skill_point IS '忍术点，用来升级忍术，通过战斗获得';


--
-- TOC entry 2783 (class 0 OID 0)
-- Dependencies: 462
-- Name: COLUMN player.level; Type: COMMENT; Schema: myapp; Owner: postgres
--

COMMENT ON COLUMN player.level IS '等级，用来显示和决定战斗加成';


--
-- TOC entry 463 (class 1259 OID 28146)
-- Name: player_player_id_seq; Type: SEQUENCE; Schema: myapp; Owner: postgres
--

CREATE SEQUENCE player_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE myapp.player_player_id_seq OWNER TO postgres;

--
-- TOC entry 2784 (class 0 OID 0)
-- Dependencies: 463
-- Name: player_player_id_seq; Type: SEQUENCE OWNED BY; Schema: myapp; Owner: postgres
--

ALTER SEQUENCE player_player_id_seq OWNED BY player.player_id;


--
-- TOC entry 461 (class 1259 OID 28129)
-- Name: user_roles; Type: TABLE; Schema: myapp; Owner: postgres; Tablespace: 
--

CREATE TABLE user_roles (
    user_role_id integer NOT NULL,
    user_id integer,
    privilege character varying
);


ALTER TABLE myapp.user_roles OWNER TO postgres;

--
-- TOC entry 460 (class 1259 OID 28127)
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE; Schema: myapp; Owner: postgres
--

CREATE SEQUENCE user_roles_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE myapp.user_roles_user_role_id_seq OWNER TO postgres;

--
-- TOC entry 2785 (class 0 OID 0)
-- Dependencies: 460
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: myapp; Owner: postgres
--

ALTER SEQUENCE user_roles_user_role_id_seq OWNED BY user_roles.user_role_id;


--
-- TOC entry 457 (class 1259 OID 28107)
-- Name: users; Type: TABLE; Schema: myapp; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    user_name character varying(20),
    password character varying(20),
    enabled boolean
);


ALTER TABLE myapp.users OWNER TO postgres;

--
-- TOC entry 456 (class 1259 OID 28105)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: myapp; Owner: postgres
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE myapp.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 2786 (class 0 OID 0)
-- Dependencies: 456
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: myapp; Owner: postgres
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- TOC entry 2746 (class 2604 OID 28122)
-- Name: id; Type: DEFAULT; Schema: myapp; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 36340)
-- Name: li_id; Type: DEFAULT; Schema: myapp; Owner: postgres
--

ALTER TABLE ONLY ninja_li ALTER COLUMN li_id SET DEFAULT nextval('ninja_li_li_id_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 28148)
-- Name: player_id; Type: DEFAULT; Schema: myapp; Owner: postgres
--

ALTER TABLE ONLY player ALTER COLUMN player_id SET DEFAULT nextval('player_player_id_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 28132)
-- Name: user_role_id; Type: DEFAULT; Schema: myapp; Owner: postgres
--

ALTER TABLE ONLY user_roles ALTER COLUMN user_role_id SET DEFAULT nextval('user_roles_user_role_id_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 28110)
-- Name: user_id; Type: DEFAULT; Schema: myapp; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- TOC entry 2766 (class 0 OID 28119)
-- Dependencies: 459
-- Data for Name: countries; Type: TABLE DATA; Schema: myapp; Owner: postgres
--

COPY countries (id, code, description, created_at, updated_at, nationality_name, region_id, idd, state_label, currency_id, states_count) FROM stdin;
141	AD	Andorra	\N	2010-03-24 01:25:49.606632	\N	\N	376	state	1	0
36	AE	United Arab Emirates	2008-06-19 17:35:35.128759	2010-10-15 11:48:34.01814	United Arab Emirates	\N	971	Emirate	3	6
142	AF	Afghanistan	\N	2010-03-24 01:25:49.747629	\N	\N	93	state	4	0
140	AG	Antigua and Barbuda	\N	2010-03-24 01:25:49.838813	\N	\N	1	state	\N	0
133	AI	Anguilla	\N	2010-03-24 01:25:49.975633	\N	\N	1	state	\N	1
143	AL	Albania	\N	2010-03-24 01:25:50.470144	\N	\N	355	state	5	0
144	AM	Armenia	\N	2010-03-24 01:25:50.534493	\N	\N	374	state	6	0
75	AN	Netherlands Antilles	\N	2010-03-24 01:25:50.602269	Dutch Antilleans	\N	599	state	7	2
145	AO	Angola	\N	2010-03-24 01:25:50.679343	\N	\N	244	state	8	1
146	AQ	Antarctica	\N	2010-03-24 01:25:50.917223	\N	\N	672	state	\N	0
164	EC	Ecuador	\N	2010-03-24 01:25:48.526346	\N	\N	593	state	52	2
147	AS	American Samoa	\N	2010-03-24 01:25:51.055873	\N	\N	1	state	\N	0
61	AT	Austria	\N	2010-03-24 01:25:51.156684	\N	\N	43	state	12	9
2	AU	Australia	2008-06-19 17:35:26.550289	2010-03-24 01:25:51.230241	Australian	5	61	state	13	8
148	AW	Aruba	\N	2010-03-24 01:25:51.343137	\N	\N	297	state	14	1
62	AZ	Azerbaijan	\N	2010-03-24 01:25:51.641932	\N	\N	994	state	15	1
149	BA	Bosnia and Herzegovina	\N	2010-03-24 01:25:47.858299	\N	\N	387	state	16	0
129	BB	Barbados	\N	2010-03-24 01:25:48.227997	\N	\N	1	state	17	1
84	BD	Bangladesh	\N	2010-03-24 01:25:48.4068	\N	\N	880	state	18	0
63	BE	Belgium	\N	2010-03-24 01:25:48.479316	\N	\N	32	state	19	1
102	BF	Burkina Faso	\N	2010-03-24 01:25:48.509497	\N	\N	226	state	\N	1
131	BG	Bulgaria	\N	2010-03-24 01:25:48.733358	\N	\N	359	state	21	1
3	BH	Bahrain	2008-06-19 17:35:27.298448	2010-03-24 01:25:48.78304	Bahraini	\N	973	state	22	2
150	BI	Burundi	\N	2010-03-24 01:25:48.804895	\N	\N	257	state	23	1
100	BJ	Benin	\N	2010-03-24 01:25:48.891994	Beninese	\N	229	state	\N	1
252	BL	Saint Barthélemy	\N	\N	French	8	590	state	\N	0
118	BM	Bermuda	\N	2010-03-24 01:25:49.051586	\N	\N	1	state	24	1
86	BN	Brunei	\N	2010-03-24 01:25:49.082922	\N	\N	673	state	25	0
151	BO	Bolivia	\N	2010-03-24 01:25:49.099565	\N	\N	591	state	26	0
46	BR	Brazil	2008-08-13 10:17:37.187697	2010-03-24 01:25:49.197977	Brazilian	\N	55	state	27	27
93	BS	Bahamas	\N	2010-03-24 01:25:49.254443	\N	\N	1	state	29	0
152	BT	Bhutan	\N	2010-03-24 01:25:49.32995	\N	\N	975	state	30	0
153	BV	Bouvet Island	\N	\N	\N	\N	\N	state	\N	0
154	BW	Botswana	\N	2010-03-24 01:25:49.547243	\N	\N	267	state	31	1
155	BY	Belarus	\N	2010-03-24 01:25:49.625134	\N	\N	375	state	32	1
136	BZ	Belize	\N	2010-03-24 01:25:49.684948	\N	\N	501	state	33	0
79	CA	Canada	\N	2010-03-24 01:25:51.528601	Canadian	\N	1	state	34	3
250	CB	Providenciales 	2009-12-23 18:07:07.864804	2009-12-23 18:07:07.864804	Carribean	\N	\N	state	\N	1
156	CC	Cocos (Keeling) Islands	\N	2010-03-24 01:25:46.186502	\N	\N	61	state	\N	0
248	CD	Congo(DRC)	2009-09-17 07:30:37.626333	2010-03-24 01:25:46.325769		\N	243	state	35	1
157	CF	Central African Republic	\N	2010-03-24 01:25:46.754821	\N	\N	236	state	\N	1
158	CG	Congo	\N	2010-03-24 01:25:46.858708	\N	\N	242	state	\N	1
60	CH	Switzerland	\N	2010-03-24 01:25:46.968194	\N	\N	41	state	36	2
99	CI	Cote d'Ivoire	\N	2010-03-24 01:25:47.014618	Ivorian	\N	225	state	\N	1
117	CK	Cook Islands	\N	2010-03-24 01:25:47.111428	\N	\N	682	state	\N	1
47	CL	Chile	2008-08-13 10:18:03.45212	2010-03-24 01:25:47.23479	Chilean	\N	56	state	37	1
4	CM	Cameroon	2008-06-19 17:35:27.315803	2010-03-24 01:25:47.352022	Cameroonian	\N	237	state	\N	1
119	CO	Columbia	\N	2010-03-24 01:25:47.517746	Colombian	\N	57	state	39	3
6	CR	Costa Rica	2008-06-19 17:35:27.964884	2010-03-24 01:25:47.707955	Costa Rican	\N	506	state	40	2
159	CU	Cuba	\N	2010-03-24 01:25:47.894698	\N	\N	53	state	44	0
160	CV	Cape Verde	\N	2010-03-24 01:25:48.124168	\N	\N	238	state	45	0
161	CX	Christmas Island	\N	2010-03-24 01:25:48.278817	\N	\N	61	state	\N	0
7	CY	Cyprus	2008-06-19 17:35:27.989966	2010-03-24 01:25:48.355846	Cypriot	\N	357	state	46	7
72	CZ	Czech Republic	\N	2010-03-24 01:25:48.425547	\N	\N	420	state	43	2
45	DE	Germany	2008-08-13 10:15:24.858424	2010-03-24 01:25:49.99302	Deutsch	\N	49	state	47	12
81	DJ	Djibouti	\N	2010-03-24 01:25:50.618927	\N	\N	253	state	48	1
162	DK	Denmark	\N	2010-03-24 01:25:50.69384	\N	\N	45	state	49	0
163	DM	Dominica	\N	2010-03-24 01:25:50.840255	\N	\N	1	state	\N	0
94	DO	Dominican Republic	\N	2010-10-27 03:21:01.421714		\N	1	Province	50	18
80	DZ	Algeria	\N	2010-03-24 01:25:46.630016	Algerian	\N	213	state	51	1
165	EE	Estonia	\N	2010-03-24 01:25:48.858198	\N	\N	372	state	53	0
8	EG	Egypt	2008-06-19 17:35:28.009265	2010-03-24 01:25:48.957399	Egyptian	\N	20	state	54	13
166	EH	Western Sahara	\N	2010-03-24 01:25:48.997566	\N	\N	212	state	\N	0
167	ER	Eritrea	\N	2010-03-24 01:25:49.467393	\N	\N	291	state	\N	1
68	ES	Spain	\N	2010-03-24 01:25:49.530761	\N	\N	34	state	55	3
9	ET	Ethiopia	2008-06-19 17:35:28.264742	2010-03-24 01:25:49.569152	Ethiopian	\N	251	state	56	1
43	FI	Finland	2008-08-03 14:12:44.158708	2010-03-24 01:25:47.368264	Finnish	\N	358	state	58	1
10	FJ	Fiji	2008-06-19 17:35:28.289255	2010-03-24 01:25:47.435237	Fijian	5	679	state	59	2
168	FK	Falkland Islands (Malvinas)	\N	2010-03-24 01:25:47.535094	\N	\N	500	state	60	0
169	FM	Micronesia	\N	2010-03-24 01:25:47.693188	\N	\N	691	state	\N	0
170	FO	Faroe Islands	\N	2010-03-24 01:25:47.748219	\N	\N	298	state	\N	0
51	FR	France	2008-08-13 11:03:24.947081	2010-03-24 01:25:48.158108	French	\N	33	state	61	5
171	FX	France, Metropolitan	\N	2010-03-24 01:25:48.56701	\N	\N	33	state	\N	0
172	GA	Gabon	\N	2010-03-24 01:25:49.947691	\N	\N	241	state	\N	1
37	GB	United Kingdom	2008-06-19 17:35:35.378377	2010-10-09 00:50:48.890614	British	\N	44	County	62	23
173	GD	Grenada	\N	2010-03-24 01:25:50.141937	\N	\N	1	state	\N	0
107	GE	Georgia	\N	2010-03-24 01:25:50.484687	\N	\N	995	state	63	2
174	GF	French Guiana	\N	2010-03-24 01:25:50.551064	\N	\N	594	state	\N	0
106	GH	Ghana	\N	2010-03-24 01:25:50.745668	\N	\N	233	state	64	1
175	GI	Gibraltar	\N	2010-03-24 01:25:50.820055	\N	\N	350	state	65	0
176	GL	Greenland	\N	2010-03-24 01:25:51.175155	\N	\N	299	state	\N	0
177	GM	Gambia	\N	2010-03-24 01:25:51.194336	\N	\N	220	state	66	2
179	GP	Guadeloupe	\N	2010-03-24 01:25:51.360492	\N	\N	590	state	\N	0
125	GQ	Guinea Equatorial	\N	2010-03-24 01:25:51.544423	\N	\N	240	state	\N	1
88	GR	Greece	\N	2010-03-24 01:25:51.664563	\N	\N	30	state	68	2
180	GS	South Georgia and the South Sandwich Islands	\N	\N	\N	\N	\N	state	\N	0
135	GT	Guatemala	\N	2010-03-24 01:25:46.210648	\N	\N	502	state	69	0
5	CN	China	2008-06-19 17:35:27.325309	2010-10-09 00:49:18.991577	Chinese	4	86	Province	38	23
178	GN	Republic of Guinea	\N	2010-03-24 01:25:51.273321	\N	\N	224	state	67	1
11	GU	Guam	2008-06-19 17:35:28.2988	2010-03-24 01:25:46.572118	Guam	\N	1	state	\N	1
181	GY	Guyana	\N	2010-03-24 01:25:46.981083	\N	\N	592	state	71	0
12	HK	Hong Kong	2008-06-19 17:35:28.323681	2010-03-24 01:25:49.272685	Hong Kong	4	852	state	72	1
182	HM	Heard & McDonald Islands	\N	\N	\N	\N	\N	state	\N	0
137	HN	Honduras	\N	2010-03-24 01:25:49.480349	\N	\N	504	state	73	0
104	HR	Croatia	\N	2010-03-24 01:25:49.69974	\N	\N	385	state	74	2
183	HT	Haiti	\N	2010-03-24 01:25:49.861128	\N	\N	509	state	75	0
69	HU	Hungary	\N	2010-03-24 01:25:49.911429	\N	\N	36	state	76	1
14	ID	Indonesia	2008-06-19 17:35:29.622277	2010-03-24 01:25:47.127754	Indonesian	3	62	state	77	10
89	IE	Ireland	\N	2010-03-24 01:25:47.258995	\N	\N	353	state	78	1
82	IL	Israel	\N	2010-03-24 01:25:47.779633	\N	\N	972	state	79	1
13	IN	India	2008-06-19 17:35:28.656255	2010-03-24 01:25:48.042873	Indian	\N	91	state	80	19
184	IO	British Indian Ocean Territory	\N	2010-03-24 01:25:48.246405	\N	\N	246	state	\N	0
58	PL	Poland	\N	2010-03-24 01:25:46.813986	Polish	\N	48	state	136	5
186	IR	Islamic Republic of Iran	\N	2010-03-24 01:25:48.447335	\N	\N	98	state	82	0
187	IS	Iceland	\N	2010-03-24 01:25:48.494934	\N	\N	354	state	83	0
42	IT	Italy	2008-07-18 16:37:47.687587	2010-03-24 01:25:48.61233	Italian	\N	39	state	84	10
134	JM	Jamaica	\N	2010-03-24 01:25:51.573545	\N	\N	1	state	85	1
15	JP	Japan	2008-06-19 17:35:29.805802	2010-03-24 01:25:46.245436	Japanese	\N	81	state	87	17
17	KE	Kenya	2008-06-19 17:35:30.221011	2010-03-24 01:25:49.120029	Kenyan	\N	254	state	88	1
73	KG	Kyrgyzstan	\N	2010-03-24 01:25:49.17863	\N	\N	996	state	89	1
64	KH	Cambodia	\N	2010-03-24 01:25:49.315508	\N	\N	855	state	90	1
188	KI	Kiribati	\N	2010-03-24 01:25:49.345014	\N	\N	686	state	\N	0
189	KM	Comoros	\N	2010-03-24 01:25:49.646664	\N	\N	269	state	91	1
105	KN	Federation of Saint Kitts and Nevis	\N	2010-03-24 01:25:49.714098	\N	\N	1	state	\N	1
190	KP	Korea, Democratic People's Republic of	\N	2010-03-24 01:25:49.819576	\N	\N	850	state	92	0
18	KR	South Korea	2008-06-19 17:35:30.246026	2010-03-24 01:25:50.058504	Korean	\N	82	state	93	19
59	KW	Kuwait	\N	2010-03-24 01:25:50.648062	\N	\N	965	state	94	1
191	KY	Cayman Islands	\N	2010-03-24 01:25:50.782629	\N	\N	1	state	95	1
71	KZ	Kazakhstan	\N	2010-03-24 01:25:50.861634	\N	\N	7	state	96	2
192	LA	Lao People's Democratic Republic	\N	2010-03-24 01:25:47.272997	\N	\N	856	state	97	0
19	LB	Lebanon	2008-06-19 17:35:30.722768	2010-03-24 01:25:47.318484	Lebanese	\N	961	state	98	1
95	LC	St. Lucia	\N	2010-03-24 01:25:47.453652	\N	\N	1	state	\N	0
193	LI	Liechtenstein	\N	2010-03-24 01:25:47.766214	\N	\N	423	state	\N	0
40	LK	Sri Lanka	2008-07-01 16:02:54.238498	2010-03-24 01:25:48.194595	Sri Lankan	\N	94	state	99	1
194	LR	Liberia	\N	2010-03-24 01:25:48.838227	\N	\N	231	state	100	1
195	LS	Lesotho	\N	2010-03-24 01:25:48.874871	\N	\N	266	state	101	1
109	LT	Lithuania	\N	2010-03-24 01:25:48.925846	Lithuanian	\N	370	state	102	1
196	LU	Luxembourg	\N	2010-03-24 01:25:49.01567	\N	\N	352	state	103	0
90	LV	Latvia	\N	2010-03-24 01:25:49.066522	\N	\N	371	state	104	1
91	LY	Libya	\N	2010-03-24 01:25:49.163272	\N	\N	218	state	105	1
22	MA	Morocco	2008-06-19 17:35:31.743097	2010-03-24 01:25:50.764226	Moroccan	\N	212	state	106	11
70	MC	Monaco	\N	2010-03-24 01:25:50.989936	\N	\N	377	state	\N	2
197	MD	Moldova, Republic of	\N	2010-03-24 01:25:51.033523	\N	\N	373	state	107	0
253	MF	Saint Martin	\N	\N	French	8	590	state	\N	0
115	MG	Madagascar	\N	2010-03-24 01:25:51.255834		\N	261	state	108	1
198	MH	Marshall Islands	\N	2010-03-24 01:25:51.288849	\N	\N	692	state	\N	0
110	ML	Mali	\N	2010-03-24 01:25:51.755223	\N	\N	223	state	\N	1
121	MM	Burma	\N	2010-03-24 01:25:46.612063	Burmese	\N	95	state	111	0
56	MN	Mongolia	\N	2010-03-24 01:25:46.665533	Mongolian	\N	976	state	112	1
20	MO	Macau	2008-06-19 17:35:30.732417	2010-03-24 01:25:46.78785	Macau	\N	853	state	113	1
199	MP	Northern Mariana Islands	\N	2010-03-24 01:25:46.874153	\N	\N	1	state	\N	0
200	MQ	Martinique	\N	2010-03-24 01:25:46.99595	\N	\N	596	state	\N	0
111	MR	Mauritania	\N	2010-03-24 01:25:47.032255	\N	\N	222	state	114	1
201	MS	Monserrat	\N	2010-03-24 01:25:47.075341	\N	\N	1	state	\N	0
77	MT	Malta	\N	2010-03-24 01:25:47.157275	\N	\N	356	state	115	2
41	MU	Mauritius	2008-07-07 15:29:48.935106	2010-03-24 01:25:47.28958	Mauritian	\N	230	state	116	2
74	MV	Maldives	\N	2010-03-24 01:25:47.336743	\N	\N	960	state	117	1
202	MW	Malawi	\N	2010-03-24 01:25:47.468136	\N	\N	265	state	118	1
65	MX	Mexico	\N	2010-03-24 01:25:47.551026	Mexican	\N	52	state	119	32
21	MY	Malaysia	2008-06-19 17:35:30.757248	2010-03-24 01:25:47.606518	Malaysian	3	60	state	121	13
122	MZ	Mozambique	\N	2010-03-24 01:25:47.674716	\N	\N	258	state	122	1
112	NA	Namibia	\N	2010-03-24 01:25:49.148433	\N	\N	264	state	123	1
203	NC	New Caledonia	\N	2010-03-24 01:25:49.231341	\N	\N	687	state	\N	0
204	NE	Niger	\N	2010-03-24 01:25:49.360965	\N	\N	227	state	\N	1
205	NF	Norfolk Island	\N	2010-03-24 01:25:49.424054	\N	\N	672	state	\N	0
25	NG	Nigeria	2008-06-19 17:35:31.815199	2010-03-24 01:25:49.49525	Nigerian	\N	234	state	124	6
139	NI	Nicaragua	\N	2010-03-24 01:25:49.592167	\N	\N	505	state	125	0
44	NL	Netherlands	2008-08-13 10:14:50.054885	2010-03-24 01:25:49.779441	Dutch	\N	31	state	126	2
206	NO	Norway	\N	2010-03-24 01:25:50.102019	\N	\N	47	state	127	0
23	NP	Nepal	2008-06-19 17:35:31.780467	2010-03-24 01:25:50.393382	Nepalese	\N	977	state	128	1
207	NR	Nauru	\N	2010-03-24 01:25:50.569098	\N	\N	674	state	\N	0
208	NU	Niue	\N	2010-03-24 01:25:50.727414	\N	\N	683	state	\N	0
24	NZ	New Zealand	2008-06-19 17:35:31.79023	2010-03-24 01:25:51.211521	New Zealand	5	64	state	129	2
67	OM	Oman	\N	2010-03-24 01:25:48.656306	\N	\N	968	state	130	9
97	PA	Panama	\N	2010-03-24 01:25:51.140384	\N	\N	507	state	131	1
108	GW	Guinea-Bissau	\N	2010-03-24 01:25:46.770321	\N	\N	245	state	70	1
209	PF	French Polynesia	\N	2010-03-24 01:25:51.45943	\N	\N	689	state	\N	0
116	PG	Papua New Guinea	\N	2010-03-24 01:25:51.694326	\N	\N	675	state	133	1
26	PH	Philippines	2008-06-19 17:35:31.840089	2010-03-24 01:25:51.771549	Filipino	\N	63	state	134	6
85	PK	Pakistan	\N	2010-03-24 01:25:46.689448	Pakistani	\N	92	state	135	1
210	PM	St. Pierre & Miquelon	\N	2010-03-24 01:25:46.888708	\N	\N	508	state	\N	0
211	PN	Pitcairn	\N	\N	\N	\N	\N	state	\N	0
212	PR	Puerto Rico	\N	2010-03-24 01:25:47.384283	\N	\N	1	state	\N	0
78	PS	Palestine	\N	2010-03-24 01:25:47.483474	Palestinian	\N	970	state	\N	0
27	PT	Portugal	2008-06-19 17:35:32.538424	2010-11-02 10:52:26.188227	Portuguese	\N	351	District	137	2
213	PW	Palau	\N	2010-03-24 01:25:47.722089	\N	\N	680	state	\N	0
16	JO	Jordan	2008-06-19 17:35:30.18861	2010-03-24 01:25:51.729558	Jordanian	\N	962	state	86	3
214	PY	Paraguay	\N	2010-03-24 01:25:47.797847	\N	\N	595	state	138	0
28	QA	Qatar	2008-06-19 17:35:32.555058	2010-03-24 01:25:49.376084	Qatari	\N	974	state	139	1
251	RE	France, Réunion	\N	\N	\N	\N	262	state	\N	1
215	RE	Reunion	\N	2010-03-24 01:25:48.295573	\N	\N	262	state	\N	1
132	RO	Romania	\N	2010-03-24 01:25:49.03287	Romana	\N	40	state	141	1
127	RW	Rwanda	\N	2010-03-24 01:25:49.514968	\N	\N	250	state	143	1
216	SB	Solomon Islands	\N	2010-03-24 01:25:51.476844	\N	\N	677	state	145	0
114	SC	Seychelles	\N	2010-03-24 01:25:51.621705	\N	\N	248	state	146	1
217	SD	Sudan	\N	2010-03-24 01:25:51.710581	\N	\N	249	state	147	1
55	SE	Sweden	\N	2010-03-24 01:25:46.286313	Swedish	\N	46	state	149	0
30	SG	Singapore	2008-06-19 17:35:32.585869	2010-03-24 01:25:46.708652	Singaporean	3	65	state	150	1
218	SH	St. Helena	\N	2010-03-24 01:25:46.828073	\N	\N	290	state	151	0
219	SI	Slovenia	\N	2010-03-24 01:25:46.843112	\N	\N	386	state	152	0
220	SJ	Svalbard & Jan Mayen Islands	\N	\N	\N	\N	\N	state	\N	0
92	SK	Slovakia	\N	2010-03-24 01:25:47.045967	\N	\N	421	state	153	1
221	SL	Sierra Leone	\N	2010-03-24 01:25:47.09313	\N	\N	232	state	154	1
222	SM	San Marino	\N	2010-03-24 01:25:47.172357	\N	\N	378	state	\N	0
113	SN	Senegal	\N	2010-03-24 01:25:47.218226	\N	\N	221	state	\N	1
223	SO	Somalia	\N	2010-03-24 01:25:47.396786	\N	\N	252	state	155	1
76	SP	Serbia	\N	2010-03-24 01:25:47.501167	Serbian	\N	381	state	\N	1
224	SR	Suriname	\N	2010-03-24 01:25:47.63855	\N	\N	597	state	156	0
225	ST	Sao Tome & Principe	\N	2010-03-24 01:25:47.735014	\N	\N	239	state	158	1
138	SV	El Salvador	\N	2010-03-24 01:25:47.919918	\N	\N	503	state	159	0
52	SY	Syria	\N	2010-03-24 01:25:48.339466	Syrian	\N	963	state	160	0
226	SZ	Swaziland	\N	2010-03-24 01:25:48.392749	\N	\N	268	state	161	1
130	TC	Turks & Caicos	\N	2010-03-24 01:25:49.728826	\N	\N	1	state	\N	2
103	TD	Chad	\N	2010-03-24 01:25:49.80303	\N	\N	235	state	\N	1
227	TF	French Southern Territories	\N	\N	\N	\N	\N	state	\N	0
124	TG	Togo	\N	2010-03-24 01:25:50.087346	\N	\N	228	state	\N	1
33	TH	Thailand	2008-06-19 17:35:34.370727	2010-03-24 01:25:50.118666	Thai	3	66	state	162	36
120	TJ	Tajikistan	\N	2010-03-24 01:25:50.500917	\N	\N	992	state	\N	1
228	TK	Tokelau	\N	2010-03-24 01:25:50.585988	\N	\N	690	state	\N	0
229	TM	Turkmenistan	\N	2010-03-24 01:25:50.709802	\N	\N	993	state	163	0
34	TN	Tunisia	2008-06-19 17:35:34.920295	2010-03-24 01:25:50.799755	Tunisian	\N	216	state	164	7
230	TO	Tonga	\N	2010-03-24 01:25:50.884415	\N	\N	676	state	165	0
231	TP	East Timor	\N	2010-03-24 01:25:51.011717	\N	\N	670	state	\N	0
35	TR	Turkey	2008-06-19 17:35:34.988936	2010-03-24 01:25:51.109889	Turkish	\N	90	state	167	4
57	TT	Trinidad and Tobago	\N	2010-03-24 01:25:51.306383	\N	\N	1	state	168	2
232	TV	Tuvalu	\N	2010-03-24 01:25:51.49117	\N	\N	688	state	\N	0
32	TW	Taiwan	2008-06-19 17:35:34.284499	2010-03-24 01:25:51.591193	Taiwanese	4	886	state	169	2
123	TZ	Tanzania	\N	2010-03-24 01:25:46.305588	\N	\N	255	state	170	3
233	UA	Ukraine	\N	2010-03-24 01:25:48.319949	\N	\N	380	state	171	1
126	UG	Uganda	\N	2010-03-24 01:25:48.81988	\N	\N	256	state	174	2
234	UM	United States Minor Outlying Islands	\N	\N	\N	\N	\N	state	\N	0
38	US	United States	2008-06-19 17:35:35.528555	2010-03-24 01:25:49.440865	American	\N	1	state	175	52
235	UZ	Uzbekistan	\N	2010-03-24 01:25:49.929172	\N	\N	998	state	\N	0
236	VA	Vatican City State (Holy See)	\N	2010-03-24 01:25:45.992205	\N	\N	379	state	\N	0
237	VC	St. Vincent & the Grenadines	\N	2010-03-24 01:25:46.741725	\N	\N	1	state	\N	0
54	VE	Venezuela	\N	2010-03-24 01:25:46.917838	Venezuelan	\N	58	state	178	0
238	VG	British Virgin Islands	\N	2010-03-24 01:25:47.061622	\N	\N	1	state	\N	0
239	VI	United States Virgin Islands	\N	2010-03-24 01:25:47.187458	\N	\N	1	state	\N	3
240	VU	Vanuatu	\N	2010-03-24 01:25:48.261945	\N	\N	678	state	180	0
241	WF	Wallis & Futuna Islands	\N	2010-03-24 01:25:50.51583	\N	\N	681	state	\N	0
242	WS	Samoa	\N	2010-03-24 01:25:51.508819	\N	\N	685	state	181	0
48	UY	Uruguay	2008-08-13 10:18:39.983672	2010-11-29 02:54:49.144514	Uruguayan	\N	598	Departmento	177	3
83	YE	Yemen	\N	2010-03-24 01:25:47.202024	\N	\N	967	state	\N	1
243	YT	Mayotte	\N	2010-03-24 01:25:48.459601	\N	\N	269	state	\N	0
244	YU	Yugoslavia	\N	2010-03-24 01:31:15.415676	\N	\N	11	state	188	1
31	ZA	South Africa	2008-06-19 17:35:34.195759	2010-03-24 01:25:50.432732	South African	\N	27	state	189	4
128	ZM	Zambia	\N	2010-03-24 01:25:51.323643	\N	\N	260	state	190	1
245	ZR	Zaire	\N	2010-03-24 01:25:46.168701	\N	\N	243	state	\N	0
246	ZW	Zimbabwe	\N	2010-03-24 01:25:46.955149	\N	\N	263	state	191	1
101	\N	B.O.T	\N	\N	\N	\N	\N	state	\N	1
50	RU	Russia	2008-08-13 10:56:19.895909	2010-11-29 02:32:25.474823	Russian	\N	7	Oblast	142	4
185	IQ	Iraq	\N	2010-03-24 01:25:48.379281	\N	\N	964	state	81	2
96	AR	Argentina	\N	2010-03-24 01:25:50.956203	Argentinean	\N	54	state	10	13
98	PE	Peru	\N	2010-03-24 01:25:51.388905	Peruvian	\N	51	state	132	1
39	VN	Vietnam	2008-06-19 17:35:36.061199	2010-10-11 04:23:08.428115	Vietnamese	\N	84	Province	179	4
254	HI	United States - Hawaii	2012-08-17 07:41:01.264295	2012-08-17 07:41:01.264295	American	\N	\N	state	\N	4
29	SA	Saudi Arabia	2008-06-19 17:35:32.567559	2010-03-24 01:25:51.415955	Saudi Arabian	\N	966	Province	144	1
\.


--
-- TOC entry 2787 (class 0 OID 0)
-- Dependencies: 458
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: myapp; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 1, false);


--
-- TOC entry 2772 (class 0 OID 36337)
-- Dependencies: 465
-- Data for Name: ninja_li; Type: TABLE DATA; Schema: myapp; Owner: postgres
--

COPY ninja_li (li_id, li_name, li_description) FROM stdin;
1	伊賀流	與雇主間有金錢契約關係,擅长暗杀与情报收集
2	甲賀流	活躍於戰場上或後方.長於用藥.誓死對主君盡忠
3	風魔忍	被誉为隐秘修炼者的迷之忍者众,擅长幻术与伪装
4	轩辕忍	源于中国的绿林死士,对武器锻造与使用出神入化
\.


--
-- TOC entry 2788 (class 0 OID 0)
-- Dependencies: 464
-- Name: ninja_li_li_id_seq; Type: SEQUENCE SET; Schema: myapp; Owner: postgres
--

SELECT pg_catalog.setval('ninja_li_li_id_seq', 4, true);


--
-- TOC entry 2769 (class 0 OID 28143)
-- Dependencies: 462
-- Data for Name: player; Type: TABLE DATA; Schema: myapp; Owner: postgres
--

COPY player (player_id, player_name, player_password, login_time, register_time, last_active_time, hp, exp, power, speed, wisdom, blood, mood, skill_point, level, li_id, sex) FROM stdin;
1	ninja	\N	\N	\N	\N	\N	\N	14	16	7	3	\N	\N	\N	4	ç·
\.


--
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 463
-- Name: player_player_id_seq; Type: SEQUENCE SET; Schema: myapp; Owner: postgres
--

SELECT pg_catalog.setval('player_player_id_seq', 1, true);


--
-- TOC entry 2768 (class 0 OID 28129)
-- Dependencies: 461
-- Data for Name: user_roles; Type: TABLE DATA; Schema: myapp; Owner: postgres
--

COPY user_roles (user_role_id, user_id, privilege) FROM stdin;
1	1	ROLE_USER
\.


--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 460
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE SET; Schema: myapp; Owner: postgres
--

SELECT pg_catalog.setval('user_roles_user_role_id_seq', 1, true);


--
-- TOC entry 2764 (class 0 OID 28107)
-- Dependencies: 457
-- Data for Name: users; Type: TABLE DATA; Schema: myapp; Owner: postgres
--

COPY users (user_id, user_name, password, enabled) FROM stdin;
1	jack	123	t
\.


--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 456
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: myapp; Owner: postgres
--

SELECT pg_catalog.setval('users_user_id_seq', 1, true);


--
-- TOC entry 2760 (class 2606 OID 36342)
-- Name: ninja_li_pkey; Type: CONSTRAINT; Schema: myapp; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ninja_li
    ADD CONSTRAINT ninja_li_pkey PRIMARY KEY (li_id);


--
-- TOC entry 2756 (class 2606 OID 36344)
-- Name: player_pkey; Type: CONSTRAINT; Schema: myapp; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- TOC entry 2758 (class 2606 OID 36346)
-- Name: player_player_name_key; Type: CONSTRAINT; Schema: myapp; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_player_name_key UNIQUE (player_name);


--
-- TOC entry 2754 (class 2606 OID 28137)
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: myapp; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_role_id);


--
-- TOC entry 2752 (class 2606 OID 28112)
-- Name: users_pkey; Type: CONSTRAINT; Schema: myapp; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2762 (class 2606 OID 36367)
-- Name: player_li_id_fkey; Type: FK CONSTRAINT; Schema: myapp; Owner: postgres
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_li_id_fkey FOREIGN KEY (li_id) REFERENCES ninja_li(li_id);


--
-- TOC entry 2761 (class 2606 OID 28138)
-- Name: user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: myapp; Owner: postgres
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


-- Completed on 2013-07-10 00:51:57

--
-- PostgreSQL database dump complete
--

