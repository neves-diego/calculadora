#!/bin/bash

while true; do
    clear  # Limpa a tela para melhor visualização
    echo -e "\nEscolha uma operação matemática:"
    echo "1. Soma (+)"
    echo "2. Subtração (-)"
    echo "3. Multiplicação (x)"
    echo "4. Divisão (÷)"
    echo "5. Sair"
    
    read -p "Digite o número da operação desejada: " escolha
    
    if [[ "$escolha" == "5" ]]; then
        echo "Tchau! Obrigado por usar a calculadora!"
        break
    fi
    
    if ! [[ "$escolha" =~ ^[1-4]$ ]]; then
        echo "Opção inválida! Tente novamente."
        sleep 2
        continue
    fi
    
    read -p "Digite o primeiro número: " num1
    read -p "Digite o segundo número: " num2
    
    if ! [[ "$num1" =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        echo "Por favor, insira apenas números válidos."
        sleep 2
        continue
    fi
    
    case $escolha in
        1) resultado=$(echo "$num1 + $num2" | bc)
           echo "Resultado: $num1 + $num2 = $resultado";;
        2) resultado=$(echo "$num1 - $num2" | bc)
           echo "Resultado: $num1 - $num2 = $resultado";;
        3) resultado=$(echo "$num1 * $num2" | bc)
           echo "Resultado: $num1 × $num2 = $resultado";;
        4) if [[ "$num2" == "0" ]]; then
               echo "Erro: divisão por zero não é permitida."
           else
               resultado=$(echo "scale=2; $num1 / $num2" | bc)
               echo "Resultado: $num1 ÷ $num2 = $resultado"
           fi;;
    esac
    
    echo -e "\nPressione Enter para continuar..."
    read
done

