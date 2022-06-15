/*
Ideias de buscas:
selecionar todas as plataformas que tem um filme num determinado pais
all shows in my country
All shows on a platform
All shows a user can watch(his platforms+country)
Movies/shows a user has watched
Movies/shows to watch 

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