#language: pt
Funcionalidade: Remover o feedback
Como usuário deslogado na plataforma.
De forma que eu consiga remover um feedback.
Eu quero um botão remover feedback na plataforma que seja exibido ao lado de cada feedback já cadastrado.

Cenário: Remover o feedback com tipo elogio
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"                                                         
Quando preencho o campo "Nome" com "Teste"                             
Quando preencho o drop "feedback[tipo]" com "Elogio"                       
Quando preencho o campo "Descricao" com "Cadastro feedback elogio com sucesso" 
E clico em "Salvar"                                                           
Então o feedback deve ter sido salvo no banco de dados com nome "Teste" e descricao "Cadastro feedback elogio com sucesso"                                                        
Então deverei ver o link "Cadastro feedback elogio com sucesso"                                                                           
E clico em "Feedback"  
Então deverei ver o link "Ver avaliações"         
E clico em "Ver avaliações"                       
Então deverei ver o link "Avaliações"     
E clico em "Remover"  
Então deverei ver o link "Avaliações"  

Cenário: Remover o feedback com tipo reclamação
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"                                                         
Quando preencho o campo "Nome" com "Teste"                             
Quando preencho o drop "feedback[tipo]" com "Reclamação"                       
Quando preencho o campo "Descricao" com "Cadastro feedback elogio com sucesso" 
E clico em "Salvar"                                                           
Então o feedback deve ter sido salvo no banco de dados com nome "Teste" e descricao "Cadastro feedback elogio com sucesso"                                                        
Então deverei ver o link "Cadastro feedback elogio com sucesso"                                                                           
E clico em "Feedback"  
Então deverei ver o link "Ver avaliações"         
E clico em "Ver avaliações"                       
Então deverei ver o link "Avaliações"     
E clico em "Remover"  
Então deverei ver o link "Avaliações"  

Cenário: Remover o feedback com tipo reclamação (Anônimo)
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"                     
Quando preencho o campo "Nome" com ""                                                             
Quando preencho o drop "feedback[tipo]" com "Reclamação"                       
Quando preencho o campo "Descricao" com "Cadastro feedback elogio com sucesso" 
E clico em "Salvar"                                                           
Então o feedback deve ter sido salvo no banco de dados com nome "" e descricao "Cadastro feedback elogio com sucesso"                                                        
Então deverei ver o link "Cadastro feedback elogio com sucesso"                                                                           
E clico em "Feedback"  
Então deverei ver o link "Ver avaliações"         
E clico em "Ver avaliações"                       
Então deverei ver o link "Avaliações"     
E clico em "Remover"  
Então deverei ver o link "Avaliações"  