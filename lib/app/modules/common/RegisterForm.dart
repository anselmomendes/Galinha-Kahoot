import 'styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterForm extends StatefulWidget{
    RegisterForm({Key key, this.target, this.auth, this.callback}): super(key: key);
    final target;
    final auth;
    final callback;

    @override
    State<StatefulWidget> createState() => _RegisterFormState();   
}

class _RegisterFormState extends State<RegisterForm>{

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _universityController = TextEditingController();    
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context){
        return Form(
          key: _formKey,
          child: _generateWidgets()
        );
    }

  _generateWidgets(){
    return Column(
      children: <Widget>[  

        // App logo
        SizedBox(height: 20),
        Image.asset("images/app_logo.png", width: MediaQuery.of(context).size.width * appLogoMediumSize),
        SizedBox(height: 20), // Sim isso é preguiça
        // Header
        Text("Registro de "+ widget.target, style: headerTextStyle),
        SizedBox(height: 20), // Sim isso é preguiça

        // Nome
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Seu nome',
            labelText: 'Nome completo',
          ),
          validator: (String value) {
            return value.split(' ').length < 2 ? 'Insira seu nome completo.' : null;
          },
        ),

        // Universidade
        TextFormField(
          controller: _universityController,
          decoration: const InputDecoration(
            icon: Icon(Icons.school),
            hintText: 'Nome da universidade',
            labelText: 'Universidade',
          ),
          validator: (String value) {
            return null; // Caso seja necessário alguma checagem posterior
          },
        ),

        // Email 
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Endereço de email',
            labelText: 'Email',
          ),
          validator: (String value) {
            return !value.contains('@') ? 'Insira um email válido.' : null;
          },
        ),

        // Senha 
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Senha',
            labelText: 'Senha',
          ),
          obscureText: true,
          validator: (String value) {
            return value.length < 8 ? 'Insira uma senha de pelo menos 8 caracteres.' : null;
          },
        ),

        // Botão de Registro
        Container( 
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            RaisedButton(
              color: appContrastColor,
              textColor: Colors.white,
              onPressed: () async {
                if(_formKey.currentState.validate()){
                  _register();
                }
              },
             child: const Text('Registrar-se'),
            ),


            ]
          )
        )
      ]
    );    
  }

    void _register() async {
      final FirebaseUser user = (await widget.auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      widget.callback(user);
    }

  @override
  void dispose() {
    _nameController.dispose();
    _universityController.dispose();
    _emailController.dispose();
    _passwordController.dispose();    
    super.dispose();
  }  

}



