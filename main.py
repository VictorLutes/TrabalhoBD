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

    
except (Exception, psycopg2.DatabaseError) as error:
    print(error)

def inserir():
    print("Tabelas: 1-VPN, 2-Streaming, 3-Pais, 4-Usuario, 5-Midia (e Filme ou Serie)")
    #10-Photo, 11-Genero, 12-MidiaLicenciada,  13-MarcaParaAssistir, 14-Visto, 15-Filme, 16-ElencoFilme, 17-DubLegFilme, 19-Serie, 20-Episodio, 21-ElencoEpisodio, 22-DubLegEpisodio")
    tabela=int(input("digite o numero da tabela que voce quer inserir: "))
    if(tabela==1):
        nome=input("digite o nome da VPN: ")
        preco=int(input("digite o preco da VPN: "))
        sql="INSERT INTO VPN (nome, preco) VALUES (%s, %s);"
        try:
            cur.execute(sql, [nome.upper(), preco])
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            print("insert failed")
            conn.rollback()
            return
        conn.commit()

    elif(tabela==2):
        nome=input("digite o nome da Plataforma de Streaming: ")
        preco=input("digite o preco da Plataforma de Streaming: ")
        sql="INSERT INTO Streaming (nome, preco) VALUES (%s, %s);"
        try:
            cur.execute(sql, [nome.upper(), preco])
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            print("insert failed")
            conn.rollback()
            return
        conn.commit()

    elif(tabela==3):
        nome=input("digite o nome do pais: ")
        sql="INSERT INTO Pais (nome) VALUES (%s);"
        try:
            cur.execute(sql, [nome.upper()])
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            print("insert failed")
            conn.rollback()
            return
        conn.commit()

    elif(tabela==4):
        email=input("digite o email do Usuario: ")
        nome=input("digite o nome do Usuario: ")
        senha=input("digite o senha do Usuario: ")
        sql="INSERT INTO Usuario (email, nome, senha) VALUES (%s, %s, %s);"
        try:
            cur.execute(sql, [email, nome, senha])
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            print("select failed")
            conn.rollback()
            return
        conn.commit()

    elif(tabela==5):
        print("Digite os dados da mídia e depois os dados do filme ou serie correspondente")
        ident=input("digite id da  Midia: ")
        titulo=input("digite o titulo da Midia: ")
        diretor=input("digite o diretor da Midia: ")
        data=input("digite a data da Midia (no formato YYYY/MM/DD HH24:MI:SS): ")
        descricao=input("digite a descricao da Midia: ")
        tituloEstrangeiro=input("digite o tituloEstrangeiro da Midia: ")
        tipo=input("digite o tipo da Midia (filme ou serie): ")
        sql="INSERT INTO Midia (id, titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (%s, %s, %s, TO_DATE('%s', 'YYYY/MM/DD HH24:MI:SS'), %s, %s, %s);"
        try:
            cur.execute(sql, [int(ident), titulo.upper(), diretor.upper(), data, descricao, tituloEstrangeiro.upper(), tipo.upper()])
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            print("insert failed")
            conn.rollback()
            return
        
        if(tipo.upper()=='SERIE'):
            print("Agora insira os dados dessa Serie:")
            nroTemp=input("digite numero de temporadas da  Serie: ")
            nroEp=input("digite numero episodios por temporada da  Serie: ")
            sql="INSERT INTO Serie (id, duracao) VALUES (%s, %s);"
            try:
                cur.execute(sql, [int(ident), int(dur)])
            except(Exception, psycopg2.DatabaseError) as error:
                print(error)
                print("insert failed")
                conn.rollback()
                return
        else:
            print("Agora insira os dados desse Filme:")
            dur=input("digite a duracao do Filme: ")
            sql="INSERT INTO Serie (id, nroTemporadas, nroEps) VALUES (%s, %s, %s);"
            try:
                cur.execute(sql, [int(ident), int(dur)])
            except(Exception, psycopg2.DatabaseError) as error:
                print(error)
                print("insert failed")
                conn.rollback()
                return

        conn.commit()

    

def buscarMarcados():
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

def buscarMidia():
    print("Descubra quais plataformas tem um filme ou serie em um determinado país")
    pais=input("digite o pais: ")
    nome=input("digite o nome: ")
    diretor=input("digite o nome do diretor: ")
    sql="SELECT S.nome FROM Streaming S JOIN MidiaLicenciada ML ON S.nome=ML.streaming JOIN Midia M ON M.id=ML.midia WHERE ML.pais=%s AND M.titulo=%s AND M.diretor=%s;"
    try:
        cur.execute(sql, [pais.upper(), nome.upper(), diretor.upper()])
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    for row in res:
        print(row)

def buscarVPNs():
    sql="SELECT * FROM VPN;"
    try:
        cur.execute(sql)
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    for row in res:
        print(row)

def buscarMidias():
    sql="SELECT * FROM Midia;"
    try:
        cur.execute(sql)
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    for row in res:
        print(row)

def usarScripts():
    cur.execute("SELECT table_schema,table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_schema,table_name")
    rows = cur.fetchall()
    for row in rows:
        print("dropping table: ", row[1])
        cur.execute("drop table " + row[1] + " cascade")
    cur.execute(open("EsquemaPostgre.sql", "r").read())
    cur.execute(open("Dados.sql", "r").read())
    conn.commit()


option=1

while(option!=0):
    print("Opcoes: \n\t0-sair\n\t1-apagar todas as tabelas e recarregar o esquema e os dados dos arquivos sql\n\t2-buscar pela plataforma com mais filmes ou series marcadas para assistir de um usuario\n\t3-buscar quais plataformas tem um filme ou serie em um pais\n\t4-listar todas as VPNs\n\t5-listar todas as midias\n\t6-inserir dados em uma tabela")
    option=int(input("Escolha uma opcao: "))
    if(option==1):
        usarScripts()
    elif(option==2):
        buscarMarcados()
    elif(option==3):
        buscarMidia()
    elif(option==4):
        buscarVPNs()
    elif(option==5):
        buscarMidias()
    elif(option==6):
        inserir()

conn.close()
print('Database connection closed.')