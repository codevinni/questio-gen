# 📝  Questio Gen

**Questio Gen** é uma plataforma acadêmica desenvolvida para facilitar a geração e o gerenciamento de questionários educacionais. O sistema permite que administradores cadastrem disciplinas, matérias e questões, enquanto estudantes podem gerar testes personalizados baseados em seus tópicos de estudo e acompanhar seu desempenho através de relatórios.

<img width="1743" height="865" alt="image" src="https://github.com/user-attachments/assets/54c200d6-9695-4ff5-9855-7e7f89044b5d" />

## Sobre

Este projeto foi desenvolvido como parte de um trabalho acadêmico com o objetivo de demonstrar a implementação de uma aplicação web robusta utilizando o ecossistema **Java Spring**.

O foco principal é a arquitetura **MVC (Model-View-Controller)**, explorando a integração entre o back-end e o banco de dados, além do uso de JSP para renderização dinâmica do front-end.

## Funcionalidades

- **Gerenciamento de Disciplinas**: Cadastro e organização de disciplinas acadêmicas
- **Gerenciamento de Matérias**: Cadastro de matérias vinculadas a disciplinas específicas
- **Banco de Questões**: Sistema completo para cadastrar, editar e gerenciar questões
- **Geração de Questionários**: Criação automática de questionários personalizados baseados em critérios selecionados
- **Sistema de Respostas**: Estudantes podem responder aos questionários gerados
- **Relatórios de Desempenho**: Visualização de resultados e estatísticas de questionários realizados
- **Controle de Usuários**: Cadastro e autenticação com diferentes níveis de acesso (Administrador e Estudante)

## Tecnologias Usadas

O projeto utiliza as seguintes tecnologias e bibliotecas:

- **Java 22**: Linguagem base do projeto
- **Spring Framework 7** (Spring Web MVC): Framework principal para controle de injeção de dependência e arquitetura web
- **Hibernate 6 & JPA**: Para mapeamento objeto-relacional (ORM) e persistência de dados
- **PostgreSQL**: Sistema gerenciador de banco de dados relacional
- **JSP (JavaServer Pages) & JSTL**: Tecnologia de renderização de páginas web dinâmicas
- **Spring Security Crypto**: Para criptografia de senhas
- **Maven**: Gerenciamento de dependências e build

## Arquitetura do Projeto

```
Questio-Gen/
│ 
├── src/main/java/META-INF/
│   └── persistence.xml                 # Configuração JPA
├── src/main/java/br/tsi/questio/
│   ├── controller/                     # Controllers Spring MVC
│   │   ├── AccountController.java
│   │   ├── DisciplinesController.java
│   │   └── ...
│   ├── dao/                            # Data Access Objects
│   │   ├── JPAUtil.java                # Configuração JPA
│   │   ├── AccountDAO.java
│   │   └── ...
│   ├── model/                          # Entidades JPA
│   │   ├── Account.java
│   │   └── Discipline.java
│   ├── enums/                        
│   │   ├── UserRole.java
│   │   ├── SchoolGrade.java
│   │   └── Bimester.java
│   └── interceptor/                    # Interceptadores
│       └── AuthenticatorInterceptor.java
└── src/main/webapp/WEB-INF/
    └── views/                          # Páginas JSP

```

## Setup

### Requisitos

- PostgreSQL instalado e em execução
- Java 22 ou superior
- Servidor de aplicação compatível com Jakarta EE (ex: Apache Tomcat 10.1+)

### Configuração do Banco de Dados

#### Usando o Backup SQL (Recomendado)

Para facilitar a configuração do ambiente, um script SQL de backup completo está incluído em `database/backup.sql`.

**Passos:**

1. Crie um banco de dados vazio no PostgreSQL:
   ```sql
   CREATE DATABASE questiogen;
   ```

2. Execute o script de backup:
   ```bash
   psql -U postgres -d questiogen -f database/backup.sql
   ```

   Ou importe via ferramenta gráfica (pgAdmin e etc.).

3. O script irá criar todas as tabelas e sequências necessárias, além de popular o banco com dados iniciais (usuários, matérias, questões).

4. Configure as credenciais do banco de dados em `src/main/java/META-INF/persistence.xml` e `src/main/java/br/tsi/questio/dao/JPAUtil.java`:
   - URL de conexão (ex: jdbc:postgresql://localhost:5432/questiogen)
   - Nome do banco de dados
   - Usuário
   - Senha

### Como Executar

Há duas formas de executar este projeto:

#### Opção 1: Via Maven + Servidor de Aplicação (Recomendado para Produção)

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/questio-gen.git
   cd questio-gen
   ```

2. **Configure o banco de dados** conforme descrito acima

3. **Compile o projeto**:
   ```bash
   mvn clean install
   ```

4. **Implante o arquivo WAR** gerado em `target/questiogen.war` no seu servidor de aplicação:
   - Apache Tomcat 10.1+
   - WildFly
   - GlassFish

5. **Acesse a aplicação** através do navegador:
   ```
   http://localhost:8080/questiogen
   ```

#### Opção 2: Via Eclipse EE + Tomcat 10 (Desenvolvimento)

Esta foi a configuração utilizada durante o desenvolvimento do projeto:

**Pré-requisitos:**
- Eclipse IDE for Enterprise Java and Web Developers
- Apache Tomcat 10.1+ instalado
- PostgreSQL rodando localmente

**Passos:**

1. **Importar o projeto**:
   - File → Import → Existing Maven Projects
   - Selecione a pasta do projeto
   - Aguarde o Eclipse baixar as dependências Maven

2. **Configurar o Tomcat no Eclipse**:
   - Window → Preferences → Server → Runtime Environments
   - Add → Apache Tomcat v10.1
   - Aponte para o diretório de instalação do Tomcat
   - Apply and Close

3. **Adicionar projeto ao servidor**:
   - Aba "Servers" (inferior) → Botão direito no Tomcat → Add and Remove
   - Mova o projeto de "Available" para "Configured"
   - Finish

4. **Executar**:
   - Botão direito no projeto → Run As → Run on Server
   - Selecione o Tomcat 10.1 configurado
   - Finish
   - O navegador abrirá automaticamente em `http://localhost:8080/questiogen`

## Credenciais de Acesso

Após executar o script SQL de backup, você poderá acessar com as seguintes credenciais:

**Acesso Administrador:**
- **Usuário**: `admin`
- **Senha**: `admin`

## Observações Importantes

- **Senhas**: As senhas dos usuários são armazenadas utilizando hash criptográfico para fins de demonstração acadêmica
- **Spring MVC**: O projeto utiliza o padrão MVC do Spring para separação de responsabilidades
- **JPA/Hibernate**: A persistência é gerenciada através do Hibernate com JPA
- **Interceptadores**: O sistema utiliza interceptadores do Spring para controle de autenticação
- **Validações**: Validações são realizadas tanto no front-end quanto no back-end
- **Dados Iniciais**: O script SQL inclui dados de exemplo (usuários, disciplinas, matérias e questões) para facilitar testes
