import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  const WelcomePage({Key key, this.title = "Welcome"}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final _senhaController = TextEditingController();
    final _emailController = TextEditingController();
    String login;
    String senha;

    //Autenticação em string para testes. Trabalhos futuros: implementar autenticação mais segura.
    login = "teste";
    senha = "teste";

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 100.0,
          left: 40.0,
          right: 40.0,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250.0,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/bits.png",
                      width: 200,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [Colors.red, Colors.redAccent],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  //NAVIGATOR PARA A PRIMEIRA TELA
                  onPressed: () {
                    Navigator.pushNamed(context, '/teacher/teacher_login');
                  },
                  child: Text(
                    "Sou professor",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50.0,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [Colors.red, Colors.redAccent],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  //NAVIGATOR PARA A PRIMEIRA TELA
                  onPressed: () {
                    Navigator.pushNamed(context, '/student/student_login');
                  },
                  child: Text(
                    "Sou aluno",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
