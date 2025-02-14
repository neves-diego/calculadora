import os

def exibir_menu():
    os.system("clear" if os.name == "posix" else "cls")  # Limpa a tela
    print("\nEscolha uma operação matemática:")
    print("1. Soma (+)")
    print("2. Subtração (-)")
    print("3. Multiplicação (x)")
    print("4. Divisão (÷)")
    print("5. Sair")

def obter_numero(mensagem):
    while True:
        try:
            return float(input(mensagem))
        except ValueError:
            print("Por favor, insira um número válido.")

def calcular(escolha, num1, num2):
    if escolha == "1":
        return num1 + num2
    elif escolha == "2":
        return num1 - num2
    elif escolha == "3":
        return num1 * num2
    elif escolha == "4":
        if num2 == 0:
            return "Erro: divisão por zero não é permitida."
        return round(num1 / num2, 2)

def main():
    while True:
        exibir_menu()
        escolha = input("Digite o número da operação desejada: ")
        
        if escolha == "5":
            print("Tchau! Obrigado por usar a calculadora!")
            break
        
        if escolha not in ["1", "2", "3", "4"]:
            print("Opção inválida! Tente novamente.")
            input("Pressione Enter para continuar...")
            continue
        
        num1 = obter_numero("Digite o primeiro número: ")
        num2 = obter_numero("Digite o segundo número: ")
        
        resultado = calcular(escolha, num1, num2)
        print(f"\nResultado: {resultado}")
        
        input("\nPressione Enter para continuar...")

if __name__ == "__main__":
    main()
