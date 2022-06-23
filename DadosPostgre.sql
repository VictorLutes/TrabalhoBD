INSERT INTO Usuario (email, nome, senha) VALUES ('victor@lutes.com', 'victor lutes', 'senha');
INSERT INTO Usuario (email, nome, senha) VALUES ('john@doe.com', 'john doe', '1234');
INSERT INTO Usuario (email, nome, senha) VALUES ('ddevito@gmail.com', 'd Devito', 'iasip');

INSERT INTO Pais (nome) VALUES ('BRASIL');
INSERT INTO Pais (nome) VALUES ('CANADA');
INSERT INTO Pais (nome) VALUES ('CHINA');
INSERT INTO Pais (nome) VALUES ('JAPAO');
INSERT INTO Pais (nome) VALUES ('MEXICO');
INSERT INTO Pais (nome) VALUES ('FRANCA');
INSERT INTO Pais (nome) VALUES ('ESTADOS UNIDOS');

INSERT INTO VPN (nome, preco) VALUES ('EXPRESSVPN', 25);
INSERT INTO VPN (nome, preco) VALUES ('NORDVPN', 20);

INSERT INTO Streaming (nome, preco) VALUES ('NETFLIX', 25);
INSERT INTO Streaming (nome, preco) VALUES ('HULU', 20);
INSERT INTO Streaming (nome, preco) VALUES ('HBO', 30);
INSERT INTO Streaming (nome, preco) VALUES ('STREMIO', 0);

INSERT INTO Determina (vpn, pais) VALUES ('NORDVPN', 'ESTADOS UNIDOS');
INSERT INTO Determina (vpn, pais) VALUES ('NORDVPN', 'BRASIL');
INSERT INTO Determina (vpn, pais) VALUES ('EXPRESSVPN', 'BRASIL');
INSERT INTO Determina (vpn, pais) VALUES ('EXPRESSVPN', 'CANADA');

INSERT INTO Assina (usuario, streaming) VALUES ('john@doe.com', 'NETFLIX');
INSERT INTO Assina (usuario, streaming) VALUES ('victor@lutes.com', 'STREMIO');
INSERT INTO Assina (usuario, streaming) VALUES ('victor@lutes.com', 'NETFLIX');
INSERT INTO Assina (usuario, streaming) VALUES ('victor@lutes.com', 'HULU');
INSERT INTO Assina (usuario, streaming) VALUES ('ddevito@gmail.com', 'HULU');
INSERT INTO Assina (usuario, streaming) VALUES ('ddevito@gmail.com', 'HBO');

INSERT INTO Utiliza (usuario, vpn) VALUES ('john@doe.com', 'NORDVPN');
INSERT INTO Utiliza (usuario, vpn) VALUES ('victor@lutes.com', 'EXPRESSVPN');

INSERT INTO EstaEm (usuario, pais) VALUES ('ddevito@gmail.com', 'ESTADOS UNIDOS');
INSERT INTO EstaEm (usuario, pais) VALUES ('ddevito@gmail.com', 'BRASIL');
INSERT INTO EstaEm (usuario, pais) VALUES ('victor@lutes.com', 'BRASIL');
INSERT INTO EstaEm (usuario, pais) VALUES ('john@doe.com', 'BRASIL');

