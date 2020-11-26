import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/common/BaseAuth.dart';
import 'package:PeensA/app/modules/common/styles.dart';

class TeacherCadastroPage extends StatefulWidget {
  final auth = Auth();
  final String title;
  TeacherCadastroPage({Key key, this.title = "Novo cadastro"})
      : super(key: key);

  @override
  _TeacherCadastroPageState createState() => _TeacherCadastroPageState();
}

class _TeacherCadastroPageState extends State<TeacherCadastroPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        padding: EdgeInsets.only(
            top: screenWidth * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05),
        child: Center(
            child: Column(children: <Widget>[
          Image.asset("assets/bits.png",
              width: MediaQuery.of(context).size.width * appLogoMediumSize),
          SizedBox(height: 20),
          Text("Registro de professor", style: headerTextStyle),
          SizedBox(height: 20),
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                // Nome
                TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      hintText: "Nome completo",
                      prefixIcon: Icon(Icons.person),
                    )),

                // Universidade
                TextFormField(
                    controller: _universityController,
                    decoration: const InputDecoration(
                      labelText: 'Universidade',
                      hintText: "Nome da Universidade",
                      prefixIcon: Icon(Icons.school),
                    )),

                // Email
                TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: "Endereço de email",
                      prefixIcon: Icon(Icons.mail),
                    )),

                // Senha
                TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      hintText: "Senha",
                      prefixIcon: Icon(Icons.lock),
                    )),
              ])),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    onPressed: _register,
                    color: appColor,
                    child: Text('Registrar-se',
                        style: TextStyle(color: Colors.white)))
              ])
        ])));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    try {
      String userId = (await widget.auth.signUp(
        _emailController.text,
        _passwordController.text,
      ));
      widget.auth.sendEmailVerification();
      widget.auth.createUserMeta(
          "teacher", _nameController.text, _universityController.text);
      _showVerifyEmailSentDialog();
    } catch (e) {
      _showRegistrationError("$e");
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
