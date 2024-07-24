-- curso gratuito https://www.youtube.com/watch?v=6M-jFECiHog&t=1s

-- A Indentação é a melhor forma de deixar o seu código legível


-- ###### BLOCO: CÓDIGOS NO SQL ############################################################################ --
-- #### SELECT, FROM, WHERE, AS, DISTINCT, ORDER BY ASC DESC, LIMIT,AND, OR, BETWEEN, LIKE, IS NOT NULL #### --
-- selecione a coluna da tabela;
    SELECT coluna FROM tabela;

-- selecionando varias colunas da tabela
    SELECT
        coluna1,
        coluna2,
        coluna3
    FROM 
        tabela;

-- Colocando ALIAS (Apelido na coluna)
    SELECT
        coluna1 as apelido_001,
        coluna2 as novo_nome,
        coluna3 as coluna_produto
    FROM 
        tabela;

-- Trabalhando com valores distintos: DISTINCT
-- Usando DISTINCT para limpar o resultado com dados repetidos
    SELECT DISTINCT marca_produto FROM produto;

-- Ordenar as informações de uma tabela: ORDER BY
-- Ordenar de forma crescente: ORDER BY ***** ASC
-- Ordenar de forma decrescente: ORDER BY ***** DESC
-- ASC ---> -- DESC <---
    SELECT * FROM produto
    ORDER BY coluna_name ASC;
    
-- Ordenando com duas ou mais colunas, assim segue a sequencia da primeira e depois da segunda coluna
    SELECT * FROM produto
    ORDER BY coluna_first_name ASC, coluna_last_name ASC;

-- Limitando o resultado da consulta: Limitando o resultado para somente 5
    SELECT * FROM tabela LIMIT 5;



-- ###### FILTROS ########################################################################################## --

-- Usando: WHERE
    SELECT * FROM tabela WHERE nome = 'first_name';
    SELECT * FROM tabela WHERE id >= 55;
    SELECT * FROM tabela WHERE price > 1000;
    SELECT * FROM tabela WHERE renda_anual >= 50000 ORDER BY renda_anual ASC;
    SELECT * FROM tabela WHERE renda_anual <= 50000 ORDER BY renda_anual DESC;

-- Usando: AND
    SELECT * FROM tabela 
    WHERE renda_anual <= 50000 
    AND sexo = 'masculino' 
    ORDER BY first_name DESC
    LIMIT 10;

-- Usando: OR
    SELECT * FROM produto
    WHERE marca_produto = 'dell' or marca_produto = 'LENOVO' 
    AND price >= 1000
    ORDER BY first_name ASC
    LIMIT 4;

-- Selecionar todos produtos da marca DELL ou SAMSUNG
    SELECT * FROM produto
    WHERE marca_produto = 'dell' or marca_produto = 'SAMSUNG';

-- Usando: IN
    SELECT * FROM produto
    WHERE marca_produto IN ("DELL","SAMSUNG","VAIO");

-- Usando: BETWEEN
    -- EXAMPLE: SELECT * FROM product WHERE price BETWEEN MIN AND MAX;
    SELECT * FROM product
    WHERE price >= 1000 AND price <= 5000;

     SELECT * FROM product
    WHERE price BETWEEN 1000 AND 5000;

--> Para o operador OR podemos usar uma alternativa o IN
--> Para o operador AND podemos usar uma alternativa o BETWEEN

-- Usando: LIKE
    -- usando dados entre as %% mostra que está buscando dados que contem aquele dado inserido
    SELECT * FROM produto
    WHERE product_name LIKE '%SUNG%';

    -- Deste modo a consulta vai buscar apenas os dados que começa com o conteúdo citado
    SELECT * FROM produto
    WHERE product_name LIKE 'SUNG%';

    -- Deste modo a consulta vai buscar apenas os dados que termina com o conteúdo citado
    SELECT * FROM produto
    WHERE product_name LIKE '%SAM';

-- Usando: NULL
    -- Busca todos que contem a coluna com valor null ou seja sem dados atribuídos
    SELECT * FROM clientes
    WHERE phone IS NULL;
    -- Busca todos que não contem dados null na coluna setada na consulta
    SELECT * FROM clientes
    WHERE phone IS NOT NULL;


-- ###### BLOCO ANALISE DE DADOS SQL ####################################################################### --
-- #### COUNT, SUM, AVG, MIN, MAX ########################################################################## --

-- Usando: COUNT
    -- Efetua a contagem das linhas de retorno da consulta da coluna selecionada
    SELECT COUNT(product_name) FROM produtos;

    -- Efetua a contagem de todas linhas de retorno da consulta independente se existe colunas vazias (NULL) ou não
    SELECT COUNT(*) FROM produtos;

-- Usando: SUN
    -- Usado para efetuar a some de determinada coluna apresentada
    SELECT SUM(price_new) FROM produtos;

-- Usando: AVG, MIN e MAX
    -- AVG Consulta trazendo a média dos valores apresentados nas colunas
    -- MIN Consulta trazendo o mínimo dos valores apresentados nas colunas
    -- AVG Consulta trazendo o máximo dos valores apresentados nas colunas
    SELECT 
        AVG(price) as preco_medio,
        MIN(price) as preco_minimo,
        MAX(price) as preco_maximo
    FROM produtos;

