import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_module.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
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
    CasesSintomasModule(title: "Apresentação do Caso", page: 'apresentacao'),
    CasesSintomasModule(title: "Avaliação", page: 'avaliacao'),
    CasesSintomasModule(title: "Informações Cirúrgicas", page: 'procedimentos'),
    CasesSintomasModule(title: "Exames", page: 'exames'),
    // CasesSintomasModule(title: "Quiz", page: 'quiz'),

    // Modo antigo
    // CasesSintomasModule(),
    // CasesAvaliacaoModule(),
    // CasesProcedimentoModule(),
    // CasesExamesModule(),
    // CasesKahootModule(),
    CasesQuizModule(title: "Quiz", page: 'quiz'),
    CasesRelatorioModule(),
  ];

  @override
  Widget build(BuildContext context) {
    CasesModel model = controller.caseModel.data;
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: <Widget>[
          // CasesAnamneseModule(),
          // Novo modo
          CasesSintomasModule(
              title: "Apresentação do Caso",
              page: 'apresentacao',
              model: model),
          CasesSintomasModule(
              title: "Avaliação", page: 'avaliacao', model: model),
          CasesSintomasModule(
              title: "Informações Cirúrgicas",
              page: 'procedimentos',
              model: model),
          CasesSintomasModule(
            title: "Exames",
            page: 'exames',
            model: model,
          ),
          // CasesSintomasModule(title: "Quiz", page: 'quiz'),

          // Modo antigo
          // CasesSintomasModule(),
          // CasesAvaliacaoModule(),
          // CasesProcedimentoModule(),
          // CasesExamesModule(),
          // CasesKahootModule(),
          CasesQuizModule(
            page: 'quiz',
            model: model,
            title: "Quiz",
          ),
          CasesRelatorioModule(),
        ],
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
