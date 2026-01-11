-- ============================================
-- DADOS DE EXEMPLO: assistencia_saude
-- Execute APÓS criar as tabelas (schema.sql)
-- ============================================

-- AGENCIAS
INSERT INTO Agencia (nome, telefone, email, endereco) VALUES 
('UBS Centro', '11-3333-1111', 'ubs.centro@saude.gov', 'Rua Principal, 100'),
('UBS Norte', '11-3333-2222', 'ubs.norte@saude.gov', 'Av. Norte, 500'),
('Hospital Municipal', '11-3333-3333', 'hospital@saude.gov', 'Rua Hospital, 1000');

-- PROFISSIONAIS
INSERT INTO Profissional (agencia_id, nome, cpf, telefone, email, especialidade) VALUES 
(1, 'Dr. Carlos Silva', '111.111.111-11', '11-99999-1111', 'carlos@email.com', 'Clinico Geral'),
(1, 'Dra. Ana Santos', '222.222.222-22', '11-99999-2222', 'ana@email.com', 'Pediatra'),
(2, 'Dr. Pedro Oliveira', '333.333.333-33', '11-99999-3333', 'pedro@email.com', 'Cardiologista'),
(3, 'Dra. Maria Costa', '444.444.444-44', '11-99999-4444', 'maria@email.com', 'Ginecologista');

-- FAMILIAS
INSERT INTO Familia (codigo_familiar, responsavel, situacao_vulnerabilidade) VALUES 
('FAM001', 'Joao da Silva', 'Baixa renda'),
('FAM002', 'Maria Oliveira', 'Extrema pobreza'),
('FAM003', 'Carlos Santos', 'Baixa renda');

-- ENDERECOS
INSERT INTO Endereco (familia_id, logradouro, numero, bairro, cidade, estado, cep) VALUES 
(1, 'Rua das Flores', '123', 'Centro', 'Sao Paulo', 'SP', '01000-000'),
(2, 'Av. Brasil', '456', 'Jardim', 'Sao Paulo', 'SP', '02000-000'),
(3, 'Rua Nova', '789', 'Vila Nova', 'Sao Paulo', 'SP', '03000-000');

-- PESSOAS
INSERT INTO Pessoa (familia_id, nome, cpf, data_nascimento, sexo, gestante, deficiencia, telefone) VALUES 
(1, 'Joao da Silva', '123.456.789-01', '1980-05-15', 'M', FALSE, NULL, '11-98888-1111'),
(1, 'Ana Silva', '123.456.789-02', '1985-03-20', 'F', TRUE, NULL, '11-98888-1112'),
(2, 'Maria Oliveira', '234.567.890-01', '1975-08-10', 'F', FALSE, NULL, '11-98888-2222'),
(2, 'Pedro Oliveira', '234.567.890-02', '2010-12-01', 'M', FALSE, NULL, '11-98888-2223'),
(3, 'Carlos Santos', '345.678.901-01', '1990-01-25', 'M', FALSE, 'Visual', '11-98888-3333'),
(3, 'Julia Santos', '345.678.901-02', '1992-07-30', 'F', TRUE, NULL, '11-98888-3334');

-- UNIDADES DE SAUDE
INSERT INTO UnidadeSaude (nome, tipo, endereco) VALUES 
('UBS Centro', 'UBS', 'Rua Principal, 100'),
('UBS Norte', 'UBS', 'Av. Norte, 500'),
('Hospital Municipal', 'Hospital', 'Rua Hospital, 1000'),
('Clinica Popular', 'Clinica', 'Rua Comercio, 200');

-- MEDICAMENTOS
INSERT INTO Medicamento (nome, principio_ativo) VALUES 
('Paracetamol 500mg', 'Paracetamol'),
('Amoxicilina 500mg', 'Amoxicilina'),
('Omeprazol 20mg', 'Omeprazol'),
('Losartana 50mg', 'Losartana'),
('Metformina 850mg', 'Metformina');

-- CONSULTAS
INSERT INTO Consulta (pessoa_id, profissional_id, data_consulta, hora_consulta, tipo_consulta) VALUES 
(1, 1, '2025-01-10', '08:00', 'Rotina'),
(2, 4, '2025-01-11', '09:30', 'Pre-natal'),
(3, 1, '2025-01-12', '10:00', 'Retorno'),
(4, 2, '2025-01-13', '14:00', 'Pediatrica'),
(5, 3, '2025-01-14', '15:30', 'Cardiologia'),
(6, 4, '2025-01-15', '16:00', 'Pre-natal'),
(1, 3, '2025-02-01', '08:30', 'Cardiologia'),
(2, 4, '2025-02-10', '10:00', 'Pre-natal');

-- ATENDIMENTOS
INSERT INTO Atendimento (pessoa_id, profissional_id, unidade_saude_id, data_atendimento, tipo_atendimento, descricao) VALUES 
(1, 1, 1, '2025-01-10', 'Consulta', 'Paciente com dor de cabeca'),
(2, 4, 1, '2025-01-11', 'Pre-natal', 'Acompanhamento gestacional'),
(3, 1, 2, '2025-01-12', 'Retorno', 'Retorno para ver exames'),
(4, 2, 2, '2025-01-13', 'Emergencia', 'Febre alta'),
(5, 3, 3, '2025-01-14', 'Consulta', 'Avaliacao cardiologica');

-- PRESCRICOES
INSERT INTO Prescricao (pessoa_id, profissional_id, medicamento_id, data_prescricao, dosagem, frequencia, instrucoes) VALUES 
(1, 1, 1, '2025-01-10', '500mg', '8 em 8 horas', 'Tomar por 5 dias'),
(4, 2, 1, '2025-01-13', '250mg', '6 em 6 horas', 'Tomar por 3 dias'),
(5, 3, 4, '2025-01-14', '50mg', '1 vez ao dia', 'Uso continuo'),
(3, 1, 3, '2025-01-12', '20mg', '1 vez ao dia', 'Tomar em jejum'),
(6, 4, 2, '2025-01-15', '500mg', '12 em 12 horas', 'Tomar por 7 dias');

-- DIAGNOSTICOS
INSERT INTO Diagnostico (pessoa_id, descricao, data_diagnostico) VALUES 
(1, 'Cefaleia tensional', '2025-01-10'),
(4, 'Infeccao viral', '2025-01-13'),
(5, 'Hipertensao arterial', '2025-01-14'),
(3, 'Gastrite', '2025-01-12');

-- PRONTUARIOS
INSERT INTO Prontuario (pessoa_id, profissional_id, data_registro, historico, observacoes) VALUES 
(1, 1, '2025-01-10', 'Primeira consulta - queixa de dor de cabeca frequente', 'Solicitar exames'),
(5, 3, '2025-01-14', 'Paciente com historico familiar de hipertensao', 'Iniciar tratamento'),
(3, 1, '2025-01-12', 'Paciente com desconforto estomacal', 'Dieta leve');

-- PROCEDIMENTOS
INSERT INTO Procedimento (atendimento_id, descricao) VALUES 
(1, 'Aferir pressao arterial'),
(2, 'Exame de ultrassom'),
(4, 'Administrar antitermico'),
(5, 'Eletrocardiograma');
