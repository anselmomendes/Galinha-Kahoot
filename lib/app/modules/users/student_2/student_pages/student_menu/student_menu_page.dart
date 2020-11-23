// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentMenuPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const StudentMenuPage(
      {Key key, this.title = "Professor e Estudante - Teste", this.showAppBar})
      : super(key: key);

  @override
  _StudentMenuPageState createState() => _StudentMenuPageState();
}

class _StudentMenuPageState extends State<StudentMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(),
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: true,
              title: Text(widget.title),
            )
          : null,
      body: 
      Container(
          decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/imagem7vermelho2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      child: Center(
          child: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 5)),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.all(15),
            elevation: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                const ListTile(
                  //contentPadding: EdgeInsets.only(left: 30),
                  leading: Icon(
                    Icons.list,
                    color: Colors.blueGrey,
                    size: 40.0,
                  ),
                  title: Text('Turmas',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  subtitle: Text('Acesse suas turmas cadastradas.',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.redAccent,
                      child: const Text('ACESSAR'),
                      onPressed: () {
                        Modular.to
                            .pushNamed('/student_class/student_class_list');
                      },
                    ),
                    FlatButton(
                      color: Colors.redAccent,
                      child: const Text('CADASTRAR'),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/')
                        // Navigator.pushNamed(context, '/teacher_select');
                        Modular.to
                            .pushNamed('/student_class/student_add_class');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.all(15),
            elevation: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.public,
                    color: Colors.blueGrey,
                    size: 40.0,
                  ),
                  title: Text('Casos Públicos',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  subtitle:
                      Text('Acesse casos criados por outros professores.',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.redAccent,
                      child: const Text('ACESSAR'),
                      onPressed: () {
                        // Modular.to.pushNamed('/teacher/teacher_report');
                        Modular.to
                            .pushNamed('/student_cases/cases_public');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
      ),
    );
  }
}
