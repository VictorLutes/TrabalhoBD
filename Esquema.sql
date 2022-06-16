CREATE TABLE Usuario (
   email VARCHAR2(20),
   nome VARCHAR2(20) NOT NULL,
   senha VARCHAR2(20) NOT NULL,
   CONSTRAINT pk_usuario PRIMARY KEY(email),
   CONSTRAINT fk_usuario FOREIGN KEY(pais) REFERENCES Pais(nome)
);

CREATE TABLE MarcaParaAssistir (
   usuario VARCHAR2(20),
   midia NUMBER(4),
   CONSTRAINT pk_marcaparaassistir PRIMARY KEY(usuario, midia),
   CONSTRAINT fk_marcaparaassistir1 FOREIGN KEY(usuario) REFERENCES Usuario(nome),
   CONSTRAINT fk_marcaparaassistir2 FOREIGN KEY(midia) REFERENCES Midia(id)
);

CREATE TABLE Visto (
   midiaLicenciada NUMBER(4),
   usuario VARCHAR2(20),
   data DATE, 
   minuto NUMBER(4),
   CONSTRAINT pk_visto PRIMARY KEY(midiaLicenciada, usuario, data),
   CONSTRAINT fk_visto1 FOREIGN KEY(midiaLicenciada) REFERENCES MidiaLicenciada(id),
   CONSTRAINT fk_visto2 FOREIGN KEY(usuario) REFERENCES Usuario(nome),
   CONSTRAINT ck_minuto CHECK(minuto>0 and minuto<1200)
);

CREATE TABLE Pais (
   nome VARCHAR2(20),
   CONSTRAINT pk_pais PRIMARY KEY(pais)
);

CREATE TABLE EstaEm (
   usuario VARCHAR2(20),
   pais VARCHAR2(20),
   CONSTRAINT pk_estaem PRIMARY KEY(usuario, pais),
   CONSTRAINT fk_estaem FOREIGN KEY(usuario) REFERENCES Usuario(email),
   CONSTRAINT fk_estaem FOREIGN KEY(pais) REFERENCES Pais(nome),
);

CREATE TABLE Utiliza (
   usuario VARCHAR2(20),
   vpn VARCHAR2(20),
   CONSTRAINT pk_utiliza PRIMARY KEY(usuario, vpn),
   CONSTRAINT fk_utiliza FOREIGN KEY(vpn) REFERENCES VPN(vpn)
);

CREATE TABLE Assina (
   usuario VARCHAR2(20),
   streaming VARCHAR2(20),
   CONSTRAINT pk_assina PRIMARY KEY(usuario, streaming),
   CONSTRAINT fk_assina FOREIGN KEY(streaming) REFERENCES Streaming(nome)
);

CREATE TABLE Determina (
   vpn VARCHAR2(20),
   pais VARCHAR2(20),
   CONSTRAINT pk_determina PRIMARY KEY(vpn, pais),
   CONSTRAINT fk_determina1 FOREIGN KEY(vpn) REFERENCES VPN(nome),
   CONSTRAINT fk_determina2 FOREIGN KEY(pais) REFERENCES Pais(nome)
);

CREATE TABLE VPN (
   nome VARCHAR2(20),
   preco NUMBER(4),
   CONSTRAINT pk_vpn PRIMARY KEY(nome)
);

CREATE TABLE Streaming (
   nome VARCHAR2(20),
   preco NUMBER(4),
   CONSTRAINT pk_streaming PRIMARY KEY(nome)
);

CREATE TABLE MidiaLicenciada (
   id NUMBER(4),
   midia VARCHAR2(20) NOT NULL,
   streaming VARCHAR2(20) NOT NULL,
   pais VARCHAR2(20) NOT NULL,
   CONSTRAINT pk_midialicenciada PRIMARY KEY(id),
   CONSTRAINT sk_midia UNIQUE(midia, streaming, pais),
   CONSTRAINT fk_midialicenciada1 FOREIGN KEY(midia) REFERENCES Midia(id),
   CONSTRAINT fk_midialicenciada2 FOREIGN KEY(streaming) REFERENCES Streaming(nome),
   CONSTRAINT fk_midialicenciada3 FOREIGN KEY(pais) REFERENCES Pais(nome)
);

