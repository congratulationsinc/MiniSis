--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2015-12-22 12:03:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 174 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 174
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 82177)
-- Name: USER; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "USER" (
    user_id integer NOT NULL,
    user_name character varying(25),
    password character varying(35),
    first_name character varying(30),
    last_name character varying(35),
    email character varying(30),
    phone integer,
    age integer,
    career character varying(25)
);


ALTER TABLE public."USER" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 82161)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session (
    id_session integer NOT NULL,
    user_id integer,
    session_date date,
    start_time time without time zone,
    end_time time without time zone,
    activate boolean
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 82123)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task (
    task_id integer NOT NULL,
    task_name character varying(30),
    task_description text,
    start_date date,
    end_date date
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 82169)
-- Name: task_score; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_score (
    user_id integer NOT NULL,
    task_id integer NOT NULL,
    date_presentation date,
    score integer
);


ALTER TABLE public.task_score OWNER TO postgres;

--
-- TOC entry 1838 (class 2606 OID 82165)
-- Name: pk_session; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT pk_session PRIMARY KEY (id_session);


--
-- TOC entry 1835 (class 2606 OID 82130)
-- Name: pk_task; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT pk_task PRIMARY KEY (task_id);


--
-- TOC entry 1842 (class 2606 OID 82173)
-- Name: pk_task_score; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_score
    ADD CONSTRAINT pk_task_score PRIMARY KEY (user_id, task_id);


--
-- TOC entry 1847 (class 2606 OID 82181)
-- Name: pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "USER"
    ADD CONSTRAINT pk_user PRIMARY KEY (user_id);


--
-- TOC entry 1843 (class 1259 OID 82175)
-- Name: relationship_1_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX relationship_1_fk ON task_score USING btree (user_id);


--
-- TOC entry 1844 (class 1259 OID 82176)
-- Name: relationship_2_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX relationship_2_fk ON task_score USING btree (task_id);


--
-- TOC entry 1839 (class 1259 OID 82167)
-- Name: relationship_3_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX relationship_3_fk ON session USING btree (user_id);


--
-- TOC entry 1840 (class 1259 OID 82166)
-- Name: session_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX session_pk ON session USING btree (id_session);


--
-- TOC entry 1836 (class 1259 OID 82168)
-- Name: task_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX task_pk ON task USING btree (task_id);


--
-- TOC entry 1845 (class 1259 OID 82174)
-- Name: task_score_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX task_score_pk ON task_score USING btree (user_id, task_id);


--
-- TOC entry 1848 (class 1259 OID 82182)
-- Name: user_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX user_pk ON "USER" USING btree (user_id);


--
-- TOC entry 1849 (class 2606 OID 82183)
-- Name: fk_session_relations_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session
    ADD CONSTRAINT fk_session_relations_user FOREIGN KEY (user_id) REFERENCES "USER"(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1851 (class 2606 OID 82193)
-- Name: fk_task_sco_relations_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_score
    ADD CONSTRAINT fk_task_sco_relations_task FOREIGN KEY (task_id) REFERENCES task(task_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1850 (class 2606 OID 82188)
-- Name: fk_task_sco_relations_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_score
    ADD CONSTRAINT fk_task_sco_relations_user FOREIGN KEY (user_id) REFERENCES "USER"(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-12-22 12:03:54

--
-- PostgreSQL database dump complete
--



--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2015-12-22 12:04:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1962 (class 0 OID 82177)
-- Dependencies: 173
-- Data for Name: USER; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1010, 'jhona', 'jhona', 'jhonatan', 'sanchez', 'jhonaumss@gmail.com', 69493775, 21, 'Ing. Sistemas');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1011, 'griss', 'griss', 'griselda', 'fernandez', 'gfernadez@gmail.com', 678994356, 21, 'Ing. Sistemas');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1012, 'ale', 'ale', 'alejandra', 'perez', 'aperez@gmail.com', 32546790, 20, 'Ing. Sistemas');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1013, 'mauri', 'mauri', 'mauricio', 'perez', 'mperez@gmail.com', 45876512, 21, 'Ing. Sistemas');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1014, 'denis', 'denis', 'denis', 'perez', 'dperez@gmail.com', 68303928, 20, 'Ing. Sistemas');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1015, 'anthony', 'anthony', 'anthony', 'fernandez', 'afernandez@gmail.com', 12458909, 21, 'Ing. Sistemas');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1016, 'julio', 'julio', 'julio', 'perez', 'jperez@gmail.com', 54981245, 21, 'Ing. Informatica');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1017, 'gustavo', 'gustavo', 'gustavo', 'perez', 'gperez@gmail.com', 12345678, 20, 'Ing. Sistemas');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1018, 'juan', 'juan', 'juan', 'perez', 'jperez@gmail.com', 23456789, 22, 'Ing. Informatica');
INSERT INTO "USER" (user_id, user_name, password, first_name, last_name, email, phone, age, career) VALUES (1019, 'dani', 'dani', 'daniela', 'fernandez', 'dfernandez@gmail.com', 23769834, 20, 'Ing. Sistemas');


