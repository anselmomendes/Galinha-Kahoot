import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/student_Quiz/student_quiz_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_controller.dart';

class StudentCasesQuizPage extends StatefulWidget {
  final String title;
  final String page;
  final CasesModel model;
  const StudentCasesQuizPage({Key key, this.title, this.model, this.page})
      : super(key: key);

  @override
  _StudentCasesQuizPageState createState() => _StudentCasesQuizPageState();
}

class _StudentCasesQuizPageState
    extends ModularState<StudentCasesQuizPage, StudentCasesQuizController> {
  bool editMode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.loadQuiz(widget.model.id, widget.page);
    editMode = false;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appContrastColor,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          if (controller.quizList.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.quizList.data.isEmpty) {
            return Text("Nenhum caso encontrado");
          }
          List<QuizModel> list = controller.quizList.data;
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  elevation: 5,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.list,
                          size: 40.0,
                        ),
                        title: Text('Questões de Múltipla Escolha'),
                        subtitle: Text(
                          '5/10',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  elevation: 5,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.done_outline,
                          size: 30.0,
                        ),
                        title: Text(
                          'Questões de Verdadeiro ou Falso',
                        ),
                        subtitle: Text(
                          '5/10',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: screenWidth * 1.4,
                    child: Container(
                      child: Center(
                        child: RaisedButton(
                            color: Colors.blue,
                            padding: const EdgeInsets.fromLTRB(
                                40.0, 20.0, 40.0, 20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.blue)),
                            child: Text(
                              "Iniciar Quiz",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/student_2/splash_screen_quiz',
                                arguments: list,
                              );
                            }),
                      ),
                    )),
              ],
            ),
          );
        }));
  }

  Widget _introScreen() {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 3,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xffED213A), Color(0xff93291E)],
          ),
          navigateAfterSeconds: StudentQuizPage(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bits.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