CREATE TABLE Midia (
   id NUMBER(4),
   titulo VARCHAR2(20) NOT NULL,
   diretor VARCHAR2(20) NOT NULL,
   data DATE, 
   descricao VARCHAR2(100),
   tituloEstrangeiro VARCHAR2(20),
   tipo VARCHAR2(5),
   CONSTRAINT pk_midia PRIMARY KEY(id),
   CONSTRAINT sk_midia UNIQUE(titulo, diretor),
   CONSTRAINT ck_tipo CHECK(UPPER(tipo) IN ('SERIE', 'FILME')),
);

CREATE TABLE Photo (
   midia NUMBER(4),
   enderecoPhoto VARCHAR2(20),
   CONSTRAINT pk_photo PRIMARY KEY(midia, enderecoPhoto),
   CONSTRAINT fk_photo FOREIGN KEY(midia) REFERENCES Midia(id),
);

CREATE TABLE Genero (
   midia NUMBER(4),
   nomeGenero VARCHAR2(20),
   CONSTRAINT pk_genero PRIMARY KEY(midia, nomeGenero),
   CONSTRAINT fk_genero FOREIGN KEY(midia) REFERENCES Midia(id),
);

CREATE TABLE Filme (
   id NUMBER(4),
   duracao NUMBER(3),
   CONSTRAINT pk_filme PRIMARY KEY(id),
   CONSTRAINT fk_filme FOREIGN KEY(id) REFERENCES Midia(id),
);

CREATE TABLE ElencoFilme (
   filme NUMBER(4),
   nome NUMBER(3),
   CONSTRAINT pk_filme PRIMARY KEY(filme, nome),
   CONSTRAINT fk_filme FOREIGN KEY(filme) REFERENCES Filme(id),
);

CREATE TABLE DubLegFilme (
   filme NUMBER(4),
   linguagem NUMBER(3),
   CONSTRAINT pk_filme PRIMARY KEY(filme, linguagem),
   CONSTRAINT fk_filme FOREIGN KEY(filme) REFERENCES Filme(id),
);

CREATE TABLE Serie (
   id NUMBER(4),
   nroTemporadas NUMBER(2),
   nroEps NUMBER(3),
   CONSTRAINT pk_serie PRIMARY KEY(id),
   CONSTRAINT fk_serie FOREIGN KEY(id) REFERENCES Midia(id),
);

CREATE TABLE Episodio (
   serie NUMBER(4),
   nroTemp NUMBER(2),
   nroEp NUMBER(3),
   duracao NUMBER(3),
   CONSTRAINT pk_episodio PRIMARY KEY(serie, nroTemp, nroEp),
   CONSTRAINT fk_episodio FOREIGN KEY(serie) REFERENCES Serie(id),
);

CREATE TABLE ElencoEpisodio (
   serie NUMBER(4),
   nroTemp NUMBER(2),
   nroEp NUMBER(3),
   nome NUMBER(3),
   CONSTRAINT pk_episodio PRIMARY KEY(serie, nroTemp, nroEp, nome),
   CONSTRAINT fk_episodio FOREIGN KEY(serie, nroTemp, nroEp) REFERENCES Episodio(serie, nroTemp, nroEp),
);

CREATE TABLE DubLegEpisodio (
   serie NUMBER(4),
   nroTemp NUMBER(2),
   nroEp NUMBER(3),
   linguagem NUMBER(3),
   CONSTRAINT pk_episodio PRIMARY KEY(serie, nroTemp, nroEp, linguagem),
   CONSTRAINT fk_episodio FOREIGN KEY(serie, nroTemp, nroEp) REFERENCES Episodio(serie, nroTemp, nroEp),
);

