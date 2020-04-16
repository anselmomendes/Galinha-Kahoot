import 'package:flutter/material.dart';

class TeacherLoginPage extends StatefulWidget {
  final String title;
  const TeacherLoginPage({Key key, this.title = "TeacherLogin"})
      : super(key: key);

  @override
  _TeacherLoginPageState createState() => _TeacherLoginPageState();
}

class _TeacherLoginPageState extends State<TeacherLoginPage> {
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
                      "images/bits.png",
                      width: 200,
                    ),
                    // Text(
                    //   "\nPeensa",
                    //   style: TextStyle(fontSize: 23),
                    // )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.0,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'teacher_area');
                  },
                  //NAVIGATOR PARA A PRIMEIRA TELA
                  /*onPressed: () {
                    print("Email registrado: " +
                        _emailController.text +
                        "\nSenha registrada: " +
                        _senhaController.text);

                    // if (_emailController.text == login &&
                    //     _senhaController.text == senha) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AreaProfessor())); //nope
                    _senhaController.text = "";
                    // } else {
                    //   return new Alert(
                    //     context: context,
                    //     type: AlertType.error,
                    //     title: "AVISO",
                    //     desc: "Login ou senha incorretos!",
                    //     buttons: [
                    //       DialogButton(
                    //         child: Text(
                    //           "Ok",
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 20),
                    //         ),
                    //         onPressed: () => Navigator.pop(context),
                    //         width: 120,
                    //       )
                    //     ],
                    //   ).show();
                    // }
                  },*/
                  child: Text(
                    "Fazer Login",
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
                  //NAVIGATOR PARA O CADASTRO DO PROFESSOR
                  onPressed: () {
                    Navigator.pushNamed(context, 'cadastro_professor');
                  },
                  child: Text(
                    "Novo cadastro",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
