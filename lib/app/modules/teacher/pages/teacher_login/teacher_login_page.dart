import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:galinha_karoot/app/modules/common/EmailPasswordForm.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class TeacherLoginPage extends StatefulWidget {
  
  TeacherLoginPage({Key key, this.title = "Entrar como professor"})
      : super(key: key);

  final String title;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _TeacherLoginPageState createState() => _TeacherLoginPageState();
}

class _TeacherLoginPageState extends State<TeacherLoginPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus();
        },
        child:Center(
        child:     
          SingleChildScrollView(            
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * appPadding), 
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                    Image.asset("assets/bits.png", width: MediaQuery.of(context).size.width * appLogoMediumSize),
                    SizedBox(height: 20),
                    Text(widget.title, style: headerTextStyle),
                    EmailPasswordForm(callback: _authCallback),
                    InkWell(child: Text("Não tem uma conta?", style: TextStyle(color: Colors.blue)),
                            onTap: () => _gotoRegister()
                    )
                  ]
                )      
          )
        )
      )
    );
  }

  _authCallback(result) async{
    try{
      var user = (await Auth().getCurrentUser());
      if (user.uid.length > 0 && user.uid != null){ // && 

        // First check the role of the user
        if (await Auth().getCurrentUserRole() == "student"){
          throw Exception("Usuário já cadastrado como aluno!");
        }

        // Check for if mail is verified
        if(user.isEmailVerified){
          // String role = await Auth().getCurrentUserRole();
          Navigator.pushNamed(context, '/teacher/teacher_area');          
        }
        else{
          _showVerifyEmailSentDialog();
        }        
      }
      else {
        throw Exception("Usuário não cadastrado!");
      }
    }
    catch (e){
      _showSignInError(e);
    }
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

   void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verifique seu email."),
          content: new Text("Você precisa verificar seu email antes de continuar."),
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

  _gotoRegister(){
    Navigator.pushNamed(context, '/teacher/teacher_cadastro');
  }
}
