select * from venda;
select * from item_venda;
select * from cliente;
select * from produto;

select nome_produto, valor_unitario from item_venda where nome_produto='ventilador de mesa' group by nome_produto;


select c.nome as nomeCliente, v.id as idCompra, iv.subtotal as total, p.nome as nomeProduto, 
iv.quantidade as qtdProdutosComprados, v.data_pagamento as data_compra, date(v.data_envio) as data_envio
from cliente as c 
inner join venda as v 
inner join item_venda as iv 
inner join produto as p
on c.id=v.cliente_id and iv.produto_id=p.id
where c.id=50 and date(v.data)='2019-01-08' and date(v.data_envio)='2019-01-18' group by p.nome;








set @id_cliente=50;
set @data_inicial='2019-01-08';
set @data_final='2019-01-18';
call consultar_vendas_realizadas(@id_cliente,@data_inicial,@data_final);
drop procedure consultar_vendas_realizadas;