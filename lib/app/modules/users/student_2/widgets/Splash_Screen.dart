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
    Future.delayed(Duration(seconds: 3)).then((_){
       Navigator.pushNamed(
                                  context, '/student_quiz/quizpage',
                                  arguments: widget.list);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset("assets/bits.png"),
              ),
            )
        );
  }
}
