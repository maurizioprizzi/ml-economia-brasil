# Como contribuir

Obrigado pelo interesse em contribuir com esta série! Toda contribuição é bem-vinda, seja uma correção de typo, uma melhoria na explicação, um novo teste ou uma análise complementar.

## Tipos de contribuição

### 🐛 Reportar um problema
Abra uma [Issue](../../issues) descrevendo:
- O que você estava tentando fazer
- O que aconteceu
- O que você esperava que acontecesse
- Versão do Python e sistema operacional

### 💡 Sugerir uma melhoria
Abra uma Issue com a etiqueta `enhancement` descrevendo sua ideia.

### 🔧 Contribuir com código

1. **Fork** o repositório
2. **Clone** seu fork: `git clone https://github.com/SEU_USUARIO/ml-economia-brasil.git`
3. **Crie uma branch** com nome descritivo: `git checkout -b melhoria-coleta-ipca`
4. **Faça suas alterações** seguindo as convenções abaixo
5. **Teste** suas alterações: `pytest tests/`
6. **Formate** o código: `black src/ notebooks/`
7. **Commit** com mensagem clara: `git commit -m "feat: adiciona cache local para API do IBGE"`
8. **Push** e abra um **Pull Request**

## Convenções

### Commits
Use o padrão [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` nova funcionalidade
- `fix:` correção de bug
- `docs:` alteração na documentação
- `refactor:` refatoração sem mudança de comportamento
- `test:` adição ou correção de testes
- `data:` alteração na coleta ou processamento de dados

### Código Python
- Seguimos o [PEP 8](https://peps.python.org/pep-0008/) com linha máxima de 100 caracteres
- Usamos `black` para formatação automática
- Funções e variáveis: `snake_case`
- Classes: `PascalCase`
- Constantes: `UPPER_CASE`
- Docstrings em português, seguindo o formato NumPy

### Notebooks
- Numere os notebooks (`01_`, `02_`, ...)
- Cada notebook começa com uma seção "## O que faremos neste notebook?" em linguagem acessível
- Explique o conceito *antes* do código
- Use comentários no código para explicar decisões não-óbvias

## Código de Conduta

Este projeto segue o [Contributor Covenant](https://www.contributor-covenant.org/). Em resumo: seja respeitoso, inclusivo e colaborativo.
