select * from funcionario;
select * from usuario;

insert into usuario(id,login,senha)
values			(12,'ralf','kjhki');

insert into funcionario(nome,telefone,cpf,id,cargo_id,usuario_id)
values('ralf','99-7856-5455','4212456789',9,4,12);

delimiter //
create trigger encriptar_senha before insert
on funcionario
for each row
begin 
	update usuario
    set senha=md5(senha)
    where id=new.usuario_id;
end