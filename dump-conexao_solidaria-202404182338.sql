--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)

-- Started on 2024-04-18 23:38:09 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16459)
-- Name: alimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimento (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text NOT NULL
);


ALTER TABLE public.alimento OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16458)
-- Name: alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alimento_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 224
-- Name: alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alimento_id_seq OWNED BY public.alimento.id;


--
-- TOC entry 227 (class 1259 OID 16468)
-- Name: arrecadacao_alimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arrecadacao_alimento (
    id integer NOT NULL,
    id_alimento integer,
    data_validade date NOT NULL,
    peso numeric(10,2) NOT NULL,
    id_pessoa integer,
    id_condutor integer,
    id_deposito integer
);


ALTER TABLE public.arrecadacao_alimento OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16467)
-- Name: arrecadacao_alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arrecadacao_alimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.arrecadacao_alimento_id_seq OWNER TO postgres;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 226
-- Name: arrecadacao_alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arrecadacao_alimento_id_seq OWNED BY public.arrecadacao_alimento.id;


--
-- TOC entry 217 (class 1259 OID 16395)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidade (
    id integer NOT NULL,
    uf_estado character(2) NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.cidade OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16394)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidade_id_seq OWNER TO postgres;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 216
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cidade_id_seq OWNED BY public.cidade.id;


--
-- TOC entry 221 (class 1259 OID 16432)
-- Name: condutor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condutor (
    id integer NOT NULL,
    cnh character(11) NOT NULL
);


ALTER TABLE public.condutor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16445)
-- Name: deposito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposito (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text NOT NULL,
    id_pessoa integer
);


ALTER TABLE public.deposito OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16444)
-- Name: deposito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deposito_id_seq OWNER TO postgres;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 222
-- Name: deposito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposito_id_seq OWNED BY public.deposito.id;


--
-- TOC entry 231 (class 1259 OID 16512)
-- Name: doacao_alimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doacao_alimento (
    id integer NOT NULL,
    id_solicitante integer,
    id_alimento integer,
    peso numeric(10,2) NOT NULL,
    id_condutor integer,
    id_estoque_alimento integer
);


ALTER TABLE public.doacao_alimento OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16511)
-- Name: doacao_alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doacao_alimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doacao_alimento_id_seq OWNER TO postgres;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 230
-- Name: doacao_alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doacao_alimento_id_seq OWNED BY public.doacao_alimento.id;


--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    uf character(2) NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16495)
-- Name: estoque_alimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque_alimento (
    id integer NOT NULL,
    id_alimento integer,
    data_validade date NOT NULL,
    peso numeric(10,2) NOT NULL,
    id_deposito integer
);


ALTER TABLE public.estoque_alimento OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16494)
-- Name: estoque_alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_alimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estoque_alimento_id_seq OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 228
-- Name: estoque_alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_alimento_id_seq OWNED BY public.estoque_alimento.id;


--
-- TOC entry 219 (class 1259 OID 16407)
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    id integer NOT NULL,
    cpf character(11) NOT NULL,
    nome character varying(100) NOT NULL,
    sobrenome character varying(100) NOT NULL,
    data_nascimento date NOT NULL,
    id_cidade integer,
    bairro character varying(100) NOT NULL,
    cep character(8) NOT NULL,
    logradouro character varying(100) NOT NULL,
    numero_residencial character varying(10),
    ddd character(2) NOT NULL,
    telefone character(9) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16406)
-- Name: pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pessoa_id_seq OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 218
-- Name: pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoa_id_seq OWNED BY public.pessoa.id;


--
-- TOC entry 220 (class 1259 OID 16422)
-- Name: solicitante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitante (
    id integer NOT NULL,
    quantidade_dependentes integer NOT NULL
);


ALTER TABLE public.solicitante OWNER TO postgres;

