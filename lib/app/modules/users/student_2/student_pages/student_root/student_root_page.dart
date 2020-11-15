import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_menu/drawers/drawers_widget.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_menu/student_menu_module.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_root/student_root_controller.dart';
import 'student_root_controller.dart';

class StudentRootPage extends StatefulWidget {
  final String title;
  const StudentRootPage({Key key, this.title = "Menu Aluno"})
      : super(key: key);

  @override
  _StudentRootPageState createState() => _StudentRootPageState();
}

class _StudentRootPageState
    extends ModularState<StudentRootPage, StudentRootController> {
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
      body: RouterOutlet(module: StudentMenuModule()),
    );
  }
}
