// npm install mysql2 sequelize


const { Sequelize, DataTypes } = require('sequelize');

const sequelize = new Sequelize('VITACURE', 'Davi', '123', {
  host: 'localhost',
  dialect: 'mysql',
});

const Paciente = sequelize.define('Paciente', {
  nome: { type: DataTypes.STRING(120), allowNull: false },
  login: { type: DataTypes.STRING(50), allowNull: false, unique: true, primaryKey: true },
  cpf: { type: DataTypes.STRING(15), allowNull: false, unique: true },
  foto: DataTypes.STRING(100),
  data_de_nascimento: DataTypes.STRING(10),
  rg: { type: DataTypes.INTEGER, allowNull: false, unique: true },
  telefone: DataTypes.STRING(19),
  endereco: DataTypes.STRING(100),
  Senha: DataTypes.INTEGER,
  ID: DataTypes.INTEGER,
  bairro: DataTypes.STRING(100),
  Cidade: DataTypes.STRING(100),
  Estado: DataTypes.STRING(50),
  Email: DataTypes.STRING(100),
});

const Clinica = sequelize.define('Clinica', {
  foto: DataTypes.STRING(100),
  nome: { type: DataTypes.STRING(120), allowNull: false },
  cnpj: { type: DataTypes.STRING(19), allowNull: false, unique: true, primaryKey: true },
  endereco: { type: DataTypes.STRING(100), allowNull: false },
  telefone: DataTypes.STRING(13),
});

const Notificacoes = sequelize.define('Notificacoes', {
  hora: { type: DataTypes.STRING(5), allowNull: false },
  data: { type: DataTypes.DATE, allowNull: false },
  id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
});

const Medico = sequelize.define('Medico', {
  nome: { type: DataTypes.STRING(120), allowNull: false },
  login: { type: DataTypes.STRING(50), allowNull: false, unique: true, primaryKey: true },
  cpf: { type: DataTypes.STRING(15), allowNull: false, unique: true },
  email: DataTypes.STRING(100),
  foto: { type: DataTypes.STRING(100), allowNull: false },
  crm: { type: DataTypes.INTEGER, allowNull: false, unique: true },
  contrato: { type: DataTypes.STRING(100), allowNull: false },
  especializacao: { type: DataTypes.STRING(50), allowNull: false },
  rg: { type: DataTypes.INTEGER, allowNull: false, unique: true },
});

const Farmacia = sequelize.define('Farmacia', {
  cnpj: { type: DataTypes.STRING(19), allowNull: false, unique: true, primaryKey: true },
  nome: { type: DataTypes.STRING(120), allowNull: false },
  email: { type: DataTypes.STRING(100), allowNull: false },
  telefone: { type: DataTypes.STRING(10), allowNull: false },
  login: { type: DataTypes.STRING(50), allowNull: false, unique: true },
});

const Expediente = sequelize.define('Expediente', {
  dias: DataTypes.STRING(100),
  horario_inicio: { type: DataTypes.STRING(5), allowNull: false },
  horario_fim: { type: DataTypes.STRING(5), allowNull: false },
  id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
});

const Farmaceutico = sequelize.define('Farmaceutico', {
  cpf: { type: DataTypes.STRING(15), allowNull: false, unique: true },
  contrato: { type: DataTypes.STRING(100), allowNull: false },
  crm: { type: DataTypes.INTEGER, allowNull: false, unique: true },
  login: { type: DataTypes.STRING(50), allowNull: false, unique: true },
});

const Medicamento = sequelize.define('Medicamento', {
  numero_cas: { type: DataTypes.STRING(30), allowNull: false, primaryKey: true },
  nome: { type: DataTypes.STRING(120), allowNull: false },
  preco: { type: DataTypes.INTEGER, allowNull: false },
  foto: DataTypes.STRING(100),
  quantidade: { type: DataTypes.INTEGER, allowNull: false },
});

const Consulta = sequelize.define('Consulta', {
  numero_da_consulta: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
  horario: { type: DataTypes.INTEGER, allowNull: false },
  atestado: DataTypes.STRING(100),
  data: { type: DataTypes.DATE, allowNull: false },
});

const Assistente = sequelize.define('Assistente', {
  id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
  perguntas: { type: DataTypes.STRING(100), allowNull: false },
  respostas: { type: DataTypes.STRING(200), allowNull: false },
  FK_login_paciente: { type: DataTypes.STRING(50), allowNull: false },
});