INSERT INTO Midia (titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES ('IN BRUGES', 'MARTIN MCDOUNAGH', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'NA MIRA DO CHEFE', 'FILME');
INSERT INTO Midia (titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES ('BARRY', 'BILL HADER', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'BARRY', 'SERIE');
INSERT INTO Midia (titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES ('IN THE MOOD FOR LOVE', 'WONG KAR WAI', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E TRISTE', 'AMOR A FLOR DA PELE', 'FILME');
INSERT INTO Midia (titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES ('DR WHO', 'STEVEN MOFFAT', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E SCIFI', 'DR WHO', 'SERIE');
INSERT INTO Midia (titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES ('LETTERKENNY', 'JARED KEESO', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'LETTERKENNY', 'SERIE');
INSERT INTO Midia (titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES ('ALWAYS SUNNY IN PHILADELPHIA', 'ROB MCELHENNEY', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'IASIP', 'SERIE');

INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (1, 'NETFLIX', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (1, 'NETFLIX', 'ESTADOS UNIDOS');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (1, 'HULU', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (1, 'HBO', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (1, 'STREMIO', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (2, 'NETFLIX', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (3, 'NETFLIX', 'ESTADOS UNIDOS');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (2, 'HULU', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (4, 'HBO', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (5, 'STREMIO', 'BRASIL');
INSERT INTO MidiaLicenciada (midia, streaming, pais) VALUES (6, 'STREMIO', 'BRASIL');


INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (5, 'victor@lutes.com', TO_DATE('2022/04/30 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (6, 'victor@lutes.com', TO_DATE('2022/04/30 19:00:00', 'YYYY/MM/DD HH24:MI:SS'), 200);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (7, 'victor@lutes.com', TO_DATE('2022/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 300);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (1, 'ddevito@gmail.com', TO_DATE('2022/04/30 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (2, 'ddevito@gmail.com', TO_DATE('2022/04/30 19:00:00', 'YYYY/MM/DD HH24:MI:SS'), 200);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (3, 'ddevito@gmail.com', TO_DATE('2022/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 300);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (1, 'john@doe.com', TO_DATE('2022/04/30 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (2, 'john@doe.com', TO_DATE('2022/04/30 19:00:00', 'YYYY/MM/DD HH24:MI:SS'), 200);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (3, 'john@doe.com', TO_DATE('2022/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 300);

INSERT INTO Photo(midia, enderecoPhoto) VALUES(1, DEFAULT);
INSERT INTO Photo(midia, enderecoPhoto) VALUES(2, DEFAULT);
INSERT INTO Photo(midia, enderecoPhoto) VALUES(3, DEFAULT);
INSERT INTO Photo(midia, enderecoPhoto) VALUES(4, DEFAULT);
INSERT INTO Photo(midia, enderecoPhoto) VALUES(5, DEFAULT);
INSERT INTO Photo(midia, enderecoPhoto) VALUES(6, DEFAULT);

INSERT INTO Genero(midia, nomeGenero) VALUES(1, 'COMEDIA');
INSERT INTO Genero(midia, nomeGenero) VALUES(1, 'DRAMA');
INSERT INTO Genero(midia, nomeGenero) VALUES(2, 'COMEDIA');
INSERT INTO Genero(midia, nomeGenero) VALUES(3, 'ROMANCE');
INSERT INTO Genero(midia, nomeGenero) VALUES(4, 'SCIFI');
INSERT INTO Genero(midia, nomeGenero) VALUES(5, 'COMEDIA');
INSERT INTO Genero(midia, nomeGenero) VALUES(6, 'COMEDIA');

INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 1);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 2);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 3);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 4);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('ddevito@gmail.com', 4);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('ddevito@gmail.com', 5);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('john@doe.com', 6);


INSERT INTO Filme(id, duracao) VALUES(1, 120);
INSERT INTO Filme(id, duracao) VALUES(3, 120);

INSERT INTO ElencoFilme(filme, nome) VALUES(1, 'COLIN FARRELL');
INSERT INTO ElencoFilme(filme, nome) VALUES(3, 'TONY LEUNG');

INSERT INTO DubLegFilme(filme, linguagem) VALUES(1, 'ESPANHOL');
INSERT INTO DubLegFilme(filme, linguagem) VALUES(3, 'INGLES');

INSERT INTO Serie(id, nroTemporadas, nroEps) VALUES(2, 3, 12);
INSERT INTO Serie(id, nroTemporadas, nroEps) VALUES(4, 15, 12);
INSERT INTO Serie(id, nroTemporadas, nroEps) VALUES(5, 9, 10);
INSERT INTO Serie(id, nroTemporadas, nroEps) VALUES(6, 13, 8);

INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(2, 1, 1, 30);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(2, 1, 2, 30);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(2, 1, 3, 30);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(2, 1, 4, 30);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(2, 1, 5, 30);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(2, 2, 1, 30);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(2, 3, 1, 30);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(4, 1, 1, 20);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(5, 1, 1, 50);
INSERT INTO Episodio(serie, nroEp, nroTemp, duracao) VALUES(6, 1, 1, 20);

INSERT INTO ElencoEpisodio(serie, nroEp, nroTemp, nome) VALUES(2, 1, 1, 'BILL HADER');
INSERT INTO ElencoEpisodio(serie, nroEp, nroTemp, nome) VALUES(4, 1, 1, 'DAVID TENNANT');
INSERT INTO ElencoEpisodio(serie, nroEp, nroTemp, nome) VALUES(5, 1, 1, 'JARED KEESO');
INSERT INTO ElencoEpisodio(serie, nroEp, nroTemp, nome) VALUES(6, 1, 1, 'CHARLIE DAY');

INSERT INTO DubLegEpisodio(serie, nroEp, nroTemp, linguagem) VALUES(2, 1, 1, 'PORTUGUES');
INSERT INTO DubLegEpisodio(serie, nroEp, nroTemp, linguagem) VALUES(4, 1, 1, 'FRANCES');