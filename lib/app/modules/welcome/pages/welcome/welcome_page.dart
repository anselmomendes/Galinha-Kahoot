import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/welcome/pages/welcome/welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  const WelcomePage({Key key, this.title = "Welcome"}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends ModularState<WelcomePage, WelcomeController> {
  @override
  void initState() {
    super.initState();
    userIsLogged();
  }

  userIsLogged() async {
    print("Verificando user logado");
    var result = await controller.autoLogIn();
    String role = await controller.getUserRole();
    if (result) {
      if (role == "student") {
        Navigator.pushReplacementNamed(context, '/student_2/student_root');
      }
      if (role == "teacher") {
        // Navigator.pushReplacementNamed(context, '/teacher/teacher_root');
        // Nova rota
        Navigator.pushReplacementNamed(context, '/teacher/teacher_root');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/imagem7vermelho.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 200.0,
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
                        "assets/bitsbranco.png",
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
                      // Navigator.pushNamed(context, '/student/student_login');
                      Navigator.pushNamed(
                          // context, '/student/student_menu_options');
                          context,
                          '/student/student_login_email');
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
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
