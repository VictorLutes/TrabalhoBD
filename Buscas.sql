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


Filtrar por genero:
varGenero="DRAMA";
SELECT M.nome, M.diretor FROM
    Midia M JOIN Genero G ON G.midia=M.id WHERE G.nomeGenero=varGenero;
    
filtrar por linguagem:
varLinguagem="PORTUGUES";
SELECT M.nome, M.diretor FROM
    Midia M JOIN DubLegEpisodio D ON D.serie=M.id WHERE D.linguagem=varLinguagem
    UNION
    Midia M JOIN DubLegFilme D ON D.filme=M.id WHERE D.linguagem=varLinguagem;

buscar filmes e series com um ator:
varNomeAtor="JOHN HAMM";
SELECT M.nome, M.diretor FROM
    Midia M JOIN ElencoEpisodio E ON E.serie=M.id WHERE E.nome=varNome
    UNION
    Midia M JOIN ElencoFilme E ON E.filme=M.id WHERE E.nome=varNomeAtor;


Mostrar as plataformas com mais shows que ele marcou para assistir:
varUsuario="victor@lutes.com";
SELECT S.nome, count(MPA.midia) FROM Streaming S JOIN MidiaLicenciada ML ON S.nome=ML.streaming JOIN MarcaParaAssistir MPA ON MPA.midia=ML.midia WHERE MPA.usuario=varUsuario
GROUP BY S.nome HAVING count(MPA.midia)>0
ORDER BY count(MPA.midia) DESC;

/*
----- Dicion�rio de Dados -------------------

select * from user_tables; 

select 'drop table '||table_name||' cascade constraints;' from user_tables; 

----- Otimizador de Consultas -------------------

EXPLAIN PLAN FOR

select * from time where nome = 'INTER'; 

SELECT plan_table_output
	FROM TABLE(dbms_xplan.display());

---------------------------------------------------------------------------------

EXPLAIN PLAN FOR

select * from time where upper(nome) = 'INTER'; 

SELECT plan_table_output
	FROM TABLE(dbms_xplan.display());

---------------------------------------------------------------------------------
EXPLAIN PLAN FOR

select * from time where nome like 'IN%'; 

SELECT plan_table_output
	FROM TABLE(dbms_xplan.display());
        
        
---------------------------------------------------------------------------------        
EXPLAIN PLAN FOR

select * from time where nome like '%TER'; 

SELECT plan_table_output
	FROM TABLE(dbms_xplan.display());

---------------------------------------------------------------------------------        

EXEC DBMS_STATS.GATHER_SCHEMA_STATS(NULL, NULL);
*/
