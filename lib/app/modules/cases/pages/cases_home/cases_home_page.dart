import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_anamnese/cases_anamnese_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_avaliacao/cases_avaliacao_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_exames/cases_exames_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_kahoot/cases_kahoot_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_procedimento/cases_procedimento_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_module.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class CasesHomePage extends StatefulWidget {
  final CasesModel model;
  CasesHomePage({Key key, @required this.model}) : super(key: key);
  @override
  _CasesHomePageState createState() => _CasesHomePageState();
}

class _CasesHomePageState
    extends ModularState<CasesHomePage, CasesHomeController> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    // CasesAnamneseModule(),
    CasesSintomasModule(),
    CasesAvaliacaoModule(),
    CasesProcedimentoModule(),
    CasesExamesModule(),
    CasesKahootModule(),
    CasesRelatorioModule(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 17,
        backgroundColor: appContrastColor,
        selectedItemColor: appContrastColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_numbered,
              color: Colors.white,
            ),
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
          /* BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital, color: Colors.white),
            backgroundColor: Colors.red,
            title: Text('I', style: TextStyle(color: Colors.white)),
          ), */
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
