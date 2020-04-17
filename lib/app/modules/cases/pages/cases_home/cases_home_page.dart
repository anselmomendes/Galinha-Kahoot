import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_anamnese/cases_anamnese_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_avaliacao/cases_avaliacao_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_exames/cases_exames_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_kahoot/cases_kahoot_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_procedimento/cases_procedimento_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_relatorio/cases_relatorio_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_sintomas/cases_sintomas_page.dart';

class CasesHomePage extends StatefulWidget {
  @override
  _CasesHomePageState createState() => _CasesHomePageState();
}

class _CasesHomePageState extends State<CasesHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    CasesSintomasPage(),
    CasesAnamnesePage(),
    CasesAvaliacaoPage(),
    CasesExamesPage(),
    CasesProcedimentoPage(),
    CasesKahootPage(),
    CasesRelatorioPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 17,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_numbered,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            title: Text('S', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Colors.white),
            backgroundColor: Colors.red,
            title: Text('A', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new, color: Colors.white),
            backgroundColor: Colors.red,
            title: Text('Av', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital, color: Colors.white),
            backgroundColor: Colors.red,
            title: Text('E', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing, color: Colors.white),
            backgroundColor: Colors.red,
            title: Text('P', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Colors.white),
            backgroundColor: Colors.red,
            title: Text('K', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subject, color: Colors.white),
            backgroundColor: Colors.red,
            title: Text('R', style: TextStyle(color: Colors.white)),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
