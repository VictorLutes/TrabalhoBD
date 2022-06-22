CREATE TABLE VPN (
   nome VARCHAR2(30),
   preco NUMBER(4),
   CONSTRAINT pk_vpn PRIMARY KEY(nome)
);

CREATE TABLE Streaming (
   nome VARCHAR2(30),
   preco NUMBER(4),
   CONSTRAINT pk_streaming PRIMARY KEY(nome)
);

CREATE TABLE Pais (
   nome VARCHAR2(30),
   CONSTRAINT pk_pais PRIMARY KEY(nome)
);

CREATE TABLE Usuario (
   email VARCHAR2(30),
   nome VARCHAR2(30) NOT NULL,
   senha VARCHAR2(30) NOT NULL,
   CONSTRAINT pk_usuario PRIMARY KEY(email)
);

CREATE TABLE EstaEm (
   usuario VARCHAR2(30),
   pais VARCHAR2(30),
   CONSTRAINT pk_estaem PRIMARY KEY(usuario, pais),
   CONSTRAINT fk_estaem FOREIGN KEY(usuario) REFERENCES Usuario(email),
   CONSTRAINT fk_estaem2 FOREIGN KEY(pais) REFERENCES Pais(nome)
);


CREATE TABLE Utiliza (
   usuario VARCHAR2(30),
   vpn VARCHAR2(30),
   CONSTRAINT pk_utiliza PRIMARY KEY(usuario, vpn),
   CONSTRAINT fk_utiliza FOREIGN KEY(vpn) REFERENCES VPN(nome),
   CONSTRAINT fk_utiliza2 FOREIGN KEY(usuario) REFERENCES Usuario(email)
);


CREATE TABLE Assina (
   usuario VARCHAR2(30),
   streaming VARCHAR2(30),
   CONSTRAINT pk_assina PRIMARY KEY(usuario, streaming),
   CONSTRAINT fk_assina FOREIGN KEY(streaming) REFERENCES Streaming(nome)
);

CREATE TABLE Determina (
   vpn VARCHAR2(30),
   pais VARCHAR2(30),
   CONSTRAINT pk_determina PRIMARY KEY(vpn, pais),
   CONSTRAINT fk_determina1 FOREIGN KEY(vpn) REFERENCES VPN(nome),
   CONSTRAINT fk_determina2 FOREIGN KEY(pais) REFERENCES Pais(nome)
);

CREATE TABLE Midia (
   id NUMBER(4),
   titulo VARCHAR2(30) NOT NULL,
   diretor VARCHAR2(30) NOT NULL,
   data DATE, 
   descricao VARCHAR2(100),
   tituloEstrangeiro VARCHAR2(30),
   tipo VARCHAR2(5),
   CONSTRAINT pk_midia PRIMARY KEY(id),
   CONSTRAINT sk_midia UNIQUE(titulo, diretor),
   CONSTRAINT ck_tipo CHECK(UPPER(tipo) IN ('SERIE', 'FILME'))
);

CREATE TABLE Photo (
   midia NUMBER(4),
   enderecoPhoto VARCHAR2(30),
   CONSTRAINT pk_photo PRIMARY KEY(midia, enderecoPhoto),
   CONSTRAINT fk_photo FOREIGN KEY(midia) REFERENCES Midia(id)
);

CREATE TABLE Genero (
   midia NUMBER(4),
   nomeGenero VARCHAR2(30),
   CONSTRAINT pk_genero PRIMARY KEY(midia, nomeGenero),
   CONSTRAINT fk_genero FOREIGN KEY(midia) REFERENCES Midia(id)
);

CREATE TABLE MidiaLicenciada (
   id NUMBER(4),
   midia NUMBER(4) NOT NULL,
   streaming VARCHAR2(30) NOT NULL,
   pais VARCHAR2(30) NOT NULL,
   CONSTRAINT pk_midialicenciada PRIMARY KEY(id),
   CONSTRAINT sk_midialicenciada UNIQUE(midia, streaming, pais),
   CONSTRAINT fk_midialicenciada1 FOREIGN KEY(midia) REFERENCES Midia(id),
   CONSTRAINT fk_midialicenciada2 FOREIGN KEY(streaming) REFERENCES Streaming(nome),
   CONSTRAINT fk_midialicenciada3 FOREIGN KEY(pais) REFERENCES Pais(nome)
);



