import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../pages/teacher_menu/drawers/drawers_widget.dart';
import '../../pages/teacher_menu/teacher_menu_module.dart';
import 'teacher_root_controller.dart';

class TeacherRootPage extends StatefulWidget {
  final String title;
  const TeacherRootPage({Key key, this.title = "Menu Aluno"})
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
        backgroundColor: Colors.redAccent,
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: DrawersWidget(),
      ),
      body: RouterOutlet(module: TeacherMenuModule()),
    );
  }
}
