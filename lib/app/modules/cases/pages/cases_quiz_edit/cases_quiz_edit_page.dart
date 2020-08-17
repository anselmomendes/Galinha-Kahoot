import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cases_quiz_edit_controller.dart';

class CasesQuizEditPage extends StatefulWidget {
  final String title;
  const CasesQuizEditPage({Key key, this.title = "CasesQuizEdit"})
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
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
