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