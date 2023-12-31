toc.dat                                                                                             0000600 0004000 0002000 00000012545 14447077604 0014463 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           ,                {            operaciones_bancarias    15.2    15.2     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         
           1262    17662    operaciones_bancarias    DATABASE     �   CREATE DATABASE operaciones_bancarias WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 %   DROP DATABASE operaciones_bancarias;
                postgres    false                     3079    17679 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false         
           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2         �            1259    17669    cuentas    TABLE     �   CREATE TABLE public.cuentas (
    rut character varying(11) NOT NULL,
    n_cuenta integer NOT NULL,
    tipo character varying(30) NOT NULL
);
    DROP TABLE public.cuentas;
       public         heap    postgres    false         �            1259    17690    registro_transacciones    TABLE     �  CREATE TABLE public.registro_transacciones (
    n_operacion character varying(6) DEFAULT substr((public.uuid_generate_v4())::text, 1, 6),
    rut character varying(12) NOT NULL,
    n_cuenta integer NOT NULL,
    detalle_operacion character varying(30) DEFAULT 'No especifica'::character varying,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    abonos money DEFAULT 0,
    cargos money DEFAULT 0,
    balance money GENERATED ALWAYS AS ((abonos - cargos)) STORED NOT NULL
);
 *   DROP TABLE public.registro_transacciones;
       public         heap    postgres    false    2         �            1259    17663    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    rut character varying(11) NOT NULL,
    clave text NOT NULL,
    nombre character varying(50) NOT NULL,
    primer_apellido character varying(50) NOT NULL,
    segundo_apellido character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    email character varying(50) NOT NULL,
    telefono character varying(15),
    CONSTRAINT chk_clave CHECK ((length(clave) >= 8))
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false         
          0    17669    cuentas 
   TABLE DATA           6   COPY public.cuentas (rut, n_cuenta, tipo) FROM stdin;
    public          postgres    false    216       3348.dat 
          0    17690    registro_transacciones 
   TABLE DATA           v   COPY public.registro_transacciones (n_operacion, rut, n_cuenta, detalle_operacion, fecha, abonos, cargos) FROM stdin;
    public          postgres    false    217       3349.dat 
          0    17663    usuarios 
   TABLE DATA           |   COPY public.usuarios (rut, clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono) FROM stdin;
    public          postgres    false    215       3347.dat �           2606    17673    cuentas cuentas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (n_cuenta);
 >   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_pkey;
       public            postgres    false    216                    2606    17668    usuarios usuarios_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (rut);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    215         �           2606    17674    cuentas cuentas_rut_fkey 
   FK CONSTRAINT     w   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_rut_fkey FOREIGN KEY (rut) REFERENCES public.usuarios(rut);
 B   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_rut_fkey;
       public          postgres    false    216    215    3199         �           2606    17704 ;   registro_transacciones registro_transacciones_n_cuenta_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_transacciones
    ADD CONSTRAINT registro_transacciones_n_cuenta_fkey FOREIGN KEY (n_cuenta) REFERENCES public.cuentas(n_cuenta);
 e   ALTER TABLE ONLY public.registro_transacciones DROP CONSTRAINT registro_transacciones_n_cuenta_fkey;
       public          postgres    false    216    3201    217         �           2606    17699 6   registro_transacciones registro_transacciones_rut_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_transacciones
    ADD CONSTRAINT registro_transacciones_rut_fkey FOREIGN KEY (rut) REFERENCES public.usuarios(rut);
 `   ALTER TABLE ONLY public.registro_transacciones DROP CONSTRAINT registro_transacciones_rut_fkey;
       public          postgres    false    217    3199    215                                                                                                                                                                   3348.dat                                                                                            0000600 0004000 0002000 00000000177 14447077604 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2222222-k	1	Vista
2222222-k	2	Corriente
21444444-4	3	Ahorro
21444444-4	4	Vista
18555555-1	5	Corriente
18555555-1	6	Ahorro
\.


                                                                                                                                                                                                                                                                                                                                                                                                 3349.dat                                                                                            0000600 0004000 0002000 00000000143 14447077604 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        f031d7	18555555-1	6	transferencia desde usa	2023-06-20 12:36:22.210965	0,00 €	20.000,00 €
\.


                                                                                                                                                                                                                                                                                                                                                                                                                             3347.dat                                                                                            0000600 0004000 0002000 00000001541 14447077604 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2222222-k	123456789	Pedro	Picapiedra	Piedra	1987-03-24	pedro@gmail.com	955545951
21444444-4	123456789	Wilma	Pica	Picapiedra	1983-08-13	wilma@gmail.com	988888888
18555555-1	123456789	Pablo	Marmol	Marmolejo	1971-12-30	pablo@gmail.com	978852143
456543454-9	123456789	Jasmin	saaaa	Salvador	1970-05-30	elena@dojo.com	954423555
22222222-2	123456789	Juana	La	Loca	1970-05-29	juana@dojo.com	95442222
456543454-8	12345678	Juancho	El	Leon	1994-03-02	juancho@si.com	954423599
456543455-5	123456789	Sr	Don	Gato	1987-08-13	don@cat.com	955523599
1.999.999-8	123456789	Pepe	Grillo	Grillito	1978-06-15	pepe@gmail.com	95444444
456543454-1	123456789	xxxxxxx	xxxxxxxx	xxxxxxxxx	2023-06-05	ped@dojo.com	954423591
456543455-1	123456789	Betty	Boo	Boo	1985-06-07	betty@dojo.com	954433333
456577754-9	123456789	aaaaaaaa	aaaaaaa	aaaaaaa	2023-05-30	sjasmin.salvador@gmail.com	954423591
\.


                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000012113 14447077604 0015377 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

DROP DATABASE operaciones_bancarias;
--
-- Name: operaciones_bancarias; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE operaciones_bancarias WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE operaciones_bancarias OWNER TO postgres;

\connect operaciones_bancarias

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cuentas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas (
    rut character varying(11) NOT NULL,
    n_cuenta integer NOT NULL,
    tipo character varying(30) NOT NULL
);


ALTER TABLE public.cuentas OWNER TO postgres;

--
-- Name: registro_transacciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registro_transacciones (
    n_operacion character varying(6) DEFAULT substr((public.uuid_generate_v4())::text, 1, 6),
    rut character varying(12) NOT NULL,
    n_cuenta integer NOT NULL,
    detalle_operacion character varying(30) DEFAULT 'No especifica'::character varying,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    abonos money DEFAULT 0,
    cargos money DEFAULT 0,
    balance money GENERATED ALWAYS AS ((abonos - cargos)) STORED NOT NULL
);


ALTER TABLE public.registro_transacciones OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    rut character varying(11) NOT NULL,
    clave text NOT NULL,
    nombre character varying(50) NOT NULL,
    primer_apellido character varying(50) NOT NULL,
    segundo_apellido character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    email character varying(50) NOT NULL,
    telefono character varying(15),
    CONSTRAINT chk_clave CHECK ((length(clave) >= 8))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas (rut, n_cuenta, tipo) FROM stdin;
\.
COPY public.cuentas (rut, n_cuenta, tipo) FROM '$$PATH$$/3348.dat';

--
-- Data for Name: registro_transacciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registro_transacciones (n_operacion, rut, n_cuenta, detalle_operacion, fecha, abonos, cargos) FROM stdin;
\.
COPY public.registro_transacciones (n_operacion, rut, n_cuenta, detalle_operacion, fecha, abonos, cargos) FROM '$$PATH$$/3349.dat';

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (rut, clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono) FROM stdin;
\.
COPY public.usuarios (rut, clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono) FROM '$$PATH$$/3347.dat';

--
-- Name: cuentas cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (n_cuenta);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (rut);


--
-- Name: cuentas cuentas_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_rut_fkey FOREIGN KEY (rut) REFERENCES public.usuarios(rut);


--
-- Name: registro_transacciones registro_transacciones_n_cuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_transacciones
    ADD CONSTRAINT registro_transacciones_n_cuenta_fkey FOREIGN KEY (n_cuenta) REFERENCES public.cuentas(n_cuenta);


--
-- Name: registro_transacciones registro_transacciones_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_transacciones
    ADD CONSTRAINT registro_transacciones_rut_fkey FOREIGN KEY (rut) REFERENCES public.usuarios(rut);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     