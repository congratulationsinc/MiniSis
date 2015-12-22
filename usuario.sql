--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2015-12-21 09:46:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 171 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1938 (class 0 OID 0)
-- Dependencies: 171
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 82073)
-- Name: USER; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "USER" (
    id_user integer NOT NULL,
    user_name character varying(20),
    password character varying(20)
);


ALTER TABLE public."USER" OWNER TO postgres;

--
-- TOC entry 1822 (class 2606 OID 82077)
-- Name: pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "USER"
    ADD CONSTRAINT pk_user PRIMARY KEY (id_user);


--
-- TOC entry 1823 (class 1259 OID 82078)
-- Name: user_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX user_pk ON "USER" USING btree (id_user);


--
-- TOC entry 1937 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-12-21 09:46:52

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2015-12-21 09:45:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1931 (class 0 OID 82073)
-- Dependencies: 170
-- Data for Name: USER; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "USER" (id_user, user_name, password) VALUES (1010, 'jhona', 'jhona');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1011, 'griss', 'griss');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1012, 'mauri', 'mauri');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1013, 'anthony', 'anthony');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1014, 'ale', 'ale');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1015, 'denis', 'denis');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1016, 'julio', 'julio');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1017, 'gustavo', 'gustavo');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1018, 'jose', 'jose');
INSERT INTO "USER" (id_user, user_name, password) VALUES (1019, 'juan', 'juan');


-- Completed on 2015-12-21 09:45:07

--
-- PostgreSQL database dump complete
--

