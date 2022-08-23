delimiter $
create procedure consultar_vendas_realizadas(id_cliente int,data_inicial date, data_final date)
begin
	select c.nome as nomeCliente, v.id as idCompra, iv.subtotal as total, p.nome as nomeProduto, 
	iv.quantidade as qtdProdutosComprados, v.data_pagamento as data_compra, date(v.data_envio) as data_envio
	from cliente as c 
    inner join venda as v 
    inner join item_venda as iv 
    inner join produto as p
	on c.id=v.cliente_id and iv.produto_id=p.id
    where c.id=id_cliente and date(v.data)=data_inicial and date(v.data_envio)=data_final group by p.nome;
end$

set @id_cliente=50;
set @data_inicial='2019-01-08';
set @data_final='2019-01-18';
call consultar_vendas_realizadas(@id_cliente,@data_inicial,@data_final);