#ler usuario, fazer uma busca ou insercao, retornar dados

#senha TrabalhoBD1234

import psycopg2
# conecta na base
try:
    # cria a conexao
    print('Connecting to the PostgreSQL database...')
    conn = psycopg2.connect(host='localhost', database='postgres',user='postgres', password='TrabalhoBD1234')
    cur = conn.cursor()

except (Exception, psycopg2.DatabaseError) as error:
    print(error)
    exit

#funcao para inserir dados na tabela
def inserir():
    print("Tabelas: 1-VPN, 2-Streaming, 3-Pais, 4-Usuario, 5-Midia (e Filme ou Serie)")
    #10-Photo, 11-Genero, 12-MidiaLicenciada,  13-MarcaParaAssistir, 14-Visto, 15-Filme, 16-ElencoFilme, 17-DubLegFilme, 19-Serie, 20-Episodio, 21-ElencoEpisodio, 22-DubLegEpisodio")
    tabela=int(input("digite o numero da tabela que voce quer inserir: "))
    if(tabela==1):#insere em VPN
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

    elif(tabela==2):#insere em Streaming
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

    elif(tabela==3):#insere em pais
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

    elif(tabela==4):#insere em usuario
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

    elif(tabela==5):#faz insercao casada midia e filme ou serie
        print("Digite os dados da mídia e depois os dados do filme ou serie correspondente")
        titulo=input("digite o titulo da Midia: ")
        diretor=input("digite o diretor da Midia: ")
        data=input("digite a data da Midia (no formato YYYY/MM/DD HH24:MI:SS): ")
        descricao=input("digite a descricao da Midia: ")
        tituloEstrangeiro=input("digite o tituloEstrangeiro da Midia: ")
        tipo=input("digite o tipo da Midia (filme ou serie): ")
        sql="INSERT INTO Midia (titulo, diretor, data, descricao, tituloEstrangeiro, tipo) VALUES (%s, %s, TO_DATE(%s, 'YYYY/MM/DD HH24:MI:SS'), %s, %s, %s);"
        try:
            cur.execute(sql, [titulo.upper(), diretor.upper(), data, descricao, tituloEstrangeiro.upper(), tipo.upper()])
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            print("insert failed")
            conn.rollback()
            return
        #agora vou buscar o id da linha que acabei de inserir para inserir com o mesmo id a especializacao serie ou filme
        sql="SELECT id FROM Midia WHERE titulo=%s AND diretor=%s;"
        try:
            cur.execute(sql, [titulo.upper(), diretor.upper()])
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            print("insert failed")
            conn.rollback()
            return
        res = cur.fetchall()
        ident=res[0][0]

        if(tipo.upper()=='SERIE'):#insere com o mesmo id em serie
            print("Agora insira os dados dessa Serie:")
            nroTemp=input("digite numero de temporadas da  Serie: ")
            nroEp=input("digite numero episodios por temporada da  Serie: ")
            sql="INSERT INTO Serie (id, nroTemporadas, nroEps) VALUES (%s, %s, %s);"
            try:
                cur.execute(sql, [int(ident), int(nroTemp), int(nroEp)])
            except(Exception, psycopg2.DatabaseError) as error:
                print(error)
                print("insert failed")
                conn.rollback()
                return
        else:#insere com o mesmo id em filme
            print("Agora insira os dados desse Filme:")
            dur=input("digite a duracao do Filme: ")
            sql="INSERT INTO Filme (id, duracao) VALUES (%s, %s);"
            try:
                cur.execute(sql, [int(ident), int(dur)])
            except(Exception, psycopg2.DatabaseError) as error:
                print(error)
                print("insert failed")
                conn.rollback()
                return

        conn.commit()

    
#faz um select pelas plataformas com mais midias que um usuario marcou para assistir
def buscarMarcados():
    print("Digite o email de um usuario para saber quantas midias que ele marcou para assistir tem em cada plataforma (se houver pelo menos uma)")
    email=input("digite um email: ")
    sql="SELECT S.nome, count(MPA.midia) FROM Streaming S JOIN MidiaLicenciada ML ON S.nome=ML.streaming JOIN MarcaParaAssistir MPA ON MPA.midia=ML.midia WHERE MPA.usuario = %s GROUP BY S.nome HAVING count(MPA.midia)>0 ORDER BY count(MPA.midia) DESC;"
    try:
        cur.execute(sql, [email])
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    print("Nome das streamings e numero de midias que elas tem em algum pais que o usuario %s marcou para assitir: ", email)
    for row in res:
        print(row)

#fazer a busca do nome das plataformas com uma midia em um pais
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
    print("Nome das streamings com a midia %s no %s:", nome, pais)
    for row in res:
        print(row)

#lista todas as vpns
def buscarVPNs():
    sql="SELECT * FROM VPN;"
    try:
        cur.execute(sql)
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    print("Dados de VPN:")
    for row in res:
        print(row)

#lista todas as midias
def buscarMidias():
    sql="SELECT * FROM Midia;"
    try:
        cur.execute(sql)
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
        print("select failed")
        return
    res = cur.fetchall()
    print("Dados de Midias:")
    for row in res:
        print(row)

#dropa as tabelas e recria elas com os dados do esquema
def usarScripts():
    cur.execute("SELECT table_schema,table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_schema,table_name")
    rows = cur.fetchall()
    for row in rows:
        print("dropping table: ", row[1])
        cur.execute("drop table " + row[1] + " cascade")
    cur.execute(open("EsquemaPostgre.sql", "r").read())
    cur.execute(open("DadosPostgre.sql", "r").read())
    conn.commit()


option=1
print("se a base de dados esta vazia ou voce quer reiniciar ela escolha 1 para carregar o esquema e os dados das scripts sql que criamos")
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