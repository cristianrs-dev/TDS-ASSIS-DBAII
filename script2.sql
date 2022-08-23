delimiter //
create function consultar_comissao
(id_func int, data_ini date, data_fin date)
returns decimal(6,2) deterministic
begin
	declare qtd_vendas int;
    declare total_comissao decimal(6,2);
    
	select count(v.funcionario_id),c.comissao
    into qtd_vendas,total_comissao
	from venda as v inner join cargo as c inner join funcionario as f
	on v.funcionario_id=f.id and f.cargo_id=c.id and c.comissao is not null and
	f.id=id_func
	where date(v.data)>=data_ini and date(v.data_envio)<=data_fin 
	group by v.funcionario_id;

    return (qtd_vendas * total_comissao);
end//

select consultar_comissao(2,'2019-01-08','2019-02-14');

