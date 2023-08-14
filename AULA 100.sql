CREATE DATABASE ibge_lspa;

USE ibge_lspa;

CREATE TABLE produtos (
    cod_produto INT,
    nome_produto VARCHAR(45),
    PRIMARY KEY(cod_produto)
    
);


CREATE TABLE safra (
cod_safra INT,
cod_produto INT,
volume INT,
ano INT,
mes INT, 
PRIMARY KEY(cod_safra),
FOREIGN KEY (cod_produto)
REFERENCES produtos (cod_produto)

);

drop table ibge_lspa;

select * from safra;

select * from produtos;

-- 1)Liste todos os produtos e suas safras correspondentes
select p.nome_produto, s.volume from safra s
inner join produtos p
on s.cod_produto =p.cod_produto;

-- 2)Liste o nome do produto, volume e ano da safra para um
-- produto específico (por exemplo, código do produto 1)
select p.nome_produto, s.volume, s.cod_safra
from produtos p
inner join safra s on s.cod_produto=p.cod_produto
where p.cod_produto =1;

-- 3)Calcule o volume total de safras para cada produto.Calcule o
-- volume total de safras para cada produto
select p.nome_produto, sum(s.volume) as volume_total
from produtos p
inner join safra s on s.cod_produto=p.cod_produto
group by s.cod_produto;

-- 4)Lista dos produtos que tiveram safras no ano de 2023
select p.nome_produto,s.ano
 from produtos p
 inner join safra s on s.cod_produto=p.cod_produto
where s.ano=2023;

 
-- 5)Liste o nome do produto e o volume médio das safras para
-- produtos com volume médio superior a 100 milhões de toneladas

select p.nome_produto, avg(s.volume) as volume_medio
from produtos p
inner join safra s on p.cod_produto=s.cod_produto
group by p.nome_produto
having volume_medio > 100000000;

-- 6)Liste os produtos e suas safras ordenados pelo ano e mês da safra
select *
from produtos p
inner join safra s on p.cod_produto=s.cod_produto
order by s.ano,s.mes;

-- 7)Calcule o total de volume de safras agrupados por produtos no
-- ano de 2023
select p.nome_produto,sum(s.volume) as volume_total
from produtos p
inner join safra s on s.cod_produto=p.cod_produto
where s.ano=2023
group by s.cod_produto;

-- 8)Calcule o volume de safras do produto com código 2 no ano de
-- 2023 no mês de Junho
select p.nome_produto, s.volume
from produtos p
inner join safra s on s.cod_produto=p.cod_produto
where s.ano=2023 and mes =6 and s.cod_produto =2
group by s.cod_produto;





