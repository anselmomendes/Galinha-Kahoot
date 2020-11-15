import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
  int easter = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: screenWidth * 0.08,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/bits.png",
                    height: 150.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Problematização Estratégica de Ensino em Saúde Aplicada",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                  Divider(height: 25.0),
                  Text(
                    "Aplicativo para Mestrado\n",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Aplicativo de compartilhamento de conteúdos sobre casos médicos com questionários online.",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  // Divider(height: 30.0),
                  SizedBox(
                    height: screenWidth * 0.35,
                  ),
                  Text(
                    'Política de Privacidade:',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                              "https://bitsjr.com.br/financas/privacy_policy_financas.html",
                          style: TextStyle(color: Colors.blue, fontSize: 12.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              /* launch(
                              'https://bitsjr.com.br/financas/privacy_policy_financas.html' 
                              ); */
                            })
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              /* padding: EdgeInsets.only(
                  // top: screenWidth * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05), */
              constraints: BoxConstraints.expand(height: 45.0),
              // color: Colors.lightBlue[300],
              child: Text(
                "Aplicativo desenvolvido por Bits Jr.\nwww.bitsjr.com.br",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Image.asset(
              "assets/logo_bitsjr.png",
              height: 40.0,
            ),
            /* Padding(
              padding: EdgeInsets.only(top: 10.0),
            ), */
          ],
        ),
      ),
    );
  }
}