/*
CREATE TABLE TIME (
   NOME VARCHAR2(20) NOT NULL,
   ESTADO CHAR(2),
   TIPO VARCHAR2(12),
   SALDO_GOLS NUMBER(4),
   CONSTRAINT PK_TIME PRIMARY KEY(NOME),
   CONSTRAINT CK_TIPO CHECK(UPPER(TIPO) IN ('AMADOR', 'PROFISSIONAL'))
);


CREATE TABLE JOGA (
   TIME1 VARCHAR2(20) NOT NULL,
   TIME2 VARCHAR2(20) NOT NULL,
   CLASSICO CHAR(1),
   CONSTRAINT PK_JOGA PRIMARY KEY(TIME1,TIME2),
   CONSTRAINT FK_TIME1 FOREIGN KEY(TIME1) REFERENCES TIME(NOME) ON DELETE CASCADE,
   CONSTRAINT FK_TIME2 FOREIGN KEY(TIME2) REFERENCES TIME(NOME) ON DELETE CASCADE,
CONSTRAINT CK_TIMES CHECK(UPPER(TIME1)!= UPPER(TIME2)),
CONSTRAINT CK_CLASSICO CHECK(UPPER(CLASSICO) IN('S','N'))
 );

CREATE TABLE PARTIDA (
   TIME1 VARCHAR2(20) NOT NULL,
   TIME2 VARCHAR2(20) NOT NULL,
   DATA DATE NOT NULL,
   PLACAR VARCHAR2(5) DEFAULT '0X0',
   LOCAL VARCHAR2(15),
   CONSTRAINT PK_PARTIDA PRIMARY KEY(TIME1,TIME2,DATA),
   CONSTRAINT FK_TIMES_PARTIDA FOREIGN KEY(TIME1, TIME2) REFERENCES JOGA(TIME1, TIME2) ON DELETE CASCADE,
   CONSTRAINT CK_PLACAR CHECK(REGEXP_LIKE(PLACAR,'[[:digit:]]{1,2}\X[[:digit:]]{1,2}', 'i' ))
);

CREATE TABLE JOGADOR (
   CPF CHAR(14) NOT NULL,
   RG VARCHAR2(20) NOT NULL,
   NOME VARCHAR2(40) NOT NULL,
   DATA_NASC DATE,
   NATURALIDADE VARCHAR2(15),
   TIME VARCHAR2(20) NOT NULL,
   CONSTRAINT PK_JOGADOR PRIMARY KEY(CPF),
   CONSTRAINT FK_TIME_JOGADOR FOREIGN KEY(TIME) REFERENCES TIME(NOME) ON DELETE CASCADE,
   CONSTRAINT UN_JOGADOR UNIQUE(RG, NOME), 
   CONSTRAINT CK_CPF CHECK(REGEXP_LIKE(CPF, '[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}'))
);

CREATE TABLE POSICAO_JOGADOR (
   JOGADOR CHAR(14)NOT NULL,
   POSICAO VARCHAR2(10) NOT NULL,
   CONSTRAINT PK_POSICAO_JOGADOR PRIMARY KEY(JOGADOR, POSICAO),
   CONSTRAINT FK_POSICAO_JOGADOR FOREIGN KEY(JOGADOR) REFERENCES JOGADOR(CPF) ON DELETE CASCADE
);

CREATE TABLE DIRETOR (
   TIME VARCHAR2(20) NOT NULL,
   NOME VARCHAR2(20) NOT NULL,
   CONSTRAINT PK_DIRETOR PRIMARY KEY(TIME, NOME),
   CONSTRAINT FK_DIRETOR FOREIGN KEY(TIME) REFERENCES TIME(NOME) ON DELETE CASCADE
);

CREATE TABLE UNIFORME (
   TIME VARCHAR2(20) NOT NULL,
   TIPO CHAR(7) NOT NULL,
   COR_PRINCIPAL VARCHAR2(10),
   CONSTRAINT PK_UNIFORME PRIMARY KEY(TIME, TIPO),
   CONSTRAINT FK_UNIFORME FOREIGN KEY(TIME) REFERENCES TIME(NOME) ON DELETE CASCADE,
   CONSTRAINT CK_UNIFORME CHECK(UPPER(TIPO) IN('TITULAR', 'RESERVA'))
);
*/