# 📓 Diário do Projeto

> Registro diário do desenvolvimento da série **Machine Learning em Economia Brasileira**.
> Escrito para ser lido por qualquer pessoa — com ou sem experiência em programação.

---

## Como ler este diário

Cada entrada explica **o que foi feito**, **por que foi feito** e **o que isso significa** na prática. A ideia é que um estudante de economia sem experiência em programação consiga acompanhar o raciocínio, e que um programador sem experiência em economia entenda as escolhas metodológicas.

Se quiser acompanhar o projeto desde o começo, leia de cima para baixo.

---

## 31 de março de 2025

### O que fizemos hoje

Criamos a estrutura completa do repositório no GitHub — a "casa" onde todo o projeto vai morar.

### Por que isso importa

Antes de escrever uma linha de análise, precisamos organizar o espaço de trabalho. Pense nisso como arrumar o laboratório antes de começar um experimento: cada coisa no seu lugar, para que qualquer pessoa consiga entender o que está acontecendo e reproduzir os resultados.

Um repositório bem estruturado desde o início também é um sinal de maturidade profissional. Quando um recrutador ou pesquisador acessa um projeto no GitHub, a primeira impressão vem exatamente dessa organização.

### O que criamos

**A estrutura de pastas dos 3 projetos da série:**

```
ml-economia-brasil/
├── projeto-01-ipca/        ← Previsão da inflação (IPCA)
├── projeto-02-pib/         ← Nowcasting do PIB
└── projeto-03-desemprego/  ← Desemprego com Causal ML
```

Cada projeto tem a mesma organização interna:
- `notebooks/` — onde ficam os Jupyter Notebooks com as análises, numerados em ordem
- `src/` — código Python organizado em funções reutilizáveis
- `app/` — o aplicativo interativo (dashboard) que será construído ao final
- `data/raw/` — dados originais baixados das APIs, nunca modificados
- `data/processed/` — dados já tratados e prontos para análise
- `reports/` — relatórios gerados automaticamente

**Por que separar `raw` de `processed`?**
É uma boa prática fundamental em ciência de dados: nunca sobrescrever os dados originais. Se algo der errado no processamento, você sempre pode voltar à fonte. É o equivalente a manter o caderno de laboratório original intacto.

**Os arquivos de documentação:**
- `README.md` — a "capa" do projeto, com explicação geral, referências e instruções de uso
- `DIARIO.md` — este arquivo que você está lendo agora
- `CONTRIBUTING.md` — guia para quem quiser contribuir com o projeto
- `LICENSE` — licença MIT, que permite uso livre inclusive comercial
- `.gitignore` — lista de arquivos que o Git deve ignorar (dados brutos, modelos treinados, ambientes virtuais)

### O que é o GitHub Actions (CI)?

Configuramos também um sistema chamado **CI** (Integração Contínua). Toda vez que enviamos código novo para o GitHub, esse sistema roda automaticamente e verifica:

1. O código está formatado corretamente? (ferramenta: `black`)
2. Tem algum erro óbvio de programação? (ferramenta: `flake8`)
3. Os testes unitários passam? (ferramenta: `pytest`)

É como ter um assistente que relê seu código sempre que você salva, apontando problemas antes que virem dores de cabeça maiores.

**Problema que encontramos:** na primeira versão, o CI tentava instalar todas as dependências do projeto — incluindo TensorFlow (um pacote de deep learning com ~500MB) — só para rodar o lint. O GitHub cancelou os jobs por falta de recursos.

**Solução:** criamos um arquivo separado `requirements-ci.txt` com apenas o mínimo necessário para verificar qualidade de código. O TensorFlow e os outros pacotes pesados ficam no `requirements.txt` local, instalado apenas na máquina do desenvolvedor.

### Conceito do dia: reprodutibilidade

Um dos pilares da ciência de dados séria é a **reprodutibilidade**: qualquer pessoa, em qualquer computador, deve conseguir chegar aos mesmos resultados seguindo os passos documentados.

Por isso usamos APIs públicas em vez de arquivos de dados locais — qualquer pessoa pode rodar o código e baixar os mesmos dados que nós baixamos. Por isso documentamos cada decisão. Por isso versionamos o código no GitHub.

### Próximo passo

Amanhã começamos o primeiro notebook real: **coleta de dados do IPCA via API do IBGE**. Vamos escrever código que baixa automaticamente o histórico completo da inflação brasileira — desde o Plano Real até hoje — direto da fonte oficial, sem precisar baixar nenhum arquivo manualmente.

---

*[← voltar ao README](README.md)*