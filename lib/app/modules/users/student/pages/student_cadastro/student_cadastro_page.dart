import 'package:PeensA/app/modules/users/student/pages/student_cadastro/student_cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/common/BaseAuth.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:load/load.dart';

class StudentCadastroPage extends StatefulWidget {
  final Auth auth = Auth();
  final String title;

  StudentCadastroPage({Key key, this.title = "Novo cadastro"})
      : super(key: key);

  @override
  _StudentCadastroPageState createState() => _StudentCadastroPageState();
}

class _StudentCadastroPageState
    extends ModularState<StudentCadastroPage, StudentCadastroController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _success;

  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    var screenWidth = MediaQuery.of(context).size.width;

    return LoadingProvider(
      child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: screenWidth * 0.2,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05),
          child: Center(
              child: Column(children: <Widget>[
            Image.asset("assets/bits.png",
                width: MediaQuery.of(context).size.width * appLogoMediumSize),
            SizedBox(height: 20),
            Text("Registro de aluno", style: headerTextStyle),
            SizedBox(height: 20),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Observer(
                      builder: (_) => _entryField(
                          labelText: "Nome:",
                          hintText: "Nome completo",
                          onChanged: controller.changeName,
                          errorText: controller.validateName,
                          icon: Icon(Icons.person))),
                  Observer(
                      builder: (_) => _entryField(
                          labelText: "Universidade:",
                          hintText: "Nome da Universidade",
                          onChanged: controller.changeUniversity,
                          errorText: controller.validateUniversity,
                          icon: Icon(Icons.school))),
                  // Email
                  Observer(
                      builder: (_) => _entryField(
                          labelText: "Email:",
                          hintText: "Endereço de email",
                          onChanged: controller.changeEmail,
                          errorText: controller.validateEmail,
                          icon: Icon(Icons.mail))),
                  Observer(
                      builder: (_) => _entryField(
                          isPassword: true,
                          labelText: "Senha:",
                          hintText: "Senha",
                          onChanged: controller.changePassword,
                          errorText: controller.validatePassword,
                          icon: Icon(Icons.lock))),
                ])),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Observer(
                    builder: (_) => FlatButton(
                        disabledColor: Colors.grey,
                        onPressed: controller.isValid
                            ? () {
                                _register();
                              }
                            : null,
                        color: appColor,
                        child: Text('Registrar-se',
                            style: TextStyle(color: Colors.white))),
                  )
                ])
          ]))),
    );
  }

  Widget _entryField(
      {bool isPassword = false,
      String labelText,
      onChanged,
      String Function() errorText,
      Icon icon,
      String hintText}) {
    return TextFormField(
        obscureText: isPassword,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: icon,
          errorText: errorText == null ? null : errorText(),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    try {
      showLoadingDialog();
      String userId = (await widget.auth.signUp(
        controller.email,
        controller.password,
      ));
      widget.auth.sendEmailVerification();
      widget.auth
          .createUserMeta("student", controller.name, controller.university);
      _showVerifyEmailSentDialog();
    } catch (e) {
      hideLoadingDialog();
      _showRegistrationError("$e ");
    }
  }

  void _showRegistrationError(e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Houve um erro!"),
          content: new Text(e),
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

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verifique seu email."),
          content:
              new Text("Um link para verificação foi enviado para seu email."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.pushNamed(context, Modular.initialRoute);
              },
            ),
          ],
        );
      },
    );
  }
}
