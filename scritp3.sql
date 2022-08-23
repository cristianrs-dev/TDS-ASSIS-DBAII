delimiter //
create function relacionamento_cliente_empresa( idCliente int)
returns varchar(17) deterministic
begin
	declare total_compras decimal(7,2);
    
	select iv.Subtotal into total_compras
	from cliente as c inner join produto as p inner join item_venda as iv
	inner join venda as v
	on v.cliente_id=c.id and iv.produto_id=p.id and iv.venda_id=v.id
	where v.data_pagamento between '2021-01-01' and '2022-12-31'
	and c.id=idCliente
	group by c.nome;
	if total_compras >=10000 then
		return "cliente premium";
	else
		return "cliente regular";
	end if;
end//

select relacionamento_cliente_empresa(49);