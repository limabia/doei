#language: pt
Funcionalidade: Cadastro de feedback
Como usuário deslogado na plataforma.
De forma que eu consiga cadastrar um feedback.
Eu quero um botão cadastrar feedback na plataforma que seja exibido no rodapé do site.

Cenário: Cadastro feedback elogio com sucesso                                    
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"                                                         
Quando preencho o campo "Nome" com "Teste anônimo"                             
Quando preencho o drop "feedback[tipo]" com "Elogio"                       
Quando preencho o campo "Descricao" com "Cadastro feedback elogio com sucesso" 
E clico em "Salvar"                                                           
Então o feedback deve ter sido salvo no banco de dados com nome "Teste anônimo" e descricao "Cadastro feedback elogio com sucesso"                                                        
Então deverei ver o link "Cadastro feedback elogio com sucesso"                                

Cenário: Cadastro feedback reclamação com sucesso                                     
Dado que estou na tela inicial                                                    
Então deverei ver o link "Entrar"                                                  
E clico em "Feedback"                                                               
Quando preencho o campo "Nome" com "Teste Bruno"                                   
Quando preencho o drop "feedback[tipo]" com "Reclamação"                       
Quando preencho o campo "Descricao" com "Cadastro feedback reclamação com sucesso." 
E clico em "Salvar"                                                                
Então o feedback deve ter sido salvo no banco de dados com nome "Teste Bruno" e descricao "Cadastro feedback reclamação com sucesso."                                                        
Então deverei ver o link "Cadastro feedback reclamação com sucesso."                                    

Cenário: Cadastro feedback sem nome com sucesso                                     
Dado que estou na tela inicial                                                  
Então deverei ver o link "Entrar"                                         
E clico em "Feedback"                                                            
Quando preencho o campo "Nome" com ""                                            
Quando preencho o drop "feedback[tipo]" com "Elogio"                          
Quando preencho o campo "Descricao" com "Cadastro feedback sem nome com sucesso." 
E clico em "Salvar"        
Então o feedback deve ter sido salvo no banco de dados com nome "" e descricao "Cadastro feedback sem nome com sucesso."                                                          
Então deverei ver o link "Cadastro feedback sem nome com sucesso."                                                 
                                
Cenário: Cadastro feedback com erro                                     
Dado que estou na tela inicial                                        
Então deverei ver o link "Entrar"                                    
E clico em "Feedback"                                                
Quando preencho o campo "Nome" com "Bernado"                          
Quando preencho o drop "feedback[tipo]" com "Elogio"              
E clico em "Salvar"                                                   
E deverei ver a mensagem de erro "O campo descricao é obrigatório!"   

Cenário: Cadastro feedback e voltar para home                               
Dado que estou na tela inicial                                               
Então deverei ver o link "Entrar"                                              
E clico em "Feedback"  
Então deverei ver o link "Ver avaliações"         
E clico em "Voltar"  