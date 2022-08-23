select * from venda;
select * from item_venda;
select * from cliente;
select * from produto;

select c.id,c.nome,p.nome, iv.valor_unitario,iv.quantidade, iv.Subtotal, v.data_pagamento
from cliente as c inner join produto as p inner join item_venda as iv
inner join venda as v
on v.cliente_id=c.id and iv.produto_id=p.id and iv.venda_id=v.id
where v.data_pagamento between '2021-01-01' and '2022-12-31' and iv.subtotal>=500

group by c.nome;

select iv.valor_unitario,iv.Subtotal
from cliente as c inner join produto as p inner join item_venda as iv
inner join venda as v
on v.cliente_id=c.id and iv.produto_id=p.id and iv.venda_id=v.id
where v.data_pagamento between '2021-01-01' and '2022-12-31' and iv.subtotal>=500
and c.id=199
group by c.nome;