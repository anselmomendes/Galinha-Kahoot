import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';

class Splash extends StatefulWidget {
  final List<QuizModel> list;

  const Splash({
    Key key,
    @required this.list,
  }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushNamed(context, '/student_quiz/quizpage',
          arguments: widget.list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [ 
         Expanded(
          flex: 2, 
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagem7.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 300.0),),
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
              ),
              Container(
                width: 150,
                height: 150,
                child: Image.asset("assets/bits.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                
              ),
                Text(
                  'Iniciando Quiz!',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                  Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                
              ),
               Container(
                width: 150,
                height: 150,
                child: Image(image : NetworkImage('https://olaargentina.com/wp-content/uploads/2019/11/loading-gif-transparent-10.gif'))
              ),
            ],
          ),
        ),
      ),
      ),],),
    );
  }
}
