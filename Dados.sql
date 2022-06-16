INSERT INTO Usuario (email, nome, senha) VALUES ('victor@lutes.com', 'victor lutes', 'senha');
INSERT INTO Usuario (email, nome, senha) VALUES ('john@doe.com', 'john doe', '1234');
INSERT INTO Usuario (email, nome, senha) VALUES ('dannydevito@gmail.com', 'Danny Devito', 'iasip');

INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 1);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 2);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 3);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('victor@lutes.com', 4);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('dannydevito@gmail.com', 4);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('dannydevito@gmail.com', 5);
INSERT INTO MarcaParaAssistir (usuario, midia) VALUES ('john@doe.com', 6);


INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (5, 'victor@lutes.com', TO_DATE('2022/04/30 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (6, 'victor@lutes.com', TO_DATE('2022/04/30 19:00:00', 'YYYY/MM/DD HH24:MI:SS'), 200);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (7, 'victor@lutes.com', TO_DATE('2022/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 300);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (1, 'dannydevito@gmail.com', TO_DATE('2022/04/30 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (2, 'dannydevito@gmail.com', TO_DATE('2022/04/30 19:00:00', 'YYYY/MM/DD HH24:MI:SS'), 200);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (3, 'dannydevito@gmail.com', TO_DATE('2022/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 300);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (1, 'john@doe.com', TO_DATE('2022/04/30 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (2, 'john@doe.com', TO_DATE('2022/04/30 19:00:00', 'YYYY/MM/DD HH24:MI:SS'), 200);
INSERT INTO Visto (midiaLicenciada,usuario, data, minuto) VALUES (3, 'john@doe.com', TO_DATE('2022/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 300);

INSERT INTO Pais (nome) VALUES ('BRASIL');
INSERT INTO Pais (nome) VALUES ('CANADA');
INSERT INTO Pais (nome) VALUES ('CHINA');
INSERT INTO Pais (nome) VALUES ('JAPAO');
INSERT INTO Pais (nome) VALUES ('MEXICO');
INSERT INTO Pais (nome) VALUES ('FRANCA');
INSERT INTO Pais (nome) VALUES ('ESTADOS UNIDOS');

INSERT INTO EstaEm (usuario, pais) VALUES ('dannydevito@gmail.com', 'ESTADOS UNIDOS');
INSERT INTO EstaEm (usuario, pais) VALUES ('dannydevito@gmail.com', 'BRASIL');
INSERT INTO EstaEm (usuario, pais) VALUES ('victor@lutes.com', 'BRASIL');
INSERT INTO EstaEm (usuario, pais) VALUES ('john@doe.com', 'BRASIL');

INSERT INTO Utiliza (usuario, vpn) VALUES ('john@doe.com', 'NORDVPN');
INSERT INTO Utiliza (usuario, vpn) VALUES ('victor@lutes.com', 'EXPRESSVPN');

INSERT INTO VPN (nome, preco) VALUES ('EXPRESSVPN', 25);
INSERT INTO VPN (nome, preco) VALUES ('NORDVPN', 20);

INSERT INTO Determina (vpn, pais) VALUES ('NORDVPN', 'ESTADOS UNIDOS');
INSERT INTO Determina (vpn, pais) VALUES ('NORDVPN', 'BRASIL');
INSERT INTO Determina (vpn, pais) VALUES ('EXPRESSVPN', 'BRASIL');
INSERT INTO Determina (vpn, pais) VALUES ('EXPRESSVPN', 'CANADA');

INSERT INTO Assina (usuario, streaming) VALUES ('john@doe.com', 'NETFLIX');
INSERT INTO Assina (usuario, streaming) VALUES ('victor@lutes.com', 'STREMIO');
INSERT INTO Assina (usuario, streaming) VALUES ('victor@lutes.com', 'NETFLIX');
INSERT INTO Assina (usuario, streaming) VALUES ('victor@lutes.com', 'HULU');
INSERT INTO Assina (usuario, streaming) VALUES ('dannydevito@gmail.com', 'HULU');
INSERT INTO Assina (usuario, streaming) VALUES ('dannydevito@gmail.com', 'HBO');

INSERT INTO Streaming (nome, preco) VALUES ('NETFLIX', 25);
INSERT INTO Streaming (nome, preco) VALUES ('HULU', 20);
INSERT INTO Streaming (nome, preco) VALUES ('HBO', 30);
INSERT INTO Streaming (nome, preco) VALUES ('STREMIO', 0);

INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (1, 1, 'NETFLIX', 'BRASIL');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (2, 1, 'NETFLIX', 'ESTADOS UNIDOS');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (3, 1, 'HULU', 'BRASIL');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (4, 1, 'HBO', 'BRASIL');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (5, 1, 'STREMIO', 'BRASIL');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (6, 2, 'NETFLIX', 'BRASIL');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (7, 3, 'NETFLIX', 'ESTADOS UNIDOS');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (8, 2, 'HULU', 'BRASIL');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (9, 4, 'HBO', 'BRASIL');
INSERT INTO MidiaLicenciada (id, midia, streaming, pais) VALUES (10, 5, 'STREMIO', 'BRASIL');

INSERT INTO Midia (id, titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (1, 'IN BRUGES', 'MATRIN MCDOUNAGH', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'NA MIRA DO CHEFE', 'FILME');
INSERT INTO Midia (id, titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (2, 'BARRY', 'BILL HADER', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'BARRY', 'SERIE');
INSERT INTO Midia (id, titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (3, 'IN THE MOOD FOR LOVE', 'WONG KAR WAI', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E TRISTE', 'AMOR A FLOR DA PELE', 'FILME');
INSERT INTO Midia (id, titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (4, 'DR WHO', 'STEVEN MOFFAT', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E SCIFI', 'DR WHO', 'SERIE');
INSERT INTO Midia (id, titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (5, 'LETTERKENNY', 'JARED KEESO', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'LETTERKENNY', 'SERIE');
INSERT INTO Midia (id, titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (6, 'ITS ALWAYS SUNNY IN PHILADELPHIA', 'ROB MCELHENNEY', TO_DATE('2016/05/02 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'MUITO BOM E ENGRACADO', 'IASIP', 'SERIE');

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



/*
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('PALMEIRAS', 'SP', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('VASCO', 'RJ', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('FLAMENGO', 'RJ', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('BOTAFOGO', 'RJ', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('CHAPECOENSE', 'SC', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('SANTOS', 'SP', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('UNIDOS', NULL, 'AMADOR', NULL);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('INTER', 'SP', 'AMADOR', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('CRUZEIRO', 'MG', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('ATLETICO', 'MG', 'PROFISSIONAL', 0);
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS) VALUES ('INTERNACIONAL', 'RS', 'PROFISSIONAL', 0);


INSERT INTO JOGA (TIME1, TIME2, CLASSICO) VALUES ('VASCO', 'CHAPECOENSE', 'N');
INSERT INTO JOGA (TIME1, TIME2, CLASSICO) VALUES ('INTER', 'PALMEIRAS', 'N');
INSERT INTO JOGA (TIME1, TIME2, CLASSICO) VALUES ('PALMEIRAS', 'SANTOS', 'S');
INSERT INTO JOGA (TIME1, TIME2, CLASSICO) VALUES ('UNIDOS', 'INTER', NULL);
INSERT INTO JOGA (TIME1, TIME2, CLASSICO) VALUES ('CRUZEIRO', 'SANTOS', 'N');
INSERT INTO JOGA (TIME1, TIME2, CLASSICO) VALUES ('VASCO', 'FLAMENGO', 'S');

INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL) VALUES ('VASCO', 'CHAPECOENSE', TO_DATE('2018/04/30 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), DEFAULT, 'RIO DE JANEIRO');
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL)  VALUES ('INTER', 'PALMEIRAS', TO_DATE('2018/03/02 20:00:00', 'YYYY/MM/DD HH24:MI:SS'), '1X0', 'SANTOS');
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL) VALUES ('PALMEIRAS', 'SANTOS', TO_DATE('2018/02/01 14:30:00', 'YYYY/MM/DD HH24:MI:SS'), '4X2', 'SANTOS');
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL) VALUES ('UNIDOS', 'INTER', TO_DATE('2020/12/01 16:30:00', 'YYYY/MM/DD HH24:MI:SS'), DEFAULT, 'SAO CARLOS');
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL) VALUES ('CRUZEIRO', 'SANTOS', TO_DATE('2018/07/01 14:30:00', 'YYYY/MM/DD HH24:MI:SS'), '0X2', 'BELO HORIZONTE');
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL) VALUES ('CRUZEIRO', 'SANTOS', TO_DATE('2018/12/07 14:30:00', 'YYYY/MM/DD HH24:MI:SS'), '3X2', NULL);
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL) VALUES ('VASCO', 'FLAMENGO', TO_DATE('2018/02/10 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), '2X1', 'RIO DE JANEIRO');
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL) VALUES ('VASCO', 'FLAMENGO', TO_DATE('2020/12/03 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), NULL, NULL);


INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
    VALUES ('400.560.298-61', '20.000.201-3', 'REINALDO', TO_DATE('1995/09/02', 'YYYY/MM/DD'), 'SAO PAULO', 'SANTOS');
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
    VALUES ('400.560.298-60', '40.123.201-3', 'JOSE', TO_DATE('1997/10/12', 'YYYY/MM/DD'), NULL,'PALMEIRAS');
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
    VALUES ('111.460.298-60', '40.435.201-3', 'ALFREDO', TO_DATE('1990/01/22', 'YYYY/MM/DD'), 'RIO DE JANEIRO', 'CHAPECOENSE');
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
    VALUES ('103.460.333-60', '40.234.201-3', 'EDERSON', TO_DATE('1989/10/10', 'YYYY/MM/DD'), 'CAMPINAS', 'SANTOS');
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
    VALUES ('011.460.298-60', '20.435.201-3', 'NETO', TO_DATE('1991/09/02', 'YYYY/MM/DD'), 'FLORIANOPOLIS', 'CHAPECOENSE');   
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
    VALUES ('123.340.198-45', '34.124.002-5', 'SANTIAGO', TO_DATE('1987/12/01', 'YYYY/MM/DD'), 'IBATE', 'UNIDOS');   
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
    VALUES ('301.400.298-00', '40.100.202-7', 'ALESSANDRO', TO_DATE('1992/03/01', 'YYYY/MM/DD'), 'BELO HORIZONTE', 'SANTOS');   

INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)  VALUES ('400.560.298-61', 'MEIA');  
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)  VALUES ('400.560.298-60', 'GOLEIRO');   
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)  VALUES ('111.460.298-60', 'ATACANTE');  
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)  VALUES ('103.460.333-60', 'ZAGUEIRO');  
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)  VALUES ('011.460.298-60', 'GOLEIRO');      
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)  VALUES ('123.340.198-45', 'ZAGUEIRO');      
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)  VALUES ('301.400.298-00', 'ATACANTE');      
    
INSERT INTO DIRETOR (TIME, NOME) VALUES ('PALMEIRAS', 'ROGER MACHADO');      
INSERT INTO DIRETOR (TIME, NOME) VALUES ('VASCO', 'ZE RICARDO');
INSERT INTO DIRETOR (TIME, NOME) VALUES ('CHAPECOENSE', 'GILSON');       
INSERT INTO DIRETOR (TIME, NOME) VALUES ('INTER', 'AUGUSTO');        
INSERT INTO DIRETOR (TIME, NOME) VALUES ('SANTOS', 'JAIR');        
INSERT INTO DIRETOR (TIME, NOME) VALUES ('UNIDOS', 'CAMARGO');        
INSERT INTO DIRETOR (TIME, NOME) VALUES ('CRUZEIRO', 'MANO MENEZES');        

INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('PALMEIRAS', 'TITULAR', 'VERDE');
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('PALMEIRAS', 'RESERVA', 'BRANCO');
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('VASCO', 'TITULAR', 'BRANCO');
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('CHAPECOENSE', 'RESERVA', NULL);
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('SANTOS', 'RESERVA', 'PRETO');
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('INTER', 'TITULAR', NULL);
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('CRUZEIRO', 'TITULAR', 'AZUL');
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL) VALUES ('UNIDOS', 'TITULAR', 'AZUL');
*/