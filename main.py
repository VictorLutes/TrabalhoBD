#ler usuario, fazer uma busca ou insercao, retornar dados

#senha TrabalhoBD1234

import psycopg2
# conecta na base
try:
    # cria a conexao
    print('Connecting to the PostgreSQL database...')
    conn = psycopg2.connect(host='localhost', database='postgres',user='postgres', password='TrabalhoBD1234')
    
    
    # busca a versao do postgres para imprimir
    print('PostgreSQL database version:')
    cur = conn.cursor()
    cur.execute('SELECT version()')

    # imprime a versao do postgres
    db_version = cur.fetchone()
    print(db_version)

    cur.execute(open("EsquemaPostgre.sql", "r").read())
    cur.execute(open("Dados.sql", "r").read())

    
except (Exception, psycopg2.DatabaseError) as error:
    print(error)

def inserir():
    print("Tabelas: 1-VPN, 2-Streaming, 3-Pais, 4-Usuario, 5-EstaEm, 6-Utiliza, 7-Assina, 8-Determina, 9-Midia")
    #10-Photo, 11-Genero, 12-MidiaLicenciada,  13-MarcaParaAssistir, 14-Visto, 15-Filme, 16-ElencoFilme, 17-DubLegFilme, 19-Serie, 20-Episodio, 21-ElencoEpisodio, 22-DubLegEpisodio")
    tabela=input("digite o numero da tabela que voce quer inserir: ")
    if(tabela==1):
        nome=input("digite o nome da VPN: ")
        preco=input("digite o preco da VPN: ")

    elif(tabela==2):
        nome=input("digite o nome da Plataforma de Streaming: ")
        preco=input("digite o preco da Plataforma de Streaming: ")

    elif(tabela==3):
        nome=input("digite o nome do pais: ")

    elif(tabela==4):
        email=input("digite o email do Usuario: ")
        nome=input("digite o nome do Usuario: ")
        senha=input("digite o senha do Usuario: ")

    elif(tabela==5):
        usuario=input("digite o usuario da EstaEm: ")
        pais=input("digite o pais da EstaEm: ")

    elif(tabela==6):
        usuario=input("digite o usuario da Utiliza: ")
        vpn=input("digite a vpn da Utiliza: ")

    elif(tabela==7):
        usuario=input("digite o usuario da Assina: ")
        streaming=input("digite o streaming da Assina: ")

    elif(tabela==8):
        vpn=input("digite a vpn da Determina: ")
        pais=input("digite o pais da Determina: ")

    elif(tabela==9):
        ident=input("digite id da  Midia: ")
        titulo=input("digite o titulo da Midia: ")
        diretor=input("digite o diretor da Midia: ")
        data=input("digite a data da Midia: ")
        descricao=input("digite a descricao da Midia: ")
        tituloEstrangeiro=input("digite o tituloEstrangeiro da Midia: ")
        tipo=input("digite o tipo da Midia (filme ou serie): ")

    

def buscar():
    print("Digite o email de um usuario para saber qual plataforma tem mais midias que ele marcou para assistir")
    email=input("digite um email: ")
    sql="SELECT S.nome, count(MPA.midia) FROM Streaming S JOIN MidiaLicenciada ML ON S.nome=ML.streaming JOIN MarcaParaAssistir MPA ON MPA.midia=ML.midia WHERE MPA.usuario = %s GROUP BY S.nome HAVING count(MPA.midia)>0 ORDER BY count(MPA.midia) DESC;"
    try:
        cur.execute(sql, [email])
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    for row in res:
        print(row)

    print("Descubra quais plataformas tem um filme ou serie em um determinado país")
    pais=input("digite o pais: ")
    nome=input("digite o nome: ")
    diretor=input("digite o nome do diretor: ")
    sql="SELECT S.nome, FROM Streaming S JOIN MidiaLicenciada ML ON S.nome=ML.streaming JOIN Midia M ON M.id=ML.midia WHERE ML.pais=%s AND M.titulo=:varNomeMidia AND M.diretor=%s;"
    try:
        cur.execute(sql, [pais.upper(), nome.upper(), diretor.upper()])
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    for row in res:
        print(row)


option=1

while(option!=0):
    print("Opcoes: \n\t0-sair\n\t1-inserir\n\t2-buscar")
    option=int(input("Escolha uma opcao: "))
    if(option==1):
        inserir()
    elif(option==2):
        buscar()

conn.close()
print('Database connection closed.')