# Liste todas as consultas para um determinado médico em um determinado dia
  
# Liste todas as consultas que um determinado paciente foi em um determinado médico

# Quais remédios um determinado paciente usou no corrente ano

# Quais médicos demartologistas atendem na terça-feira

# Quais farmacias possuem paracetamol


RESPOSTAS DAS 5 QUESTÕES:


# Liste todas as consultas para um determinado médico em um determinado dia

SELECT c.*
FROM consulta c
JOIN medico_paciente_consulta mpc ON c.numero_da_consulta = mpc.FK_numero_da_consulta
JOIN medico m ON mpc.FK_login_medico = m.login
WHERE m.login = 'gh3456@G' AND c.data = '2023-06-11';

#-------------------------------------------------------------------------------------


# Liste todas as consultas que um determinado paciente foi em um determinado médico


SELECT consulta.*
FROM medico_paciente_consulta
JOIN consulta ON medico_paciente_consulta.FK_numero_da_consulta = consulta.numero_da_consulta
WHERE medico_paciente_consulta.FK_login_paciente = 'ab1234@A' AND medico_paciente_consulta.FK_login_medico = 'ef9012@F';



#-------------------------------------------------------------------------------------

# Quais remédios um determinado paciente usou no corrente ano


SELECT m.nome
FROM paciente p
JOIN medico_paciente_consulta mpc ON p.login = mpc.FK_login_paciente
JOIN consulta c ON mpc.FK_numero_da_consulta = c.numero_da_consulta
JOIN prescricao pr ON c.numero_da_consulta = pr.FK_numero_da_consulta
JOIN medicamento m ON pr.id = m.numero_cas
WHERE p.login = 'ab1234@A' 
AND YEAR(c.data) = 2023
AND m.numero_cas = '15687-27-1';

#-------------------------------------------------------------------------------------

# Quais médicos demartologistas atendem na terça-feira

SELECT DISTINCT m.nome
FROM medico m
JOIN medico_expediente_clinica mec ON m.login = mec.FK_login_medico
JOIN expediente e ON mec.FK_id_expediente = e.id
WHERE e.dias = 'Terça'
AND m.especializacao = 'Dermatologista';


#-------------------------------------------------------------------------------------

# Quais farmacias possuem paracetamol

SELECT f.nome
FROM farmacia f
JOIN farmacia_medicamento fm ON f.cnpj = fm.FK_cnpj_farmacia
JOIN medicamento m ON fm.FK_numero_cas_medicamento = m.numero_cas
WHERE m.nome = 'Paracetamol';


#-------------------------------------------------------------------------------------
