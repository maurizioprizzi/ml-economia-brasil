# Projeto 03 — Previsão de Desemprego com Causal ML 🔗

> **Qual é o efeito real da taxa de juros sobre o desemprego? E do salário mínimo?**
> Este projeto vai além da previsão: usa inferência causal com machine learning para responder perguntas de política econômica.

[![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python)](https://python.org)
[![Dados: PNAD/CAGED](https://img.shields.io/badge/dados-PNAD%20%2F%20CAGED%20%2F%20BCB-009c3b)]()
[![Método: EconML](https://img.shields.io/badge/método-EconML%20%2F%20Double%20ML-purple)]()
[![Microsoft Research](https://img.shields.io/badge/inspiração-Microsoft%20Research-0078d4)]()

> 🔴 **Status: em breve** — este projeto será desenvolvido após a conclusão do Projeto 02.

---

## 💡 Por que este projeto existe?

Prever o desemprego é importante. Mas entender **por que** o desemprego sobe ou cai — e o que o governo pode fazer para mudar isso — é ainda mais importante.

Este projeto usa um campo emergente chamado **Causal Machine Learning** para responder perguntas que modelos preditivos tradicionais não conseguem: *"Se o Banco Central reduzir a Selic em 1 ponto percentual, quantos empregos serão criados?"*

### A inspiração: EconML da Microsoft Research

O projeto [EconML](https://github.com/py-why/EconML) é um toolkit open source criado pela Microsoft Research que combina técnicas de ML de ponta com econometria para automatizar problemas de **inferência causal**. Foi desenvolvido por pesquisadores do time ALICE (Automated Learning and Intelligence for Causation and Economics) e é usado por bancos, governos e pesquisadores ao redor do mundo.

### O problema com modelos preditivos simples

Um modelo de ML pode aprender que "quando a Selic está alta, o desemprego sobe". Mas isso é **correlação**, não **causalidade**. Pode ser que ambos subam juntos em crises, mas não que um cause o outro. O Causal ML usa técnicas matemáticas rigorosas para separar o efeito causal do ruído de correlação.

---

## 🎓 Correlação vs. Causalidade (para iniciantes)

Imagine que sorveterias vendem mais sorvete nos dias em que há mais afogamentos. Existe uma correlação. Mas sorvete não causa afogamentos — ambos sobem no verão. Se uma política pública reduzisse a venda de sorvetes, os afogamentos não cairiam.

Na economia, esse tipo de confusão pode levar a políticas públicas equivocadas. O Causal ML foi criado para evitar exatamente isso.

### O método Double ML (Double Machine Learning)

O método DML, desenvolvido por Chernozhukov et al. (2018), funciona em duas etapas:

1. **Etapa 1:** Use ML para prever a variável de tratamento (ex: Selic) a partir dos controles (crise, pandemia, governo, etc.) e guarde o resíduo
2. **Etapa 2:** Use ML para prever o resultado (desemprego) a partir dos mesmos controles e guarde o resíduo
3. **Etapa 3:** Regredida um resíduo sobre o outro — o coeficiente é o efeito causal, livre dos confundidores

---

## 📊 Dados utilizados

| Variável | Fonte | Frequência |
|----------|-------|-----------|
| Taxa de desemprego (alvo) | IBGE / PNAD Contínua | Trimestral |
| Informalidade | IBGE / PNAD Contínua | Trimestral |
| CAGED (empregos formais criados) | MTE | Mensal |
| Taxa Selic (tratamento) | BCB / SGS | Mensal |
| Salário mínimo real | Ipeadata | Mensal |
| Crédito total (% PIB) | BCB | Mensal |
| IPCA (inflação) | IBGE | Mensal |
| PIB real | IBGE / Contas Nacionais | Trimestral |
| Exportações | MDIC | Mensal |
| Gastos do governo | STN / Ipeadata | Mensal |

---

## 🗂️ Estrutura dos notebooks

```
notebooks/
├── 01_coleta_dados.ipynb              ← PNAD, CAGED e variáveis macro
├── 02_analise_exploratoria.ipynb      ← O mercado de trabalho brasileiro
├── 03_previsao_desemprego.ipynb       ← ML preditivo (linha de base)
├── 04_correlacao_vs_causalidade.ipynb ← Por que correlação não basta
├── 05_double_ml.ipynb                 ← Implementando DML com EconML
├── 06_efeitos_heterogeneos.ipynb      ← O efeito da Selic varia por região?
└── 07_politica_economica.ipynb        ← Simulações de política pública
```

---

## 📐 Perguntas de pesquisa

Este projeto busca responder:

1. **Previsão:** Conseguimos prever a taxa de desemprego 1 a 4 trimestres à frente com ML?
2. **Causalidade:** Qual o efeito causal da taxa Selic sobre o desemprego?
3. **Causalidade:** Qual o efeito causal do salário mínimo sobre o emprego formal?
4. **Heterogeneidade:** Os efeitos são diferentes por região (Norte/Sul/Sudeste)?
5. **Política:** Simulações de cenários de política econômica

---

## 📚 Referências científicas

1. Chernozhukov, V., Chetverikov, D., Demirer, M., Duflo, E., Hansen, C., Newey, W., & Robins, J. (2018). Double/debiased machine learning for treatment and structural parameters. *The Econometrics Journal*, 21(1), C1–C68.

2. Athey, S., & Imbens, G. W. (2019). Machine learning methods that economists should know about. *Annual Review of Economics*, 11, 685–725.

3. Microsoft Research (2019–). EconML: A Python Package for ML-Based Heterogeneous Treatment Effects Estimation. *GitHub*. https://github.com/py-why/EconML

4. Gogas, P., Papadimitriou, T., & Sofianos, E. (2022). Forecasting unemployment in the euro area with machine learning. *Journal of Forecasting*, 41(3), 551–566.

---

*Parte da série [Machine Learning em Economia Brasileira](../README.md)*
