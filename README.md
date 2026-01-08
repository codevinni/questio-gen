# Questio Gen

**Questio Gen** é uma plataforma acadêmica desenvolvida para facilitar a geração e o gerenciamento de questionários educacionais. O sistema permite que administradores cadastrem disciplinas, matérias e questões, enquanto estudantes podem gerar testes personalizados baseados em seus tópicos de estudo e acompanhar seu desempenho através de relatórios.

## Sobre

Este projeto foi desenvolvido como parte de um trabalho acadêmico com o objetivo de demonstrar a implementação de uma aplicação web robusta utilizando o ecossistema **Java Spring**.

O foco principal é a arquitetura **MVC (Model-View-Controller)**, explorando a integração entre o back-end e o banco de dados relacional, além do uso de JSP para renderização dinâmica do front-end. O projeto evidencia boas práticas de desenvolvimento, como a separação de responsabilidades, injeção de dependências e segurança no manuseio de dados (criptografia de senhas).

## Tecnologias Usadas

O projeto utiliza as seguintes tecnologias e bibliotecas:

*   **Java 22**: Linguagem base do projeto.
*   **Spring Framework 7** (Spring Web MVC): Framework principal para controle de injeção de dependência e arquitetura web.
*   **Hibernate 6 & JPA**: Para mapeamento objeto-relacional (ORM) e persistência de dados.
*   **PostgreSQL**: Sistema gerenciador de banco de dados relacional.
*   **JSP (JavaServer Pages) & JSTL**: Tecnologia de renderização de páginas web dinâmicas.
*   **Spring Security Crypto**: Para criptografia de senhas.
*   **Maven**: Gerenciamento de dependências e build.
*   **HTML5 & CSS3**: Estilização moderna e responsiva.

## Configuração do Banco de Dados

Para facilitar a configuração do ambiente, um script SQL de backup completo está incluído na raiz do projeto: `sample_database_script.sql`.

### Como Utilizar
1.  Crie um banco de dados vazio no PostgreSQL (ex: `questio_db`).
2.  Execute o script `sample_database_script.sql` neste banco.

O script irá criar todas as tabelas e sequências necessárias, além de popular o banco com dados iniciais (usuários, matérias, questões).

### Notas Importantes
*   **Senhas**: As senhas dos usuários são armazenadas utilizando um hash simples para fins de demonstração acadêmica.
*   **Acesso Admin**:
    *   **Usuário**: `admin`
    *   **Senha**: `admin`