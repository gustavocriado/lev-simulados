CREATE DATABASE LEV_DB;


USE LEV_DB;


CREATE TABLE PESSOA(
	ID_PESSOA INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	NM_PESSOA VARCHAR(60),
	EMAIL_PESSOA VARCHAR(50),
	TEL_PESSOA VARCHAR(11),
	ESCOLARIDADE_PESSOA VARCHAR(30),
	CIDADE_PESSOA VARCHAR(30),
	TIPO_PESSOA VARCHAR(30),
	DATA_CADASTRO DATETIME);


CREATE TABLE CADERNO(
	ID_CADERNO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	ID_PESSOA INT,
	NM_CADERNO VARCHAR(30),
	CRONOMETRO_CADERNO TIME); 

	
CREATE TABLE ASSUNTO(
	ID_ASSUNTO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	ID_MATERIA INT,
	NM_ASSUNTO VARCHAR(30),
	DSCR_ASSUNTO VARCHAR(150),
	STATUS_ASSUNTO VARCHAR(15),
	DATA_CADASTRO DATETIME); -- OBS EXPLICAR DPS

	
CREATE TABLE QUESTAO(
	ID_QUESTAO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	ID_ASSUNTO INT,
	ID_COMPETENCIA INT,
	ID_DIFICULDADE INT,
	ANO_QUESTAO INT,
	SEMESTRE_QUESTAO VARCHAR(20),
	STATUS_QUESTAO VARCHAR(15),
	PERGUNTA_QUESTAO VARCHAR(2000),
	DATA_CADASTRO DATETIME);


CREATE TABLE CADERNO_QUESTAO(
	ID_CADERNO INT,
	ID_QUESTAO INT,
	RESPOSTA_QUESTAO VARCHAR(15));

		
CREATE TABLE COMENTARIO(
	ID_COMENTARIO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	ID_QUESTAO INT,
	ID_PESSOA INT,
	DSCR_COMENTARIO VARCHAR(2000),
	DT_COMENTARIO DATE); 


CREATE TABLE TIPO_COMPETENCIA(
	ID_COMPETENCIA INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	NM_COMPETENCIA VARCHAR(30),
	STATUS_COMPETENCIA VARCHAR(15),
	DATA_CADASTRO DATETIME);


CREATE TABLE MATERIA(
	ID_MATERIA INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	NM_MATERIA VARCHAR(30),
	STATUS_MATERIA VARCHAR(15),
	DATA_CADASTRO DATETIME);


CREATE TABLE DIFICULDADE_QUESTAO(
	ID_DIFICULDADE INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	NM_DIFICULDADE VARCHAR(30),
	STATUS_DIFICULDADE VARCHAR(15),
	DATA_CADASTRO DATETIME);


CREATE TABLE ALTERNATIVA_QUESTAO(
	ID_ALTERNATIVA INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	ID_QUESTAO INT,
	ALTERNATIVA1 VARCHAR(500),
	ALTERNATIVA2 VARCHAR(500),
	ALTERNATIVA3 VARCHAR(500),
	ALTERNATIVA4 VARCHAR(500),
	ALTERNATIVA5 VARCHAR(500));


ALTER TABLE CADERNO ADD CONSTRAINT ID_PESSOA_FK FOREIGN KEY
	(ID_PESSOA) REFERENCES PESSOA (ID_PESSOA);

	
ALTER TABLE QUESTAO ADD CONSTRAINT ID_ASSUNTO_FK FOREIGN KEY
	(ID_ASSUNTO) REFERENCES ASSUNTO (ID_ASSUNTO);


ALTER TABLE QUESTAO ADD CONSTRAINT ID_COMPETENCIA_FK FOREIGN KEY
	(ID_COMPETENCIA) REFERENCES TIPO_COMPETENCIA (ID_COMPETENCIA);


ALTER TABLE QUESTAO ADD CONSTRAINT ID_DIFICULDADE_FK FOREIGN KEY
	(ID_DIFICULDADE) REFERENCES DIFICULDADE_QUESTAO (ID_DIFICULDADE); 


ALTER TABLE CADERNO_QUESTAO ADD CONSTRAINT ID_CADERNO_FK FOREIGN KEY 
	(ID_CADERNO) REFERENCES CADERNO (ID_CADERNO);

	
ALTER TABLE CADERNO_QUESTAO ADD CONSTRAINT ID_QUESTAO_FK FOREIGN KEY
	(ID_QUESTAO) REFERENCES QUESTAO (ID_QUESTAO);

	
ALTER TABLE COMENTARIO ADD CONSTRAINT ID_FK_QUESTAO FOREIGN KEY
	(ID_QUESTAO) REFERENCES QUESTAO (ID_QUESTAO);

	
ALTER TABLE COMENTARIO ADD CONSTRAINT ID_FK_PESSOA FOREIGN KEY
	(ID_PESSOA) REFERENCES PESSOA (ID_PESSOA);


ALTER TABLE ASSUNTO ADD CONSTRAINT ID_MATERIA_FK FOREIGN KEY
	(ID_MATERIA) REFERENCES MATERIA (ID_MATERIA);


ALTER TABLE ALTERNATIVA_QUESTAO ADD CONSTRAINT ID_FK_QUESTAO_FK FOREIGN KEY
	(ID_QUESTAO) REFERENCES QUESTAO (ID_QUESTAO);