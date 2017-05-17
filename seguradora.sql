CREATE TABLE "seguradora" (
"id_seg" integer, 
"nome" varchar(40), 
"endereco" varchar(40),
PRIMARY KEY (id_seg) 
) ; 

INSERT INTO "seguradora" 
("id_seg", "nome", "endereco") 
VALUES (1, 'Seguradora 1', 'Rua da pedra'); 

INSERT INTO "seguradora" 
("id_seg", "nome", "endereco") 
VALUES (2, 'Seguradora 2', 'Rua da rocha');

INSERT INTO "seguradora" 
("id_seg", "nome", "endereco") 
VALUES (3, 'Seguradora 3', 'Rua da vazia');  

CREATE TABLE "cliente" ( 
"nome" varchar(40), 
"endereco" varchar(40),
"cpf" decimal,
"idade" integer,
PRIMARY KEY (cpf)
) ; 


INSERT INTO "cliente" 
("nome", "endereco", "cpf", "idade") 
VALUES ('Cliente 1', 'Rua da pedra', 05541741386, 25); 

INSERT INTO "cliente" 
("nome", "endereco", "cpf", "idade") 
VALUES ('Cliente 2', 'Rua da show', 05541741245, 35); 

INSERT INTO "cliente" 
("nome", "endereco", "cpf", "idade") 
VALUES ('Cliente 3', 'Rua da geek', 05541741365, 45); 

CREATE TABLE "veiculo" (
"placa" varchar(40), 
"ano" varchar(40), 
"marca" varchar(40),
PRIMARY KEY (placa) ,
"cpf_cliente" decimal REFERENCES cliente(cpf)
) ;

INSERT INTO "veiculo" 
("placa", "ano", "marca", "cpf_cliente") 
VALUES ('asd1234', '2002','palio', 05541741386 );  

INSERT INTO "veiculo" 
("placa", "ano", "marca", "cpf_cliente") 
VALUES ('rew1238', '2012','siena', 05541741245 );  

INSERT INTO "veiculo" 
("placa", "ano", "marca", "cpf_cliente") 
VALUES ('poi3219', '2017','corola', 05541741365 );  


CREATE TABLE "corretor" (
"nome" varchar(40), 
"endereco" varchar(40), 
"cpf" decimal,
PRIMARY KEY (cpf) ,
"id_seguradora" integer REFERENCES seguradora(id_seg)
) ;

INSERT INTO "corretor" 
("nome", "endereco", "cpf", "id_seguradora") 
VALUES ('Corretor 1', 'Rua genova',35548713245, 1 ); 

INSERT INTO "corretor" 
("nome", "endereco", "cpf", "id_seguradora") 
VALUES ('Corretor 2', 'Rua glauber',32245136985, 2 ); 

INSERT INTO "corretor" 
("nome", "endereco", "cpf", "id_seguradora") 
VALUES ('Corretor 3', 'Rua gaia',12345769812, 3 ); 

CREATE TABLE "seguro_veiculo" (
"id_sv" varchar(40), 
"data" varchar(40), 
"meses" integer,
PRIMARY KEY (id_sv) ,
"id_seguradora" integer REFERENCES seguradora(id_seg),
"placa_veic" varchar(40) REFERENCES veiculo(placa),
"cpf_cliente" decimal REFERENCES cliente(cpf),
"cpf_corretor" decimal REFERENCES corretor(cpf)
) ;

INSERT INTO "seguro_veiculo" 
("id_sv", "data", "meses", "id_seguradora", "placa_veic", "cpf_cliente", "cpf_corretor") 
VALUES ('1', '04/02/2017', '12', 1, 'asd1234', 05541741386, 35548713245 ); 

INSERT INTO "seguro_veiculo" 
("id_sv", "data", "meses", "id_seguradora", "placa_veic", "cpf_cliente", "cpf_corretor") 
VALUES ('2', '12/02/2017', '12', 2, 'rew1238', 05541741245, 32245136985 );

INSERT INTO "seguro_veiculo" 
("id_sv", "data", "meses", "id_seguradora", "placa_veic", "cpf_cliente", "cpf_corretor") 
VALUES ('3', '12/04/2017', '12', 3, 'poi3219', 05541741365, 12345769812 ); 

CREATE TABLE "pagamento" (
"data" varchar(40), 
"vencimento" varchar(40), 
"id_pagamento" integer,
PRIMARY KEY (id_pagamento) ,
"id_seguro" varchar(40) REFERENCES seguro_veiculo(id_sv)
) ;

INSERT INTO "pagamento" 
("data", "vencimento", "id_pagamento", "id_seguro") 
VALUES ('10/05/2017', '15/05/2017', 1, '1' );

INSERT INTO "pagamento" 
("data", "vencimento", "id_pagamento", "id_seguro") 
VALUES ('15/05/2017', '15/05/2017', 2, '2' );

INSERT INTO "pagamento" 
("data", "vencimento", "id_pagamento", "id_seguro") 
VALUES ('05/05/2017', '15/05/2017', 3, '3' );

CREATE TABLE "oficina" (
"nome" varchar(40), 
"endereco" varchar(40), 
"cnpj" decimal,
PRIMARY KEY (cnpj) ,
"id_seguradora" integer REFERENCES seguradora(id_seg)
) ;

INSERT INTO "oficina" 
("nome", "endereco", "cnpj", "id_seguradora") 
VALUES ('oficina 1', 'rua k9', 3123456789, 1 );

INSERT INTO "oficina" 
("nome", "endereco", "cnpj", "id_seguradora") 
VALUES ('oficina 2', 'rua bereu', 3246578965, 2 );

INSERT INTO "oficina" 
("nome", "endereco", "cnpj", "id_seguradora") 
VALUES ('oficina 3', 'rua jose', 321657879, 3 );

CREATE TABLE "sinistro" (
"data" varchar(40), 
"valor" decimal, 
"id_sinistro" integer,
PRIMARY KEY (id_sinistro) ,
"id_seguro" varchar(40) REFERENCES seguro_veiculo(id_sv),
"id_oficina" decimal REFERENCES oficina(cnpj)
) ;

INSERT INTO "sinistro" 
("data", "valor", "id_sinistro", "id_seguro", "id_oficina") 
VALUES ('01/01/2017', '1220.20', 1, '1', 3123456789 );

INSERT INTO "sinistro" 
("data", "valor", "id_sinistro", "id_seguro", "id_oficina") 
VALUES ('10/01/2017', '1200.20', 2, '2', 3246578965 );

INSERT INTO "sinistro" 
("data", "valor", "id_sinistro", "id_seguro", "id_oficina") 
VALUES ('10/02/2017', '5200.20', 3, '3', 321657879 );
