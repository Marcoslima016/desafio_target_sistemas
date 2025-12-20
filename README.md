# Desafio Target Sistemas

Aplicativo desenvolvido para o processo de recrutamento da empresa Target Sistemas. 

**Candidato: Marcos Vinicius Lima**

<!-- ================================================= -->
## Sobre o projeto

O aplicativo consiste em uma ferramenta para anotação de informações, oferecendo uma entrada de dados para que o usuário adicione cada informação manualmente. Além disso, o usuário pode editar/remover informações, e também conferir estatísticas sobre a lista de informações. 


<!-- ================================================= -->
## Escopo 

### 1. Tela de acesso (login)

Tela de acesso ao aplicativo. 

**Requisitos Funcionais:**

1.1 O App deve fornecer a opção de acesso utilizando login e senha. <br>
1.2 O App deve fazer as devidas validações de login (Usuário preenchido; Senha deve ter no mínimo 8 caracteres e no máximo 20 caracteres) <br>
1.3 O App deve fornecer uma forma de acessar a Política de Privacidade. <br>
1.4 O App deve fazer o devido tratamento em caso de falhas (Falha de conexão; usuário ou senha inválidos). <br>

### 2. Tela inicial 

Tela exibida após efetuar o login. Nessa tela o usuário pode consultar a lista de informações que ja foram inseridas, além de poder adicionar novas informações ou editar/excluir informações ja existentes. 

**Requisitos Funcionais:**

2.1 O App deve listar as informações existentes. <br>
2.2 O App deve fornecer uma entrada de texto para o usuário adicionar uma nova informação. <br>
2.3 O App deve fazer a devida validação da entrada de texto utilizada para adicionar uma nova informação.<br>
2.4 O App deve fornecer uma forma de editar informações existentes. <br>
2.5 O App deve permitir que o usuário exclua informações. <br>

### 3. Tela de Estatísticas 

Tela que exibe as estatísticas das informações inseridas.

**Requisitos Funcionais:** 

3.1 O App deve exibir, em formato texto, as seguintes estatisticas sobre a lista de informações:
- Qtd de linhas.
- Qtd de edições. 
- Qtd de caracteres. 

3.2 O App deve possuir um gráfico que exibe, em porcentagem, as seguintes informações: 
- Qtd de letras.
- Qtd de números.


<!-- ================================================= -->

## Como rodar o projeto 

Este projeto foi desenvolvido utilizando **Flutter**.  
Siga os passos abaixo para configurar o ambiente e executar a aplicação localmente.

### 1. Pré-requisitos

Certifique-se de ter os seguintes itens instalados:

- **Flutter SDK** (versão 3.35.0)
  - https://docs.flutter.dev/get-started/install
- **Dart** (já incluído no Flutter SDK)
- Um editor de código:
  - Visual Studio Code (com extensões Flutter e Dart) **ou**
  - Android Studio
- Um dispositivo ou emulador configurado:
  - Android Emulator, iOS Simulator ou dispositivo físico

Para verificar se o ambiente está corretamente configurado, execute:

```bash
flutter doctor
```
### 2. Instalação das dependências

Após clonar o repositório, navegue até a raiz do projeto e execute:
```bash
flutter pub get
```

### 3. Executando o projeto

**Em modo de desenvolvimento**

Com um dispositivo ou emulador ativo, execute:

```bash
flutter run
```
