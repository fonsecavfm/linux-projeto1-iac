#!/bin/bash

total=10
progresso=0

# Função para imprimir a barra de progresso
imprimir_barra_progresso() {
  local cor_barra="\e[44m"  # Cor de fundo azul
  local cor_progresso="\e[42m"  # Cor de fundo verde
  local cor_reset="\e[0m"  # Reset de cor

  local largura_tela=$(tput cols)
  local largura_barra=$((largura_tela - 10))

  local porcentagem=$(($progresso * 100 / $total))
  local qtd_preenchida=$((largura_barra * $progresso / $total))
  local qtd_faltante=$((largura_barra - qtd_preenchida))

  printf "Progresso: [%-${largura_barra}s] %3d%%" \
         "${cor_progresso}$(printf '=%.0s' $(seq $qtd_preenchida))${cor_reset}${cor_barra}$(printf '=%.0s' $(seq $qtd_faltante))${cor_reset}" \
         $porcentagem
}

# Limpar a tela antes de exibir a barra de progresso
clear

# Loop para simular o progresso
while [ $progresso -lt $total ]; do
  # Atualizar o progresso
  progresso=$((progresso + 1))

  # Imprimir a barra de progresso
  imprimir_barra_progresso

  # Aguardar um curto período de tempo para simular o progresso
  sleep 0.5
done

# Imprimir a barra de progresso completa em verde
imprimir_barra_progresso
echo

# Mensagem de conclusão
echo "Concluído!"
