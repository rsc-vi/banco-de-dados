#CHAT

INSERT INTO assistente (id, perguntas, respostas, FK_login_paciente)  VALUES
(5000, 'Como posso mudar minha senha de login?', 'Na tela de login, pressione “esqueci a senha” confirme seu email e, em seguida  digite uma nova senha e confirme', 
(SELECT login FROM paciente WHERE nome = 'Rebeca')
);


#-------------------------------------------------------------------------------------------------------

#TELA INICIAL


#-------------------------------------------------------------------------------------------------------


#CADASTRAR
INSERT INTO paciente (nome, login, cpf, foto, data_de_nascimento, rg, telefone, endereco, id, bairro, Cidade, Estado, Email) VALUES
('Rebeca Caetano dos Santos', 'RebecaCaetao', '123.456.789-01', '----', '--------- ', '777777-7', '+55 (82) 99999-9999', 'Rua Luiz Holanda Cavalcante', 'Maragogi', 'Alagoas', 'rcs43@aluno.ifal.edu.br' );

#LOGIN
SELECT * FROM paciente WHERE login ="RebecaCaetano" AND senha = "23456";



#----------------------------------------------------------------------------------------------

#Esqueci a senha

SELECT senha FROM paciente WHERE email = 'Rebecacaetano@gmail.com';
UPDATE paciente
SET senha = 105590;

#----------------------------------------------------------------------------------------------

#PERFIL DO MÉDICO

SELECT * FROM medico WHERE nome = 'José Eduardo Vicente lima';

#----------------------------------------------------------------------------------------------

#PERFIL DO PACIENTE

SELECT * FROM paciente;

#----------------------------------------------------------------------------------------------

#Atualizar dados do paciente

UPDATE paciente
SET nome = 'Rebeca Caetano dos Santos';
SET email = 'rcs43@aluno.ifal.edu.br';
SET telefone = '+55 (82) 99999-9999';
SET rua = 'Luiz Holanda Cavalcante';
SET cidade = 'Maragogi';
SET estado = 'Alagoas';
SET rg = 777777-7;
SET cpf = '123.456.789-01';
SET id = 202567801;
SET login = 'RebecaCaetano';
SET senha =  23456;

#----------------------------------------------------------------------------------------------
#ATESTADO

SELECT consulta FROM atestado WHERE data = '10/09/2023';

#----------------------------------------------------------------------------------------------
#CHAMADA DE EMERGÊNCIA

SELECT telefone from paciente WHERE nome = 'Rebeca Caetano dos Santos';
SELECT telefone from clinica WHERE nome = 'Clinica José Bonifácio';

#----------------------------------------------------------------------------------------------
#CHAMADA PARA A FARMÁCIA

SELECT telefone from paciente WHERE nome = 'Rebeca Caetano dos Santos';
SELECT telefone from clinica WHERE nome = 'Drogaria Popular';

#----------------------------------------------------------------------------------------------
#LOCALIZAÇÃO FARMACIA

SELECT endereco FROM farmacia WHERE nome = 'Farmacia Permanente';

#----------------------------------------------------------------------------------------------
#FARMACIA FAZER PEDIDO

SELECT * FROM medicamento;

#----------------------------------------------------------------------------------------------
#IFOOD FARMACIA

SELECT preco FROM medicamento;
SELECT endereco FROM paciente WHERE nome = 'Rebeca Caetano dos Santos'
