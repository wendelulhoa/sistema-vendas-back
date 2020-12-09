create database sistema_vendas;
use sistema_vendas;

create table tb_user(
	id int primary key not null auto_increment,
	user_name varchar(100),
    cpf varchar(15) unique key
);
create table tb_login(
	id int primary key not null auto_increment,
    user_name varchar(100),
    cpf varchar(15) unique key references tb_user(cpf),
    password varchar(70)
);
create table tb_endereco(
	id int primary key not null auto_increment,
    endereco varchar(100),
    cep int,
    rua varchar(100),
    cidade varchar(100),
    uf varchar(5),
    cpf varchar(15) references tb_user(cpf)
);

create table tb_produtos(
	id int primary key not null auto_increment,
	nome_produto varchar(100),
    preco_produto decimal(10,2),
    cod_categoria int references tb_categoria(id),
    path_img varchar(255)
    
);
create table tb_categoria(
	id int primary key not null auto_increment,
    nome varchar(100) not null
);
create table tb_compras(
	id int primary key not null auto_increment,
    cod_produto int references tb_produtos(id),
    preco_compra decimal(10,2),
    cpf varchar(15) references tb_user(cpf),
    quantidade int,
    num_pedido int,
    data_compra varchar(20)
);
create table tb_compras_pivot(
	cpf varchar(15) references tb_user(cpf),
    cod_pedido int references tb_compras(num_pedido),
    data_compra varchar(100)
); 
