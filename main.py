#ler usuario, fazer uma busca ou insercao, retornar dados
import cx_Oracle
dsn_tns = cx_Oracle.makedsn('Host Name', 'Port Number', service_name='Service Name') # if needed, place an 'r' before any parameter in order to address special characters such as '\'.
conn = cx_Oracle.connect(user=r'User Name', password='Personal Password', dsn=dsn_tns) # if needed, place an 'r' before any parameter in order to address special characters such as '\'. For example, if your user name contains '\', you'll need to place 'r' before the user name: user=r'User Name'

cur = conn.cursor()


def inserir():
    print("Tabelas: 1-VPN, 2-Streaming, 3-Pais, 4-Usuario, 5-EstaEm, 6-Utiliza, 7-Assina, 7-Determina, 9-Midia, 10-Photo, \
        11-Genero, 12-MidiaLicenciada,  13-MarcaParaAssistir, 14-Visto, 15-Filme, 16-ElencoFilme, 17-DubLegFilme, \
        19-Serie, 20-Episodio, 21-ElencoEpisodio, 22-DubLegEpisodio")
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
        email=input("digite o email da Usuario: ")
        nome=input("digite o nome da Usuario: ")
        senha=input("digite o senha da Usuario: ")

    elif(tabela==5):
        usuario=input("digite o usuario da EstaEm: ")
        pais=input("digite o pais da EstaEm: ")

    elif(tabela==6):
        usuario=input("digite o usuario da Utiliza: ")
        vpn=input("digite a vpn da Utiliza: ")

    elif(tabela==7):
        usuario=input("digite o usuario da EstaEm: ")
        pais=input("digite o pais da EstaEm: ")
        
    elif(tabela==8):
    elif(tabela==9):
    elif(tabela==10):
    elif(tabela==11):
    elif(tabela==12):
    elif(tabela==13):
    elif(tabela==14):
    elif(tabela==15):
    elif(tabela==16):
    elif(tabela==17):
    elif(tabela==18):
    elif(tabela==19):
    elif(tabela==20):
    elif(tabela==21):
    elif(tabela==22):

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

conn.close()