const PacienteClinica = sequelize.define('PacienteClinica', {
  FK_login_paciente: { type: DataTypes.STRING(50), allowNull: false, primaryKey: true },
  FK_cnpj_clinica: { type: DataTypes.STRING(19), allowNull: false, primaryKey: true },
});

const PacienteNotificacoes = sequelize.define('PacienteNotificacoes', {
  FK_login_paciente: { type: DataTypes.STRING(50), allowNull: false, primaryKey: true },
  FK_id_notificacoes: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
});

const MedicoNotificacoes = sequelize.define('MedicoNotificacoes', {
  FK_login_medico: { type: DataTypes.STRING(50), allowNull: false, primaryKey: true },
  FK_id_notificacoes: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
});

const FarmaciaNotificacoes = sequelize.define('FarmaciaNotificacoes', {
  FK_cnpj_farmacia: { type: DataTypes.STRING(19), allowNull: false, primaryKey: true },
  FK_id_notificacoes: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
});

const FarmaciaMedicamento = sequelize.define('FarmaciaMedicamento', {
  FK_cnpj_farmacia: { type: DataTypes.STRING(19), allowNull: false, primaryKey: true },
  FK_numero_cas_medicamento: { type: DataTypes.STRING(30), allowNull: false, primaryKey: true },
});

const MedicoExpedienteClinica = sequelize.define('MedicoExpedienteClinica', {
  FK_cnpj_clinica: { type: DataTypes.STRING(19), allowNull: false, primaryKey: true },
  FK_id_expediente: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
  FK_login_medico: { type: DataTypes.STRING(50), allowNull: false, primaryKey: true },
  rg: { type: DataTypes.INTEGER, allowNull: false },
});

const MedicoPacienteConsulta = sequelize.define('MedicoPacienteConsulta', {
  receita: DataTypes.STRING(100),
  FK_login_medico: { type: DataTypes.STRING(50), allowNull: false, primaryKey: true },
  FK_login_paciente: { type: DataTypes.STRING(50), allowNull: false, primaryKey: true },
  FK_numero_da_consulta: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
});

const Prescricao = sequelize.define('Prescricao', {
    id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
  descricao: { type: DataTypes.STRING(200), allowNull: false },
  data: { type: DataTypes.DATE, allowNull: false },
});


Paciente.belongsToMany(Clinica, { through: PacienteClinica, foreignKey: 'FK_login_paciente' });
Clinica.belongsToMany(Paciente, { through: PacienteClinica, foreignKey: 'FK_cnpj_clinica' });

Paciente.belongsToMany(Notificacoes, { through: PacienteNotificacoes, foreignKey: 'FK_login_paciente' });
Notificacoes.belongsToMany(Paciente, { through: PacienteNotificacoes, foreignKey: 'FK_id_notificacoes' });

Medico.belongsToMany(Notificacoes, { through: MedicoNotificacoes, foreignKey: 'FK_login_medico' });
Notificacoes.belongsToMany(Medico, { through: MedicoNotificacoes, foreignKey: 'FK_id_notificacoes' });

Farmacia.belongsToMany(Notificacoes, { through: FarmaciaNotificacoes, foreignKey: 'FK_cnpj_farmacia' });
Notificacoes.belongsToMany(Farmacia, { through: FarmaciaNotificacoes, foreignKey: 'FK_id_notificacoes' });

Farmacia.belongsToMany(Medicamento, { through: FarmaciaMedicamento, foreignKey: 'FK_cnpj_farmacia' });
Medicamento.belongsToMany(Farmacia, { through: FarmaciaMedicamento, foreignKey: 'FK_numero_cas_medicamento' });

Medico.belongsToMany(Expediente, { through: MedicoExpedienteClinica, foreignKey: 'FK_login_medico' });
Expediente.belongsToMany(Medico, { through: MedicoExpedienteClinica, foreignKey: 'FK_id_expediente' });
Clinica.belongsToMany(Expediente, { through: MedicoExpedienteClinica, foreignKey: 'FK_cnpj_clinica' });

Medico.belongsToMany(Paciente, { through: MedicoPacienteConsulta, foreignKey: 'FK_login_medico' });
Paciente.belongsToMany(Medico, { through: MedicoPacienteConsulta, foreignKey: 'FK_login_paciente' });
Consulta.belongsToMany(Medico, { through: MedicoPacienteConsulta, foreignKey: 'FK_numero_da_consulta' });


sequelize.sync({ force: true }).then(() => {
  console.log('Banco de dados sincronizado');
}).catch((err) => {
  console.error('Erro ao sincronizar o banco de dados:', err);
});
