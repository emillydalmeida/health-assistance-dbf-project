select * from atendimento;
select * from consulta;
select * from pessoa;
select * from agencia;
select * from prescricao;
select * from profissional;

TRUNCATE TABLE pessoa cascade;
TRUNCATE TABLE pessoa RESTART IDENTITY CASCADE;
TRUNCATE TABLE profissional RESTART IDENTITY CASCADE;

