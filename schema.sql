-- ============================================================================
-- PROJETO CIRCULA LIVRO - SCHEMAS E SCRIPTS SQL
-- ============================================================================
-- 1. DEFINIÇÃO DA ESTRUTURA (DDL)
-- ----------------------------------------------------------------------------

-- Tabela de Usuários
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    telefone VARCHAR(20) NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Livros Doados
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT NOT NULL,
    observacao TEXT NULL,
    status ENUM('disponivel', 'doado') DEFAULT 'disponivel',
    data_cadastro DATE NOT NULL,
    CONSTRAINT fk_livro_usuario FOREIGN KEY (id_usuario) 
        REFERENCES usuarios(id_usuario) 
        ON DELETE CASCADE
);

-- Tabela de Fotos do Livro
CREATE TABLE fotos_livro (
    id_foto INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    url_foto VARCHAR(255) NOT NULL,
    CONSTRAINT fk_foto_livro FOREIGN KEY (id_livro) 
        REFERENCES livros(id_livro) 
        ON DELETE CASCADE
);

-- ----------------------------------------------------------------------------
-- 2. MANIPULAÇÃO E POPULAÇÃO DE DADOS (DML)
-- (Povoamento extraído fielmente do array initialBooks do catalogo.html)
-- ----------------------------------------------------------------------------

-- Inserção de Usuários Doadores
INSERT INTO usuarios (id_usuario, nome, email, senha, cidade, telefone) VALUES 
(1, 'Carlos Eduardo', 'carlos.eduardo@email.com', 'carlos123', 'Campo Grande - MS', '67999887766'),
(2, 'Ana Beatriz', 'ana.beatriz@email.com', 'ana456', 'Campo Grande - MS', NULL),
(3, 'Mariana Souza', 'mariana.souza@email.com', 'mari789', 'Campo Grande - MS', '67991234567'),
(4, 'Julyana Navarro', 'julyanan@email.com', 'julyana885', 'Campo Grande - MS', NULL),
(5, 'João Pedro', 'pedroj@email.com', 'pedro746', 'Campo Grande - MS', '67991989999'),
(6, 'Flávio Carvalho', 'flavioc@email.com', 'carvalho426', 'Campo Grande - MS', NULL),
(7, 'Beatriz Lima', 'beatriz.lima@email.com', 'bea12345', 'Dourados - MS', '67998223344'),
(8, 'Lucas Mendes', 'lucas.mendes@email.com', 'lucas2026', 'Três Lagoas - MS', '67996554433');

-- Inserção dos Livros Doados
INSERT INTO livros (id_livro, id_usuario, titulo, autor, ano_publicacao, observacao, status, data_cadastro) VALUES 
(1, 1, 'Dom Casmurro', 'Machado de Assis', 1899, 'Livro em excelente estado de conservação, capa dura, sem rasuras ou grifos.', 'disponivel', '2026-03-10'),
(2, 2, 'O Alquimista', 'Paulo Coelho', 1988, 'Possui marcas suaves de uso na lombada, mas páginas inteiramente limpas.', 'disponivel', '2026-03-12'),
(3, 3, 'Código Limpo (Clean Code)', 'Robert C. Martin', 2009, 'Excelente para estudantes de TI! Poucos grifos a lápis nos capítulos iniciais.', 'disponivel', '2026-03-13'),
(4, 4, 'Algoritmos e Estruturas de Dados', 'Thomas H. Cormen', 2012, 'Livro bem conservado, essencial para disciplinas de programação.', 'disponivel', '2026-03-14'),
(5, 5, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 1954, 'Edição especial em brochura. Páginas amareladas pelo tempo, porém bem preservadas.', 'disponivel', '2026-03-14'),
(6, 6, 'Arquitetura Limpa', 'Robert C. Martin', 2018, 'Sem grifos ou anotações, estado de novo.', 'disponivel', '2026-03-15'),
(7, 7, '1984', 'George Orwell', 1949, 'Capa levemente desgastada nas pontas, texto totalmente legível.', 'disponivel', '2026-03-15'),
(8, 8, 'Design Thinking: Inovação em Negócios', 'MJV Innovation', 2011, 'Ideal para cursos de inovação e gestão. Contém algumas marcações de texto.', 'disponivel', '2026-03-16');

-- Inserção das Fotos dos Livros
INSERT INTO fotos_livro (id_livro, url_foto) VALUES 
(1, 'images/leitores_interagindo.png'),
(2, 'images/leitores_interagindo.png'),
(3, 'images/leitores_interagindo.png'),
(4, 'images/leitores_interagindo.png'),
(5, 'images/leitores_interagindo.png'),
(6, 'images/leitores_interagindo.png'),
(7, 'images/leitores_interagindo.png'),
(8, 'images/leitores_interagindo.png');

-- ----------------------------------------------------------------------------
-- 3. OPERAÇÕES DE ATUALIZAÇÃO E EXCLUSÃO (DML)
-- ----------------------------------------------------------------------------

-- Atualização: Cadastrar telefone para a doadora Ana Beatriz (id_usuario = 2)
UPDATE usuarios 
SET telefone = '67988884444' 
WHERE id_usuario = 2;

-- Atualização: Alterar status de livro após ser entregue a um recebedor
UPDATE livros 
SET status = 'doado' 
WHERE id_livro = 2;

-- Exclusão: Exemplo de remoção de anúncio
-- DELETE FROM livros WHERE id_livro = 2;

-- ----------------------------------------------------------------------------
-- 4. CONSULTAS SQL
-- ----------------------------------------------------------------------------

-- Consulta 1: Catálogo com Dados do Doador
SELECT 
    l.id_livro,
    l.titulo,
    l.autor,
    l.ano_publicacao,
    l.observacao,
    l.data_cadastro,
    u.nome AS doador_nome,
    u.email AS doador_email,
    u.cidade AS doador_cidade,
    u.telefone AS doador_telefone
FROM livros l
JOIN usuarios u ON l.id_usuario = u.id_usuario
WHERE l.status = 'disponivel'
ORDER BY l.data_cadastro DESC;

-- Consulta 2: Filtragem por busca textual no nome do livro ou autor
SELECT l.*, u.nome AS doador, u.cidade
FROM livros l
JOIN usuarios u ON l.id_usuario = u.id_usuario
WHERE (LOWER(l.titulo) LIKE '%casmurro%' OR LOWER(l.autor) LIKE '%machado%')
  AND l.status = 'disponivel';

-- Consulta 3: Filtragem por faixa de ano
SELECT * FROM livros 
WHERE ano_publicacao BETWEEN 2000 AND 2019 
  AND status = 'disponivel';