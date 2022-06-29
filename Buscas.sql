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


/*Filtrar por genero:*/
SELECT M.titulo, M.diretor FROM
    Midia M JOIN Genero G ON G.midia=M.id WHERE G.nomeGenero='genero buscado';
    
/*filtrar por linguagem:*/
SELECT M.titulo, M.diretor FROM
    Midia M JOIN DubLegEpisodio D ON D.serie=M.id WHERE D.linguagem='linguagem buscada'
    UNION
SELECT M.titulo, M.diretor FROM
    Midia M JOIN DubLegFilme D ON D.filme=M.id WHERE D.linguagem='linguagem buscada';

/*buscar filmes e series com um ator:*/
SELECT M.titulo, M.diretor FROM
    Midia M JOIN ElencoEpisodio E ON E.serie=M.id WHERE E.nome='ator buscado'
    UNION
SELECT M.titulo, M.diretor FROM
    Midia M JOIN ElencoFilme E ON E.filme=M.id WHERE E.nome='ator buscado';


/*Mostrar as plataformas com mais shows que ele marcou para assistir em um pais:*/
SELECT S.nome, count(MPA.midia) FROM Streaming S 
    JOIN MidiaLicenciada ML ON S.nome=ML.streaming 
    JOIN MarcaParaAssistir MPA ON MPA.midia=ML.midia 
    WHERE MPA.usuario='email buscado' AND ML.pais='pais buscado'
    GROUP BY S.nome HAVING count(MPA.midia)>0
    ORDER BY count(MPA.midia) DESC;


/*selecionar todas as plataformas que tem um filme num determinado pais:*/
SELECT S.nome FROM Streaming S 
    JOIN MidiaLicenciada ML ON S.nome=ML.streaming 
    JOIN Midia M ON M.id=ML.midia 
    WHERE ML.pais='pais buscado' AND M.titulo='titulo buscado' AND M.diretor='diretor buscado';

/*selecionar streaming que possui a mídia buscada pelo usuário:*/
SELECT str.nome, ML.pais FROM Streaming str
    INNER JOIN MidiaLicenciada ML ON str.nome = ML.streaming
    INNER JOIN Midia M ON M.id = ML.midia
    WHERE M.tituloEstrangeiro = 'tituloBuscado';
    
/*Mostrar os usuários com mais shows assistidos:*/
SELECT usuario, COUNT(midiaLicenciada) as nroMidia 
    FROM Visto 
    GROUP BY usuario
    ORDER BY nroMidia DESC;
