--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "character" (
    character_id integer NOT NULL,
    character_name text NOT NULL,
    base_health integer NOT NULL,
    base_attack integer NOT NULL,
    base_defense integer NOT NULL,
    base_sp_attack integer NOT NULL,
    base_sp_defense integer NOT NULL,
    element text NOT NULL
);


ALTER TABLE "character" OWNER TO postgres;

--
-- Name: leaderboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE leaderboard (
    player_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE leaderboard OWNER TO postgres;

--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE player (
    player_id integer NOT NULL,
    player_name text NOT NULL
);


ALTER TABLE player OWNER TO postgres;

--
-- Name: playercharacter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE playercharacter (
    player_id integer NOT NULL,
    character_id integer NOT NULL,
    health_points integer NOT NULL,
    attack_points integer NOT NULL,
    defense_points integer NOT NULL,
    sp_attack_points integer NOT NULL,
    sp_defense_points integer NOT NULL
);


ALTER TABLE playercharacter OWNER TO postgres;

--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team (
    player_id integer NOT NULL,
    character_id_1 integer,
    character_id_2 integer,
    character_id_3 integer
);


ALTER TABLE team OWNER TO postgres;

--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "character" VALUES (9, 'jinx', 150, 50, 25, 75, 50, 'air');
INSERT INTO "character" VALUES (10, 'krell', 100, 25, 25, 100, 50, 'spirit');
INSERT INTO "character" VALUES (11, 'logan', 100, 50, 25, 75, 75, 'water');
INSERT INTO "character" VALUES (1, 'dep', 100, 25, 50, 75, 100, 'fire');
INSERT INTO "character" VALUES (7, 'fergus', 150, 25, 50, 50, 75, 'air');
INSERT INTO "character" VALUES (2, 'yimbo', 300, 50, 50, 75, 75, 'fire');
INSERT INTO "character" VALUES (13, 'blue', 150, 50, 25, 75, 50, 'water');
INSERT INTO "character" VALUES (3, 'peg', 150, 50, 25, 75, 50, 'fire');
INSERT INTO "character" VALUES (12, 'tigo', 200, 50, 25, 75, 50, 'water');
INSERT INTO "character" VALUES (5, 'rex', 150, 25, 25, 75, 50, 'earth');
INSERT INTO "character" VALUES (4, 'barus', 150, 25, 50, 75, 75, 'earth');
INSERT INTO "character" VALUES (8, 'kigo', 150, 50, 50, 75, 75, 'air');
INSERT INTO "character" VALUES (6, 'jax', 200, 75, 25, 100, 50, 'earth');


--
-- Data for Name: leaderboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO leaderboard VALUES (1, 500);
INSERT INTO leaderboard VALUES (2, 25);
INSERT INTO leaderboard VALUES (3, 300);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO player VALUES (2, 'boquetes');
INSERT INTO player VALUES (1, 'srMontes');
INSERT INTO player VALUES (3, 'jaramiYolo');


--
-- Data for Name: playercharacter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO playercharacter VALUES (2, 2, 300, 50, 50, 75, 75);
INSERT INTO playercharacter VALUES (1, 8, 150, 50, 50, 75, 50);
INSERT INTO playercharacter VALUES (2, 12, 200, 50, 25, 96, 90);
INSERT INTO playercharacter VALUES (2, 6, 200, 75, 25, 65, 50);
INSERT INTO playercharacter VALUES (1, 10, 100, 25, 25, 88, 50);
INSERT INTO playercharacter VALUES (1, 11, 100, 45, 35, 75, 85);
INSERT INTO playercharacter VALUES (1, 1, 100, 31, 50, 75, 100);
INSERT INTO playercharacter VALUES (1, 5, 150, 25, 25, 75, 50);
INSERT INTO playercharacter VALUES (1, 4, 150, 25, 50, 75, 75);
INSERT INTO playercharacter VALUES (3, 1, 100, 25, 50, 75, 100);
INSERT INTO playercharacter VALUES (3, 9, 150, 50, 25, 75, 50);
INSERT INTO playercharacter VALUES (3, 3, 150, 50, 25, 75, 50);
INSERT INTO playercharacter VALUES (3, 12, 200, 50, 25, 75, 50);


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO team VALUES (1, 1, 10, 11);
INSERT INTO team VALUES (2, 2, 6, 12);
INSERT INTO team VALUES (3, 1, 3, 9);


--
-- Name: character Character_character_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT "Character_character_id_key" UNIQUE (character_id);


--
-- Name: character Character_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT "Character_pkey" PRIMARY KEY (character_id);


--
-- Name: leaderboard Leaderboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leaderboard
    ADD CONSTRAINT "Leaderboard_pkey" PRIMARY KEY (player_id);


--
-- Name: leaderboard Leaderboard_player_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leaderboard
    ADD CONSTRAINT "Leaderboard_player_id_key" UNIQUE (player_id);


--
-- Name: playercharacter PlayerCharacter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY playercharacter
    ADD CONSTRAINT "PlayerCharacter_pkey" PRIMARY KEY (player_id, character_id);


--
-- Name: player Player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY player
    ADD CONSTRAINT "Player_pkey" PRIMARY KEY (player_id);


--
-- Name: player Player_player_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY player
    ADD CONSTRAINT "Player_player_id_key" UNIQUE (player_id);


--
-- Name: team Team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT "Team_pkey" PRIMARY KEY (player_id);


--
-- Name: team team_player_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_player_id_key UNIQUE (player_id);


--
-- Name: index_attack_points; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attack_points ON playercharacter USING btree (attack_points);


--
-- Name: index_base_attack; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_base_attack ON "character" USING btree (base_attack);


--
-- Name: index_base_defense; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_base_defense ON "character" USING btree (base_defense);


--
-- Name: index_base_health; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_base_health ON "character" USING btree (base_health);


--
-- Name: index_base_sp_attack; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_base_sp_attack ON "character" USING btree (base_sp_attack);


--
-- Name: index_base_sp_defense; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_base_sp_defense ON "character" USING btree (base_sp_defense);


--
-- Name: index_character_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_character_id ON playercharacter USING btree (character_id);


--
-- Name: index_character_id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_character_id1 ON "character" USING btree (character_id);


--
-- Name: index_character_id_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_character_id_1 ON team USING btree (character_id_1);


--
-- Name: index_character_id_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_character_id_2 ON team USING btree (character_id_2);


--
-- Name: index_character_id_3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_character_id_3 ON team USING btree (character_id_3);


--
-- Name: index_character_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_character_name ON "character" USING btree (character_name);


--
-- Name: index_defense_points; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_defense_points ON playercharacter USING btree (defense_points);


--
-- Name: index_element; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_element ON "character" USING btree (element);


--
-- Name: index_health_points; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_health_points ON playercharacter USING btree (health_points);


--
-- Name: index_player_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_player_id ON player USING btree (player_id);


--
-- Name: index_player_id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_player_id1 ON leaderboard USING btree (player_id);


--
-- Name: index_player_id2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_player_id2 ON playercharacter USING btree (player_id);


--
-- Name: index_player_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_player_name ON player USING btree (player_name);


--
-- Name: index_score; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_score ON leaderboard USING btree (score);


--
-- Name: index_sp_attack_points; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sp_attack_points ON playercharacter USING btree (sp_attack_points);


--
-- Name: index_sp_defense_points; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sp_defense_points ON playercharacter USING btree (sp_defense_points);


--
-- Name: playercharacter lnk_Character_PlayerCharacter; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY playercharacter
    ADD CONSTRAINT "lnk_Character_PlayerCharacter" FOREIGN KEY (character_id) REFERENCES "character"(character_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: team lnk_Character_Team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT "lnk_Character_Team" FOREIGN KEY (character_id_1) REFERENCES "character"(character_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: team lnk_Character_Team_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT "lnk_Character_Team_2" FOREIGN KEY (character_id_2) REFERENCES "character"(character_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: team lnk_Character_Team_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT "lnk_Character_Team_3" FOREIGN KEY (character_id_3) REFERENCES "character"(character_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: leaderboard lnk_Player_Leaderboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leaderboard
    ADD CONSTRAINT "lnk_Player_Leaderboard" FOREIGN KEY (player_id) REFERENCES player(player_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: playercharacter lnk_Player_PlayerCharacter; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY playercharacter
    ADD CONSTRAINT "lnk_Player_PlayerCharacter" FOREIGN KEY (player_id) REFERENCES player(player_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: team lnk_Player_Team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT "lnk_Player_Team" FOREIGN KEY (player_id) REFERENCES player(player_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

