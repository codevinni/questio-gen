-- QUESTIO GEN FULL DATABASE SCRIPT (DDL + SEED)
-- Tested for PostgreSQL
-- Usage: Run this script to completely rebuild the database structure and populate it with data.

-- =========================================================================================================
-- 0. DROPS (CLEANUP)
-- =========================================================================================================

DROP TABLE IF EXISTS quiz_question CASCADE;
DROP TABLE IF EXISTS quiz CASCADE;
DROP TABLE IF EXISTS question CASCADE;
DROP TABLE IF EXISTS subject CASCADE;
DROP TABLE IF EXISTS discipline CASCADE;
DROP TABLE IF EXISTS account CASCADE;

DROP SEQUENCE IF EXISTS quiz_seq;
DROP SEQUENCE IF EXISTS question_seq;
DROP SEQUENCE IF EXISTS subject_seq;
DROP SEQUENCE IF EXISTS discipline_seq;
DROP SEQUENCE IF EXISTS account_seq;

-- =========================================================================================================
-- 1. SEQUENCES
-- Matches 'sequenceName' in @SequenceGenerator annotations
-- =========================================================================================================

CREATE SEQUENCE account_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE discipline_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE subject_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE question_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE quiz_seq START WITH 1 INCREMENT BY 1;

-- =========================================================================================================
-- 2. TABLES
-- =========================================================================================================

-- Table: Account
CREATE TABLE account (
    id bigint NOT NULL,
    password varchar(255),
    role varchar(255) CHECK (role IN ('ADMIN','USER')),
    username varchar(20),
    PRIMARY KEY (id)
);

-- Table: Discipline
CREATE TABLE discipline (
    id bigint NOT NULL,
    name varchar(255),
    PRIMARY KEY (id)
);

-- Table: Subject
CREATE TABLE subject (
    id bigint NOT NULL,
    bimester varchar(255) CHECK (bimester IN ('FIRST_BIMESTER','SECOND_BIMESTER','THIRD_BIMESTER','FOURTH_BIMESTER')),
    grade varchar(255) CHECK (grade IN ('FIRST_GRADE','SECOND_GRADE','THIRD_GRADE','FOURTH_GRADE','FIFTH_GRADE','SIXTH_GRADE','SEVENTH_GRADE','EIGHTH_GRADE','NINTH_GRADE')),
    name varchar(255),
    discipline_id bigint,
    PRIMARY KEY (id),
    CONSTRAINT fk_subject_discipline FOREIGN KEY (discipline_id) REFERENCES discipline (id)
);

-- Table: Question
-- Renamed correct_answer -> correctanswer to match JPA mapping expectation
CREATE TABLE question (
    id bigint NOT NULL,
    correctanswer char(1) NOT NULL,
    optiona varchar(255),
    optionb varchar(255),
    optionc varchar(255),
    optiond varchar(255),
    statement TEXT,
    subject_id bigint,
    PRIMARY KEY (id),
    CONSTRAINT fk_question_subject FOREIGN KEY (subject_id) REFERENCES subject (id)
);

-- Table: Quiz
-- Renamed created_at -> createdat, finished_at -> finishedat to match JPA mapping expectation
CREATE TABLE quiz (
    id bigint NOT NULL,
    createdat timestamp(6),
    finishedat timestamp(6),
    result float(53),
    user_id bigint NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_quiz_user FOREIGN KEY (user_id) REFERENCES account (id)
);

-- Table: Quiz_Questions(Many-to-Many Join Table)
CREATE TABLE quiz_question (
    quiz_id bigint NOT NULL,
    questions_id bigint NOT NULL,
    CONSTRAINT fk_qq_questions FOREIGN KEY (questions_id) REFERENCES question (id),
    CONSTRAINT fk_qq_quiz FOREIGN KEY (quiz_id) REFERENCES quiz (id)
);

-- =========================================================================================================
-- 3. SEED DATA
-- =========================================================================================================

