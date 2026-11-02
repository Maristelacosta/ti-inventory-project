# 🖥️ Sistema de Gestão de Ativos de TI (IT Asset Management)

## 📋 Sobre o Projeto

O Sistema de Gestão de Ativos de TI foi desenvolvido para apoiar o gerenciamento, controle e rastreabilidade dos recursos tecnológicos de uma organização.

A solução permite o cadastro, acompanhamento e monitoramento de equipamentos, usuários, movimentações, manutenções e chamados técnicos, contribuindo para a governança de TI e controle patrimonial.

---

## 🎯 Objetivos

- Gerenciar ativos tecnológicos da organização.
- Controlar o ciclo de vida dos equipamentos.
- Registrar manutenções preventivas e corretivas.
- Controlar movimentações entre setores.
- Gerenciar chamados de suporte.
- Disponibilizar informações para tomada de decisão.
- Apoiar processos de Governança de TI.

---

## 🏗️ Arquitetura da Solução

O sistema foi projetado para centralizar o gerenciamento dos ativos tecnológicos em uma única plataforma.

### Módulos

- Gestão de Ativos
- Gestão de Usuários
- Gestão de Manutenções
- Gestão de Movimentações
- Gestão de Chamados
- Relatórios Gerenciais

---

## 👥 Atores do Sistema

### Administrador

Responsável pelo gerenciamento completo do sistema.

### Técnico de TI

Responsável pela manutenção e atualização dos ativos.

### Colaborador

Usuário associado aos equipamentos ativos.

---

## ✅ Funcionalidades

- Login de usuários
- Cadastro de ativos
- Atualização de ativos
- Exclusão de ativos
- Consulta de ativos
- Cadastro de usuários
- Alocação de equipamentos
- Controle de movimentações
- Registro de manutenções
- Histórico de alterações
- Gestão de chamados
- Emissão de relatórios

---

## 🏛️ Diagrama de Casos de Uso

```mermaid
flowchart LR

    Admin[Administrador]
    Tecnico[Técnico de TI]
    Usuario[Colaborador]

    Login((Login))
    CadastroAtivo((Cadastrar Ativo))
    EditarAtivo((Editar Ativo))
    ConsultarAtivo((Consultar Ativo))
    ExcluirAtivo((Excluir Ativo))
    AlocarAtivo((Alocar Ativo ao Colaborador))

    CadastroUsuario((Cadastrar Usuário))
    GerarRelatorio((Gerar Relatórios))

    Manutencao((Registrar Manutenção))
    Movimentacao((Registrar Movimentação))
    AtualizarStatus((Atualizar Status))

    ConsultarEquipamento((Consultar Equipamentos))
    SolicitarSuporte((Solicitar Suporte))

    Admin --> Login
    Admin --> CadastroAtivo
    Admin --> EditarAtivo
    Admin --> ConsultarAtivo
    Admin --> ExcluirAtivo
    Admin --> AlocarAtivo
    Admin --> CadastroUsuario
    Admin --> GerarRelatorio

    Tecnico --> Login
    Tecnico --> ConsultarAtivo
    Tecnico --> Manutencao
    Tecnico --> Movimentacao
    Tecnico --> AtualizarStatus

    Usuario --> Login
    Usuario --> ConsultarEquipamento
    Usuario --> SolicitarSuporte

    AlocarAtivo -.include.-> ConsultarAtivo
    Manutencao -.extend.-> AtualizarStatus
```

---

## 🗄️ Modelo Entidade-Relacionamento (ERD)

```mermaid
erDiagram

    USUARIO {
        int id_usuario PK
        string nome
        string email
        string departamento
        string cargo
        string telefone
    }

    ATIVO {
        int id_ativo PK
        string patrimonio
        string nome
        string categoria
        string fabricante
        string modelo
        string numero_serie
        string status
        date data_aquisicao
    }

    MANUTENCAO {
        int id_manutencao PK
        int id_ativo FK
        date data_manutencao
        string tipo
        string descricao
        decimal custo
    }

    MOVIMENTACAO {
        int id_movimentacao PK
        int id_ativo FK
        int id_usuario FK
        date data_movimentacao
        string origem
        string destino
    }

    CHAMADO {
        int id_chamado PK
        int id_usuario FK
        int id_ativo FK
        string titulo
        string descricao
        string status
        date data_abertura
    }

    USUARIO ||--o{ MOVIMENTACAO : realiza

    ATIVO ||--o{ MOVIMENTACAO : possui

    ATIVO ||--o{ MANUTENCAO : recebe

    USUARIO ||--o{ CHAMADO : abre

    ATIVO ||--o{ CHAMADO : relacionado
```

---

## 🏗️ Diagrama de Classes UML

```mermaid
classDiagram

class Usuario {
    +int idUsuario
    +String nome
    +String email
    +String departamento
    +String cargo
    +String telefone

    +consultarAtivos()
    +abrirChamado()
}

class Ativo {
    +int idAtivo
    +String patrimonio
    +String nome
    +String categoria
    +String fabricante
    +String modelo
    +String numeroSerie
    +String status
    +Date dataAquisicao

    +cadastrar()
    +editar()
    +consultar()
    +atualizarStatus()
}

class Manutencao {
    +int idManutencao
    +Date dataManutencao
    +String tipo
    +String descricao
    +Double custo

    +registrar(
