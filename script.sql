DO $$
DECLARE
	cur_delete REFCURSOR;
	tupla RECORD;
BEGIN
	OPEN cur_delete SCROLL FOR
		SELECT * FROM tb_top_youtubers;
END;
$$

-- DO $$
-- DECLARE
-- 	v_ano INT := 2010;
-- 	v_inscritos INT := 60000000;
-- 	v_youtuber VARCHAR(200);
-- 	cur_ano_inscritos CURSOR (ano INT, inscritos INT)
-- 	FOR SELECT youtuber FROM tb_top_youtubers WHERE started >= ano AND subscribers >= inscritos;
-- BEGIN
-- 	OPEN cur_ano_inscritos(v_ano, v_inscritos);
-- 	--ou: OPEN cur_ano_inscritos(inscritos := v_inscritos, ano := v_ano);
-- 	LOOP
-- 		FETCH cur_ano_inscritos INTO v_youtuber;
-- 		EXIT WHEN NOT FOUND;
-- 		RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- 	CLOSE cur_ano_inscritos;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	cur_nomes_e_inscritos CURSOR FOR SELECT youtuber, subscribers FROM tb_top_youtubers;
-- 	tupla RECORD;
-- 	resultado TEXT DEFAULT '';
-- BEGIN
-- 	OPEN cur_nomes_e_inscritos;
-- 	FETCH cur_nomes_e_inscritos INTO tupla;
-- 	WHILE FOUND LOOP
-- 		resultado := resultado || tupla.youtuber || ';' || tupla.subscribers || ',';
-- 		FETCH cur_nomes_e_inscritos INTO tupla;
-- 	END LOOP;
-- 	CLOSE cur_nomes_e_inscritos;
-- 	RAISE NOTICE '%', resultado;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	cur_nomes_a_partir_de REFCURSOR;
-- 	v_youtuber VARCHAR(200);
-- 	v_ano INT := 2008;
-- 	v_nome_tabela VARCHAR(200):= 'tb_top_youtubers';
-- BEGIN
-- 	OPEN cur_nomes_a_partir_de FOR EXECUTE
-- 	format
-- 	(
-- 	'
-- 		SELECT youtuber FROM %s WHERE started >= $1	
-- 	',
-- 		v_nome_tabela
-- 	)USING v_ano;
-- 	LOOP
-- 		FETCH cur_nomes_a_partir_de INTO v_youtuber;
-- 		EXIT WHEN NOT FOUND;
-- 		RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- 	CLOSE cur_nomes_a_partir_de;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	cur_nomes_youtubers REFCURSOR;
-- 	v_youtuber VARCHAR(200);
-- BEGIN
-- 	OPEN cur_nomes_youtubers FOR
-- 		SELECT youtuber
-- 		FROM tb_top_youtubers;
-- 	LOOP
-- 		FETCH cur_nomes_youtubers INTO v_youtuber;
-- 		EXIT WHEN NOT FOUND;
-- 		RAISE NOTICE 'Nome: %', v_youtuber;
-- 	END LOOP;
-- 	CLOSE cur_nomes_youtubers;
-- END;
-- $$

--SELECT * FROM tb_top_youtubers

-- CREATE TABLE tb_top_youtubers(
-- 	cod_top_youtubers SERIAL PRIMARY KEY,
-- 	rank INT,
-- 	youtuber varchar(200),
-- 	subscribers INT,
-- 	video_views VARCHAR(200),
-- 	video_count INT,
-- 	category VARCHAR(200),
-- 	started INT
-- );