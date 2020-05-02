import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/drawers/drawers_widget.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_root/teacher_root_controller.dart';

class TeacherRootPage extends StatefulWidget {
  final String title;
  const TeacherRootPage({Key key, this.title = "TeacherRoot"})
      : super(key: key);

  @override
  _TeacherRootPageState createState() => _TeacherRootPageState();
}

class _TeacherRootPageState
    extends ModularState<TeacherRootPage, TeacherRootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: DrawersWidget(),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return controller.selectedPage();
        },
      ),
    );
  }
}
