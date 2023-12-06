use db_biblioteca;

# INFORMAÇÕES ESSENCIAS
insert into tb_bibliotecaria (nome, senha) values ('Val', 'val2023');
insert into tb_categoria (nome) values 
	('poesia'), ('romance'), ('mistério'), ('ficção científica'), ('fantasia'), ('horror'), ('aventura'), ('drama'), ('comédia'), ('ficção histórica'), ('não ficção'), ('Outros');
insert into tb_faixaEtaria (nome) values
	('livre'), ('10+'), ('12+'), ('14+'), ('16+'), ('18+'); 

# PREENCHENDO BASE DE DADOS
insert into tb_leitor (id, nome, telefone) values ('00001089423949', 'Felipe', '11949116670');
insert into tb_emprestimo (id_leitor, dataPrevDevolucao) values ('00001089423949', '2023-11-09');
insert into tb_livro (titulo, autor, ISBN, editora, dataPublicacao, id_faixaEtaria, alugado) values ('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', '97812345-67899', 'Editora Imaginária', '2015-04-15', 1, false);
insert into tb_emprestimoLivro (id_emprestimo, id_livro) values (1,1);
insert into tb_livroCategoria (id_livro, id_categoria) values (1, 2);

insert into tb_livro (titulo, autor, ISBN, editora, sinopse, dataPublicacao, numeroPaginas, id_faixaEtaria, alugado) values ('O milagre da manhã: O segredo para transformar sua vida (antes das 8 horas)', 'Hal Herold', '978-8576849940', 'BestSeller', 'Hal Elrod apresenta o método revolucionário praticado por milhares de pessoas ao redor do mundo e que vai proporcionar, de forma simples e eficaz, que você construa a vida dos seus sonhos - antes das 8 horas da manhã! O milagre da manhã é best-seller internacional, com mais de 1 milhão de exemplares vendidos no Brasil.', '2016-06-19', '196', 4, true);
insert into tb_livroCategoria (id_livro, id_categoria) values (2, 11);

# QUERYS
select  l.titulo, l.autor, l.dataPublicacao as 'ano de publicação', l.editora, c.nome as categoria, f.nome as 'faixa etaria', l.sinopse, l.ISBN, l.numeroPaginas as 'número de páginas' from tb_livro l 
    inner join tb_faixaEtaria f on l.id_faixaEtaria = f.id
    inner join tb_livroCategoria lc on l.id = lc.id_livro
    inner join tb_categoria c on lc.id_categoria = c.id
    where l.titulo like 'O%';
    
select leitor.id, leitor.nome, l.titulo, em.dataEmprestimo, em.dataPrevDevolucao as 'data de devolução', leitor.telefone from tb_emprestimo em
    inner join tb_emprestimoLivro el on em.id = el.id_emprestimo
    inner join tb_livro l on l.id = el.id_livro
    inner join tb_leitor leitor on em.id_leitor = leitor.id;
    
select * from tb_livro;