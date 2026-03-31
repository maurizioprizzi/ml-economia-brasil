# 🇧🇷 Machine Learning em Economia Brasileira

> **Série de projetos de ciência de dados e machine learning aplicados à economia do Brasil,
> usando exclusivamente dados públicos brasileiros.**

[![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python)](https://python.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)]()
[![Dados Abertos](https://img.shields.io/badge/dados-públicos%20brasileiros-009c3b)]()

---

## 📖 Sobre esta série

Esta série de projetos nasceu de uma constatação simples: **análise de dados econômicos com machine learning é um dos temas mais procurados no mundo**, e o Brasil tem um dos conjuntos de dados públicos mais ricos da América Latina — mas ainda existem poucos projetos didáticos e bem documentados que conectem essas duas coisas.

Cada projeto desta série foi inspirado em pesquisas de sucesso realizadas no exterior — pelo **FMI**, pelo **Banco Central Europeu (BCE)**, pela **Microsoft Research** e por universidades americanas e europeias — e adaptado para a realidade brasileira, com os dados do IBGE, do Banco Central do Brasil, do Ipeadata e de outras fontes abertas.

### Para quem é esta série?

- 🎓 **Estudantes de economia, estatística, ciência de dados e áreas afins** que querem ver como ML se aplica a problemas econômicos reais
- 💼 **Profissionais** que querem construir um portfólio diferenciado com dados brasileiros
- 🔬 **Pesquisadores** que buscam uma base de código aberta para estudos aplicados
- 🌍 **Qualquer pessoa curiosa** sobre como a inflação, o PIB e o desemprego do Brasil podem ser analisados com técnicas modernas de inteligência artificial

> **Nenhum conhecimento avançado é necessário para começar.** Cada projeto inclui explicações acessíveis antes do código técnico.

---

## 🗂️ Projetos da série

| # | Projeto | Inspiração Internacional | Status |
|---|---------|--------------------------|--------|
| [01](./projeto-01-ipca/) | [**Previsão do IPCA com Machine Learning**](./projeto-01-ipca/README.md) | Random Forest p/ inflação (EUA/BCE/IMF) | 🟡 Em desenvolvimento |
| [02](./projeto-02-pib/) | [**Nowcasting do PIB Brasileiro**](./projeto-02-pib/README.md) | GDP forecasting com XAI (FMI / Suécia) | 🔴 Em breve |
| [03](./projeto-03-desemprego/) | [**Previsão de Desemprego com Causal ML**](./projeto-03-desemprego/README.md) | EconML / Double ML (Microsoft Research) | 🔴 Em breve |

---

## 🌍 Referências internacionais que inspiraram esta série

Esta série foi construída sobre ombros de gigantes. Os projetos abaixo foram bem-sucedidos no exterior e servem como base científica para o que fazemos aqui com dados brasileiros:

### Inflação
- **Medeiros et al. (2021)** — *"Forecasting Inflation with High-Dimensional Data"* — mostrou que Random Forest supera benchmarks tradicionais na previsão da inflação americana. Publicado no *Journal of Business & Economic Statistics*.
- **BCE (2023)** — *"Forecasting euro area inflation with machine-learning models"* — o Banco Central Europeu usou Quantile Regression Forest para capturar não-linearidades na inflação da zona do euro.
- **FMI (2024)** — *"Mending the Crystal Ball: Enhanced Inflation Forecasts with Machine Learning"* — aplicou LASSO e outros modelos de ML para prever a inflação do Japão pós-pandemia.

### PIB / Nowcasting
- **FMI (2018)** — *"An Algorithmic Crystal Ball: Forecasts-based on Machine Learning"* — ML supera as próprias previsões do World Economic Outlook.
- **ESV Suécia (2021)** — *"Forecasting GDP with Explainable AI"* — primeira aplicação governamental de XAI para previsão macroeconômica, com código aberto.
- **Reserve Bank of New Zealand (2019)** — *"Nowcasting New Zealand GDP using Machine Learning"* — usou ~550 variáveis domésticas e internacionais para nowcasting em tempo real.

### Desemprego / Causal ML
- **Microsoft Research** — [EconML](https://github.com/py-why/EconML) — toolkit open source que combina ML com econometria para inferência causal em decisões econômicas.
- **Chernozhukov et al. (2018)** — *"Double/Debiased Machine Learning"* — método estatístico que permite estimar efeitos causais usando ML sem o viés típico de modelos preditivos.

---

## 🛠️ Stack tecnológica

Todos os projetos utilizam Python 3.10+ e as seguintes bibliotecas principais:

```
Coleta de dados:    requests, pandas, sidrapy, python-bcb, ipeadatapy
Processamento:      pandas, numpy, scipy
Modelagem:          scikit-learn, xgboost, lightgbm, statsmodels, pmdarima
Deep Learning:      tensorflow / pytorch (projetos selecionados)
Causal ML:          econml (Microsoft Research)
Explicabilidade:    shap, lime, eli5
Visualização:       matplotlib, seaborn, plotly
Deploy:             streamlit, fastapi, uvicorn
Qualidade:          pytest, black, flake8
CI/CD:              GitHub Actions
```

---

## 🗃️ Fontes de dados utilizadas

| Fonte | O que fornece | Como acessar |
|-------|--------------|--------------|
| **IBGE / SIDRA** | IPCA, PIB, produção industrial, censo | API pública gratuita |
| **Banco Central do Brasil (SGS)** | Selic, câmbio, crédito, IBC-Br | API pública gratuita |
| **Ipeadata** | Séries históricas macro, regionais e sociais | API pública gratuita |
| **PNAD Contínua (IBGE)** | Taxa de desemprego, informalidade | Download direto |
| **CAGED / MTE** | Criação/destruição de empregos formais | dados.gov.br |
| **B3 via yfinance** | Ibovespa, dólar, commodities | yfinance (gratuito) |
| **World Bank API** | Comparações internacionais | API pública gratuita |

Todos os dados utilizados são **públicos, gratuitos e de acesso aberto**. Nenhum projeto desta série depende de dados pagos ou proprietários.

---

## 📁 Estrutura do repositório

```
ml-economia-brasil/
│
├── README.md                    ← você está aqui
├── LICENSE
├── .gitignore
│
├── projeto-01-ipca/             ← Previsão do IPCA
│   ├── README.md
│   ├── notebooks/               ← Jupyter Notebooks numerados
│   ├── src/                     ← Código Python modular
│   ├── app/                     ← App Streamlit / FastAPI
│   ├── data/
│   │   ├── raw/                 ← Dados originais (não modificados)
│   │   └── processed/           ← Dados processados
│   ├── reports/                 ← Relatórios gerados
│   ├── tests/                   ← Testes unitários
│   └── requirements.txt
│
├── projeto-02-pib/              ← Nowcasting do PIB
│   └── ...                      ← mesma estrutura
│
├── projeto-03-desemprego/       ← Previsão de Desemprego
│   └── ...                      ← mesma estrutura
│
└── .github/
    └── workflows/               ← CI/CD com GitHub Actions
```

---

## 🚀 Como usar este repositório

### 1. Clone o repositório

```bash
git clone https://github.com/SEU_USUARIO/ml-economia-brasil.git
cd ml-economia-brasil
```

### 2. Escolha um projeto e siga o README dele

```bash
cd projeto-01-ipca
pip install -r requirements.txt
jupyter notebook notebooks/01_coleta_dados.ipynb
```

### 3. Execute os notebooks em ordem

Os notebooks são numerados (`01_`, `02_`, ...) e devem ser executados em sequência. Cada um começa com uma explicação do que será feito antes de qualquer linha de código.

---

## 📅 Progresso da série

Esta série é desenvolvida **um pouco a cada dia**, com commits regulares. Acompanhe o progresso pelo histórico de commits.

| Data | O que foi feito |
|------|----------------|
| Início | Estrutura do repositório e README principal |
| ... | ... |

---

## 🤝 Contribuições

Contribuições são muito bem-vindas! Se você encontrou um erro, tem sugestão de melhoria, ou quer adicionar uma análise complementar:

1. Faça um fork do repositório
2. Crie uma branch (`git checkout -b minha-contribuicao`)
3. Faça suas alterações e escreva um commit descritivo
4. Abra um Pull Request com uma descrição clara do que foi alterado

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

Você pode usar, modificar e distribuir este código livremente, inclusive para fins comerciais, desde que mantenha o crédito original.

---

## ✉️ Contato

Dúvidas, sugestões ou só quer conversar sobre ciência de dados e economia?
Abra uma [Issue](../../issues) no repositório ou entre em contato pelo LinkedIn.

---

> *"Os dados são o novo petróleo — mas assim como o petróleo, precisam ser refinados para ter valor."*
> Esta série é sobre como refinar dados públicos brasileiros em conhecimento econômico.
