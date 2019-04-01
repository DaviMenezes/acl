# acl
Gerenciamento de permissões

Este sistema serve para gerenciar permissoes de usuários de acordo coma permissão do moulo.
Para usar, basta perguntar ao usuário se ele tem permissão para fazer algo.

A classe de usuário deve ter o sistema de verificação de acesso DviACL que disponibiliza métodos de verificação de acesso básicas como create, red, update e delete e também uma forma de verificar a regra de acordo com a regra passada via string.

Exemplo de uso:
$user_id
Modules::produto()->create($user_id);

o método create() retorna um valor bolleano verdadeiro ou falso;

Dica de onde usar:

Use os métodos de verficar permissão nos métodos onde você quer restringir o acesso.
