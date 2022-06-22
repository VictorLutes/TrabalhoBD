/*
Ideias de buscas:

Ideias simples:
all shows in my country
All shows on a platform
Movies/shows a user has watched
Movies/shows to watch 

Ideias complexas:
Filtrar por genero e por linguagem
Se episodio x da temporada y esta nas plataformas que o usuario assina
Todas as plataformas com o episodio x da temporada y
selecionar todas as plataformas que tem um filme num determinado pais
All shows a user can watch (his platforms+country)
Mostrar a plataforma com mais shows que ele marcou para assistir
Mostrar o pais com mais shows que ele ja assistiu
Mostrar o genero com mais shows que ele ja assistiu
Buscar por shows com um ator
Buscar qual usuario mais assistiu algum genero/plataforma/nroMidias
*/


/*Filtrar por genero:
varGenero="DRAMA";*/
SELECT M.nome, M.diretor FROM
    Midia M JOIN Genero G ON G.midia=M.id WHERE G.nomeGenero=varGenero;
    
/*filtrar por linguagem:
varLinguagem="PORTUGUES";*/
SELECT M.nome, M.diretor FROM
    Midia M JOIN DubLegEpisodio D ON D.serie=M.id WHERE D.linguagem=varLinguagem
    UNION
    Midia M JOIN DubLegFilme D ON D.filme=M.id WHERE D.linguagem=varLinguagem;

/*buscar filmes e series com um ator:
varNomeAtor="JOHN HAMM";*/
SELECT M.nome, M.diretor FROM
    Midia M JOIN ElencoEpisodio E ON E.serie=M.id WHERE E.nome=varNome
    UNION
    Midia M JOIN ElencoFilme E ON E.filme=M.id WHERE E.nome=varNomeAtor;


/*Mostrar as plataformas com mais shows que ele marcou para assistir:
varUsuario="victor@lutes.com";*/
SELECT S.nome, count(MPA.midia) FROM Streaming S 
    JOIN MidiaLicenciada ML ON S.nome=ML.streaming 
    JOIN MarcaParaAssistir MPA ON MPA.midia=ML.midia 
    WHERE MPA.usuario=varUsuario
    GROUP BY S.nome HAVING count(MPA.midia)>0
    ORDER BY count(MPA.midia) DESC;


/*selecionar todas as plataformas que tem um filme num determinado pais:
varPais;
varNomeMidia;
varNomeDiretor;*/
SELECT S.nome, FROM Streaming S 
    JOIN MidiaLicenciada ML ON S.nome=ML.streaming 
    JOIN Midia M ON M.id=ML.midia 
    WHERE ML.pais=varPais AND M.titulo=varNomeMidia AND M.diretor=varNomeDiretor;

/*selecionar streaming que possui a mídia buscada pelo usuário:*/

SELECT str.nome FROM Streaming str
    INNER JOIN MidiaLicenciada ML ON str.nome = ML.streaming
    INNER JOIN Midia M ON M.id = ML.midia
    WHERE M.tituloEstrangeiro = 'tituloBuscado';
    
/*Mostrar os usuários com mais shows assistidos:*/
SELECT usuario, COUNT(midiaLicenciada) as nroMidia 
    FROM Visto 
    GROUP BY usuario
    ORDER BY nroMidia DESC;
