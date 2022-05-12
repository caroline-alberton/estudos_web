create table as_canal_origem_denuncia
(
	id serial not null primary key,
	descricao varchar (60) not null,
	ativo boolean
 );
 
 create table as_motivo_denuncia
 ( id serial not null primary key,
  descricao varchar (60) not null,
  ativo boolean
 
 );
 
 create table as_denuncia
 (
 id serial not null primary key,
	 id_canal_origem integer not null, 
	 id_motivo_denuncia integer not null,
	 data_denuncia date not null,
	 detalahamento text,
	 atendida boolean,
	 data_atendida date,
	 foreign key (id_canal_origem) references as_canal_origem_denuncia (id),
	 foreign key (id_motivo_denuncia) references as_motivo_denuncia (id)
 );
 
 insert into as_canal_origem_denuncia (descricao, ativo)
 values 
 	('Telefone', true),
 	('E-mail', true),
 	('Presencial', false),
 	('Whatsapp', true);
	
	insert into as_motivo_denuncia (descricao, ativo)
 values 
 	('Agressão verbal', true),
 	('Agressão Física', true),
 	('Abandono', true),
 	('Perturbação', false);
	
	select * from as_motivo_denuncia
	
	select * from as_canal_origem_denuncia
	
insert into as_denuncia (id_motivo_denuncia, id_canal_origem, data_denuncia)
	values (1, 1, '2019-01-01'),
 		(1, 1, '2019-01-01');
		
insert into as_denuncia (id_motivo_denuncia, id_canal_origem, data_denuncia)
	values (1, 2, '2019-01-01');
 
insert into as_denuncia (id_motivo_denuncia, id_canal_origem, data_denuncia)
	values (3, 1, '2019-02-01'),
 		(3, 1, '2019-03-01'),
		(3, 1, '2019-03-01');
		
insert into as_denuncia (id_motivo_denuncia, id_canal_origem, data_denuncia, data_atendida)
	values (2, 4, '2019-02-01', '2019-03-01');
	
insert into as_denuncia (id_motivo_denuncia, id_canal_origem, data_denuncia)
	values (4, 1, '2019-04-01'),
			(4, 1, '2019-04-01');
			
insert into as_denuncia (id_motivo_denuncia, id_canal_origem, data_denuncia, data_atendida)
	values (4, 2, '2019-03-01', '2019-04-01');
	
select * from as_denuncia
	
	


		
		
		
 
 
		
		