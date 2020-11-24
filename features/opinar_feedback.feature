#language: pt
Funcionalidade: Curtir o feedback
Como usuário deslogado na plataforma.
De forma que eu consiga curtir um feedback já cadastrado.
Eu quero um botão curtir na plataforma que seja exibido ao lado de cada feedback cadastrado.

Cenário: Curtir o feedback 
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
E clico em "Curtir"  
Então deverei ver o link "Avaliações" 

Cenário: Curtir o feedback em modo anônimo
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"                                                                                 
Quando preencho o drop "feedback[tipo]" com "Elogio"                       
Quando preencho o campo "Descricao" com "Cadastro feedback elogio com sucesso" 
E clico em "Salvar"                                                           
Então o feedback deve ter sido salvo no banco de dados com nome "" e descricao "Cadastro feedback elogio com sucesso"                                                        
Então deverei ver o link "Cadastro feedback elogio com sucesso"                                                                           
E clico em "Feedback"  
Então deverei ver o link "Ver avaliações"         
E clico em "Ver avaliações"                       
Então deverei ver o link "Avaliações"     
E clico em "Curtir"  
Então deverei ver o link "Avaliações" 

Cenário: Curtir o feedback em modo anônimo com tipo reclamação
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"                                                                                 
Quando preencho o drop "feedback[tipo]" com "Reclamação"                       
Quando preencho o campo "Descricao" com "Cadastro feedback elogio com sucesso" 
E clico em "Salvar"                                                           
Então o feedback deve ter sido salvo no banco de dados com nome "" e descricao "Cadastro feedback elogio com sucesso"                                                        
Então deverei ver o link "O seu feedback foi atualizado com sucesso!"                                                                           
E clico em "Feedback"  
Então deverei ver o link "Ver avaliações"         
E clico em "Ver avaliações"                       
Então deverei ver o link "Avaliações"     
E clico em "Curtir"  
Então deverei ver o link "Avaliações" 
Então deverei ver o link "Anônimo" 

Cenário: Curtir o feedback em modo anônimo com tipo reclamação
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"                                                                                 
Quando preencho o drop "feedback[tipo]" com "Reclamação"                       
Quando preencho o campo "Descricao" com "Cadastro feedback elogio com sucesso" 
E clico em "Salvar"                                                           
Então o feedback deve ter sido salvo no banco de dados com nome "" e descricao "Cadastro feedback elogio com sucesso"                                                        
Então deverei ver o link "O seu feedback foi atualizado com sucesso!"                                                                           
E clico em "Feedback"  
Então deverei ver o link "Ver avaliações"         
E clico em "Ver avaliações"                       
Então deverei ver o link "Avaliações"     
E clico em "Curtir"  
Então deverei ver o link "Avaliações" 
E clico em "Feedback"    
Então deverei ver o link "Ver avaliações"         
E clico em "Ver avaliações"    
E deverei ver o link "Curtiu" 