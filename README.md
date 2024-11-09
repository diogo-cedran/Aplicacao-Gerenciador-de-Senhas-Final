# Gerenciador e Gerador de Senhas

Este projeto é um aplicativo de gerenciamento de senhas desenvolvido em Flutter. Ele permite que usuários cadastrem, visualizem, atualizem e excluam senhas de forma organizada e segura, com um backend simulado usando `json-server`. O aplicativo foi desenvolvido para atender a um conjunto de requisitos acadêmicos, focado em boas práticas de desenvolvimento de software para dispositivos móveis.

## Funcionalidades

- **Cadastro de Usuários**: Tela para novos usuários se registrarem.
- **Login**: Autenticação para acesso seguro ao aplicativo.
- **Listagem de Contas**: Exibe todas as contas e senhas cadastradas para visualização e gerenciamento.
- **Formulário de Cadastro de Senhas**: Permite adicionar e gerar novas senhas.
- **Tela Inicial (Dashboard)**: Fornece uma visão geral do aplicativo e acesso rápido às principais funcionalidades.
- **Navegação**: Um menu para fácil acesso entre as telas do aplicativo.

## Estrutura do Projeto

Este projeto foi estruturado para atender aos seguintes requisitos:

### Requisitos Técnicos

1. **Classes de Domínio com Relacionamento**:
   - O projeto possui duas classes principais: `Usuario` e `SenhaModel`. Elas têm um relacionamento **One-to-Many** onde um usuário pode ter várias senhas associadas.

2. **Tela de Listagem**:
   - Uma tela exibe todas as senhas cadastradas, permitindo ao usuário visualizá-las e gerenciá-las.

3. **Tela de Formulário**:
   - O formulário permite que o usuário adicione novas senhas, coletando informações como descrição, nome de usuário e senha.

4. **Tela de Dashboard (Home)**:
   - A tela inicial funciona como um **Dashboard**, fornecendo uma visão geral e permitindo acesso rápido às funcionalidades principais.

5. **Menu de Navegação**:
   - Um menu de navegação permite ao usuário alternar entre as telas do aplicativo.

6. **CRUD**:
   - Utiliza o `json-server` para simular operações de **Create, Read, Update e Delete** com o backend, facilitando a gestão das senhas.

7. **Componentes Reutilizáveis**:
   - O projeto inclui componentes reutilizáveis que ajudam a organizar e padronizar a interface.

8. **Testes Unitários**:
   - Foram implementados testes unitários para validar o funcionamento dos principais serviços e telas, garantindo estabilidade no código.

## Estrutura de Arquivos

- **lib/screens/**: Contém as telas do aplicativo, como `home_screen.dart`, `login_screen.dart`, `cadastro_screen.dart`.
- **lib/services/**: Inclui o serviço `api_service.dart`, responsável pela comunicação com o backend.
- **lib/models/**: Contém os modelos de dados, como `senha_model.dart`.
- **test/**: Diretório de testes unitários, com testes para cada tela e serviço.

## Como Executar o Projeto

### Pré-requisitos

- **Flutter**: Certifique-se de que o Flutter esteja instalado em sua máquina.
- **json-server**: Para simular o backend, é necessário instalar o `json-server`.

### Passos para Execução

1. **Iniciar o json-server**:
   ```bash
   json-server --watch db.json --port 3000
   ```

2. **Executar o Aplicativo**:
   ```bash
   flutter run
   ```

3. **Executar os Testes**:
   Para rodar os testes unitários, utilize o comando:
   ```bash
   flutter test
   ```

## Conclusão

Este projeto de Gerenciador e Gerador de Senhas foi desenvolvido com o objetivo de aplicar boas práticas de arquitetura de software em dispositivos móveis em Flutter. Ele atende aos requisitos de uma aplicação de gerenciamento, incluindo funcionalidades de CRUD com integração a um backend simulado, uso de relacionamento entre classes de domínio, e implementação de testes unitários para garantir a confiabilidade das operações.
