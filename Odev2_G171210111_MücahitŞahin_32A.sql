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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cevaplanmamisSoru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."cevaplanmamisSoru" (
    "cevaplanmamisId" integer NOT NULL,
    "soruId" integer NOT NULL
);


ALTER TABLE public."cevaplanmamisSoru" OWNER TO postgres;

--
-- Name: cevaplar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cevaplar (
    "cevapId" integer NOT NULL,
    "soruId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "cevapZamani" date NOT NULL,
    cevap text NOT NULL,
    "cevapPuani" integer
);


ALTER TABLE public.cevaplar OWNER TO postgres;

--
-- Name: editor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editor (
    "editorId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "soruId" integer NOT NULL
);


ALTER TABLE public.editor OWNER TO postgres;

--
-- Name: etiketAd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."etiketAd" (
    "etiketAdId" integer NOT NULL,
    "etiketAdı" text NOT NULL
);


ALTER TABLE public."etiketAd" OWNER TO postgres;

--
-- Name: etiketler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etiketler (
    "etiketId" integer NOT NULL,
    "soruId" integer NOT NULL,
    "etiketAdId" integer NOT NULL
);


ALTER TABLE public.etiketler OWNER TO postgres;

--
-- Name: favoriSorular; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."favoriSorular" (
    "favoriSoruId" integer NOT NULL,
    "soruId" integer NOT NULL,
    "kullaniciId" integer NOT NULL
);


ALTER TABLE public."favoriSorular" OWNER TO postgres;

--
-- Name: itibar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itibar (
    "itibarId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "toplamPuan" integer NOT NULL
);


ALTER TABLE public.itibar OWNER TO postgres;

--
-- Name: kullaniciRozet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."kullaniciRozet" (
    "kullaniciId" integer NOT NULL,
    "rozetId" integer NOT NULL
);


ALTER TABLE public."kullaniciRozet" OWNER TO postgres;

--
-- Name: kullanicilar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanicilar (
    "kullaniciId" integer NOT NULL,
    "kullaniciAdi" text NOT NULL,
    email text NOT NULL,
    hakkinda text,
    "tamAd" text,
    "resimUrl" text,
    "websiteUrl" text,
    "twitterUrl" text,
    "githubUrl" text,
    "ulkeId" integer
);


ALTER TABLE public.kullanicilar OWNER TO postgres;

--
-- Name: moderator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moderator (
    "moderatorId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "toplulukId" integer NOT NULL
);


ALTER TABLE public.moderator OWNER TO postgres;

--
-- Name: oduller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oduller (
    "odulId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "cevapId" integer NOT NULL,
    puan integer NOT NULL
);


ALTER TABLE public.oduller OWNER TO postgres;

--
-- Name: oyCevap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."oyCevap" (
    "oyId" integer NOT NULL,
    "cevapId" integer NOT NULL
);


ALTER TABLE public."oyCevap" OWNER TO postgres;

--
-- Name: oyKullananlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."oyKullananlar" (
    "oyKullananId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "cevapId" integer NOT NULL
);


ALTER TABLE public."oyKullananlar" OWNER TO postgres;

--
-- Name: rozetler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rozetler (
    "rozetId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "rozetTuru" text NOT NULL,
    "cevapId" integer NOT NULL
);


ALTER TABLE public.rozetler OWNER TO postgres;

--
-- Name: sorular; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sorular (
    "soruId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "oySayisi" integer NOT NULL,
    "cevapSayisi" integer NOT NULL,
    "goruntulenmeSayisi" integer NOT NULL,
    "soruZamani" date NOT NULL,
    baslik text NOT NULL,
    icerik text NOT NULL
);


ALTER TABLE public.sorular OWNER TO postgres;

--
-- Name: topluluklar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topluluklar (
    "toplulukId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "toplulukAdı" text NOT NULL
);


ALTER TABLE public.topluluklar OWNER TO postgres;

