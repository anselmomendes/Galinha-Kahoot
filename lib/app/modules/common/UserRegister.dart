import 'styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class UserRegister extends StatefulWidget{
    final String title = 'User Register';

    @override
    State<StatefulWidget> createState() => UserRegisterState();

}

class UserRegisterState extends State<UserRegister> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool _success;
    String _userEmail;
    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _body()       
      );
    }

    _body(){
      return ListView(children: <Widget>[
        Image.asset("assets/bits.png",width: MediaQuery.of(context).size.width * appLogoSmallSize),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              // Form de email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira um email válido.';
                  }
                  return null;
                },
              ),

              // Form de senha
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Por favor, digite uma senha.';
                  }
                  return null;
                },
              ),

              // Botão de Registro
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _register();
                    }
                  },
                  child: const Text('Registrar-se'),
                ),
              ),

              // Caixa de feedback
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                        ? _userEmail + 'registrado com sucesso.'
                        : 'O registro falhou, tente novamente.')),
              )
            ],
          ),
        ),
      ]);
    }

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    void _register() async {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        _success = false;
      }
    }

}