-- #### GROUP BY, HAVING ###################################################################################### --
-- Usando: GROUP BY
    -- Agrupando os valores de acordo com o resultado retornado
        SELECT
            product_model,
            COUNT(*)
        FROM product
        GROUP BY product_model
        ORDER BY COUNT(*) ASC;

        SELECT
            escolaridade,
            COUNT(*)
        FROM cliente
        WHERE sexo = "M"
        GROUP BY escolaridade;

-- Usando: HAVING
    -- Utilizado para quando ja existe um resultado e deseja fazer algum filtro depois do agrupamento
        SELECT
            escolaridade,
            COUNT(*)
        FROM cliente
        GROUP BY escolaridade
        HAVING COUNT(*) >= 20;

-- ###### BLOCO ANALISE DE DADOS SQL ####################################################################### --
-- #### JOIN ############################################################################################### --
    Join: relacionamentos no SQL
    Join são formas de criar relacionamentos em consultas a banco de dados
    # conceitos importantes
        Chave primaria e chave estrangeira
        Uma chave primaria é uma coluna que identifica as informações de forma única em uma tabela
     Tendo em mente que as tabelas possuem uma coluna com dados direcionando os calores de outra tabela, 
    a tabela produtos possui uma coluna chamada ID_PRODUCT, com valores  que não se repetem. essa  será  a chave primaria,
    sendo assim é a chave que aponta os dados principais de conexão com outra tabela 
     já na tabela pedido, temos uma coluna chamada ID_PEDIDO, e essa também não se repete, 
    Entendermos também essa coluna como chave primaria.ADD

    # Chave primaria e chave estrangeira
        Já uma chave estrangeira é uma coluna que permite relacionar as linhas de uma segunda tabela com a 
        chave primaria de uma primeira tabela

    # Tabela Dimensão e Tabela Fato
        # TABELA DIMENSÃO
        Uma tabela dimensão é uma tabela que contém características de um determinado elemento: 
            produto, Loja, funcionários, clientes etc...
        nesta tabela, nenhum dos elementos principais ira repetir. É onde vamos encontrar nossas chaves primarias
        
        # TABELA FATO
        Já na tabela fato é uma tabela que vai registrar os fatos ou acontecimentos de uma empresa/negocio
        em determinados períodos de tempo(Venda, Devoluções, Aberturas de Chamados, Receitas, Despesas, etc...)
            Geralmente é uma tabela com milhares de informações e composta essencialmente por colunas de ID usadas para
            buscar informações complementares de uma tabela dimensão. conhecidas como chave estrangeiras.
        
        Vimos anteriormente que existe dois tipos de tabelas: Dimensão e Fato.
            Essas tabelas podem ser relacionadas através de uma coluna: na tabela dimensão, identificamos a chave primaria, 
            que será relacionada com a chave estrangeira da tabela fato

            #PAra que serve esses relacionamentos?
            Com essas relações, conseguimos utilizar informações de uma tabela em outra tabela. 
            Será muito util, por exemplo, para descobrir o nome do produto vendido(na tabela de pedidos)
            fazendo essa busca na tabela de produtos.

            Um exemplo é na tabela de "PEDIDO" uma coluna com "ID_PRODUTO = 11" com essa relação sabemos que na tabela 
            "PRODUTO com o ID = 11" é relacionada com pedidos

