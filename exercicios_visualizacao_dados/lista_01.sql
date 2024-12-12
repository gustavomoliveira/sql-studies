-- criação de tabela produtos
CREATE TABLE public.produtos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(55) NOT NULL,
	preco DECIMAL(10, 2),
	qtde_estoque INT	
);

-- criação de tabela categoria
CREATE TABLE public.categoria (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(55) NOT NULL,
	descricao TEXT,
	ativo BOOLEAN DEFAULT true,
	data_criacao DATE
);

-- criação de tabela relacional - muitos / muitos
CREATE TABLE public.produto_categoria (
	id_produto INT NOT NULL,
	id_categoria INT NOT NULL,
	PRIMARY KEY (id_produto, id_categoria), -- chave primária composta
	FOREIGN KEY (id_produto) REFERENCES produtos (id) ON DELETE CASCADE,
	FOREIGN KEY (id_categoria) REFERENCES categoria (id) ON DELETE CASCADE
);

-- popular tabela produtos
INSERT INTO public.produtos (nome, preco, qtde_estoque)
VALUES 
	('Notebook Lenovo', 3500.00, 15),
	('Smartphone Samsung Galaxy', 1200.99, 50),
	('Monitor LG 24"', 899.90, 30),
	('Teclado Mecânico RGB', 299.99, 40),
	('Mouse Gamer Logitech', 179.90, 25),
	('Smart TV 50" Samsung', 3499.00, 10),
	('Caixa de Som JBL', 249.00, 20),
	('Fone de Ouvido Sony', 499.99, 35),
	('Cadeira Gamer', 899.90, 12),
	('Gabinete Cooler Master', 599.90, 8),
	('Placa de Vídeo RTX 3060', 2799.00, 5),
	('Processador AMD Ryzen 5', 1199.00, 7),
	('Memória RAM 16GB', 389.90, 60),
	('SSD 1TB Kingston', 799.90, 18),
	('Fonte 600W Corsair', 349.90, 20),
	('Air Fryer Mondial', 499.90, 15),
	('Geladeira Brastemp', 3999.00, 6),
	('Fogão 4 Bocas Electrolux', 1299.00, 10),
	('Smartwatch Apple', 2499.00, 14),
	('Impressora HP LaserJet', 899.00, 5);

-- popular tabela categoria
INSERT INTO public.categoria (nome, descricao, ativo, data_criacao)
VALUES
	('Eletrônicos', 'Produtos relacionados à tecnologia e dispositivos eletrônicos.', true, '2023-01-15'),
	('Eletrodomésticos', 'Produtos utilizados no lar, como geladeiras e fogões.', true, '2023-02-10'),
	('Móveis', 'Itens de mobiliário para residências e escritórios.', true, '2023-03-05'),
	('Automotivo', 'Acessórios e peças para veículos automotores.', true, '2023-03-20'),
	('Games', 'Produtos relacionados a jogos eletrônicos e consoles.', true, '2023-04-01'),
	('Informática', 'Equipamentos e acessórios de informática.', true, '2023-04-15'),
	('Áudio e Vídeo', 'Produtos relacionados a som e imagem.', true, '2023-05-10'),
	('Esporte e Lazer', 'Equipamentos esportivos e de lazer.', true, '2023-06-01'),
	('Livros', 'Livros de diversos gêneros e áreas.', true, '2023-06-15'),
	('Beleza e Saúde', 'Produtos voltados para cuidados pessoais e saúde.', true, '2023-07-05'),
	('Moda', 'Vestuário, calçados e acessórios de moda.', true, '2023-07-20'),
	('Brinquedos', 'Jogos e brinquedos para crianças e adultos.', true, '2023-08-10'),
	('Alimentos e Bebidas', 'Itens alimentícios e bebidas.', true, '2023-09-01'),
	('Ferramentas', 'Equipamentos e ferramentas para manutenção e reparos.', true, '2023-09-15'),
	('Pet Shop', 'Produtos para animais de estimação.', true, '2023-10-05'),
	('Casa e Decoração', 'Itens para decoração e organização da casa.', true, '2023-10-20'),
	('Construção', 'Materiais e equipamentos para construção civil.', true, '2023-11-10'),
	('Automação', 'Soluções e equipamentos para automação residencial e comercial.', true, '2023-11-25'),
	('Papelaria', 'Artigos de papelaria e escritório.', true, '2023-12-01'),
	('Fotografia', 'Equipamentos e acessórios para fotografia.', true, '2023-12-10');

-- popular tabela produto_categoria
INSERT INTO public.produto_categoria (id_produto, id_categoria)
VALUES
	(1, 1),
	(1, 6), 
	(2, 2), 
	(3, 3), 
	(4, 4),
	(5, 5), 
	(6, 7), 
	(7, 8), 
	(8, 9),
	(9, 10),
	(10, 11),
	(11, 12), 
	(12, 13), 
	(13, 14), 
	(14, 15), 
	(15, 16), 
	(16, 17), 
	(17, 18), 
	(18, 19), 
	(19, 20),
	(20, 1);

-- inner join
SELECT
	p.id AS produto_id,
	p.nome AS produto_nome,
	c.id AS categoria_id,
	c.nome AS categoria_nome
FROM
	public.produto_categoria pc 
INNER JOIN
	public.produtos p ON pc.id_produto = p.id
INNER JOIN
	public.categoria c ON pc.id_categoria = c.id;