select * from venda;
select * from funcionario;
select * from cargo;

select * from venda;
select count(v.funcionario_id),c.comissao,f.nome,f.id,c.descricao
from venda as v inner join cargo as c inner join funcionario as f
on v.funcionario_id=f.id and f.cargo_id=c.id and c.comissao is not null and
f.id=2
 where date(v.data)>='2019-01-08' and date(v.data_envio)<='2019-04-21' 
group by v.funcionario_id;


