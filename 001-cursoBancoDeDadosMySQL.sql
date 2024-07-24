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
    -- conceitos importantes
    --     Chave primaria e chave estrangeira
    --     Uma chave primaria é uma coluna que identifica as informações de forma única em uma tabela
   
    -- Tendo em mente que as tabelas possuem uma coluna com dados direcionando os calores de outra tabela, 
    -- a tabela produtos possui uma coluna chamada ID_PRODUCT, com valores  que não se repetem. essa  será  a chave primaria,
    -- sendo assim é a chave que aponta os dados principais de conexão com outra tabela 
   
    -- já na tabela pedido, temos uma coluna chamada ID_PEDIDO, e essa também não se repete, 
    -- Entendermos também essa coluna como chave primaria.ADD













