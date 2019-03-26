# acl
Gerenciamento de permissões

Este sistema serve para gerenciar permissoes de usuários de acordo coma permissão do moulo.
Para usar, basta perguntar ao usuário se ele tem permissão para fazer algo.

A classe de usuário deve ter o sistema de verificação de acesso DviACL que disponibiliza métodos de verificação de acesso básicas como create, red, update e delete e também uma forma de verificar a regra de acordo com a regra passada via string.

Exemplo de uso:

$user = new User(1);

$user->canCreate() 

ou

User::canCreate(1);

o método canCreate() retorna um valor bolleano verdadeiro ou falso;

Dica de onde usar:

Use os métodos de verficar permissão nos métodos onde você quer restringir o acesso.

Você também pode usar o helper validatePermission('create') quer dispara um throw Exception com a informação de falta de permissão.

este helper disponibiliza outros métodos para usar em modo fluente caso você precise passar um serviço de validação diferente como mostrado abaixo:

validatePermission()->services([CheckCustomerType::class])

No caso acima, uma classe de serviço é passada para conduzir a validação, então dependendo do tipo de cliente a validação irá retornar true ou false.

Como as classes de serviço de validação podem extender a classe abstrada ValidatePermission, está disponível para nossa classe de serviço uma série de métodos que podemos sobrescrever caso haja necessidade como é o caso do método de retornar uma mensagem de erro que podemos alterar para qualquer string.

Também está disponível métodos que definem como cada validação devem retornar suas mensagems de erros, útil para quando queremos pegar as mensagens de erro e manipulá-las posteriormente para serem mostradas da forma que quisermos.
