create database VitaCure;
USE VitaCure;

 CREATE TABLE paciente (
 login_paciente VARCHAR(100),
 cpf VARCHAR(14),
 data_de_nascimento VARCHAR(10),
 primary key(login_paciente)
);

 
 CREATE TABLE medico (
 crm VARCHAR(50),
 login_medico VARCHAR(50),
 nome VARCHAR(50),
 email_profissional VARCHAR(50),
 cpf VARCHAR(14),
 contrato VARCHAR(50),
 primary key(login_medico)
 );
 
 CREATE TABLE recepcionista (
 email_recepcao VARCHAR (50),
 login_recepcionista VARCHAR(50),
 nome VARCHAR(50),
 email_profissional VARCHAR(50),
 cpf VARCHAR(14),
 contrato VARCHAR(50),
 primary key(login_recepcionista)
 );
 
 CREATE TABLE farmaceutico (
 email_farmacia VARCHAR (50),
 login_farmaceutico VARCHAR(50),
 nome VARCHAR(50),
 email_profissional VARCHAR(50),
 cpf VARCHAR(14),
 contrato VARCHAR(50),
 primary key(login_farmaceutico)
 );
 
 CREATE TABLE consulta (
 FK_login_paciente VARCHAR (50),
 FK_login_medico VARCHAR (50),
 FOREIGN KEY (FK_login_paciente) REFERENCES paciente (login_paciente),
 FOREIGN KEY (FK_login_medico) REFERENCES medico (login_medico),
 data VARCHAR (10),
 horario VARCHAR (5),
 numero_da_consulta VARCHAR (50),
 PRIMARY KEY (FK_login_medico, FK_login_paciente)
 );
 
 
INSERT INTO paciente(login_paciente, cpf, data_de_nascimento)
VALUES('josedasilva.paciente', '123.456.789-12', '01/04/1964'),
('carlossantos.paciente', '129.876.543-21', '11/05/2006'),
('anapereira.paciente', '123.321.210-35', '31/10/1986');

INSERT INTO medico(crm, login_medico, nome, email_profissional, cpf, contrato)
VALUES ('Ele(a),tem a documentação em dia :)', 'Pedro.medico', 'Pedro Souza', 'pedro.medico@gmail.com','761.200.278-12', 'Contratado(a) pela empresa VitaCure'),
       ('Ele(a),tem a documentação em dia :)', 'Sergio.medico', 'Sergio Vandré', 'sergio.medico@gmail.com','802.575.439-96', 'Contratado(a) pela empresa VitaCure'),
       ('Ele(a),tem a documentação em dia :)', 'Monica.medico', 'Monica Teixeira', 'monica.medico@gmail.com','478.586.981-72', 'Contratado(a) pela empresa VitaCure');



INSERT INTO recepcionista (email_recepcao, login_recepcionista, nome, email_profissional, cpf, contrato)
VALUES('recepcao@vitacure.com', 'felipe.recepcao', 'Felipe Andrade', 'felipe.recepcionista@gmail.com', '353.470.671-52', 'Contratado(a) pela empresa VitaCure'),
('recepcao@vitacure.com', 'vitor.recepcao', 'Vitor Ferreira', 'vitor.recepcionista@gmail.com', '606.604.019-67', 'Contratado(a) pela empresa VitaCure'),
('recepcao@vitacure.com', 'vitoria.recepcao', 'Vitoria Lima', 'vitoria.recepcionista@gmail.com', '486.954.032-33', 'Contratado(a) pela empresa VitaCure');

INSERT INTO farmaceutico (email_farmacia, login_farmaceutico, nome, email_profissional, cpf, contrato)
VALUES ('farmacia@vitacure.com', 'roberto.farmaceutico', 'Roberto Farias', 'roberto.farmaceutico@gmail.com', '865.331.237-21', 'Contratado(a) pela empresa VitaCure'),
('farmacia@vitacure.com', 'rebeca.farmaceutico', 'Rebeca Santos', 'rebeca.farmaceutico@gmail.com', '677.980.645-84', 'Contratado(a) pela empresa VitaCure'),
('farmacia@vitacure.com', 'roberta.farmaceutico', 'Roberta Cecilia', 'roberta.farmaceutico@gmail.com', '911.668.592-19', 'Contratado(a) pela empresa VitaCure');

INSERT INTO consulta (FK_login_paciente, FK_login_medico, data, horario, numero_da_consulta)
VALUES ('josedasilva.paciente', 'Pedro.medico', '27/10/2069', '14:00', '394-A');

