import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                    EmailPasswordForm(auth: widget._auth, callback: _authCallback),
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

  _authCallback(result){
    print(result);
  }

  _gotoRegister(){
    Navigator.pushNamed(context, '/teacher/teacher_cadastro');
  }
}
