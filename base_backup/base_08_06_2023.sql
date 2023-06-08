--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-08 18:13:02

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
-- TOC entry 216 (class 1259 OID 16411)
-- Name: SequenceGroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequenceGroup" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text DEFAULT ''::text NOT NULL
);


ALTER TABLE public."SequenceGroup" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16404)
-- Name: Sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sequences" (
    "Id" uuid NOT NULL,
    "Text" text NOT NULL,
    "Description" text NOT NULL,
    "SequenceGroupId" uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);


ALTER TABLE public."Sequences" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16425)
-- Name: UserSequenceProgress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserSequenceProgress" (
    "Id" uuid NOT NULL,
    "SequenseId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "StartTime" timestamp with time zone NOT NULL,
    "LastUpdateTime" timestamp with time zone,
    "LastSuccessTime" timestamp with time zone,
    "Stage" integer NOT NULL
);


ALTER TABLE public."UserSequenceProgress" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16418)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 16411)
-- Dependencies: 216
-- Data for Name: SequenceGroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequenceGroup" ("Id", "Name", "Description") FROM stdin;
448170a1-cba5-4fec-8481-2d2c0780485c	Test1	Тестовая группа 1
\.


--
-- TOC entry 3349 (class 0 OID 16404)
-- Dependencies: 215
-- Data for Name: Sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sequences" ("Id", "Text", "Description", "SequenceGroupId") FROM stdin;
1a089c86-8b69-45f3-bb22-5ecbba9907cf	i would like to	Фраза "I would like to" - это вежливый способ выразить желание или намерение сделать что-либо. Она часто используется в общении, особенно в ситуациях, требующих вежливости или формальности. Смысл этой фразы аналогичен простому "Я хочу", но звучит более вежливо и респектабельно.\n\nПримеры использования:\n\n"I would like to order a pizza" (Я бы хотел заказать пиццу) - в ресторане или при заказе еды на вынос.\n"I would like to book a room for two" (Я бы хотел забронировать номер на двоих) - при бронировании отеля.\n"I would like to make an appointment with the doctor" (Я бы хотела записаться на прием к врачу) - при обращении в медицинское учреждение.\n"I would like to visit Paris one day" (Однажды я бы хотел посетить Париж) - при выражении желаний или мечтаний.\nЭтот оборот не только делает ваше высказывание более вежливым, но и может смягчить просьбу или предложение, делая его менее навязчивым.	448170a1-cba5-4fec-8481-2d2c0780485c
d1795f38-b545-435d-abe8-d0bec34e6582	which is the best	Фраза "which is the best" используется для задания вопросов, когда человек хочет узнать наилучший вариант из предложенных или существующих. Структура обычно используется в контексте, где доступно множество опций и требуется помощь или мнение, чтобы определить наиболее предпочтительный вариант.\n\nПримеры использования:\n\n"Which is the best restaurant in town?" (Какой ресторан в городе лучший?) - Когда вы хотите узнать, в каком ресторане лучше всего поесть.\n"Which is the best way to learn a new language?" (Какой лучший способ изучения нового языка?) - Когда вы хотите узнать самый эффективный метод изучения языка.\n"Which is the best laptop for graphic design?" (Какой лучший ноутбук для графического дизайна?) - Когда вы хотите узнать, какой ноутбук лучше всего подходит для работы с графическим дизайном.\nТаким образом, "which is the best" - это запрос на совет или информацию, помогающий вам принять решение. Это может быть особенно полезно в ситуациях, где есть много возможных выборов, и нужно определиться с лучшим вариантом.	448170a1-cba5-4fec-8481-2d2c0780485c
01bbe6cb-b30b-4876-8de8-1d655efe363f	thank you for	Фраза "thank you for" используется для выражения благодарности за конкретное действие, событие или вещь. Это вежливый способ признания чьего-то усилия, доброты, помощи или вклада. Этот оборот помогает создать позитивную атмосферу общения и демонстрирует уважение к другому человеку.\n\nПримеры использования:\n\n"Thank you for your help" (Спасибо за вашу помощь) - выражение благодарности за помощь.\n"Thank you for the lovely gift" (Спасибо за прекрасный подарок) - благодарность за подарок.\n"Thank you for taking the time to meet with me" (Спасибо за то, что нашли время, чтобы встретиться со мной) - благодарность за время, уделенное вам.\n"Thank you for your understanding" (Спасибо за ваше понимание) - выражение благодарности за терпимость и понимание.\nС помощью этого оборота можно выразить свою благодарность более конкретно и ясно, указав, за что именно вы благодарны. Это делает вашу благодарность более искренней и значимой для того, кто ее получает.	448170a1-cba5-4fec-8481-2d2c0780485c
ecc83e29-6283-4bac-b9cd-2d8acf19ed0b	at the end of	Фраза "at the end of" используется для обозначения окончания определенного периода времени, места или объекта. Этот паттерн обычно указывает на конечную точку чего-либо в пространственном, временном или абстрактном смысле.\n\nПримеры использования:\n\n"At the end of the street, you'll see a blue house" (В конце улицы вы увидите синий дом) - для обозначения местоположения в пространстве.\n"At the end of the day, the most important thing is to be happy" (В конце концов, самое важное - быть счастливым) - фигуральное выражение, означающее в итоге, в конечном итоге.\n"At the end of the month, we usually have a team meeting" (В конце месяца у нас обычно проходит собрание команды) - для обозначения временного периода.\n"At the end of the book, the hero finally finds his true love" (В конце книги герой, наконец, находит свою настоящую любовь) - обозначение окончания некоторого объекта, здесь - книги.\nТаким образом, этот паттерн широко используется в разных контекстах и имеет достаточно гибкое применение.	448170a1-cba5-4fec-8481-2d2c0780485c
ffec10ec-d604-434c-be6b-2002494a0f67	have you ever	Фраза "have you ever" используется для задания вопросов о прошлом опыте. Это оборот, используемый в вопросах, где необходимо узнать, имел ли кто-либо опыт в каком-либо действии или событии хотя бы один раз в своей жизни. Этот оборот обычно используется с глаголом в форме причастия прошедшего времени.\n\nПримеры использования:\n\n"Have you ever been to France?" (Вы когда-нибудь были во Франции?) - вопрос о путешествии.\n"Have you ever eaten sushi?" (Вы когда-нибудь ели суши?) - вопрос о кулинарном опыте.\n"Have you ever seen a bear?" (Вы когда-нибудь видели медведя?) - вопрос о непосредственном опыте.\n"Have you ever run a marathon?" (Вы когда-нибудь бежали марафон?) - вопрос о физическом опыте или достижении.\nЭтот оборот используется для обсуждения или получения информации о чьем-то прошлом опыте, что может быть полезно во многих контекстах, будь то общение, интервью, анкетирование или исследование.	448170a1-cba5-4fec-8481-2d2c0780485c
\.


