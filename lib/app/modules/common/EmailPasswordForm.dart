import 'package:PeensA/app/modules/common/splash_loading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/common/BaseAuth.dart';
import 'package:PeensA/app/modules/welcome/pages/welcome/welcome_controller.dart';
import 'package:load/load.dart';

import 'styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordForm extends StatefulWidget {
  EmailPasswordForm({Key key, this.callback, this.ecallback}) : super(key: key);
  final Auth auth = Auth();
  final callback;
  final ecallback;

  @override
  State<StatefulWidget> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState
    extends ModularState<EmailPasswordForm, WelcomeController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Form de email
            TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Por favor, insira um email!";
                  }
                  return null;
                }),

            // Form de senha
            TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Por favor, insira uma senha!";
                  }
                  return null;
                }),

            // Botão de login
            Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: RaisedButton(
                  color: appContrastColor,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      onSubmit();
                    }
                  },

                  /*
                  // Para testes
                  onPressed: () {
                    Navigator.pushNamed(context, '/teacher/teacher_root');
                  },*/
                  child: const Text('Entrar'),
                ))
          ],
        ));
  }

  void onSubmit() async {
    String userId;
    try {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashLoad()));
      userId = await widget.auth
          .signIn(_emailController.text, _passwordController.text);
      if (userId != null && userId.length > 0) {
        emitCallback(await widget.auth.getCurrentUser());
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      emitError(e.toString());
    }
  }

  void emitCallback(FirebaseUser user) {
    controller.loginUser('isLogin');
    widget.callback(user);
  }

  void emitError(error) {
    Navigator.pop(context);
    widget.ecallback(error);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
