import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_module.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_module_.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_module.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_controller.dart';

class StudentCasesHomePage extends StatefulWidget {
  final CasesModel casesModel;
  StudentCasesHomePage({Key key, @required this.casesModel}) : super(key: key);
  @override
  _StudentCasesHomePageState createState() => _StudentCasesHomePageState();
}

class _StudentCasesHomePageState
    extends ModularState<StudentCasesHomePage, StudentCasesHomeController> {
  @override
  void initState() {
    super.initState();
    print("Case recebido: ${widget.casesModel.title}");
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
    StudentCasesQuizModule(title: "Quiz", page: 'quiz'),
    StudentCasesRelatorioModule(title: "Relatório", page: 'relatorio'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: <Widget>[
          // CasesAnamneseModule(),
          // Novo modo
          StudentCasesSintomasModule(
            title: "Apresentação do Caso",
            page: 'apresentacao',
            idCase: widget.casesModel.id,
          ),
          StudentCasesSintomasModule(
              title: "Avaliação",
              page: 'avaliacao',
              idCase: widget.casesModel.id),
          StudentCasesSintomasModule(
              title: "Informações Cirúrgicas",
              page: 'procedimentos',
              idCase: widget.casesModel.id),
          StudentCasesSintomasModule(
              title: "Exames", page: 'exames', idCase: widget.casesModel.id),

          StudentCasesQuizModule(
              title: "Quiz", page: 'quiz', model: widget.casesModel),
          StudentCasesRelatorioModule(
              title: "Relatório", page: 'relatorio', model: widget.casesModel),
          //StudentCasesRelatorioModule(),
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