--
-- TOC entry 3265 (class 2604 OID 16462)
-- Name: alimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento ALTER COLUMN id SET DEFAULT nextval('public.alimento_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 16471)
-- Name: arrecadacao_alimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrecadacao_alimento ALTER COLUMN id SET DEFAULT nextval('public.arrecadacao_alimento_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 16398)
-- Name: cidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade ALTER COLUMN id SET DEFAULT nextval('public.cidade_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 16448)
-- Name: deposito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposito ALTER COLUMN id SET DEFAULT nextval('public.deposito_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 16515)
-- Name: doacao_alimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doacao_alimento ALTER COLUMN id SET DEFAULT nextval('public.doacao_alimento_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 16498)
-- Name: estoque_alimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque_alimento ALTER COLUMN id SET DEFAULT nextval('public.estoque_alimento_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16410)
-- Name: pessoa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa ALTER COLUMN id SET DEFAULT nextval('public.pessoa_id_seq'::regclass);


--
-- TOC entry 3461 (class 0 OID 16459)
-- Dependencies: 225
-- Data for Name: alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alimento VALUES (1, 'Arroz', 'Grão básico para alimentação');
INSERT INTO public.alimento VALUES (2, 'Feijão', 'Fonte de proteínas e fibras');
INSERT INTO public.alimento VALUES (3, 'Macarrão', 'Alimento versátil e de fácil preparo');
INSERT INTO public.alimento VALUES (4, 'Farinha de trigo', 'Ingrediente essencial para diversos pratos');
INSERT INTO public.alimento VALUES (5, 'Óleo de soja', 'Utilizado para refogar e fritar alimentos');
INSERT INTO public.alimento VALUES (6, 'Açúcar', 'Adoçante natural para diversas receitas');
INSERT INTO public.alimento VALUES (7, 'Sal', 'Condimento básico para temperar alimentos');
INSERT INTO public.alimento VALUES (8, 'Café', 'Bebida estimulante e tradicional');
INSERT INTO public.alimento VALUES (9, 'Leite em pó', 'Fonte de cálcio e proteínas');
INSERT INTO public.alimento VALUES (10, 'Molho de tomate', 'Base para diversos molhos e acompanhamentos');
INSERT INTO public.alimento VALUES (11, 'Fubá', 'Farinha de milho utilizada em várias preparações');
INSERT INTO public.alimento VALUES (12, 'Biscoitos', 'Lanche prático e saboroso');
INSERT INTO public.alimento VALUES (13, 'Enlatados de sardinha', 'Fonte de proteínas e ácidos graxos ômega-3');
INSERT INTO public.alimento VALUES (14, 'Enlatados de milho verde', 'Ingredientes para saladas e pratos diversos');
INSERT INTO public.alimento VALUES (15, 'Enlatados de ervilha', 'Versáteis e nutritivas');
INSERT INTO public.alimento VALUES (16, 'Enlatados de atum', 'Fonte de proteínas e ômega-3');
INSERT INTO public.alimento VALUES (17, 'Leite condensado', 'Ingrediente para sobremesas e doces');
INSERT INTO public.alimento VALUES (18, 'Creme de leite', 'Utilizado em preparações culinárias');
INSERT INTO public.alimento VALUES (19, 'Gelatina', 'Sobremesa leve e refrescante');
INSERT INTO public.alimento VALUES (20, 'Achocolatado em pó', 'Bebida saborosa e nutritiva para crianças');


--
-- TOC entry 3463 (class 0 OID 16468)
-- Dependencies: 227
-- Data for Name: arrecadacao_alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.arrecadacao_alimento VALUES (52, 1, '2025-05-01', 5.00, 20, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (53, 2, '2025-06-15', 3.50, 21, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (54, 3, '2025-07-20', 7.00, 22, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (55, 4, '2025-08-10', 4.50, 23, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (56, 5, '2025-09-05', 6.20, 24, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (57, 6, '2025-10-15', 8.00, 25, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (58, 7, '2025-11-20', 2.80, 26, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (59, 8, '2025-12-25', 9.50, 27, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (60, 9, '2026-01-10', 3.00, 28, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (61, 10, '2026-02-15', 5.30, 29, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (62, 11, '2026-03-20', 6.70, 30, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (63, 12, '2026-04-05', 4.00, 20, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (64, 13, '2026-05-10', 7.20, 21, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (65, 14, '2026-06-15', 3.90, 22, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (66, 15, '2026-07-20', 6.50, 23, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (67, 16, '2026-08-05', 5.10, 24, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (68, 17, '2026-09-10', 8.40, 25, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (69, 18, '2026-10-15', 2.50, 26, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (70, 19, '2026-11-20', 9.00, 27, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (71, 20, '2026-12-25', 4.80, 28, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (72, 1, '2027-01-10', 7.70, 29, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (73, 2, '2027-02-15', 3.20, 30, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (74, 3, '2027-03-20', 5.90, 20, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (75, 4, '2027-04-05', 6.00, 21, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (76, 5, '2027-05-10', 8.30, 22, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (77, 6, '2027-06-15', 4.10, 23, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (78, 7, '2027-07-20', 6.40, 24, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (79, 8, '2027-08-05', 3.50, 25, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (80, 9, '2027-09-10', 7.90, 26, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (81, 10, '2027-10-15', 5.20, 27, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (82, 11, '2027-11-20', 4.70, 28, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (83, 12, '2027-12-25', 8.10, 29, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (84, 13, '2028-01-10', 3.30, 30, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (85, 14, '2028-02-15', 6.60, 20, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (86, 15, '2028-03-20', 5.00, 21, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (87, 16, '2028-04-05', 9.20, 22, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (88, 17, '2028-05-10', 3.80, 23, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (89, 18, '2028-06-15', 7.00, 24, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (90, 19, '2028-07-20', 4.50, 25, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (91, 20, '2028-08-05', 8.60, 26, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (92, 1, '2028-09-10', 2.40, 27, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (93, 2, '2028-10-15', 6.80, 28, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (94, 3, '2028-11-20', 5.30, 29, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (95, 4, '2028-12-25', 7.50, 30, 17, 2);
INSERT INTO public.arrecadacao_alimento VALUES (96, 5, '2029-01-10', 4.10, 20, 18, 1);
INSERT INTO public.arrecadacao_alimento VALUES (97, 6, '2029-02-15', 8.00, 21, 16, 2);
INSERT INTO public.arrecadacao_alimento VALUES (98, 7, '2029-03-20', 3.50, 22, 17, 1);
INSERT INTO public.arrecadacao_alimento VALUES (99, 8, '2029-04-05', 6.90, 23, 18, 2);
INSERT INTO public.arrecadacao_alimento VALUES (100, 9, '2029-05-10', 5.20, 24, 16, 1);
INSERT INTO public.arrecadacao_alimento VALUES (101, 10, '2029-06-15', 9.10, 25, 17, 2);


--
-- TOC entry 3453 (class 0 OID 16395)
-- Dependencies: 217
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cidade VALUES (1, 'PR', 'Curitiba');
INSERT INTO public.cidade VALUES (42, 'AC', 'Rio Branco');
INSERT INTO public.cidade VALUES (43, 'AC', 'Cruzeiro do Sul');
INSERT INTO public.cidade VALUES (44, 'AL', 'Maceió');
INSERT INTO public.cidade VALUES (45, 'AL', 'Arapiraca');
INSERT INTO public.cidade VALUES (46, 'AP', 'Macapá');
INSERT INTO public.cidade VALUES (47, 'AP', 'Santana');
INSERT INTO public.cidade VALUES (48, 'AM', 'Manaus');
INSERT INTO public.cidade VALUES (49, 'AM', 'Parintins');
INSERT INTO public.cidade VALUES (50, 'BA', 'Salvador');
INSERT INTO public.cidade VALUES (51, 'BA', 'Feira de Santana');
INSERT INTO public.cidade VALUES (52, 'CE', 'Fortaleza');
INSERT INTO public.cidade VALUES (53, 'CE', 'Caucaia');
INSERT INTO public.cidade VALUES (54, 'DF', 'Brasília');
INSERT INTO public.cidade VALUES (55, 'ES', 'Vitória');
INSERT INTO public.cidade VALUES (56, 'ES', 'Vila Velha');
INSERT INTO public.cidade VALUES (57, 'GO', 'Goiânia');
INSERT INTO public.cidade VALUES (58, 'GO', 'Anápolis');
INSERT INTO public.cidade VALUES (59, 'MA', 'São Luís');
INSERT INTO public.cidade VALUES (60, 'MA', 'Imperatriz');


--
-- TOC entry 3457 (class 0 OID 16432)
-- Dependencies: 221
-- Data for Name: condutor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.condutor VALUES (16, '12345678901');
INSERT INTO public.condutor VALUES (17, '98765432101');
INSERT INTO public.condutor VALUES (18, '45612378901');


--
-- TOC entry 3459 (class 0 OID 16445)
-- Dependencies: 223
-- Data for Name: deposito; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.deposito VALUES (1, 'Depósito 1', 'Depósito Azul', 19);
INSERT INTO public.deposito VALUES (2, 'Depósito 2', 'Depósito Verde', 20);


--
-- TOC entry 3467 (class 0 OID 16512)
-- Dependencies: 231
-- Data for Name: doacao_alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.doacao_alimento VALUES (1, 11, 10, 100.00, 16, 1);
INSERT INTO public.doacao_alimento VALUES (2, 12, 5, 150.00, 17, 2);
INSERT INTO public.doacao_alimento VALUES (3, 13, 20, 200.00, 18, 3);
INSERT INTO public.doacao_alimento VALUES (4, 14, 3, 250.00, 16, 4);
INSERT INTO public.doacao_alimento VALUES (5, 15, 18, 300.00, 17, 5);
INSERT INTO public.doacao_alimento VALUES (6, 11, 7, 350.00, 18, 6);
INSERT INTO public.doacao_alimento VALUES (7, 12, 11, 120.00, 16, 7);
INSERT INTO public.doacao_alimento VALUES (8, 13, 15, 180.00, 17, 8);
INSERT INTO public.doacao_alimento VALUES (9, 14, 2, 220.00, 18, 9);
INSERT INTO public.doacao_alimento VALUES (10, 15, 17, 260.00, 16, 10);


--
-- TOC entry 3451 (class 0 OID 16389)
-- Dependencies: 215
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estado VALUES ('SC', 'Santa Catarina');
INSERT INTO public.estado VALUES ('SP', 'São Paulo');
INSERT INTO public.estado VALUES ('PR', 'Paraná');
INSERT INTO public.estado VALUES ('RS', 'Rio Grande do Sul');
INSERT INTO public.estado VALUES ('AC', 'Acre');
INSERT INTO public.estado VALUES ('AL', 'Alagoas');
INSERT INTO public.estado VALUES ('AP', 'Amapá');
INSERT INTO public.estado VALUES ('AM', 'Amazonas');
INSERT INTO public.estado VALUES ('BA', 'Bahia');
INSERT INTO public.estado VALUES ('CE', 'Ceará');
INSERT INTO public.estado VALUES ('DF', 'Distrito Federal');
INSERT INTO public.estado VALUES ('ES', 'Espírito Santo');
INSERT INTO public.estado VALUES ('GO', 'Goiás');
INSERT INTO public.estado VALUES ('MA', 'Maranhão');


--
-- TOC entry 3465 (class 0 OID 16495)
-- Dependencies: 229
-- Data for Name: estoque_alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estoque_alimento VALUES (1, 10, '2024-12-31', 500.00, 1);
INSERT INTO public.estoque_alimento VALUES (2, 5, '2024-11-20', 300.00, 2);
INSERT INTO public.estoque_alimento VALUES (3, 20, '2025-01-15', 450.00, 1);
INSERT INTO public.estoque_alimento VALUES (4, 3, '2024-09-10', 250.00, 1);
INSERT INTO public.estoque_alimento VALUES (5, 18, '2024-10-05', 350.00, 2);
INSERT INTO public.estoque_alimento VALUES (6, 7, '2024-07-21', 150.00, 2);
INSERT INTO public.estoque_alimento VALUES (7, 11, '2025-03-30', 400.00, 1);
INSERT INTO public.estoque_alimento VALUES (8, 15, '2024-08-25', 600.00, 1);
INSERT INTO public.estoque_alimento VALUES (9, 2, '2024-06-17', 200.00, 2);
INSERT INTO public.estoque_alimento VALUES (10, 17, '2025-02-12', 550.00, 1);


--
-- TOC entry 3455 (class 0 OID 16407)
-- Dependencies: 219
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoa VALUES (11, '12345678901', 'João', 'Silva', '1990-05-15', 42, 'Centro', '12345678', 'Rua A', '123', '11', '999999999', 'joao.silva@email.com');
INSERT INTO public.pessoa VALUES (12, '98765432101', 'Maria', 'Santos', '1985-10-20', 43, 'Bairro Novo', '87654321', 'Rua B', '456', '11', '888888888', 'maria.santos@email.com');
INSERT INTO public.pessoa VALUES (13, '45612378901', 'José', 'Oliveira', '1995-02-25', 44, 'Jardim das Flores', '98765432', 'Rua C', '789', '11', '777777777', 'jose.oliveira@email.com');
INSERT INTO public.pessoa VALUES (14, '32165498701', 'Ana', 'Pereira', '1988-09-12', 45, 'Centro', '54321678', 'Rua D', '234', '11', '666666666', 'ana.pereira@email.com');
INSERT INTO public.pessoa VALUES (15, '78912365401', 'Carlos', 'Souza', '1992-12-30', 46, 'Vila Nova', '65432187', 'Rua E', '567', '11', '555555555', 'carlos.souza@email.com');
INSERT INTO public.pessoa VALUES (16, '65498732101', 'Fernanda', 'Ferreira', '1980-07-05', 47, 'Bairro Industrial', '87654321', 'Rua F', '890', '11', '444444444', 'fernanda.ferreira@email.com');
INSERT INTO public.pessoa VALUES (17, '98712365401', 'Lucas', 'Rocha', '1998-04-18', 48, 'Vila Real', '76543218', 'Rua G', '1234', '11', '333333333', 'lucas.rocha@email.com');
INSERT INTO public.pessoa VALUES (18, '32178965401', 'Mariana', 'Gomes', '1983-03-28', 49, 'Jardim América', '65432187', 'Rua H', '5678', '11', '222222222', 'mariana.gomes@email.com');
INSERT INTO public.pessoa VALUES (19, '45678912301', 'Pedro', 'Martins', '1994-11-08', 50, 'Centro', '54321876', 'Rua I', '9012', '11', '111111111', 'pedro.martins@email.com');
INSERT INTO public.pessoa VALUES (20, '98765432102', 'Laura', 'Lima', '1997-08-22', 51, 'Bairro Novo', '87654321', 'Rua J', '3456', '11', '000000000', 'laura.lima@email.com');
INSERT INTO public.pessoa VALUES (21, '11122233344', 'José', 'da Silva', '1995-03-10', 42, 'Centro', '12345678', 'Rua das Flores', '123', '11', '999999999', 'jose.silva@email.com');
INSERT INTO public.pessoa VALUES (22, '22233344455', 'Maria', 'dos Santos', '1988-07-15', 43, 'Vila Nova', '87654321', 'Avenida Principal', '456', '11', '888888888', 'maria.santos@email.com');
INSERT INTO public.pessoa VALUES (23, '33344455566', 'Paulo', 'Oliveira', '1990-11-25', 44, 'Jardim das Palmeiras', '98765432', 'Rua do Sol', '789', '11', '777777777', 'paulo.oliveira@email.com');
INSERT INTO public.pessoa VALUES (24, '44455566677', 'Ana', 'Pereira', '1985-04-18', 45, 'Centro', '54321678', 'Avenida Central', '234', '11', '666666666', 'ana.pereira@email.com');
INSERT INTO public.pessoa VALUES (25, '55566677788', 'Carlos', 'Ferreira', '1992-09-30', 46, 'Bairro Industrial', '65432187', 'Rua da Paz', '567', '11', '555555555', 'carlos.ferreira@email.com');
INSERT INTO public.pessoa VALUES (26, '66677788899', 'Fernanda', 'Martins', '1980-12-05', 47, 'Vila Real', '87654321', 'Avenida das Árvores', '890', '11', '444444444', 'fernanda.martins@email.com');
INSERT INTO public.pessoa VALUES (27, '77788899900', 'Lucas', 'Gomes', '1998-02-28', 48, 'Jardim América', '76543218', 'Rua do Campo', '1234', '11', '333333333', 'lucas.gomes@email.com');
INSERT INTO public.pessoa VALUES (28, '88899900011', 'Mariana', 'Rocha', '1983-06-10', 49, 'Centro', '65432187', 'Avenida dos Sonhos', '5678', '11', '222222222', 'mariana.rocha@email.com');
INSERT INTO public.pessoa VALUES (29, '99900011122', 'Pedro', 'Lima', '1994-10-15', 50, 'Jardim das Flores', '54321876', 'Rua do Mar', '9012', '11', '111111111', 'pedro.lima@email.com');
INSERT INTO public.pessoa VALUES (30, '00011122233', 'Laura', 'Souza', '1997-08-22', 51, 'Bairro Novo', '87654321', 'Avenida do Lago', '3456', '11', '000000000', 'laura.souza@email.com');
INSERT INTO public.pessoa VALUES (31, '10010010010', 'gustavo', 'silva', '2003-03-24', 1, 'floresta', '89233039', 'jonecir', '77', '33', '343475345', '@');


--
-- TOC entry 3456 (class 0 OID 16422)
-- Dependencies: 220
-- Data for Name: solicitante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.solicitante VALUES (11, 2);
INSERT INTO public.solicitante VALUES (12, 1);
INSERT INTO public.solicitante VALUES (13, 3);
INSERT INTO public.solicitante VALUES (14, 0);
INSERT INTO public.solicitante VALUES (15, 2);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 224
-- Name: alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alimento_id_seq', 20, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 226
-- Name: arrecadacao_alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arrecadacao_alimento_id_seq', 101, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 216
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cidade_id_seq', 60, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 222
-- Name: deposito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deposito_id_seq', 2, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 230
-- Name: doacao_alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doacao_alimento_id_seq', 1, false);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 228
-- Name: estoque_alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_alimento_id_seq', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 218
-- Name: pessoa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoa_id_seq', 31, true);


--
-- TOC entry 3286 (class 2606 OID 16466)
-- Name: alimento alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 16473)
-- Name: arrecadacao_alimento arrecadacao_alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrecadacao_alimento
    ADD CONSTRAINT arrecadacao_alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 16400)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 16438)
-- Name: condutor condutor_cnh_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condutor
    ADD CONSTRAINT condutor_cnh_key UNIQUE (cnh);


--
-- TOC entry 3282 (class 2606 OID 16436)
-- Name: condutor condutor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condutor
    ADD CONSTRAINT condutor_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 16450)
-- Name: deposito deposito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT deposito_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 16517)
-- Name: doacao_alimento doacao_alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doacao_alimento
    ADD CONSTRAINT doacao_alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 16393)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (uf);


--
-- TOC entry 3290 (class 2606 OID 16500)
-- Name: estoque_alimento estoque_alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque_alimento
    ADD CONSTRAINT estoque_alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 16416)
-- Name: pessoa pessoa_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_cpf_key UNIQUE (cpf);


--
-- TOC entry 3276 (class 2606 OID 16414)
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16426)
-- Name: solicitante solicitante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitante
    ADD CONSTRAINT solicitante_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 16474)
-- Name: arrecadacao_alimento arrecadacao_alimento_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrecadacao_alimento
    ADD CONSTRAINT arrecadacao_alimento_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES public.alimento(id);


--
-- TOC entry 3299 (class 2606 OID 16484)
-- Name: arrecadacao_alimento arrecadacao_alimento_id_condutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrecadacao_alimento
    ADD CONSTRAINT arrecadacao_alimento_id_condutor_fkey FOREIGN KEY (id_condutor) REFERENCES public.condutor(id);


--
-- TOC entry 3300 (class 2606 OID 16489)
-- Name: arrecadacao_alimento arrecadacao_alimento_id_deposito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrecadacao_alimento
    ADD CONSTRAINT arrecadacao_alimento_id_deposito_fkey FOREIGN KEY (id_deposito) REFERENCES public.deposito(id);


--
-- TOC entry 3301 (class 2606 OID 16479)
-- Name: arrecadacao_alimento arrecadacao_alimento_id_pessoa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrecadacao_alimento
    ADD CONSTRAINT arrecadacao_alimento_id_pessoa_fkey FOREIGN KEY (id_pessoa) REFERENCES public.pessoa(id);


--
-- TOC entry 3293 (class 2606 OID 16401)
-- Name: cidade cidade_uf_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_uf_estado_fkey FOREIGN KEY (uf_estado) REFERENCES public.estado(uf);


--
-- TOC entry 3296 (class 2606 OID 16439)
-- Name: condutor condutor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condutor
    ADD CONSTRAINT condutor_id_fkey FOREIGN KEY (id) REFERENCES public.pessoa(id);


--
-- TOC entry 3297 (class 2606 OID 16451)
-- Name: deposito deposito_id_pessoa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT deposito_id_pessoa_fkey FOREIGN KEY (id_pessoa) REFERENCES public.pessoa(id);


--
-- TOC entry 3304 (class 2606 OID 16523)
-- Name: doacao_alimento doacao_alimento_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doacao_alimento
    ADD CONSTRAINT doacao_alimento_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES public.alimento(id);


--
-- TOC entry 3305 (class 2606 OID 16528)
-- Name: doacao_alimento doacao_alimento_id_condutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doacao_alimento
    ADD CONSTRAINT doacao_alimento_id_condutor_fkey FOREIGN KEY (id_condutor) REFERENCES public.condutor(id);


--
-- TOC entry 3306 (class 2606 OID 16533)
-- Name: doacao_alimento doacao_alimento_id_estoque_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doacao_alimento
    ADD CONSTRAINT doacao_alimento_id_estoque_alimento_fkey FOREIGN KEY (id_estoque_alimento) REFERENCES public.estoque_alimento(id);


--
-- TOC entry 3307 (class 2606 OID 16518)
-- Name: doacao_alimento doacao_alimento_id_solicitante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doacao_alimento
    ADD CONSTRAINT doacao_alimento_id_solicitante_fkey FOREIGN KEY (id_solicitante) REFERENCES public.solicitante(id);


--
-- TOC entry 3302 (class 2606 OID 16501)
-- Name: estoque_alimento estoque_alimento_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque_alimento
    ADD CONSTRAINT estoque_alimento_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES public.alimento(id);


--
-- TOC entry 3303 (class 2606 OID 16506)
-- Name: estoque_alimento estoque_alimento_id_deposito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque_alimento
    ADD CONSTRAINT estoque_alimento_id_deposito_fkey FOREIGN KEY (id_deposito) REFERENCES public.deposito(id);


--
-- TOC entry 3294 (class 2606 OID 16417)
-- Name: pessoa pessoa_id_cidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_id_cidade_fkey FOREIGN KEY (id_cidade) REFERENCES public.cidade(id);


--
-- TOC entry 3295 (class 2606 OID 16427)
-- Name: solicitante solicitante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitante
    ADD CONSTRAINT solicitante_id_fkey FOREIGN KEY (id) REFERENCES public.pessoa(id);


-- Completed on 2024-04-18 23:38:09 -03

--
-- PostgreSQL database dump complete
--

