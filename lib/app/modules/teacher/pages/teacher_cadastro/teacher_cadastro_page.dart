import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class TeacherCadastroPage extends StatefulWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
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
    bool _success;
    String _userEmail;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: _body()       
        );
    }
    _body(){      
      var screenWidth = MediaQuery.of(context).size.width;


      return SingleChildScrollView(
          padding: EdgeInsets.only(top: screenWidth * 0.2, left: screenWidth * 0.05, right: screenWidth * 0.05),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset("assets/bits.png", width: MediaQuery.of(context).size.width * appLogoMediumSize),
                SizedBox(height: 20),
                Text("Registro de professor", style: headerTextStyle),
                SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[

                      // Nome
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome', 
                          hintText: "Nome completo",
                          prefixIcon:Icon(Icons.person),               
                        )
                      ),

                      // Universidade
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Universidade', 
                          hintText: "Nome da Universidade",
                          prefixIcon:Icon(Icons.school),               
                        )
                      ),

                      // Email
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Email', 
                          hintText: "Endereço de email",
                          prefixIcon:Icon(Icons.mail),               
                        )
                      ),                      

                      // Senha
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Senha', 
                          hintText: "Senha",
                          prefixIcon:Icon(Icons.lock),               
                        )
                      ),     

                    ]                    
                  )
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(onPressed: _register,color: appColor, child: Text('Registrar-se', style: TextStyle(color: Colors.white)))
                  ]
                )

              ]
            )
          )
        );
    }

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    void _register() async {
      final FirebaseUser user = (await widget._auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      print(user);
    }
}
