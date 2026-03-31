# Projeto 02 — Nowcasting do PIB Brasileiro 🔭

> **Como prever o crescimento econômico do Brasil antes que o IBGE divulgue os números oficiais?**
> Este projeto usa machine learning com dados de alta frequência para antecipar o PIB trimestral.

[![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python)](https://python.org)
[![Dados: IBGE/BCB](https://img.shields.io/badge/dados-IBGE%20%2F%20BCB%20%2F%20Ipeadata-009c3b)]()
[![XAI: SHAP](https://img.shields.io/badge/XAI-SHAP-orange)]()
[![Método: MIDAS](https://img.shields.io/badge/método-MIDAS-purple)]()

> 🔴 **Status: em breve** — este projeto será desenvolvido após a conclusão do Projeto 01.

---

## 💡 Por que este projeto existe?

O PIB (Produto Interno Bruto) é a medida mais abrangente da atividade econômica de um país. O problema: **o IBGE divulga os dados do PIB trimestral com quase 60 dias de atraso**. Ou seja, quando sabemos como a economia foi no 1º trimestre (jan–mar), já estamos em junho.

**Nowcasting** (contração de "now" + "forecasting") é a técnica de estimar o valor de uma variável econômica *antes* de sua divulgação oficial, usando dados mais recentes e de maior frequência.

### Quem já faz isso?

- O **Banco Central do Brasil** usa o IBC-Br como proxy mensal do PIB, mas não divulga o modelo completo
- O **FMI (2018)** mostrou que ML supera as próprias previsões do World Economic Outlook
- A **Autoridade Sueca de Gestão Financeira (ESV)** criou o primeiro modelo de *Explainable AI* governamental para PIB, com código aberto
- O **Reserve Bank of New Zealand** usou ~550 variáveis domésticas e internacionais para nowcasting em tempo real

### Nossa contribuição

Aplicar essas metodologias aos dados brasileiros, com código aberto, documentação didática, e comparação explícita com as projeções do **Boletim Focus** (expectativas do mercado financeiro coletadas pelo Banco Central).

---

## 🎓 O que é nowcasting? (para iniciantes)

Imagine que você quer saber a temperatura de uma cidade, mas o termômetro oficial só é lido uma vez por trimestre. Para ter uma ideia da temperatura *agora*, você poderia usar dados mais frequentes como: temperatura de cidades vizinhas, consumo de energia elétrica, vendas de sorvete, etc.

No PIB, a lógica é a mesma. Usamos variáveis mensais como proxies:
- Produção industrial (IBGE) → quanto as fábricas estão produzindo
- Vendas do comércio (PMC/IBGE) → o quanto as pessoas estão consumindo
- Consumo de energia elétrica → um termômetro geral da atividade econômica
- Criação de empregos (CAGED) → se a economia está contratando ou demitindo

---

## 📊 Dados utilizados

| Variável | Fonte | Frequência |
|----------|-------|-----------|
| PIB (variável-alvo) | IBGE / Contas Nacionais | Trimestral |
| IBC-Br | BCB / SGS | Mensal |
| Produção industrial | IBGE / PIM-PF | Mensal |
| PMC (comércio varejista) | IBGE | Mensal |
| PMS (setor de serviços) | IBGE | Mensal |
| CAGED (empregos formais) | MTE | Mensal |
| Consumo de energia | ANEEL / EPE | Mensal |
| Exportações e importações | MDIC / Comex Stat | Mensal |
| Expectativas Focus (PIB) | BCB | Semanal |
| Confiança do consumidor | FGV | Mensal |
| Confiança do empresário | FGV / CNI | Mensal |

---

## 🗂️ Estrutura dos notebooks

```
notebooks/
├── 01_coleta_dados.ipynb            ← APIs para dados trimestrais e mensais
├── 02_analise_exploratoria.ipynb    ← Visualizando o ciclo econômico brasileiro
├── 03_proxies_mensais.ipynb         ← Construindo variáveis proxy para o PIB
├── 04_modelo_baseline.ipynb         ← ARIMA e modelos bridge tradicionais
├── 05_midas_ml.ipynb                ← Modelos MIDAS e Random Forest
├── 06_backtesting.ipynb             ← Validação histórica vs. Focus/FMI
└── 07_xai_nowcasting.ipynb          ← SHAP: quais setores puxaram o PIB?
```

---

## 📐 Metodologia

### O desafio das frequências mistas

O PIB é trimestral, mas os melhores preditores são mensais. Isso cria um problema técnico: como combinar séries de frequências diferentes? Usaremos:

- **Modelos Bridge:** média simples das variáveis mensais dentro do trimestre
- **MIDAS (Mixed Data Sampling):** método econométrico específico para frequências mistas
- **Machine Learning:** deixar o modelo aprender como combinar as frequências

### Validação rigorosa

Utilizamos **backtesting em tempo real**: simulamos que estamos em cada trimestre do passado e tentamos prever o PIB que *ainda não foi divulgado*. Comparamos com as previsões do mercado (Focus) para ter um benchmark relevante.

---

## 📚 Referências científicas

1. Giannone, D., Reichlin, L., & Small, D. (2008). Nowcasting: The real-time informational content of macroeconomic data. *Journal of Monetary Economics*, 55(4), 665–676.

2. IMF (2018). An Algorithmic Crystal Ball: Forecasts-based on Machine Learning. *IMF Working Paper* WP/18/230.

3. Boström, H., et al. (2020). Explaining Multivariate Time Series Forecasts: An Application to Predicting the Swedish GDP. *Proceedings of XI-ML@KI*.

4. Reserve Bank of New Zealand (2019). Nowcasting New Zealand GDP using machine learning algorithms. *BIS IFC Bulletin*, 50.

---

*Parte da série [Machine Learning em Economia Brasileira](../README.md)*
