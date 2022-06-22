#ler usuario, fazer uma busca ou insercao, retornar dados
import cx_Oracle
import db_config
con = cx_Oracle.connect(db_config.user, db_config.pw, db_config.dsn)

cur = con.cursor()


def inserir():
    print("Tabelas: ")

def buscar():
    print("Digite o email de um usuario para saber qual plataforma tem mais midias que ele marcou para assistir")
    email=input("digite um email: ")
    sql="SELECT S.nome, count(MPA.midia) FROM Streaming S JOIN MidiaLicenciada ML ON S.nome=ML.streaming JOIN MarcaParaAssistir MPA ON MPA.midia=ML.midia WHERE MPA.usuario = :varUsuario GROUP BY S.nome HAVING count(MPA.midia)>0 ORDER BY count(MPA.midia) DESC;"
    cur.execute(sql, varUsuario=email.upper())
    res = cur.fetchall()
    for row in res:
        print(row)

    print("Descubra quais plataformas tem um filme ou serie em um determinado país")
    pais=input("digite o pais: ")
    nome=input("digite o nome: ")
    diretor=input("digite o nome do diretor: ")
    sql="SELECT S.nome, FROM Streaming S JOIN MidiaLicenciada ML ON S.nome=ML.streaming JOIN Midia M ON M.id=ML.midia WHERE ML.pais=:varPais AND M.titulo=:varNomeMidia AND M.diretor=:varNomeDiretor;"
    cur.execute(sql, varPais=pais.upper(), varNomeMidia=nome.upper(), varNomeDiretor=diretor.upper())
    res = cur.fetchall()
    for row in res:
        print(row)


option=1

while(option!=0):
    print("Opcoes: \n\t0-sair\n\t1-inserir\n\t2-buscar")
    option=input("Escolha uma opcao: ")
    if(option==1):
        inserir()
    elif(option==2):
        buscar()