--
-- Name: ulkeler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulkeler (
    "ulkeId" integer NOT NULL,
    "ulkeAdi" text NOT NULL
);


ALTER TABLE public.ulkeler OWNER TO postgres;

--
-- Name: yorumlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yorumlar (
    "yorumId" integer NOT NULL,
    "kullaniciId" integer NOT NULL,
    "soruId" integer NOT NULL,
    "yorumZamani" date NOT NULL,
    yorum text NOT NULL
);


ALTER TABLE public.yorumlar OWNER TO postgres;

--
-- Data for Name: cevaplanmamisSoru; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cevaplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cevaplar VALUES (1, 2, 1, '2005-05-15', 'noktalı virgul yok', NULL);


--
-- Data for Name: editor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.editor VALUES (1, 1, 1);
INSERT INTO public.editor VALUES (2, 2, 2);


--
-- Data for Name: etiketAd; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."etiketAd" VALUES (1, 'c++');
INSERT INTO public."etiketAd" VALUES (2, 'c#');
INSERT INTO public."etiketAd" VALUES (3, 'python');


--
-- Data for Name: etiketler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etiketler VALUES (1, 1, 1);
INSERT INTO public.etiketler VALUES (2, 1, 2);


--
-- Data for Name: favoriSorular; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."favoriSorular" VALUES (1, 1, 1);


--
-- Data for Name: itibar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.itibar VALUES (1, 1, 150);


--
-- Data for Name: kullaniciRozet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."kullaniciRozet" VALUES (1, 1);


