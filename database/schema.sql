--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Debian 14.13-1.pgdg110+1)
-- Dumped by pg_dump version 14.13 (Debian 14.13-1.pgdg110+1)

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

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO admin;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO admin;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO admin;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contact_paperwork; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.contact_paperwork (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    contact_id integer NOT NULL,
    paperwork_id integer NOT NULL
);


ALTER TABLE public.contact_paperwork OWNER TO admin;

--
-- Name: contact_property; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.contact_property (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    contact_id integer NOT NULL,
    property_id integer NOT NULL
);


ALTER TABLE public.contact_property OWNER TO admin;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100),
    phone character varying(20)
);


ALTER TABLE public.contacts OWNER TO admin;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO admin;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: paperwork; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.paperwork (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    file_url text
);


ALTER TABLE public.paperwork OWNER TO admin;

--
-- Name: paperwork_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.paperwork_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paperwork_id_seq OWNER TO admin;

--
-- Name: paperwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.paperwork_id_seq OWNED BY public.paperwork.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    address text NOT NULL,
    geom public.geometry(Polygon,4326)
);


ALTER TABLE public.properties OWNER TO admin;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO admin;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: property_paperwork; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.property_paperwork (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    property_id integer NOT NULL,
    paperwork_id integer NOT NULL
);


ALTER TABLE public.property_paperwork OWNER TO admin;

--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: paperwork id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.paperwork ALTER COLUMN id SET DEFAULT nextval('public.paperwork_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Name: contact_paperwork contact_paperwork_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contact_paperwork
    ADD CONSTRAINT contact_paperwork_pkey PRIMARY KEY (contact_id, paperwork_id);


--
-- Name: contact_property contact_property_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contact_property
    ADD CONSTRAINT contact_property_pkey PRIMARY KEY (contact_id, property_id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: paperwork paperwork_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.paperwork
    ADD CONSTRAINT paperwork_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: property_paperwork property_paperwork_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.property_paperwork
    ADD CONSTRAINT property_paperwork_pkey PRIMARY KEY (property_id, paperwork_id);


--
-- Name: contact_paperwork contact_paperwork_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contact_paperwork
    ADD CONSTRAINT contact_paperwork_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contact_paperwork contact_paperwork_paperwork_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contact_paperwork
    ADD CONSTRAINT contact_paperwork_paperwork_id_fkey FOREIGN KEY (paperwork_id) REFERENCES public.paperwork(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contact_property contact_property_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contact_property
    ADD CONSTRAINT contact_property_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contact_property contact_property_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contact_property
    ADD CONSTRAINT contact_property_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: property_paperwork property_paperwork_paperwork_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.property_paperwork
    ADD CONSTRAINT property_paperwork_paperwork_id_fkey FOREIGN KEY (paperwork_id) REFERENCES public.paperwork(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: property_paperwork property_paperwork_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.property_paperwork
    ADD CONSTRAINT property_paperwork_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