-- Users
INSERT INTO account (id, username, password, role) VALUES (1, 'admin', '$2a$10$wF/DwJrV.ZDdfGCWw6L37uC22TYFZ/aTmH4/yFkSNUwUJyDH5TmDi', 'ADMIN');
INSERT INTO account (id, username, password, role) VALUES (2, 'Vini', '$2a$10$wF/DwJrV.ZDdfGCWw6L37uC22TYFZ/aTmH4/yFkSNUwUJyDH5TmDi', 'USER');
INSERT INTO account (id, username, password, role) VALUES (3, 'Daniel', '$2a$10$wF/DwJrV.ZDdfGCWw6L37uC22TYFZ/aTmH4/yFkSNUwUJyDH5TmDi', 'USER');

-- Disciplines
INSERT INTO discipline (id, name) VALUES (1, 'Matemática');
INSERT INTO discipline (id, name) VALUES (2, 'História');

-- Subjects (Matemática)
INSERT INTO subject (id, name, discipline_id, grade, bimester) VALUES (1, 'Álgebra Elementar', 1, 'FIRST_GRADE', 'FIRST_BIMESTER');
INSERT INTO subject (id, name, discipline_id, grade, bimester) VALUES (2, 'Geometria Plana', 1, 'FIRST_GRADE', 'SECOND_BIMESTER');
INSERT INTO subject (id, name, discipline_id, grade, bimester) VALUES (3, 'Trigonometria', 1, 'SECOND_GRADE', 'FIRST_BIMESTER');

-- Subjects (História)
INSERT INTO subject (id, name, discipline_id, grade, bimester) VALUES (4, 'História Antiga', 2, 'FIRST_GRADE', 'FIRST_BIMESTER');
INSERT INTO subject (id, name, discipline_id, grade, bimester) VALUES (5, 'Idade Média', 2, 'FIRST_GRADE', 'SECOND_BIMESTER');
INSERT INTO subject (id, name, discipline_id, grade, bimester) VALUES (6, 'Era Vargas', 2, 'THIRD_GRADE', 'THIRD_BIMESTER');

