--1)
create database Exercicio_DML
go

use Exercicio_DML
go

create table motorista (

 codigo int identity (1,1) not null,
 nome varchar(30) not null,
 nro_carteira int not null,
 hora_entrada time not null, 
 hora_saida time not null,
 primary key (codigo)

);
go

create table cliente (

 codigo int identity (1,1) not null,
 rg varchar(15) not null,
 nome varchar(30) not null,
 endereco varchar(40) not null,
 primary key (codigo),
 unique (rg)
);
go

create table veiculo (

 placa varchar(9) not null,
 marca varchar(10) not null,
 cor varchar(8) not null,

 primary key (placa)


);
go

create table ocorrencia (

 codigo int identity (1,1) not null,
 end_busca varchar(40) not null,
 end_entrega varchar(40) not null,
 data_ocorrencia date not null, 
 distancia varchar(10) not null,
 preco decimal not null,
 pago bit not null,
 cod_motorista int not null,
 cod_cliente int not null,
 placa varchar(9) not null,
 primary key (codigo),

 foreign key (cod_motorista) references motorista(codigo),
 foreign key (cod_cliente) references cliente (codigo),
 foreign key (placa) references veiculo (placa),

);
go

--2)

--A)
insert into motorista (nome, nro_carteira, hora_entrada, hora_saida)
values ('Lucas', 001, '13:47', '14:57'
);
go

--B)
insert into cliente (rg, nome, endereco)
values ('37.455.325-3', 'Roque', 'Avenida Brasil'
);
go

--C)
insert into veiculo (placa, marca, cor)
values ('AFK-7177' ,'BMW' , 'Azul'
);
go

--D)
insert into ocorrencia (end_busca, end_entrega, data_ocorrencia, distancia, preco, pago, cod_motorista, cod_cliente, placa )
values ('Rodovia Anhanguera', 'Rua das Acácias', '17/06/2020', '20Km', '650.00', '0', 1, 1, 'AFK7177'
);
go

--E)
update ocorrencia
set pago = 'S'
where codigo = 10
go

--F)
update motorista
set hora_saida = '18:00'
where codigo = 5
go

--G)
delete from ocorrencia
where data_ocorrencia between '10/06/2020' and '17/06/2020'
go

--H)
delete from veiculo
where placa = 'AAA5555'
go

--I)
select * from motorista
where hora_entrada ='6:00' and hora_saida = '13:00'
go

--J)


--K)


