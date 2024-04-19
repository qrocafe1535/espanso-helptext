#!/bin/bash

# ======================================================= #
#               GERADOR DE SENHAS                         #
# ======================================================= #

# Função para mostrar o uso correto do script
usage() {
    echo "Uso: $0 [-l LENGTH] [-s]"
    echo "  -l LENGTH   Define o tamanho da senha (default: 8)"
    echo "  -s          Inclui símbolos na senha"
    exit 1
}

# Define o tamanho padrão da senha e se incluirá símbolos ou não
LENGTH=8
SYMBOLS=0

# Lê as opções do usuário
while getopts "l:s" opt; do
    case $opt in
        l)
            LENGTH=$OPTARG
            ;;
        s)
            SYMBOLS=1
            ;;
        *)
            usage
            ;;
    esac
done

# Definição do conjunto de caracteres
CHARS="A-Za-z0-9"

# Se a opção de símbolos for selecionada, adiciona símbolos ao conjunto de caracteres
if [ $SYMBOLS -eq 1 ]; then
    CHARS="${CHARS}!@#$%^&*_-+=<>?"
fi

# Gera a senha
PASSWORD=$(cat /dev/urandom | tr -dc $CHARS | head -c $LENGTH)

# Mostra a senha gerada
echo $PASSWORD
