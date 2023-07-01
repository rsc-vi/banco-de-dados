#1ª Query - Filtrar emails profissionais dos médicos
SELECT nome FROM medico WHERE email_profissional LIKE '%.medico%';


#2ª Query - Selecionar um paciente em específico
SELECT data_de_nascimento FROM paciente WHERE cpf = '123.456.789-12';

#3ª Query - Descobrir o número da consulta através do login do paciente

SELECT  numero_da_consulta FROM consulta WHERE FK_login_medico = 'Pedro.medico';

#4ª Query - Apresentar o CPF dos pacientes nascidos em 1964 e 1986

SELECT cpf FROM paciente WHERE data_de_nascimento LIKE '%/1964' OR data_de_nascimento LIKE '%/1986';

#5ª Query - Quantidade de médicos com o CRM em dia

SELECT COUNT(*) FROM medico WHERE crm = 'Ele(a),tem a documentação em dia :)';

#6ª Query - CPF de quantidade de clientes que não tenham 59 anos
SELECT COUNT(*) FROM paciente WHERE data_de_nascimento NOT LIKE '%/1964';

#7ª Query - Mostrar o login do recepcionista a partir de seu CPF
SELECT login_recepcionista FROM recepcionista WHERE cpf = '486.954.032-33';

#8ª Query - Identificar o médico, a partir do número da consulta
SELECT FK_login_medico FROM consulta WHERE numero_da_consulta = '394-A';

#9ª Query - Visualizar a data da consulta a partir do número da consulta
SELECT data FROM consulta WHERE numero_da_consulta = '394-A';

#10ª Query - Visualizar o horário da consulta a partir do número da consulta
SELECT horario FROM consulta WHERE numero_da_consulta = '394-A';

#11ª Query - Quantidade de médicos sem a documentação em dia 
SELECT COUNT(*) FROM medico WHERE crm NOT LIKE 'Ele(a),tem a documentação em dia :)';

#12ª Query - Quantidade de farmaceuticos com contrato na vitacure
SELECT COUNT(*) FROM farmaceutico WHERE contrato LIKE 'Contratado(a) pela empresa VitaCure';