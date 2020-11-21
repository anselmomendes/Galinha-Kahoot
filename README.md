# Galinha Kahoot


O projeto consiste na criação de um aplicativo de compartilhamento de conteúdos sobre casos médicos com a possbilidade de questionários serem criados por professores e enviados para que seus alunos respondam, similar ao aplicativo [Kahoot!](https://play.google.com/store/apps/details?id=no.mobitroll.kahoot.android). O aplicativo também deve contar com um relatório de desempenho de cada aluno com relação às suas respostas submetidas nos questionários.

| Nome oficial | Nome de desenvolvimento | Tipo       | Referência                                                                                      | Contrato                             | Data de Entrega | Versão do Flutter | Versão do Dart |
|--------------|-------------------------|------------|-------------------------------------------------------------------------------------------------|--------------------------------------|-----------------|-------------------|----------------|
| Peensa!      | Galinha Kahoot          | Aplicativo | [Aplicativo Kahoot!](https://play.google.com/store/apps/details?id=no.mobitroll.kahoot.android) | [Contrato](https://z.zz.ht/bjNuR.pdf) | ??/??/??        |       1.20.4      |      2.9.2     |

### Funcionalidades/ Módulos:

##### 1 - Autenticação e gerenciamento de usuários (professor/aluno)
- [x] Login e Cadastro de usuário.
- [x] Recuperação de senha.
- [ ] Edição de perfil. 	
##### 2 - Dashboard baseada em roles (professor / aluno)
- ##### 2.1 - Dashboard do Professor
	- Criação e gerenciamento de turmas.
		- [ ] Sistema de convites para turma
    	- [ ] Edição de dados de turma (Nome, Descrição, Qr Code, Casos associados e alunos)
    - Criação e gerenciamento de casos.
    	- [ ] Editor de texto para criação de novos casos.
   		- [ ] Criador de questionários (com editor de texto).
    	- [ ] Gerenciador de casos e questionários (adição, exclusão e edição).
	- Relatório de desempenho de turmas.
		- [ ] Gráficos com dados gerais de desempenho da turma com relação aos questionários.
		- [ ] Estatísticas de visualização e respostas (Quantidade de vezes que um caso foi visualizado ou teve um questionário respondido)
		- [ ] Gráficos e estatísticas de desempenho de alunos específicos (respostas corretas e dados de visualização).		
- ##### 2.2 - Dashboard do Aluno
	- Notificações de casos/turmas
		- [ ] Lista de novos casos a serem respondidos (Com tempo para expirar). 
	- Relatórios de desempenho:	
		- [ ] Histórico de casos respondidos. 
	- Gerenciamento de turmas:
		- [ ] Entrar/Sair de turmas.
			- [x] Leitor de QR Code
			- [ ] Busca de turma por ID.			
		- [ ] Ler casos a serem visualizados/respondidos.
			- [ ] Sistema Kahoot! (Questionário)
			- [ ] Tela de conteúdo sobre o caso médico.