--
-- TOC entry 1960 (class 0 OID 82161)
-- Dependencies: 171
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1959 (class 0 OID 82123)
-- Dependencies: 170
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1101, 'tarea del login', 'muchachos deben hacer un login de acuerdo a lo dictado en clase', '2015-07-15', '2015-07-22');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1102, 'tarea 2', 'muchachos deben hacer un resumen de lo aprendido esta semana', '2015-01-03', '2015-01-08');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1103, 'tarea 3', 'muchachos deben repasar lo aprendido esta semana', '2015-02-03', '2015-07-08');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1104, 'tarea 4', 'muchachos envien sus presentaciones lo mas pronto posible', '2015-02-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1105, 'tarea 5', 'esta tarea la deben entregar con caratula no lo olviden :) ', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1106, 'tarea 6', 'muchachos la tarea es olvidar lo hecho esta semana', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1107, 'tarea 7', 'muchachos deben hacer un resumen de lo aprendido esta semana', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1108, 'tarea 8', 'no olvidar poner sus nombres en su resumen', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1109, 'tarea 9', 'ultima chance de entregar la tarea 8', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1110, 'tarea 10', 'muchachos deben hacer un resumen de lo aprendido la anterior semana', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1111, 'tarea 11', 'copiar la tarea 1 (la del login) lo perdi', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1112, 'tarea 12', 'revisen su base datos ejeje', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1113, 'tarea 13', 'esta tarea es para la prueba', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1114, 'tarea 14', 'los ultimos 5 en entregar tienen 10 puntos menos', '2015-07-23', '2015-07-30');
INSERT INTO task (task_id, task_name, task_description, start_date, end_date) VALUES (1115, 'tarea 15', '!!!!!!ultima tarea suerte!!!!!!!!', '2015-07-23', '2015-07-30');


--
-- TOC entry 1961 (class 0 OID 82169)
-- Dependencies: 172
-- Data for Name: task_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1010, 1101, '2015-02-12', 56);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1011, 1111, '2015-02-12', 66);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1010, 1102, '2015-02-12', 36);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1010, 1103, '2015-02-12', 56);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1011, 1102, '2015-02-12', 53);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1011, 1101, '2015-02-12', 56);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1012, 1101, '2015-02-12', 67);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1013, 1101, '2015-02-12', 32);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1014, 1101, '2015-02-12', 52);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1011, 1103, '2015-02-12', 76);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1012, 1102, '2015-02-12', 47);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1013, 1102, '2015-02-12', 82);
INSERT INTO task_score (user_id, task_id, date_presentation, score) VALUES (1014, 1102, '2015-02-12', 62);


-- Completed on 2015-12-22 12:04:24

--
-- PostgreSQL database dump complete
--

