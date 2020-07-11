import 'styles.dart';
import 'EmailPasswordForm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  AuthPage(this.title, this.registerPage) : super();

  final String title;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Widget registerPage;

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

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
                    Image.asset("images/logo.png", width: MediaQuery.of(context).size.width * appLogoMediumSize),
                    SizedBox(height: 20),
                    Text(widget.title, style: headerTextStyle),
                    EmailPasswordForm(callback: _authCallback, ecallback: _errorCallback),
                    InkWell(child: Text("Não tem uma conta?", style: TextStyle(color: Colors.blue)),
                            onTap: () => _gotoPage(widget.registerPage)
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

  _errorCallback(error){
    print(error);
  }

  _gotoPage(Widget page){
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_)=> page));
  }
}
