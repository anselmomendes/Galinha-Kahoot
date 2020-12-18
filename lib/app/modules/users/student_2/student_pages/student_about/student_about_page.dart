import 'package:PeensA/app/modules/users/teacher/pages/teacher_about/termos_de_uso.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentAboutPage extends StatefulWidget {
  final String title;
  final bool showAppBar;
  const StudentAboutPage(
      {Key key, this.title = "StudentAbout", this.showAppBar})
      : super(key: key);

  @override
  _StudentAboutPageState createState() => _StudentAboutPageState();
}

class _StudentAboutPageState extends State<StudentAboutPage> {
  final double title = 23;
  final double subtitle = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o aplicativo"),
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
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 85.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/logoCipe.png"),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 85.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/brasaouepa.png"),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 85.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/logo-original-fundo-claro.png"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Divider(),
                          Text(
                            "Mestrado Profissional em Cirurgia e Pesquisa Experimental - CIPE\n Universidade do Estado do Pará",
                            style: TextStyle(
                                color: Color(0xff385623),
                                fontSize: title,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            child: ListTile(
                                title: Text(
                                  "Linha de atuação científico tecnológica:",
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
                                      """Desenvolvimento de tecnologia nas áreas cirúrgicas e afins.\n
Este aplicativo é um produto de tese desenvolvido por Eunice Lara dos Santos Cunha no Programa de Mestrado Profissional em Cirurgia e Pesquisa Experimental. Programa credenciado pela CAPES.
""",
                                      style: TextStyle(fontSize: subtitle),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      "Contato:",
                                      style: TextStyle(
                                          fontSize: subtitle,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      child: Text(
                                        "laracunha30@hotmail.com",
                                        style: TextStyle(
                                          fontSize: subtitle,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: () {
                                        launch(
                                            'mailto:laracunha30@hotmail.com');
                                      },
                                    ),
                                    Text(
                                      "\nOrientador(a):",
                                      style: TextStyle(
                                          fontSize: subtitle,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      """ Prof. Dr. Jofre Jacob da Silva Freitas""",
                                      style: TextStyle(fontSize: subtitle),
                                    ),
                                    Text(
                                      "\nCoorientador(as):",
                                      style: TextStyle(
                                          fontSize: subtitle,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      """ Prof. Dr. Anderson Bentes de Lima""",
                                      style: TextStyle(fontSize: subtitle),
                                    ),
                                    Text(
                                      "\nDesenvolvido por:",
                                      style: TextStyle(
                                          fontSize: subtitle,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      child: Center(
                                        child: Container(
                                          width: 143.0,
                                          height: 90.0,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/logo_bitsjr.png"),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        launch("https://bitsjr.com.br");
                                      },
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        """Bits Jr. - Soluções em TI""",
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          child: ListTile(
                              title: Text(
                                "Legal",
                                style: TextStyle(
                                    color: Color(0xff385623),
                                    fontSize: title,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: RaisedButton(
                                      color: Colors.white,
                                      child: SizedBox(
                                        child: Text(
                                          "Termos de uso do aplicativo",
                                          style: TextStyle(fontSize: subtitle),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Termos()));
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
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
