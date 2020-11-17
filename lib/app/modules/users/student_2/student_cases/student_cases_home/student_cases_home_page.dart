import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_module.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_module.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_modulle_.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_module.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_controller.dart';

class StudentCasesHomePage extends StatefulWidget {
  final ClassModel classModel;
  StudentCasesHomePage({Key key, @required this.classModel}) : super(key: key);
  @override
  _StudentCasesHomePageState createState() => _StudentCasesHomePageState();
}

class _StudentCasesHomePageState
    extends ModularState<StudentCasesHomePage, StudentCasesHomeController> {
  @override
  void initState() {
    super.initState();
    print("Turma recebida na CaseHome: ${widget.classModel.className}");
    controller.getCase(widget.classModel);
  }

  final List<Widget> _widgetOptions = <Widget>[
    // CasesAnamneseModule(),
    // Novo modo
    StudentCasesSintomasModule(
        title: "Apresentação do Caso", page: 'apresentacao'),
    StudentCasesSintomasModule(title: "Avaliação", page: 'avaliacao'),
    StudentCasesSintomasModule(
        title: "Informações Cirúrgicas", page: 'procedimentos'),
    StudentCasesSintomasModule(title: "Exames", page: 'exames'),
    // CasesSintomasModule(title: "Quiz", page: 'quiz'),

    // Modo antigo
    // CasesSintomasModule(),
    // CasesAvaliacaoModule(),
    // CasesProcedimentoModule(),
    // CasesExamesModule(),
    // CasesKahootModule(),
    StudentCasesQuizModule(title: "Quiz", page: 'quiz'),
    //StudentCasesRelatorioModule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (controller.caseModel.data == null &&
              controller.pageViewController == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            CasesModel model = controller.caseModel.data;
            return PageView(
              controller: controller.pageViewController,
              children: <Widget>[
                // CasesAnamneseModule(),
                // Novo modo
                StudentCasesSintomasModule(
                    title: "Apresentação do Caso",
                    page: 'apresentacao',
                    model: model),
                StudentCasesSintomasModule(
                    title: "Avaliação", page: 'avaliacao', model: model),
                StudentCasesSintomasModule(
                    title: "Informações Cirúrgicas",
                    page: 'procedimentos',
                    model: model),
                StudentCasesSintomasModule(
                    title: "Exames", page: 'exames', model: model),
                // CasesSintomasModule(title: "Quiz", page: 'quiz'),

                // Modo antigo
                // CasesSintomasModule(),
                // CasesAvaliacaoModule(),
                // CasesProcedimentoModule(),
                // CasesExamesModule(),
                // CasesKahootModule(),
                StudentCasesQuizModule(
                    title: "Quiz", page: 'quiz', model: model),
                //StudentCasesRelatorioModule(),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller.pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: controller.pageViewController?.page?.round() ?? 0,
            selectedFontSize: 17,
            iconSize: 35,
            onTap: (index) {
              controller.pageViewController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered, color: Colors.white),
                backgroundColor: Colors.redAccent,
                title: Text('A', style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment, color: Colors.white),
                backgroundColor: Colors.redAccent,
                title: Text('A', style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_new, color: Colors.white),
                backgroundColor: Colors.redAccent,
                title: Text('I', style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.healing, color: Colors.white),
                backgroundColor: Colors.redAccent,
                title: Text('E', style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard, color: Colors.white),
                backgroundColor: Colors.redAccent,
                title: Text('Q', style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.subject, color: Colors.white),
                backgroundColor: Colors.redAccent,
                title: Text('R', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}
