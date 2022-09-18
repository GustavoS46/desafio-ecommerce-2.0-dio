-- inserção de dados e queries
USE ecommerce;

SHOW TABLES;
-- idClient, Fname, Minit, Lname, CPF, Address
INSERT INTO idClient (Fname, Minit, Lname, CPF, Address)
		VALUES('Maria', 'M', 'Silva', 123456789, 'rua silva de prata 29, Carangola - Cidade das flores'),
			  ('Ricardo', 'F', 'Salgado', 45678913, 'avenida alameda vinha 1009, Centro - Cidade das flores'),
			  ('Julia', 'S', 'Maria', 98745631, 'rua almeida das flores, Centro - Cidade das flores'),
              ('Pedro', 'G', 'Pimentel', 789123456, 'avenida koller 19, Centro - Cidade das flores');
              
-- idProduct, Pname, classification_kids, BOOL, category('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Pets'), evaluation, size
INSERT INTO product (Pname, classification_kids, category, evaluationn, size)
					  VALUES('Fone de ouvido', FALSE, 'Eletrônico', '4', NULL),
                            ('Barbie Elsa', TRUE, 'Brinquedos', '3', NULL),
                            ('Body Carters', TRUE, 'Vestimeta', '5', NULL),
                            ('Microfone Vedo - Youtuber', FALSE, 'Eletrônico', '4', NULL),
                            ('Ração', FALSE, 'Pets', '6', NULL),
                            ('Farrinha de arroz', FALSE, 'Alimentos', '2', NULL),
                            ('Fire Stike Amazon', FALSE, 'Eletrônico', '3', NULL);
                            
SELECT * FROM clients;
SELECT * FROM product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
					(1, NULL, 'compra via aplicativo', NULL, 1),
                    (2, NULL, 'compra via aplicativo', 50, 0),
                    (3, NULL, 'Confirmado', NULL, NULL, 1),
                    (4, NULL, 'compra via web site', 150, 0);
                    
-- ipPOproduct, ipPOorder, poQuantity, poStatus
SELECT * FROM orders;
INSERT INTO procuctOrder (idPOproduct, idPOorder, poQuantity, poStatus)VALUES
						  (1, 5, 2, null),
                          (2, 5, 2, null),
                          (3, 6, 1, null);
                          
INSERT INTO productStorage (storageLocation, quantity)VALUES
                           ('Rio de Janeiro', 1000),
                           ('Rio de Janeiro', 500),
                           ('São Paulo', 10),
                           ('São Paulo', 100),
                           ('São Paulo', 50);
                           
-- idLproduct, idLstorage, location
INSERT INTO storageLocation (idLproduct, idLstorage, location)VALUES
                            (1, 2, 'RJ'),
                            (2, 6, 'GO'),
                            (3, 7, 'MG');
                            
-- idSupplier, SocialName, CNPJ, contact
INSERT INTO supplier (SocialName, CNPJ, contact)VALUES
			         ('Almeida e filhos', 123456789123456, '21985474'),
                     ('Eletrônicos Silva', 723456789163457, '21985484'),
                     ('Eletrônicos Valma', 693456729126456, '21975474');
					
SELECT * FROM supplier;
-- idSupplier, idPsProduct, quantity
INSERT INTO productSupplier (idPsSSupplier, idPsProduct, quantity)VALUES
							(1, 1, 500),
                            (1, 2, 400);
                           
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact)VALUES
				   ('Tech Eletronics', NULL, 123456789123, NULL, 'Rio de Janeiro', 219946287),
                   ('Botique Durgas', NULL, NULL, 421556752210, 'Rio de Janeiro', 719946426),
                   ('Kids World', NULL, 698456715468, NULL, 'São Paulo', 614646252);
                   
SELECT * FROM seller;
-- idPseller, idPproduct, prodQuantity
INSERT INTO prodcutSeller (idPseller, idPprodcut, prodQuantity)VALUES
                         (1, 6, 80),
                         (2, 7, 19);
                         
SELECT * FROM productSeller;     
SELECT count(*) FROM clients;                    
SELECT Fname, Lname, idOrder, orderStatus FROM clients c, orders o WHERE c.idClient = idOrderClient;
SELECT concat(Fname,' ',Lname) AS Client, idOrder AS Request, orderStatus AS Status FROM clients c, orders o WHERE c.idClient = idOrderClient;

SELECT count(*) FROM clients c, orders o
		    WHERE c.idClient = idOrderClient;

SELECt * FROM productOrder; 
-- Recuperação de pedido com produtos associado
SELECT * FROM clients c  
					INNER JOIN orders o ON c.idClient = o.idOrderClient
                    INNER join productOrder p ON p.idPOorder = o.idOrder
		GROUP BY idClient;
        
-- Recuperar quantos pedidos foram feitos pelos clientes?           
SELECT c.idClient, Fname, count(*) AS Number_of_orders FROM clients c 
					INNER JOIN orders o ON c.idClient = o.idOrderClient
		GROUP BY idClient;