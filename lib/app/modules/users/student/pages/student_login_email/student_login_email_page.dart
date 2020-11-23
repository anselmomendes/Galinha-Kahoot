import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:PeensA/app/modules/common/BaseAuth.dart';
import 'package:PeensA/app/modules/common/EmailPasswordForm.dart';
import 'package:PeensA/app/modules/common/styles.dart';

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
      print(user);
      if (user.uid.length > 0 && user.uid != null) {
        var role = await Auth().getUserRole();
        print(role);

        // First check the role of the user
        if (role != null) {
          // Check for if mail is verified
          if (user.isEmailVerified) {
            if (role == "student")
              Navigator.pushNamed(context, '/student_2/student_root');
              // Navigator.pushNamed(context, '/student_2/teacher_menu');
              // Navigator.pushNamed(context, '/student/student_menu');
            else if (role == "teacher")
              throw Exception("Este usuário já cadastrado como professor!");
            else
              throw Exception("Usuário mal cadastrado!");
          } else
            _showVerifyEmailSentDialog(user.email);
        } else {
          throw Exception("Usuário mal cadastrado!");
        }
      } else {
        throw Exception("Usuário não cadastrado!");
      }
    } catch (e) {
      _showSignInError(e.toString());
    }
  }

  _authError(error) async {
    _showSignInError(error);
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
