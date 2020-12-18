import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Termos extends StatelessWidget {
  final double title = 23;
  final double subtitle = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Termos de Uso"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Color.fromRGBO(240, 240, 240, 1.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Image.asset(
                            "assets/bits.png",
                            height: 150.0,
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            child: ListTile(
                                title: Text(
                                  "Termos de Uso de Aplicativo",
                                  style: TextStyle(
                                      color: Color(0xff385623),
                                      fontSize: title,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 10,
                                    ),
                                    Text(
                                      """O aplicativo PeensA® fornece um serviço educativo relacionado à problematização de casos cotidianos em saúde, fornecendo um conteúdo coletivo. Por favor, leia atentamente os seguintes termos e condições em nossa Política de Privacidade. """,
                                      style: TextStyle(fontSize: subtitle),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      """\n AO ACESSAR OU UTILIZAR OS SERVIÇOS PRESTADOS NO APLICATIVO, INCLUINDO PUBLICAÇÕES, OU QUAISQUER INFORMAÇÕES SOBRE O CONTEÚDO A PARTIR DOS SERVIÇOS, VOCÊ INDICA QUE LEU, COMPREENDEU E CONCORDA EM ACEITAR ESSES TERMOS, O QUE CONSTITUI UM CONTRATO LEGAL, VINCULANTE ENTRE VOCÊ E O PeensA®. VOCÊ SOMENTE TERÁ O DIREITO DE ACESSAR, OU USAR OS SERVIÇOS, ASSIM COMO CONTEÚDOS COLETIVOS SE CONCORDAR COM OS SEGUINTES TERMOS: """,
                                      style: TextStyle(fontSize: subtitle),
                                    ),
                                    Text(
                                      """\n 
    1. Termos principais relacionados ao conteúdo: Conteúdo inclui tudo que está relacionado a textos, gráficos, imagens, mensagens ou outros materiais “conteúdo coletivo”, significa que coletivamente os usuários registrados poderão publicar em áreas especificas do aplicativo, sendo este quesito optativo para o usuário. O usuário pode fazer o Upload de material publicar e submeter ou enviar para ser disponibilizada através de serviços. “Mensagens diretas” permitem uma característica de mensagens a qual os usuários registrados se comuniquem.
    \n2. Edições: PeensA reserva-se o direito do usuário, a seu exclusivo critério, modificar, interromper ou encerrar os serviços ou qualquer aspecto deles, a qualquer momento e sem aviso prévio. Se nós modificarmos estes termos publicaremos as modificações neste APP, ou enviaremos uma notificação. Se os termos modificados não forem aceitáveis para você, você concorda em interromper o uso dos serviços ou de forma imediata. 
    \n3. Registros de Contas : Ao se cadastrar o professor ou aluno podem se realizar sua identificação no app e organizar sua conta com os casos e questões que queiram criar, e/ou analisar às questões pré-existentes.  
    \n4. Termos de Privacidade
    \n4.1- Fica proibido à veiculação de fotos expositivas, que comprometam terceiros, fotos da internet só serão permitidas mediante as devidas referências sobre as fontes pesquisadas. 	
    \n4.2- Fica proibido fornecer informações sigilosas sobre setores públicos ou privados, como fotos de prontuários, ou fotos setoriais, nomes institucionais, assim como menção específica à profissionais envolvidos.
    \n4.3- Não nos responsabilizamos, por quaisquer fotos pessoais publicadas no app, com exceção de imagens que não comprometam a integridade individual, aceita-se o envio de fotos específicas, mas que não identifique o paciente, como exemplo: foto de um pé diabético. Ressalta-se que o app é para fins educativos, partilha de informações e agregar conhecimento profissional e acadêmico.   
    """,
                                      style: TextStyle(fontSize: subtitle),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
