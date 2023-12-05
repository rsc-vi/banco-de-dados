CREATE DATABASE VITACURE;
USE VITACURE;

CREATE TABLE paciente (
    nome VARCHAR(120) NOT NULL,
    login VARCHAR(50) UNIQUE,
    cpf VARCHAR(15) UNIQUE,
    foto VARCHAR(100),
    data_de_nascimento VARCHAR(10),
    rg INT UNIQUE,
    telefone VARCHAR (19),
    endereco VARCHAR (100),
    Senha INT,
    ID INT,
    bairro VARCHAR(100),
    Cidade VARCHAR(100),
    Estado VARCHAR(50),
    Email VARCHAR(100),
    PRIMARY KEY(login)
);

CREATE TABLE clinica (
    foto VARCHAR(100),
    nome VARCHAR(120) NOT NULL,
    cnpj VARCHAR(19),
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR (13),
    PRIMARY KEY(cnpj)
);

CREATE TABLE notificacoes (
    hora VARCHAR(5) NOT NULL,
    data DATE NOT NULL,
    id INT,
    PRIMARY KEY(id)
);

CREATE TABLE medico (
    nome VARCHAR(120) NOT NULL,
    login VARCHAR(50) UNIQUE,
    cpf VARCHAR(15) UNIQUE,
    email VARCHAR(100),
    foto VARCHAR(100) NOT NULL,
    crm INT UNIQUE NOT NULL,
    contrato VARCHAR(100) NOT NULL,
    especializacao VARCHAR(50) NOT NULL,
    rg INT UNIQUE,
    PRIMARY KEY(login)
);

CREATE TABLE farmacia (
    cnpj VARCHAR(19),
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    login VARCHAR(50) UNIQUE,
    PRIMARY KEY(cnpj)
);

CREATE TABLE expediente (
    dias VARCHAR(100),
    horario_inicio VARCHAR(5) NOT NULL,
    horario_fim VARCHAR(5) NOT NULL,
    id INT,
    PRIMARY KEY(id)
);

CREATE TABLE farmaceutico (
    cpf VARCHAR(15) NOT NULL UNIQUE,
    contrato VARCHAR(100) NOT NULL,
    crm INT UNIQUE NOT NULL,
    login VARCHAR(50) UNIQUE,
    FK_cnpj_farmacia VARCHAR(19),
    FOREIGN KEY(FK_cnpj_farmacia) REFERENCES farmacia(cnpj),
    PRIMARY KEY(login, FK_cnpj_farmacia)
);

CREATE TABLE medicamento (
    numero_cas VARCHAR(30),
    nome VARCHAR(120) NOT NULL,
    preco INT NOT NULL,
    foto VARCHAR(100),
    quantidade INT NOT NULL,
    PRIMARY KEY(numero_cas)
);

CREATE TABLE consulta (
    numero_da_consulta INT,
    horario INT NOT NULL,
    atestado VARCHAR(100),
    data DATE NOT NULL,
    FK_numero_cas_medicamento VARCHAR(30),
    PRIMARY KEY(numero_da_consulta),
    FOREIGN KEY(FK_numero_cas_medicamento) REFERENCES medicamento(numero_cas)
);

CREATE TABLE assistente (
id INT,
perguntas VARCHAR (100),
respostas VARCHAR (200),
FK_login_paciente VARCHAR (50),
FOREIGN KEY (FK_login_paciente) REFERENCES paciente (login),
PRIMARY KEY(id, FK_login_paciente)

);

CREATE TABLE paciente_clinica (
    FK_login_paciente VARCHAR(50),
    FK_cnpj_clinica VARCHAR(19),
    FOREIGN KEY(FK_cnpj_clinica) REFERENCES clinica(cnpj),
    FOREIGN KEY(FK_login_paciente) REFERENCES paciente(login),
    PRIMARY KEY(FK_login_paciente, FK_cnpj_clinica)
);

CREATE TABLE paciente_notificacoes (
    FK_login_paciente VARCHAR(50),
    FK_id_notificacoes INT,
    FOREIGN KEY(FK_login_paciente) REFERENCES paciente(login),
    FOREIGN KEY(FK_id_notificacoes) REFERENCES notificacoes(id),
    PRIMARY KEY(FK_login_paciente, FK_id_notificacoes)
);

CREATE TABLE medico_notificacoes (
    FK_login_medico VARCHAR(50),
    FK_id_notificacoes INT,
    FOREIGN KEY(FK_login_medico) REFERENCES medico(login),
    FOREIGN KEY(FK_id_notificacoes) REFERENCES notificacoes(id),
    PRIMARY KEY(FK_login_medico, FK_id_notificacoes)
);

CREATE TABLE farmacia_notificacoes (
    FK_cnpj_farmacia VARCHAR(19),
    FK_id_notificacoes INT,
    FOREIGN KEY(FK_cnpj_farmacia) REFERENCES farmacia(cnpj),
    FOREIGN KEY(FK_id_notificacoes) REFERENCES notificacoes(id),
    PRIMARY KEY(FK_cnpj_farmacia, FK_id_notificacoes)
);

CREATE TABLE farmacia_medicamento (
    FK_cnpj_farmacia VARCHAR(19),
    FK_numero_cas_medicamento VARCHAR(30),
    FOREIGN KEY(FK_cnpj_farmacia) REFERENCES farmacia(cnpj),
    FOREIGN KEY(FK_numero_cas_medicamento) REFERENCES medicamento(numero_cas),
    PRIMARY KEY(FK_cnpj_farmacia, FK_numero_cas_medicamento)
);

CREATE TABLE medico_expediente_clinica (
    FK_cnpj_clinica VARCHAR(19),
    FK_id_expediente INT,
    FK_login_medico VARCHAR(50),
    rg INT,
    FOREIGN KEY(FK_cnpj_clinica) REFERENCES clinica(cnpj),
    FOREIGN KEY(FK_id_expediente) REFERENCES expediente(id),
    FOREIGN KEY(FK_login_medico) REFERENCES medico(login),
    PRIMARY KEY(FK_login_medico, FK_id_expediente, FK_cnpj_clinica)
);

CREATE TABLE medico_paciente_consulta (
	receita VARCHAR (100),
    FK_login_medico VARCHAR(50),
    FK_login_paciente VARCHAR(50),
    FK_numero_da_consulta INT,
    PRIMARY KEY(FK_login_medico, FK_login_paciente, FK_numero_da_consulta),
    FOREIGN KEY(FK_login_medico) REFERENCES medico(login),
    FOREIGN KEY(FK_login_paciente) REFERENCES paciente(login),
    FOREIGN KEY(FK_numero_da_consulta) REFERENCES consulta(numero_da_consulta)
);

CREATE TABLE prescricao (
    id INT,
    descricao VARCHAR(255),
    data DATE,
    FK_numero_da_consulta INT,
    PRIMARY KEY(id),
    FOREIGN KEY(FK_numero_da_consulta) REFERENCES consulta(numero_da_consulta)
);