-- #### TIPOS DE JOIN ############################################################################################### --
-- #### LEFT JOIN, RIGHT JOIN, INNER JOIN, FULL JOIN ################################################################ --

    # INNER JOIN
    O INNER JOIN retorna apenas as linhas que têm correspondência em ambas as tabelas envolvidas na junção.


    SELECT A.coluna1, B.coluna2
    FROM tabelaA A
    INNER JOIN tabelaB B ON A.id = B.id;
    Esse exemplo seleciona dados de tabelaA e tabelaB onde os valores de id são iguais em ambas as tabelas.

    # LEFT JOIN (ou LEFT OUTER JOIN)
    O LEFT JOIN retorna todas as linhas da tabela à esquerda (tabelaA), e as linhas correspondentes da tabela à direita (tabelaB). Se não houver correspondência, os resultados da tabela à direita serão NULL.


    SELECT A.coluna1, B.coluna2
    FROM tabelaA A
    LEFT JOIN tabelaB B ON A.id = B.id;
    Esse exemplo seleciona todos os dados de tabelaA e os dados correspondentes de tabelaB. Se não houver correspondência, os valores de tabelaB serão NULL.

    # RIGHT JOIN (ou RIGHT OUTER JOIN)
    O RIGHT JOIN é o oposto do LEFT JOIN. Ele retorna todas as linhas da tabela à direita (tabelaB), e as linhas correspondentes da tabela à esquerda (tabelaA). Se não houver correspondência, os resultados da tabela à esquerda serão NULL.


    SELECT A.coluna1, B.coluna2
    FROM tabelaA A
    RIGHT JOIN tabelaB B ON A.id = B.id;
    Esse exemplo seleciona todos os dados de tabelaB e os dados correspondentes de tabelaA. Se não houver correspondência, os valores de tabelaA serão NULL.

    # FULL JOIN (ou FULL OUTER JOIN)
    O FULL JOIN retorna todas as linhas quando há uma correspondência em uma das tabelas. Ele combina os resultados de LEFT JOIN e RIGHT JOIN.


    SELECT A.coluna1, B.coluna2
    FROM tabelaA A
    FULL JOIN tabelaB B ON A.id = B.id;
    Esse exemplo seleciona todos os dados de tabelaA e tabelaB. Se não houver correspondência, os resultados das tabelas que não têm correspondência serão NULL.

    Resumo Visual
    INNER JOIN: Interseção de ambas as tabelas.
    LEFT JOIN: Todas as linhas da tabela à esquerda, com correspondências da tabela à direita (ou NULL).
    RIGHT JOIN: Todas as linhas da tabela à direita, com correspondências da tabela à esquerda (ou NULL).
    FULL JOIN: Todas as linhas de ambas as tabelas, com correspondências (ou NULL).
    Exemplo Prático
    Considere as seguintes tabelas:

    Tabela A:

    id	nome
    1	Alice
    2	Bob
    3	Carol
    Tabela B:

    id	cidade
    1	NYC
    2	LA
    4	Chicago
    INNER JOIN: Retorna (1, Alice, NYC), (2, Bob, LA).
    LEFT JOIN: Retorna (1, Alice, NYC), (2, Bob, LA), (3, Carol, NULL).
    RIGHT JOIN: Retorna (1, Alice, NYC), (2, Bob, LA), (4, NULL, Chicago).
    FULL JOIN: Retorna (1, Alice, NYC), (2, Bob, LA), (3, Carol, NULL), (4, NULL, Chicago).

# SINTAXE INNER JOIN
    SELECT
        tabela1.first_name
        tabela1.last_name
        tabela2.rua
        tabela1.numero
    FROM
        tabela1
    INNER JOIN tabela2 ON tabela1.chave_estrangeira = tabela2.chave_primaria

    -- A tabela1 será a tabela que vamos querer complementar com as informações da tabela2

-- Usando: INNER JOIN
    EXEMPLO(1): Relacionado as tabelas Produtos e categorias
    SELECT
        produtos.nome_produto
        produtos.id_categoria
        produtos.marca_produto
        categoria.nome_categoria
    FROM produtos
    INNER JOIN categorias ON produtos.id_categoria = categoria.id_categoria

    EXEMPLO(2): Relacionado as tabelas Produtos e pedidos
    SELECT
        pedidos.data_venda
        pedidos.id_produto
        pedidos.qtd_produto
        produto.nome_produto
    FROM pedidos
    INNER JOIN produto ON pedidos.id_produto = produto.id_produto

    EXEMPLO(3): Receita de marca mais vendida "USANDO ALIAS PARA MINIMIZAR O CÓDIGO"
    SELECT
        pr.marca_  produto,
        SUM(pe.receita_venda)
    FROM pedidos pe
    INNER JOIN produtos pr ON pe.id_produto = pr.id_produto
    GROUP BY pr.marca_  produto

    -- Etapa 1: Descobrir a média de preços
    SELECT AVG(price_unit) FROM product;

    -- Etapa 2: Filtrar a tabela de produtos com a média de preços
    SELECT
        *
    FROM produtos
    WHERE price_unit >= (SELECT AVG(price_unit) FROM produtos);

-- #### VIEWS ############################################################################################### --
-- #### CRIANDO VIEWS ####################################################################################### --
    -- desde modo armazenamos a estrutura da consulta em uma view onde podemos chama-la pelo nome
    CREATE VIEW viewClientMasc AS
    SELECT * FROM clientes
    WHERE sexo = "M";

-- ###### BLOCO CRIAÇÃO DE BANCO DE DADOS ################################################################## --
-- #### CREATE ############################################################################################# --

-- CREATE DATABASE
    CREATE DATABASE nomeDoBanco;
    -- Setando o banco a ser usado como ativo
    USE nomeDoBanco;

-- CREATE TABLE
    CREATE TABLE alunos(
        id_aluno INT NOT NULL ,
        name VARCHAR(100) NOT NULL,
        nota DECIMAL(10, 2), -- 99999999.99
        curso VARCHAR(100)
    )

-- INSERT INTO
    INSERT INTO aluno(id_aluno, name, nota, curso)
        VALUES
        (1, 'Clerison', 8.9, 'SQL'),
        (1, 'Juliana', 8.0, 'SQL'),
        (1, 'Bianca', 9.0, 'SQL');

-- DROP TABLE
    -- Excluir a tabela com todos os dados
    DROP TABLE alunos;

-- CONSTRAINTS
-- NOT NULL
-- UNIQUE
-- CHECK
-- PRIMARY KEY
-- FOREIGN KEY

-- UPDATE TABLE
    UPDATE alunos 
    SET nota = 8
    WHERE name = "Clerison"

-- DELETE DATA TABLE
    DELETE FROM aluno
    WHERE name = "Juliana";











