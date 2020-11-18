create database Exercicio_DDL2
go

use Exercicio_DDL2
go

create table Pessoa (
 codigo int NOT NULL identity(1,1),
 nome varchar (30) NOT NULL,
 UF varchar(2) NOT NULL,
 Rua varchar(50) NOT NULL,
 Complemento varchar(50) NOT NULL,
 Bairro varchar(50) NOT NULL,
 Cep varchar(8) NOT NULL,
 NumCasa varchar(7) NOT NULL,
 telefone int NOT NULL,
 primary key (codigo)
)
go

create table Cliente (
 codigo int NOT NULL identity(1,1),
 rg varchar NOT NULL,
 dtnasc date NOT NULL,
 primary key (codigo),
 foreign key (codigo) references Pessoa(codigo)
)
go

create table Atendente (
 codigo int NOT NULL identity(1,1),
 salario money NOT NULL,
 comissao money NOT NULL,
 primary key (codigo),
 foreign key (codigo) references Pessoa(codigo)
)
go

create table Livro (
 codigo int NOT NULL identity(1,1),
 titulo varchar (25) NOT NULL,
 autor varchar (30) NOT NULL,
 preco money NOT NULL,
 qtd_estoque int NOT NULL,
 primary key (codigo)
)
go

create table Venda (
 codigo int NOT NULL identity(1,1),
 quantidade int NOT NULL,
 cod_cli int NOT NULL,
 cod_aten int NOT NULL,
 cod_livro int NOT NULL,
 primary key (codigo),
 foreign key (cod_cli) references Cliente(codigo),
 foreign key (cod_aten) references Atendente(codigo),
 foreign key (cod_livro) references Livro(codigo)
)
go