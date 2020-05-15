import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:galinha_karoot/app/modules/common/EmailPasswordForm.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class StudentEmailLoginPage extends StatefulWidget {
  final String title;

  StudentEmailLoginPage({Key key, this.title = "Entrar como aluno"})
      : super(key: key);

  @override
  _StudentEmailLoginPageState createState() => _StudentEmailLoginPageState();
}

class _StudentEmailLoginPageState extends State<StudentEmailLoginPage> {
  @override
  Widget build(BuildContext context) {
    String teste;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * appPadding),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset("assets/bits.png",
                              width: MediaQuery.of(context).size.width *
                                  appLogoMediumSize),
                          SizedBox(height: 20),
                          Text(widget.title, style: headerTextStyle),
                          Text(teste.toString()),
                          EmailPasswordForm(
                              callback: _authCallback, ecallback: _authError),
                          InkWell(
                              child: Text("Não tem uma conta?",
                                  style: TextStyle(color: Colors.blue)),
                              onTap: () => _gotoRegister())
                        ])))));
  }

  _authCallback(result) async {
    try {
      var user = (await Auth().getCurrentUser());
      if (user.uid.length > 0 && user.uid != null) {
        var role = await Auth().getUserRole();

        // First check the role of the user
        if (role != null) {
          // Check for if mail is verified
          if (user.isEmailVerified) {
            if (role == "student")
              Navigator.pushNamed(context, '/student/student_menu');
            else
              throw Exception("Este usuário já cadastrado como professor!");
          } else
            _showVerifyEmailSentDialog(user.email);
        } else {
          throw Exception("Usuário mal cadastrado!");
        }
      } else {
        throw Exception("Usuário não cadastrado!");
      }
    } catch (e) {
      _showSignInError(e);
    }
  }

  _authError(PlatformException error) async {
    _showSignInError(error.message);
  }

  void _showSignInError(text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Houve um erro!"),
          content: new Text(text),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog(email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verifique seu email."),
          content: new Text("Você precisa verificar seu email (" +
              email +
              ") antes de continuar."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        );
      },
    );
  }

  _gotoRegister() {
    Navigator.pushNamed(context, '/student/student_register');
  }
}
