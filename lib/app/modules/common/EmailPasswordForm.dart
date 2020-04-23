import 'styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordForm extends StatefulWidget{

    EmailPasswordForm({Key key, this.auth, this.callback}): super(key: key);
    final auth;
    final callback;

    @override
    State<StatefulWidget> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm>{

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();


    @override
    Widget build(BuildContext context){
        return Form(
          key: _formKey,
          child: Column(children: <Widget>[
            // Form de email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String value){
                if (value.isEmpty){
                  return "Por favor, insira um email!";
                }
                return null;
              }
            ),

            // Form de senha
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
              validator: (String value){
                if (value.isEmpty){
                  return "Por favor, insira uma senha!";
                }
                return null;
              }
            ),

            // Botão de login
            Container( 
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                color: appContrastColor,
                textColor: Colors.white,
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    _signInEmailPassword();
                  }
                },
                child: const Text('Entrar'),
              )
            )
          ],
        ));
    }

      // Example code of how to sign in with email and password.
      void _signInEmailPassword() async {

        try{
          
          final FirebaseUser user = (await widget.auth.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          )).user;

          widget.callback(user);
        }
        catch (Exception){
          print("Erro ao efetuar login...");
        }

      }

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

}