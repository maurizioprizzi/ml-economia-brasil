# Projeto 01 — Previsão do IPCA com Machine Learning 📈

> **Será que um algoritmo de machine learning consegue prever a inflação brasileira melhor do que os modelos tradicionais?**
> Este projeto responde a essa pergunta — e explica o porquê de cada decisão, passo a passo.

[![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python)](https://python.org)
[![Dados: IBGE](https://img.shields.io/badge/dados-IBGE%20%2F%20BCB-009c3b)]()
[![XAI: SHAP](https://img.shields.io/badge/XAI-SHAP-orange)]()
[![Deploy: Streamlit](https://img.shields.io/badge/deploy-Streamlit-red)]()

---

## 💡 Por que este projeto existe?

A inflação afeta a vida de todas as pessoas — o preço do pão, do aluguel, da gasolina, da conta de luz. No Brasil, o índice oficial de inflação se chama **IPCA** (Índice de Preços ao Consumidor Amplo) e é calculado todo mês pelo IBGE.

Prever a inflação com antecedência é fundamental para:
- O **Banco Central** definir a taxa de juros (Selic)
- Empresas **planejarem preços** e investimentos
- Famílias **tomarem decisões financeiras** mais informadas
- Economistas **avaliarem políticas públicas**

### O que foi feito no exterior?

Pesquisadores e bancos centrais ao redor do mundo já descobriram que **algoritmos de machine learning conseguem superar os modelos econométricos tradicionais** na previsão de inflação:

- **EUA (Medeiros et al., 2021):** Random Forest superou todos os benchmarks tradicionais na previsão da inflação americana, publicado no *Journal of Business & Economic Statistics*
- **Banco Central Europeu (2023):** usou Quantile Regression Forest para capturar comportamentos não-lineares da inflação da zona do euro
- **FMI (2024):** aplicou LASSO e Gradient Boosting para prever inflação no Japão pós-pandemia, identificando que expectativas de inflação doméstica e taxa de câmbio foram os melhores preditores

### Nossa pergunta de pesquisa

> **Os modelos de machine learning conseguem prever o IPCA brasileiro com mais precisão do que os modelos tradicionais (ARIMA, regressão linear)?**
> **E quais variáveis econômicas são as mais importantes para essa previsão?**

---

## 🎓 Conceitos fundamentais (leia antes do código!)

Antes de mergulhar nos notebooks, é útil entender alguns conceitos básicos. Não se preocupe se você ainda não conhece todos eles — cada notebook explica o que for necessário no momento certo.

### O que é o IPCA?

O IPCA mede a variação de preços de uma cesta de produtos e serviços que uma família brasileira típica consome. Ele é divulgado mensalmente pelo IBGE e é a **referência oficial** para a política monetária do Brasil (o Banco Central usa o IPCA como alvo do sistema de metas de inflação).

### O que é machine learning?

Machine learning (aprendizado de máquina) é um conjunto de técnicas em que um programa de computador **aprende padrões a partir dos dados**, em vez de seguir regras programadas manualmente. Em vez de dizer "se a Selic subir, a inflação cai", o modelo aprende sozinho essa relação — e muitas outras, inclusive não-lineares.

### O que é XAI (Explainable AI)?

Um problema histórico com ML é a "caixa preta": o modelo faz previsões precisas, mas não explica por quê. XAI (Inteligência Artificial Explicável) é um conjunto de técnicas que abre essa caixa preta. Neste projeto usamos **SHAP** (SHapley Additive exPlanations), que atribui a cada variável do modelo uma pontuação de importância para cada previsão individual.

---

## 📊 Dados utilizados

Todos os dados são **públicos e gratuitos**:

| Variável | Fonte | Frequência | Descrição |
|----------|-------|-----------|-----------|
| IPCA (variável-alvo) | IBGE / SIDRA | Mensal | Inflação oficial do Brasil |
| Taxa Selic | BCB / SGS | Mensal | Taxa básica de juros |
| Taxa de câmbio (USD/BRL) | BCB / SGS | Mensal | Valor do dólar frente ao real |
| IGP-M | FGV / Ipeadata | Mensal | Índice Geral de Preços do Mercado |
| Taxa de desemprego | IBGE / PNAD | Trimestral | % da população desempregada |
| Produção industrial | IBGE / SIDRA | Mensal | Índice de produção industrial |
| IBC-Br | BCB | Mensal | Proxy mensal do PIB |
| Preço do petróleo (Brent) | Ipeadata | Mensal | Impacto em combustíveis |
| Expectativas de inflação | BCB / Focus | Mensal | Previsões do mercado financeiro |

### Por que essas variáveis?

A teoria econômica nos guia na escolha:
- **Selic:** juros altos desaceleram a economia e reduzem a inflação (política monetária)
- **Câmbio:** desvalorização do real encarece importações e pressiona preços
- **IGP-M:** captura pressões de preços no atacado antes de chegarem ao consumidor
- **Desemprego:** menos emprego = menos consumo = menos pressão inflacionária (Curva de Phillips)
- **Petróleo:** afeta direto combustíveis e, indiretamente, toda a cadeia produtiva

---

## 🗂️ Estrutura dos notebooks

Os notebooks devem ser executados em ordem:

```
notebooks/
├── 01_coleta_dados.ipynb          ← Como baixar os dados das APIs brasileiras
├── 02_analise_exploratoria.ipynb  ← Entendendo os dados com visualizações
├── 03_feature_engineering.ipynb   ← Criando variáveis úteis para o modelo
├── 04_modelagem_baseline.ipynb    ← Modelos tradicionais (ARIMA, regressão)
├── 05_modelagem_ml.ipynb          ← Random Forest, XGBoost, LSTM
├── 06_comparacao_modelos.ipynb    ← Qual modelo ganha? Métricas e testes
└── 07_xai_shap.ipynb              ← Explicando as previsões com SHAP
```

---

## 🚀 Como executar

### Pré-requisitos

- Python 3.10 ou superior
- pip (gerenciador de pacotes Python)
- Jupyter Notebook ou JupyterLab

### Instalação

```bash
# 1. Entre na pasta do projeto
cd projeto-01-ipca

# 2. (Recomendado) Crie um ambiente virtual
python -m venv venv
source venv/bin/activate        # Linux/Mac
venv\Scripts\activate           # Windows

# 3. Instale as dependências
pip install -r requirements.txt

# 4. Inicie o Jupyter
jupyter notebook notebooks/
```

### Executando o app interativo

```bash
# Após treinar os modelos (notebooks 01 a 06):
streamlit run app/dashboard.py
```

---

## 📐 Metodologia

### 1. Coleta e limpeza dos dados
Coleta automática via APIs públicas (IBGE/SIDRA, BCB/SGS, Ipeadata). Tratamento de valores ausentes, outliers e inconsistências.

### 2. Análise exploratória (EDA)
Visualização das séries temporais, análise de correlações, decomposição de tendência/sazonalidade, testes de estacionariedade (ADF, KPSS).

### 3. Feature engineering
Criação de variáveis derivadas: lags (valores passados), médias móveis, variações percentuais, variáveis dummy sazonais. Todas as escolhas são justificadas pela teoria econômica.

### 4. Modelagem e validação
Comparação entre:
- **Baseline:** média histórica e ARIMA (modelos tradicionais)
- **ML supervisionado:** Random Forest, XGBoost, LightGBM
- **Deep Learning:** LSTM (redes neurais recorrentes)

Usamos **validação walk-forward** (também chamada de expanding window), que simula como o modelo se comportaria em uso real: sempre treinado no passado, testado no futuro imediato.

### 5. Métricas de avaliação
- **MAE** (Mean Absolute Error) — erro médio em pontos percentuais
- **RMSE** (Root Mean Squared Error) — penaliza erros grandes
- **MAPE** (Mean Absolute Percentage Error) — erro percentual médio
- **Diebold-Mariano Test** — teste estatístico para comparar modelos formalmente

### 6. Explicabilidade (XAI)
Uso de **SHAP values** para:
- Identificar quais variáveis mais influenciam a previsão
- Ver como a importância das variáveis muda ao longo do tempo
- Entender previsões individuais (ex: por que o modelo previu inflação alta em determinado mês)

---

## 📈 Resultados esperados

*(Esta seção será atualizada conforme o projeto avança)*

---

## 📚 Referências científicas

1. Medeiros, M. C., Vasconcelos, G. F., Veiga, Á., & Zilberman, E. (2021). Forecasting inflation in a data-rich environment: The benefits of machine learning methods. *Journal of Business & Economic Statistics*, 39(1), 98–119.

2. Boaretto, G., & Medeiros, M. C. (2023). Forecasting inflation using disaggregates and machine learning. *arXiv:2308.11173*.

3. ECB (2023). Forecasting euro area inflation with machine-learning models. *ECB Research Bulletin*, No. 111.

4. IMF (2024). Mending the Crystal Ball: Enhanced Inflation Forecasts with Machine Learning. *IMF Working Paper* WP/24/206.

5. Choi, H., & Varian, H. (2012). Predicting the present with Google Trends. *Economic Record*, 88, 2–9.

---

## 🗓️ Log de desenvolvimento

| Data | Notebook/Arquivo | O que foi feito |
|------|-----------------|----------------|
| Início | Estrutura | README e estrutura de pastas |
| ... | ... | ... |

---

*Parte da série [Machine Learning em Economia Brasileira](../README.md)*
