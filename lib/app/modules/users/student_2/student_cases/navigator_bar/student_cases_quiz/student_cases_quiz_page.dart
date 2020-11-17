import 'dart:ffi';

import 'package:flutter/material.dart';
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
                Container(
                    height: screenWidth * 1.4,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        QuizModel model = list[index];

                        if (model.type.compareTo("type1") == 0) {
                          return Container(
                            height: 60,
                            child: Column(
                              children: <Widget>[
                                Text('Questão ${index + 1} - Múltipla escolha',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(model.question,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 18,
                                      // fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          );
                        } else if (model.type.compareTo("type2") == 0) {
                          return Container(
                            height: 60,
                            child: Column(
                              children: <Widget>[
                                Text(
                                    'Questão ${index + 1} - Verdadeiro ou falso',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                  model.question,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    )),
              ],
            ),
          );
        }));
  }
}
