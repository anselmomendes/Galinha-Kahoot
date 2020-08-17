import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'cases_quiz_edit_controller.dart';

class CasesQuizEditPage extends StatefulWidget {
  final String title;
  final QuizModel model;
  const CasesQuizEditPage({Key key, this.title = "CasesQuizEdit", this.model})
      : super(key: key);

  @override
  _CasesQuizEditPageState createState() => _CasesQuizEditPageState();
}

class _CasesQuizEditPageState
    extends ModularState<CasesQuizEditPage, CasesQuizEditController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
