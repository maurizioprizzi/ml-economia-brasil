#!/bin/bash
# =============================================================
# setup.sh — Configuração inicial do repositório
# Machine Learning em Economia Brasileira
# =============================================================
# Uso: bash setup.sh [projeto]
# Exemplos:
#   bash setup.sh              # configura todos os projetos
#   bash setup.sh ipca         # configura apenas o projeto 01
# =============================================================

set -e

VERDE='\033[0;32m'
AMARELO='\033[1;33m'
AZUL='\033[0;34m'
RESET='\033[0m'

echo -e "${AZUL}"
echo "=============================================="
echo "  ML em Economia Brasileira — Setup inicial"
echo "=============================================="
echo -e "${RESET}"

# Verificar Python 3.10+
python_version=$(python3 --version 2>&1 | awk '{print $2}')
required="3.10"
if python3 -c "import sys; sys.exit(0 if sys.version_info >= (3,10) else 1)"; then
    echo -e "${VERDE}✓ Python $python_version encontrado${RESET}"
else
    echo -e "${AMARELO}⚠ Python 3.10+ é necessário. Versão atual: $python_version${RESET}"
    exit 1
fi

# Função para configurar um projeto
setup_projeto() {
    local nome=$1
    local pasta=$2

    echo ""
    echo -e "${AZUL}── Configurando $nome...${RESET}"

    if [ ! -d "$pasta" ]; then
        echo "  Pasta $pasta não encontrada. Pulando."
        return
    fi

    cd "$pasta"

    # Criar ambiente virtual
    if [ ! -d "venv" ]; then
        python3 -m venv venv
        echo -e "  ${VERDE}✓ Ambiente virtual criado${RESET}"
    else
        echo "  Ambiente virtual já existe"
    fi

    # Ativar e instalar dependências
    source venv/bin/activate
    pip install --upgrade pip --quiet
    pip install -r requirements.txt --quiet
    echo -e "  ${VERDE}✓ Dependências instaladas${RESET}"

    deactivate
    cd ..
}

# Qual projeto configurar?
ALVO="${1:-todos}"

case $ALVO in
    ipca|01)
        setup_projeto "Projeto 01 — IPCA" "projeto-01-ipca"
        ;;
    pib|02)
        setup_projeto "Projeto 02 — PIB" "projeto-02-pib"
        ;;
    desemprego|03)
        setup_projeto "Projeto 03 — Desemprego" "projeto-03-desemprego"
        ;;
    todos|*)
        setup_projeto "Projeto 01 — IPCA" "projeto-01-ipca"
        setup_projeto "Projeto 02 — PIB" "projeto-02-pib"
        setup_projeto "Projeto 03 — Desemprego" "projeto-03-desemprego"
        ;;
esac

echo ""
echo -e "${VERDE}=============================================="
echo "  Setup concluído!"
echo "=============================================="
echo -e "${RESET}"
echo "Para começar o Projeto 01:"
echo "  cd projeto-01-ipca"
echo "  source venv/bin/activate"
echo "  jupyter notebook notebooks/"
echo ""
