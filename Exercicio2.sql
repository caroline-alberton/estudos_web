select * from as_denuncia_denunciados

select * from un_unico where cpf is not null

select * from as_denuncia

ALTER TABLE as_denuncia ADD CONSTRAINT fk_id_denunciante FOREIGN KEY (id_unico_denunciante) REFERENCES un_unico(codigo);

CREATE TABLE as_denuncia_denunciados (
id serial not null primary key,
	id_denuncia integer not null unique,
	id_unico_denunciado integer not null unique,
	notificado boolean default false,
	
	constraint fk_id_denuncia 
		foreign key (id_denuncia)
			references as_denuncia(id),
	
	constraint fk_id_unico_denunciado
		foreign key (id_unico_denunciado)
			references un_unico(codigo)
);

update as_denuncia set id_unico_denunciante = 986 where id in (1,4,6,8);
update as_denuncia set id_unico_denunciante = 62459 where id in (2,3,7,9);
update as_denuncia set id_unico_denunciante = 62458 where id in (5,10);

insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (1,21439);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (2,57695);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (3,62485);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (4,62512);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (5,62525);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (6,62602);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (7,62626);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (8,62680);
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (9,62715);;
insert into as_denuncia_denunciados (id_denuncia, id_unico_denunciado)
values (10,62733);

select ad.id, 
data_denuncia, 
u.nome nome_denunciante,   
case when u.cpf is not null then u.cpf else u.cnpj end  documento_denunciante,
am.descricao motivo, 
ac.descricao canal_origem, 
u2.nome nome_denunciado,
case when u2.cpf is not null then u2.cpf else u2.cnpj end documento_denunciado,
u2.dtnasc data_nascimento
from as_denuncia ad
join un_unico u on u.codigo = ad.id_unico_denunciante
join as_motivo_denuncia am  on am.id = ad.id_motivo_denuncia
join as_canal_origem_denuncia ac on ac.id = ad.id_canal_origem
join as_denuncia_denunciados adn on adn.id_denuncia = ad.id
join un_unico u2 on adn.id_unico_denunciado = u2.codigo
order by data_denuncia, nome_denunciante, nome_denunciado
