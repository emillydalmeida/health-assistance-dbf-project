# Sistema de Assistencia de Saude

**Projeto:** Sistema Integrado de Assistencia de Saude  
**Disciplina:** Fundamentos de Banco de Dados  
**Instituicao:** Universidade

---

## 1. Descricao do Projeto

Sistema de gerenciamento de saude desenvolvido como trabalho final da disciplina de Banco de Dados. O sistema permite a manipulacao completa de dados relacionados a atendimentos de saude, incluindo cadastro de pessoas, profissionais, consultas, prescricoes e prontuarios.

---

## 2. Funcionalidades

| Funcionalidade | Responsavel |
|----------------|-------------|
| Inclusao de dados | Jesse |
| Edicao de dados | Juan Pablo |
| Remocao de dados | Nayrana |
| Consultas com filtragem | Emilly |
| Graficos com agregacao | Emilly |

---

## 3. Estrutura do Banco de Dados

O sistema utiliza PostgreSQL com as seguintes tabelas:

- **Agencia** - Agencias de saude
- **Profissional** - Profissionais de saude
- **Familia** - Nucleos familiares
- **Endereco** - Enderecos das familias
- **Pessoa** - Pacientes cadastrados
- **UnidadeSaude** - Unidades de atendimento
- **Atendimento** - Registros de atendimentos
- **Prontuario** - Prontuarios medicos
- **Medicamento** - Medicamentos disponiveis
- **Prescricao** - Prescricoes medicas
- **Diagnostico** - Diagnosticos realizados
- **Procedimento** - Procedimentos realizados
- **Consulta** - Agendamento de consultas

---

## 4. Configuracao do Banco de Dados

### Passo a passo:

**1. Instalar PostgreSQL** (se ainda nao tiver)
- Download: https://www.postgresql.org/download/

**2. Criar o banco de dados**
```sql
CREATE DATABASE assistencia_saude;
```

**3. Executar o script de criacao das tabelas**
```bash
psql -U postgres -d assistencia_saude -f database/schema.sql
```

**4. (Opcional) Inserir dados de exemplo**
```bash
psql -U postgres -d assistencia_saude -f database/dados_exemplo.sql
```

### Configuracao de conexao no Python:
```python
DB_CONFIG = {
    'host': 'localhost',
    'port': '5432',
    'database': 'assistencia_saude',
    'user': 'postgres',
    'password': 'SUA_SENHA'
}
```

---

## 5. Tecnologias

- Python 3.x
- PostgreSQL
- psycopg2
- pandas

---

## 6. Equipe

- Emilly
- Jesse
- Juan Pablo
- Nayrana

---

*Projeto academico - Fundamentos de Banco de Dados*