CREATE TABLE MarcaParaAssistir (
   usuario VARCHAR2(30),
   midia NUMBER(4),
   CONSTRAINT pk_marcaparaassistir PRIMARY KEY(usuario, midia),
   CONSTRAINT fk_marcaparaassistir1 FOREIGN KEY(usuario) REFERENCES Usuario(email),
   CONSTRAINT fk_marcaparaassistir2 FOREIGN KEY(midia) REFERENCES Midia(id)
);

CREATE TABLE Visto (
   midiaLicenciada NUMBER(4),
   usuario VARCHAR2(30),
   data DATE, 
   minuto NUMBER(4),
   CONSTRAINT pk_visto PRIMARY KEY(midiaLicenciada, usuario, data),
   CONSTRAINT fk_visto1 FOREIGN KEY(midiaLicenciada) REFERENCES MidiaLicenciada(id),
   CONSTRAINT fk_visto2 FOREIGN KEY(usuario) REFERENCES Usuario(email),
   CONSTRAINT ck_minuto CHECK(minuto>0 and minuto<1300)
);

CREATE TABLE Filme (
   id NUMBER(4),
   duracao NUMBER(3),
   CONSTRAINT pk_filme PRIMARY KEY(id),
   CONSTRAINT fk_filme FOREIGN KEY(id) REFERENCES Midia(id)
);

CREATE TABLE ElencoFilme (
   filme NUMBER(4),
   nome VARCHAR2(30),
   CONSTRAINT pk_elencofilme PRIMARY KEY(filme, nome),
   CONSTRAINT fk_elencofilme FOREIGN KEY(filme) REFERENCES Filme(id)
);

CREATE TABLE DubLegFilme (
   filme NUMBER(4),
   linguagem VARCHAR2(30),
   CONSTRAINT pk_dubfilme PRIMARY KEY(filme, linguagem),
   CONSTRAINT fk_dubfilme FOREIGN KEY(filme) REFERENCES Filme(id)
);

CREATE TABLE Serie (
   id NUMBER(4),
   nroTemporadas NUMBER(2),
   nroEps NUMBER(3),
   CONSTRAINT pk_serie PRIMARY KEY(id),
   CONSTRAINT fk_serie FOREIGN KEY(id) REFERENCES Midia(id)
);

CREATE TABLE Episodio (
   serie NUMBER(4),
   nroTemp NUMBER(2),
   nroEp NUMBER(3),
   duracao NUMBER(3),
   CONSTRAINT pk_episodio PRIMARY KEY(serie, nroTemp, nroEp),
   CONSTRAINT fk_episodio FOREIGN KEY(serie) REFERENCES Serie(id)
);

CREATE TABLE ElencoEpisodio (
   serie NUMBER(4),
   nroTemp NUMBER(2),
   nroEp NUMBER(3),
   nome VARCHAR2(30),
   CONSTRAINT pk_elencoepisodio PRIMARY KEY(serie, nroTemp, nroEp, nome),
   CONSTRAINT fk_elencoepisodio FOREIGN KEY(serie, nroTemp, nroEp) REFERENCES Episodio(serie, nroTemp, nroEp)
);

CREATE TABLE DubLegEpisodio (
   serie NUMBER(4),
   nroTemp NUMBER(2),
   nroEp NUMBER(3),
   linguagem VARCHAR2(30),
   CONSTRAINT pk_dubepisodio PRIMARY KEY(serie, nroTemp, nroEp, linguagem),
   CONSTRAINT fk_dubepisodio FOREIGN KEY(serie, nroTemp, nroEp) REFERENCES Episodio(serie, nroTemp, nroEp)
);