--
-- TOC entry 3352 (class 0 OID 16425)
-- Dependencies: 218
-- Data for Name: UserSequenceProgress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserSequenceProgress" ("Id", "SequenseId", "UserId", "StartTime", "LastUpdateTime", "LastSuccessTime", "Stage") FROM stdin;
\.


--
-- TOC entry 3351 (class 0 OID 16418)
-- Dependencies: 217
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" ("Id", "Name") FROM stdin;
\.


--
-- TOC entry 3348 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20230608130925_m1	7.0.5
20230608144859_m2	7.0.5
20230608145425_m3	7.0.5
\.


--
-- TOC entry 3196 (class 2606 OID 16417)
-- Name: SequenceGroup PK_SequenceGroup; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequenceGroup"
    ADD CONSTRAINT "PK_SequenceGroup" PRIMARY KEY ("Id");


--
-- TOC entry 3194 (class 2606 OID 16446)
-- Name: Sequences PK_Sequences; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "PK_Sequences" PRIMARY KEY ("Id");


--
-- TOC entry 3202 (class 2606 OID 16429)
-- Name: UserSequenceProgress PK_UserSequenceProgress; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "PK_UserSequenceProgress" PRIMARY KEY ("Id");


--
-- TOC entry 3198 (class 2606 OID 16444)
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- TOC entry 3191 (class 2606 OID 16403)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 3192 (class 1259 OID 16458)
-- Name: IX_Sequences_SequenceGroupId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Sequences_SequenceGroupId" ON public."Sequences" USING btree ("SequenceGroupId");


--
-- TOC entry 3199 (class 1259 OID 16440)
-- Name: IX_UserSequenceProgress_SequenseId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserSequenceProgress_SequenseId" ON public."UserSequenceProgress" USING btree ("SequenseId");


--
-- TOC entry 3200 (class 1259 OID 16441)
-- Name: IX_UserSequenceProgress_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserSequenceProgress_UserId" ON public."UserSequenceProgress" USING btree ("UserId");


--
-- TOC entry 3203 (class 2606 OID 16459)
-- Name: Sequences FK_Sequences_SequenceGroup_SequenceGroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId" FOREIGN KEY ("SequenceGroupId") REFERENCES public."SequenceGroup"("Id") ON DELETE CASCADE;


--
-- TOC entry 3204 (class 2606 OID 16447)
-- Name: UserSequenceProgress FK_UserSequenceProgress_Sequences_SequenseId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenseId" FOREIGN KEY ("SequenseId") REFERENCES public."Sequences"("Id") ON DELETE CASCADE;


--
-- TOC entry 3205 (class 2606 OID 16452)
-- Name: UserSequenceProgress FK_UserSequenceProgress_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


-- Completed on 2023-06-08 18:13:02

--
-- PostgreSQL database dump complete
--

