#language: pt

Funcionalidade: Converter usuário em administrador
Como um Administrador
De forma que eu consiga restringir acesso a funcionalidades especiais
Eu quero diferenciar usuários e marcar ou desmarcar um botão de administrador na tela de lista de usuários 

Cenário: Adicionar usuário ao grupo de administradores
Dado que estou logado como usuario administrador
E que estou na página de lista de usuários
Quando clico em "Tornar Admin" na lista "Usuários", na linha onde "email" com valor "notadm@adm.com"
Então o atributo "admin", que é "boolean" no usuário "notadm@adm.com" deve estar como "true"

Cenário: Remover usuário ao grupo de administradores
Dado que estou logado como usuario administrador
E que estou na página de lista de usuários
Quando clico em "Remover Admin" na lista "Usuários", na linha onde "email" com valor "notadm@adm.com"
Então o atributo "admin", que é "boolean" no usuário "notadm@adm.com" deve estar como "false"
