--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12rc1

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
-- Name: kategoriekle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kategoriekle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."kategoriad" = UPPER(NEW."kategoriad"); -- büyük harfe dönüştürdükten sonra ekle
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.kategoriekle() OWNER TO postgres;

--
-- Name: kayitEkle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."kayitEkle"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."kitapad" = UPPER(NEW."kitapad"); -- büyük harfe dönüştürdükten sonra ekle
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."kayitEkle"() OWNER TO postgres;

--
-- Name: oduncver(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.oduncver() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE kitap
    Set mevcutmu=false
    WHERE kitapId=NEW.kitapId;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.oduncver() OWNER TO postgres;

--
-- Name: toplamkategori(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplamkategori() RETURNS integer
    LANGUAGE plpgsql
    AS $$  
declare  
    total integer;  
BEGIN  
   SELECT count(*) into total FROM kategori;  
   RETURN total;  
END;  
$$;


ALTER FUNCTION public.toplamkategori() OWNER TO postgres;

--
-- Name: toplamkitap(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplamkitap() RETURNS integer
    LANGUAGE plpgsql
    AS $$  
declare  
    total integer;  
BEGIN  
   SELECT count(*) into total FROM kitap;  
   RETURN total;  
END;  
$$;


ALTER FUNCTION public.toplamkitap() OWNER TO postgres;

--
-- Name: toplammevcutkitap(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplammevcutkitap() RETURNS integer
    LANGUAGE plpgsql
    AS $$  
declare  
    total integer;  
BEGIN  
   SELECT count(*) into total FROM mevcutkitap;  
   RETURN total;  
END;  
$$;


ALTER FUNCTION public.toplammevcutkitap() OWNER TO postgres;

--
-- Name: toplamyayinevi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplamyayinevi() RETURNS integer
    LANGUAGE plpgsql
    AS $$  
declare  
    total integer;  
BEGIN  
   SELECT count(*) into total FROM yayinevi;  
   RETURN total;  
END;  
$$;


ALTER FUNCTION public.toplamyayinevi() OWNER TO postgres;

--
-- Name: toplamyazar(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplamyazar() RETURNS integer
    LANGUAGE plpgsql
    AS $$  
declare  
    total integer;  
BEGIN  
   SELECT count(*) into total FROM yazar;  
   RETURN total;  
END;  
$$;


ALTER FUNCTION public.toplamyazar() OWNER TO postgres;

--
-- Name: yayieviekle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.yayieviekle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."yayineviad" = UPPER(NEW."yayineviad"); -- büyük harfe dönüştürdükten sonra ekle
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.yayieviekle() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    kategoriid integer NOT NULL,
    kategoriad text NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- Name: kategoriYayınevi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."kategoriYayınevi" (
    "kategoriId" integer NOT NULL,
    "yayineviId" integer NOT NULL
);


ALTER TABLE public."kategoriYayınevi" OWNER TO postgres;

--
-- Name: kitap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitap (
    kitapid integer NOT NULL,
    kitapad text NOT NULL,
    yazarid integer NOT NULL,
    kategoriid integer NOT NULL,
    yayineviid integer NOT NULL,
    mevcutmu boolean
);


ALTER TABLE public.kitap OWNER TO postgres;

--
-- Name: kitapKategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."kitapKategori" (
    "kitapId" integer NOT NULL,
    "kategoriId" integer NOT NULL
);


ALTER TABLE public."kitapKategori" OWNER TO postgres;

--
-- Name: kitapYazar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."kitapYazar" (
    "kitapId" integer NOT NULL,
    yazarid integer NOT NULL
);


ALTER TABLE public."kitapYazar" OWNER TO postgres;

--
-- Name: kullanici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanici (
    kullaniciid integer NOT NULL,
    ad text NOT NULL,
    soyad text NOT NULL,
    sifre text NOT NULL
);


ALTER TABLE public.kullanici OWNER TO postgres;

--
-- Name: kutuphaneci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kutuphaneci (
    "kutuphaneciId" integer NOT NULL,
    kullaniciid integer NOT NULL
);


ALTER TABLE public.kutuphaneci OWNER TO postgres;

--
-- Name: mevcutkitap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mevcutkitap (
    mevcutkitapid integer NOT NULL,
    kitapid integer NOT NULL,
    odunczamani date NOT NULL,
    kullaniciid integer NOT NULL
);


ALTER TABLE public.mevcutkitap OWNER TO postgres;

--
-- Name: ogrenci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenci (
    "ogrenciId" integer NOT NULL,
    kullaniciid integer NOT NULL
);


ALTER TABLE public.ogrenci OWNER TO postgres;

--
-- Name: yayinevi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yayinevi (
    yayineviid integer NOT NULL,
    yayineviad text NOT NULL,
    adres text NOT NULL
);


ALTER TABLE public.yayinevi OWNER TO postgres;

--
-- Name: yazar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yazar (
    yazarid integer NOT NULL,
    yazarad text NOT NULL
);


ALTER TABLE public.yazar OWNER TO postgres;

--
-- Name: yazarKategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."yazarKategori" (
    yazarid integer NOT NULL,
    "kategoriId" integer NOT NULL
);


ALTER TABLE public."yazarKategori" OWNER TO postgres;

--
-- Name: yazarYayinevi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."yazarYayinevi" (
    yazarid integer NOT NULL,
    "yayineviId" integer NOT NULL
);


ALTER TABLE public."yazarYayinevi" OWNER TO postgres;

--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kategori VALUES (1, 'aşk');
INSERT INTO public.kategori VALUES (2, 'macera');
INSERT INTO public.kategori VALUES (3, 'FELSEFE');


--
-- Data for Name: kategoriYayınevi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: kitap; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kitap VALUES (2, 'dune mesihi', 1, 2, 1, false);
INSERT INTO public.kitap VALUES (4, 'dune tanrı imparator', 1, 2, 1, true);
INSERT INTO public.kitap VALUES (3, 'dune çocukları', 1, 2, 10, true);
INSERT INTO public.kitap VALUES (1, 'dune', 1, 2, 1, false);
INSERT INTO public.kitap VALUES (58, 'suç ve ceza', 2, 1, 1, true);


--
-- Data for Name: kitapKategori; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: kitapYazar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: kullanici; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kullanici VALUES (1, 'mücahit', 's', '1');
INSERT INTO public.kullanici VALUES (2, 'yasin', 'dogru', '1');


--
-- Data for Name: kutuphaneci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kutuphaneci VALUES (1, 1);


--
-- Data for Name: mevcutkitap; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mevcutkitap VALUES (1, 1, '2019-12-14', 2);
INSERT INTO public.mevcutkitap VALUES (2, 2, '2019-12-17', 2);


--
-- Data for Name: ogrenci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ogrenci VALUES (1, 2);


--
-- Data for Name: yayinevi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yayinevi VALUES (1, 'Can yayınevi', 'sivas');
INSERT INTO public.yayinevi VALUES (10, 'yky', 'izmit');
INSERT INTO public.yayinevi VALUES (2, 'ITHAKI', 'ankara');


--
-- Data for Name: yazar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yazar VALUES (1, 'frank helbert');
INSERT INTO public.yazar VALUES (2, 'dosto');
INSERT INTO public.yazar VALUES (4, 'sabahattin ali');


--
-- Data for Name: yazarKategori; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: yazarYayinevi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: kitap Kitap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap
    ADD CONSTRAINT "Kitap_pkey" PRIMARY KEY (kitapid);


--
-- Name: kategoriYayınevi kategoriYayınevi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kategoriYayınevi"
    ADD CONSTRAINT "kategoriYayınevi_pkey" PRIMARY KEY ("kategoriId", "yayineviId");


--
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (kategoriid);


--
-- Name: kitapKategori kitapKategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kitapKategori"
    ADD CONSTRAINT "kitapKategori_pkey" PRIMARY KEY ("kitapId", "kategoriId");


--
-- Name: kitapYazar kitapYazar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kitapYazar"
    ADD CONSTRAINT "kitapYazar_pkey" PRIMARY KEY ("kitapId", yazarid);


--
-- Name: kullanici kullanici_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanici
    ADD CONSTRAINT kullanici_pkey PRIMARY KEY (kullaniciid);


--
-- Name: kutuphaneci kutuphaneci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kutuphaneci
    ADD CONSTRAINT kutuphaneci_pkey PRIMARY KEY ("kutuphaneciId");


--
-- Name: mevcutkitap mevcutKitap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mevcutkitap
    ADD CONSTRAINT "mevcutKitap_pkey" PRIMARY KEY (mevcutkitapid);


--
-- Name: ogrenci ogrenci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT ogrenci_pkey PRIMARY KEY ("ogrenciId");


--
-- Name: yayinevi yayinevi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yayinevi
    ADD CONSTRAINT yayinevi_pkey PRIMARY KEY (yayineviid);


--
-- Name: yazarKategori yazarKategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yazarKategori"
    ADD CONSTRAINT "yazarKategori_pkey" PRIMARY KEY (yazarid, "kategoriId");


--
-- Name: yazarYayinevi yazarYayinevi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yazarYayinevi"
    ADD CONSTRAINT "yazarYayinevi_pkey" PRIMARY KEY (yazarid, "yayineviId");


--
-- Name: yazar yazar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yazar
    ADD CONSTRAINT yazar_pkey PRIMARY KEY (yazarid);


--
-- Name: index_kitapId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "index_kitapId" ON public."kitapYazar" USING btree ("kitapId");


--
-- Name: kategori kategorikontrol; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER kategorikontrol BEFORE INSERT ON public.kategori FOR EACH ROW EXECUTE FUNCTION public.kategoriekle();


--
-- Name: kitap kayitKontrol; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kayitKontrol" BEFORE INSERT ON public.kitap FOR EACH ROW EXECUTE FUNCTION public."kayitEkle"();


--
-- Name: mevcutkitap odunckontrol; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER odunckontrol BEFORE INSERT ON public.mevcutkitap FOR EACH ROW EXECUTE FUNCTION public.oduncver();


--
-- Name: yayinevi yayinevikontrol; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER yayinevikontrol BEFORE INSERT ON public.yayinevi FOR EACH ROW EXECUTE FUNCTION public.yayieviekle();


--
-- Name: kategoriYayınevi lnk_kategori_kategoriYayınevi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kategoriYayınevi"
    ADD CONSTRAINT "lnk_kategori_kategoriYayınevi" FOREIGN KEY ("kategoriId") REFERENCES public.kategori(kategoriid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitapKategori lnk_kategori_kitapKategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kitapKategori"
    ADD CONSTRAINT "lnk_kategori_kitapKategori" FOREIGN KEY ("kategoriId") REFERENCES public.kategori(kategoriid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: yazarKategori lnk_kategori_yazarKategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yazarKategori"
    ADD CONSTRAINT "lnk_kategori_yazarKategori" FOREIGN KEY ("kategoriId") REFERENCES public.kategori(kategoriid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitapKategori lnk_kitap_kitapKategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kitapKategori"
    ADD CONSTRAINT "lnk_kitap_kitapKategori" FOREIGN KEY ("kitapId") REFERENCES public.kitap(kitapid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitapYazar lnk_kitap_kitapYazar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kitapYazar"
    ADD CONSTRAINT "lnk_kitap_kitapYazar" FOREIGN KEY ("kitapId") REFERENCES public.kitap(kitapid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mevcutkitap lnk_kitap_mevcutKitap; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mevcutkitap
    ADD CONSTRAINT "lnk_kitap_mevcutKitap" FOREIGN KEY (kitapid) REFERENCES public.kitap(kitapid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kategoriYayınevi lnk_yayinevi_kategoriYayınevi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kategoriYayınevi"
    ADD CONSTRAINT "lnk_yayinevi_kategoriYayınevi" FOREIGN KEY ("yayineviId") REFERENCES public.yayinevi(yayineviid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitap lnk_yayinevi_kitap; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap
    ADD CONSTRAINT lnk_yayinevi_kitap FOREIGN KEY (yayineviid) REFERENCES public.yayinevi(yayineviid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: yazarYayinevi lnk_yayinevi_yazarYayinevi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yazarYayinevi"
    ADD CONSTRAINT "lnk_yayinevi_yazarYayinevi" FOREIGN KEY ("yayineviId") REFERENCES public.yayinevi(yayineviid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitapYazar lnk_yazar_kitapYazar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kitapYazar"
    ADD CONSTRAINT "lnk_yazar_kitapYazar" FOREIGN KEY (yazarid) REFERENCES public.yazar(yazarid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: yazarKategori lnk_yazar_yazarKategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yazarKategori"
    ADD CONSTRAINT "lnk_yazar_yazarKategori" FOREIGN KEY (yazarid) REFERENCES public.yazar(yazarid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: yazarYayinevi lnk_yazar_yazarYayinevi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yazarYayinevi"
    ADD CONSTRAINT "lnk_yazar_yazarYayinevi" FOREIGN KEY (yazarid) REFERENCES public.yazar(yazarid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

