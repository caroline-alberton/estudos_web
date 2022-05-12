create table "cachorros"
(
	id serial not null,
	raca varchar (200),
	porte char not null,
	nome varchar (200) not null,
	agressividade boolean not null default false
);

select * from cachorros;

insert into cachorros (raca, porte, nome, agressividade) 
values ('srd', 'p', 'scooby-lu', true);
insert into cachorros (raca, porte, nome, agressividade) 
values ('srd', 'm', 'zelda', false);

alter table cachorros add column observacao text;

alter table cachorros rename column observacao to descricao;

alter table cachorros alter column raca type varchar (100);

alter table cachorros rename to dogs;

select * from dogs;

alter table dogs drop column descricao;

drop table dogs;

create table "cachorros"
(
	id serial not null primary key,
	num_atendimento int not null,
	raca varchar (200),
	porte char not null,
	nome varchar (200) not null unique,
	agressividade boolean not null default false
);
create sequence impar start 1 increment 2 owned by cachorros.num_atendimento;

insert into cachorros (raca,num_atendimento, porte, nome, agressividade) 
values ('srd', nextval ('impar'), 'p', 'scooby-lu', true);
insert into cachorros (raca,num_atendimento, porte, nome, agressividade) 
values ('srd', nextval ('impar'), 'm', 'zelda', false);
insert into cachorros (raca, porte, nome, agressividade) 
values ('srd', 'm', 'zelda', false);

select * from cachorros;

drop table cachorros;

alter table cachorros drop column num_atendimento;

create table atendimento
(
	id serial not null,
	id_cachorro int not null,
	diagnostico text not null,
	constraint fk_cachorro 
		foreign key (id_cachorro)
			references cachorros (id)
);

insert into atendimento (id_cachorro, diagnostico)
values (1, 'nenem');
insert into atendimento (id_cachorro, diagnostico)
values (2, 'fofo');
insert into atendimento (id_cachorro, diagnostico)
values (3, 'awn');
insert into atendimento (id_cachorro, diagnostico)
values (2, 'churupita');

select * from atendimento 

update atendimento set diagnostico = 'mau' where id = 4;

delete from atendimento where diagnostico ilike 'MAU';

delete from atendimento where diagnostico ilike '%n%';

select * 
from cachorros as ca
inner join atendimento as ate on ca.id = ate.id_cachorro;

select * 
from cachorros as ca
right join atendimento as ate on ca.id = ate.id_cachorro;


select raca, ate.id_cachorro, coalesce (ate.id_cachorro, 0)
from cachorros as ca
left join atendimento as ate on ca.id = ate.id_cachorro;

select id_cachorro, count (ate.id) as num_atend, sum (ate.id), array_agg (ate.diagnostico)
from cachorros as ca
inner join atendimento as ate on ca.id = ate.id_cachorro
group by id_cachorro 

select *
from cachorros as ca
inner join atendimento as ate on ca.id = ate.id_cachorro
order by ate.id desc