--
-- Data for Name: kullanicilar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kullanicilar VALUES (2, 'selim', 'seli@g.com', 'sivaslı', 'selim kose', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.kullanicilar VALUES (1, 'ahmet', 'ahmet@sf.com', 'çok iyi insanım', 'ahmet şahin', 'resim1', 'website1', 'twit1', 'git1', 2);


--
-- Data for Name: moderator; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oduller; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oyCevap; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oyKullananlar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rozetler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rozetler VALUES (1, 1, 'cevapUstası', 1);


--
-- Data for Name: sorular; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sorular VALUES (1, 1, 5, 0, 10, '2015-05-13', 'c++ error', 'program çalışmıyor');
INSERT INTO public.sorular VALUES (2, 2, 10, 12, 0, '2000-12-10', 'hataaa', 'çalışmıyor');


--
-- Data for Name: topluluklar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.topluluklar VALUES (1, 1, 'stackoverflow');


--
-- Data for Name: ulkeler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ulkeler VALUES (1, 'Türkiye');
INSERT INTO public.ulkeler VALUES (2, 'Amerika');
INSERT INTO public.ulkeler VALUES (3, 'Rusya');
INSERT INTO public.ulkeler VALUES (4, 'Hollanda');


--
-- Data for Name: yorumlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yorumlar VALUES (1, 2, 1, '2016-06-13', 'çok iyi cevaplamıs');


--
-- Name: cevaplanmamisSoru cevaplanmamisSoru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cevaplanmamisSoru"
    ADD CONSTRAINT "cevaplanmamisSoru_pkey" PRIMARY KEY ("cevaplanmamisId");


--
-- Name: cevaplar cevaplar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cevaplar
    ADD CONSTRAINT cevaplar_pkey PRIMARY KEY ("cevapId");


--
-- Name: editor editor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editor
    ADD CONSTRAINT editor_pkey PRIMARY KEY ("editorId");


--
-- Name: etiketAd etiketAd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."etiketAd"
    ADD CONSTRAINT "etiketAd_pkey" PRIMARY KEY ("etiketAdId");


--
-- Name: etiketler etiketler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiketler
    ADD CONSTRAINT etiketler_pkey PRIMARY KEY ("etiketId");


--
-- Name: favoriSorular favoriSorular_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."favoriSorular"
    ADD CONSTRAINT "favoriSorular_pkey" PRIMARY KEY ("favoriSoruId");


--
-- Name: itibar itibar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itibar
    ADD CONSTRAINT itibar_pkey PRIMARY KEY ("itibarId");


--
-- Name: kullaniciRozet kullaniciRozet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kullaniciRozet"
    ADD CONSTRAINT "kullaniciRozet_pkey" PRIMARY KEY ("kullaniciId", "rozetId");


--
-- Name: kullanicilar kullanicilar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_pkey PRIMARY KEY ("kullaniciId");


--
-- Name: moderator moderator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderator
    ADD CONSTRAINT moderator_pkey PRIMARY KEY ("moderatorId");


--
-- Name: oduller oduller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oduller
    ADD CONSTRAINT oduller_pkey PRIMARY KEY ("odulId");


--
-- Name: oyCevap oyCevap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."oyCevap"
    ADD CONSTRAINT "oyCevap_pkey" PRIMARY KEY ("oyId", "cevapId");


--
-- Name: oyKullananlar oyKullananlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."oyKullananlar"
    ADD CONSTRAINT "oyKullananlar_pkey" PRIMARY KEY ("oyKullananId");


--
-- Name: rozetler rozetler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rozetler
    ADD CONSTRAINT rozetler_pkey PRIMARY KEY ("rozetId");


--
-- Name: sorular sorular_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sorular
    ADD CONSTRAINT sorular_pkey PRIMARY KEY ("soruId");


--
-- Name: topluluklar topluluklar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topluluklar
    ADD CONSTRAINT topluluklar_pkey PRIMARY KEY ("toplulukId");


--
-- Name: ulkeler ulkeler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulkeler
    ADD CONSTRAINT ulkeler_pkey PRIMARY KEY ("ulkeId");


--
-- Name: etiketler unique_etiketler_etiketAdId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiketler
    ADD CONSTRAINT "unique_etiketler_etiketAdId" UNIQUE ("etiketAdId");


--
-- Name: favoriSorular unique_favoriSorular_soruId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."favoriSorular"
    ADD CONSTRAINT "unique_favoriSorular_soruId" UNIQUE ("soruId");


--
-- Name: itibar unique_itibar_kullaniciId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itibar
    ADD CONSTRAINT "unique_itibar_kullaniciId" UNIQUE ("kullaniciId");


--
-- Name: moderator unique_moderator_toplulukId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderator
    ADD CONSTRAINT "unique_moderator_toplulukId" UNIQUE ("toplulukId");


--
-- Name: oduller unique_oduller_cevapId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oduller
    ADD CONSTRAINT "unique_oduller_cevapId" UNIQUE ("cevapId");


--
-- Name: topluluklar unique_topluluklar_kullaniciId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topluluklar
    ADD CONSTRAINT "unique_topluluklar_kullaniciId" UNIQUE ("kullaniciId");


--
-- Name: yorumlar yorumlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yorumlar
    ADD CONSTRAINT yorumlar_pkey PRIMARY KEY ("yorumId");


--
-- Name: oduller lnk_cevaplar_oduller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oduller
    ADD CONSTRAINT lnk_cevaplar_oduller FOREIGN KEY ("cevapId") REFERENCES public.cevaplar("cevapId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oyCevap lnk_cevaplar_oyCevap; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."oyCevap"
    ADD CONSTRAINT "lnk_cevaplar_oyCevap" FOREIGN KEY ("cevapId") REFERENCES public.cevaplar("cevapId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rozetler lnk_cevaplar_rozetler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rozetler
    ADD CONSTRAINT lnk_cevaplar_rozetler FOREIGN KEY ("cevapId") REFERENCES public.cevaplar("cevapId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: etiketler lnk_etiketAd_etiketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiketler
    ADD CONSTRAINT "lnk_etiketAd_etiketler" FOREIGN KEY ("etiketAdId") REFERENCES public."etiketAd"("etiketAdId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cevaplar lnk_kullanicilar_cevaplar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cevaplar
    ADD CONSTRAINT lnk_kullanicilar_cevaplar FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: editor lnk_kullanicilar_editor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editor
    ADD CONSTRAINT lnk_kullanicilar_editor FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: favoriSorular lnk_kullanicilar_favoriSorular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."favoriSorular"
    ADD CONSTRAINT "lnk_kullanicilar_favoriSorular" FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: itibar lnk_kullanicilar_itibar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itibar
    ADD CONSTRAINT lnk_kullanicilar_itibar FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kullaniciRozet lnk_kullanicilar_kullaniciRozet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kullaniciRozet"
    ADD CONSTRAINT "lnk_kullanicilar_kullaniciRozet" FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: moderator lnk_kullanicilar_moderator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderator
    ADD CONSTRAINT lnk_kullanicilar_moderator FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oduller lnk_kullanicilar_oduller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oduller
    ADD CONSTRAINT lnk_kullanicilar_oduller FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oyKullananlar lnk_kullanicilar_oyKullananlar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."oyKullananlar"
    ADD CONSTRAINT "lnk_kullanicilar_oyKullananlar" FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sorular lnk_kullanicilar_sorular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sorular
    ADD CONSTRAINT lnk_kullanicilar_sorular FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: topluluklar lnk_kullanicilar_topluluklar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topluluklar
    ADD CONSTRAINT lnk_kullanicilar_topluluklar FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: yorumlar lnk_kullanicilar_yorumlar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yorumlar
    ADD CONSTRAINT lnk_kullanicilar_yorumlar FOREIGN KEY ("kullaniciId") REFERENCES public.kullanicilar("kullaniciId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oyCevap lnk_oyKullananlar_oyCevap; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."oyCevap"
    ADD CONSTRAINT "lnk_oyKullananlar_oyCevap" FOREIGN KEY ("oyId") REFERENCES public."oyKullananlar"("oyKullananId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kullaniciRozet lnk_rozetler_kullaniciRozet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."kullaniciRozet"
    ADD CONSTRAINT "lnk_rozetler_kullaniciRozet" FOREIGN KEY ("rozetId") REFERENCES public.rozetler("rozetId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cevaplanmamisSoru lnk_sorular_cevaplanmamisSoru; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cevaplanmamisSoru"
    ADD CONSTRAINT "lnk_sorular_cevaplanmamisSoru" FOREIGN KEY ("soruId") REFERENCES public.sorular("soruId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cevaplar lnk_sorular_cevaplar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cevaplar
    ADD CONSTRAINT lnk_sorular_cevaplar FOREIGN KEY ("soruId") REFERENCES public.sorular("soruId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: editor lnk_sorular_editor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editor
    ADD CONSTRAINT lnk_sorular_editor FOREIGN KEY ("soruId") REFERENCES public.sorular("soruId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: etiketler lnk_sorular_etiketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiketler
    ADD CONSTRAINT lnk_sorular_etiketler FOREIGN KEY ("soruId") REFERENCES public.sorular("soruId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: favoriSorular lnk_sorular_favoriSorular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."favoriSorular"
    ADD CONSTRAINT "lnk_sorular_favoriSorular" FOREIGN KEY ("soruId") REFERENCES public.sorular("soruId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: yorumlar lnk_sorular_yorumlar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yorumlar
    ADD CONSTRAINT lnk_sorular_yorumlar FOREIGN KEY ("soruId") REFERENCES public.sorular("soruId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: moderator lnk_topluluklar_moderator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderator
    ADD CONSTRAINT lnk_topluluklar_moderator FOREIGN KEY ("toplulukId") REFERENCES public.topluluklar("toplulukId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kullanicilar lnk_ulkeler_kullanicilar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT lnk_ulkeler_kullanicilar FOREIGN KEY ("ulkeId") REFERENCES public.ulkeler("ulkeId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

