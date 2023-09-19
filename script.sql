DO $$
DECLARE
	cur_nomes_youtubers REFCURSOR;
	v_youtuber VARCHAR(200);
BEGIN
	OPEN cur_nomes_youtubers FOR
		SELECT youtuber
		FROM tb_top_youtubers;
	LOOP
		FETCH cur_nomes_youtubers INTO v_youtuber;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE 'Nome: %', v_youtuber;
	END LOOP;
	CLOSE cur_nomes_youtubers;
END;
$$

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