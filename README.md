# 📚 Circula Livro

> Plataforma web para conectar leitores, incentivando a doação e a troca gratuita e sustentável de livros usados.

---

## 🚀 Sobre o Projeto

O **Circula Livro** nasceu com o propósito de fazer o conhecimento circular. A aplicação permite que usuários cadastrem livros para doação e naveguem por um catálogo dinâmico de obras disponíveis, possibilitando o contato direto entre quem quer doar e quem quer receber.

---

## ✨ Funcionalidades

- **Página Inicial (Hero):** Apresentação da proposta de valor com atalhos diretos para cadastro, catálogo e anúncio de livros.
- **Cadastro de Usuários:** Registro simplificado com validação de campos obrigatórios (_Nome completo, E-mail, Cidade_) e opcionais (_Telefone/WhatsApp_).
- **Autenticação (Login):** Tela de login com suporte a alternância de visibilidade da senha (`mostrar/ocultar`).
- **Anúncio de Doação (`doar.html`):**
  - Cadastro obrigatório de título, autor, ano de publicação e upload de imagens (permite múltiplos arquivos).
  - Campo opcional para detalhar o estado de conservação do livro.
- **Catálogo Dinâmico (`catalogo.html`):**
  - **Filtro em tempo real:** Busca por título do livro, autor ou ano.
  - **Filtro por época:** Seleção de faixas de ano de publicação.
  - **Ordenação:** Organização dos livros por data de cadastro (mais recentes ou mais antigos).
  - **Modal de Detalhes:** Visualização completa do livro e dados do doador.
  - **Contato Automático:** Envio direto de e-mail com mensagem pré-formatada via `mailto:` e atalho direto para o **WhatsApp** (caso o doador tenha cadastrado telefone).

---

## 🛠️ Tecnologias Utilizadas

- **HTML5:** Estrutura semântica e acessível.
- **CSS3:** Estilização moderna e escura (Dark Theme), variáveis CSS e layout flexível (Flexbox e Grid).
- **JavaScript (ES6+):** Manipulação de DOM, filtros em tempo real, modais interativos e lógica de envio de mensagens pré-formatadas.

---

## 📁 Estrutura do Projeto

```text
circula-livro/
├── index.html        # Página principal / Landing Page
├── cadastro.html     # Formulário de cadastro de usuário
├── login.html        # Tela de acesso do usuário
├── doar.html         # Formulário para anúncio de doação de livros
├── catalogo.html     # Lista de livros disponíveis com filtros e contato
├── style.css         # Estilos globais e específicos das páginas
└── images/           # Imagens e recursos visuais do projeto
```