-- Questions (Álgebra)
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (1, 'Quanto é 2 + 2?', 1, '3', '4', '5', '6', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (2, 'Qual é o valor de x em 2x = 10?', 1, '2', '5', '10', '20', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (3, 'O que é uma equação de 1º grau?', 1, 'Reta', 'Parábola', 'Círculo', 'Elipse', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (4, 'Resolva: 3x - 5 = 4', 1, '1', '2', '3', '4', 'C');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (5, 'Qual o coeficiente linear de y = 2x + 1?', 1, '1', '2', '3', '0', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (6, 'Expanda (a+b)^2', 1, 'a^2+b^2', 'a^2+2ab+b^2', 'a^2-b^2', '2a+2b', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (7, 'Fatore x^2 - 9', 1, '(x-3)(x+3)', '(x-3)^2', '(x+3)^2', 'x(x-9)', 'A');

-- Questions (Geometria/História/etc - Continuing pattern)
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (8, 'Qual a soma dos ângulos internos de um triângulo?', 2, '180', '360', '90', '270', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (9, 'Área do quadrado de lado 4?', 2, '8', '12', '16', '20', 'C');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (10, 'O que é um triângulo isósceles?', 2, '3 lados iguais', '2 lados iguais', '0 lados iguais', 'Um ângulo reto', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (11, 'Fórmula da área do círculo?', 2, '2*pi*r', 'pi*r^2', 'pi*d', 'pi*r', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (12, 'Quantos lados tem um hexágono?', 2, '5', '6', '7', '8', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (13, 'Teorema de Pitágoras?', 2, 'a+b=c', 'a^2+b^2=c^2', 'a*b=c', 'a/b=c', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (14, 'O que é o raio?', 2, 'Diâmetro', 'Metade do diâmetro', 'Dobro do diâmetro', 'Circunferência', 'B');

INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (15, 'Seno de 30 graus?', 3, '1/2', 'raiz(3)/2', '1', '0', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (16, 'Cosseno de 0 graus?', 3, '0', '1', '-1', '0.5', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (17, 'Tangente de 45 graus?', 3, '0', '1', 'infinito', 'raiz(3)', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (18, 'Relação fundamental?', 3, 'sen+cos=1', 'sen^2+cos^2=1', 'tg=sen*cos', 'sec=1/sen', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (19, 'Quadrante onde seno é positivo?', 3, '1 e 2', '3 e 4', '1 e 4', '2 e 3', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (20, '2pi radianos em graus?', 3, '180', '360', '90', '270', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (21, 'Função inversa do seno?', 3, 'Cosseno', 'Tangente', 'Arco Seno', 'Secante', 'C');

INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (22, 'Rio do Egito Antigo?', 4, 'Amazonas', 'Nilo', 'Tigre', 'Eufrates', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (23, 'Escrita Egípcia?', 4, 'Cuneiforme', 'Hieróglifos', 'Latim', 'Grego', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (24, 'Quem construiu as pirâmides?', 4, 'Romanos', 'Maias', 'Egípcios', 'Persas', 'C');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (25, 'Deus do Sol Egípcio?', 4, 'Zeus', 'Rá', 'Odin', 'Thor', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (26, 'Civilização entre rios?', 4, 'Mesopotâmia', 'Grécia', 'Roma', 'China', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (27, 'Código de leis antigo?', 4, 'Da Vinci', 'Hammurabi', 'Napoleão', 'Civil', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (28, 'Cidade-estado grega?', 4, 'Roma', 'Esparta', 'Cairo', 'Londres', 'B');

INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (29, 'Sistema econômico feudal?', 2, 'Capitalismo', 'Feudalismo', 'Comunismo', 'Socialismo', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (30, 'Peste que assolou a Europa?', 5, 'Gripe Espanhola', 'Peste Negra', 'Varíola', 'Cólera', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (31, 'Guerra santa?', 5, 'Cruzadas', 'Jihad', 'Guerra Fria', 'Guerra dos 100 anos', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (32, 'Império que caiu em 1453?', 5, 'Romano Ocidente', 'Bizantino', 'Persa', 'Mongol', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (33, 'Classe guerreira?', 5, 'Samurais', 'Cavaleiros', 'Vikings', 'Espartanos', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (34, 'Língua da igreja?', 5, 'Inglês', 'Latim', 'Grego', 'Francês', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (35, 'Joana Darc era de onde?', 5, 'Inglaterra', 'França', 'Espanha', 'Itália', 'B');

INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (36, 'Ano da revolução?', 6, '1922', '1930', '1945', '1964', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (37, 'Criada por Vargas?', 6, 'Petrobras', 'Vale', 'Todas as anteriores', 'Nenhuma', 'C');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (38, 'Estado Novo foi?', 6, 'Democracia', 'Ditadura', 'Monarquia', 'Parlamentarismo', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (39, 'Leis trabalhosas?', 6, 'CLT', 'SUS', 'LDB', 'ECA', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (40, 'Vargas cometeu?', 6, 'Homicídio', 'Suicídio', 'Fuga', 'Renúncia', 'B');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (41, 'Quem sucedeu Vargas em 45?', 6, 'Dutra', 'Kubitschek', 'Goulart', 'Quadros', 'A');
INSERT INTO question (id, statement, subject_id, optiona, optionb, optionc, optiond, correctanswer) VALUES (42, 'Voto feminino?', 6, 'Proibido', 'Aprovado em 32', 'Ignorado', 'Apenas para ricas', 'B');

-- Quizzes
-- Renamed created_at -> createdat, finished_at -> finishedat
INSERT INTO quiz (id, user_id, result, createdat, finishedat) VALUES (1, 2, 10.0, NOW(), NOW());
INSERT INTO quiz (id, user_id, result, createdat, finishedat) VALUES (2, 3, null, NOW(), null);

-- Quiz Questions
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (1, 1);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (1, 2);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (1, 3);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (1, 4);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (1, 5);

INSERT INTO quiz_question(quiz_id, questions_id) VALUES (2, 22);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (2, 23);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (2, 24);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (2, 25);
INSERT INTO quiz_question(quiz_id, questions_id) VALUES (2, 26);

-- =========================================================================================================
-- 4. SEQUENCE RESET
-- =========================================================================================================

SELECT setval('account_seq', (SELECT MAX(id) FROM account));
SELECT setval('discipline_seq', (SELECT MAX(id) FROM discipline));
SELECT setval('subject_seq', (SELECT MAX(id) FROM subject));
SELECT setval('question_seq', (SELECT MAX(id) FROM question));
SELECT setval('quiz_seq', (SELECT MAX(id) FROM quiz));

-- END OF SCRIPT
