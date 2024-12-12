-- criação de tabela (ddl)
create table public.estudantes (
	id int primary key,
	nome varchar(100),
	idade int,
	email varchar(100)
);
-- inserção de dados (dml)
insert into public.estudantes values
	(1, 'Alice dos Santos', 22, 'alice.santos@example.com'),
	(2, 'Bruno Almeida', 25, 'bruno.almeida@example.com'),
	(3, 'Carla Oliveira', 20, 'carla.oliveira@example.com'),
	(4, 'Daniel Souza', 23, 'daniel.souza@example.com'),
	(5, 'Fernanda Lima', 21, 'fernanda.lima@example.com');

-- consulta básica (dql)
select * from estudantes e;

-- consulta com condição (dql)
select nome from estudantes e 
where idade > 20;

-- atualização de dados (dml)
update estudantes
set  email = 'novoemail@exemplo.com'
where id = 3;

-- exclusão de dados (dml)
delete from estudantes 
where id = 5;

-- join simples (dql) -- foreign key (ddl)
create table public.cursos (
	cursos_id int primary key,
	nome_curso varchar(100)
);

insert into cursos (cursos_id, nome_curso) values
	(1, 'Introdução à Programação'),
	(2, 'Banco de Dados Avançado'),
	(3, 'Desenvolvimento Web Full Stack'),
	(4, 'Machine Learning e IA'),
	(5, 'Gestão de Projetos Ágeis');
	
select * from cursos c ;

alter table estudantes
add column id_curso int;

alter table estudantes
add constraint fk_cursos_id
foreign key (id_curso) references cursos (cursos_id);

begin;
update estudantes set id_curso = 1 where id = 1;
update estudantes set id_curso = 2 where id = 2;
update estudantes set id_curso = 3 where id = 3;
update estudantes set id_curso = 4 where id = 4;
commit;
rollback;

select e.*, c.* from estudantes e
inner join cursos c
on c.cursos_id = e.id_curso;

-- transações (dtl)
begin;
insert into public.estudantes (id, nome, idade, email)
values (6, 'Laura Mendes', 21, 'laura.mendes@example.com');

update estudantes
set idade = 27
where id = 2;
commit;
rollback;

-- controle de acesso (dcl)
create user leitor with password 'senha';

grant select on table estudantes to leitor;