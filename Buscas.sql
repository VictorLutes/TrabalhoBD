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


/*selecionar todas as plataformas que tem um filme ou serie num determinado pais:*/
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



/*Mostrar as plataformas todos os shows que um usuario marcou para assistir:*/
/*se for testar no Postgre usar EXCEPT ao inves de MINUS*/
SELECT S.nome FROM Streaming S
    WHERE NOT EXISTS(\
        (SELECT MPA.midia FROM MarcaParaAssistir MPA WHERE MPA.usuario='')
        MINUS
        (SELECT ML.midia FROM MidiaLicenciada ML WHERE S.nome = ML.streaming));

-- Buscar qual usuario mais assistiu algum genero
SELECT usuario, COUNT(midiaLicenciada) as nroMidia 
    FROM Visto 
    JOIN Genero G ON G.midia=Visto.midiaLicenciada on G.nomeGenero='genero buscado'
    GROUP BY usuario ON 
    ORDER BY nroMidia DESC
    LIMIT 1;
-- Buscar qual usuario mais assistiu alguma plataforma
SELECT usuario, COUNT(midiaLicenciada) as nroMidia 
    FROM Visto 
    JOIN Streaming S ON S.nome=Visto.midiaLicenciada on S.nome='plataforma buscada'
    GROUP BY usuario ON 
    ORDER BY nroMidia DESC
    LIMIT 1;
