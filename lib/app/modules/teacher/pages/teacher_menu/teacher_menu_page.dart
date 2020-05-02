// import 'dart:html';

import 'package:flutter/material.dart';

class TeacherMenuPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const TeacherMenuPage({Key key, this.title = "Professor", this.showAppBar})
      : super(key: key);

  @override
  _TeacherMenuPageState createState() => _TeacherMenuPageState();
}

class _TeacherMenuPageState extends State<TeacherMenuPage> {
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
      body: Center(
          child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            elevation: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //const SizedBox(height: 15,),
                const ListTile(
                  //contentPadding: EdgeInsets.only(left: 30),
                  leading: Icon(
                    Icons.local_hospital,
                  ),
                  title: Text('Casos'),
                  subtitle: Text('Acesse ou crie casos médicos.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.red,
                      child: const Text('ACESSAR'),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/');
                        Navigator.pushNamed(
                            context, '/teacher/teacher_list_cases');
                      },
                    ),
                    FlatButton(
                      color: Colors.red,
                      child: const Text('CRIAR'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cases/cases_register');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
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
                  leading: Icon(Icons.list),
                  title: Text('Turmas'),
                  subtitle:
                      Text('Acesse status de turmas ou crie novas turmas.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.red,
                      child: const Text('ACESSAR'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/class/class_list/');
                      },
                    ),
                    FlatButton(
                      color: Colors.red,
                      child: const Text('CRIAR'),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/')
                        Navigator.pushNamed(context, '/class/class_register');
                        //Navigator.pushNamed(context, '/class/class_register/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(15),
            elevation: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                const ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Relatório'),
                  subtitle:
                      Text('Acesse os relatórios do Quiz do casos clínicos.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.red,
                      child: const Text('ACESSAR'),
                      onPressed: () {
                        Navigator.pushNamed(
                            //context, '/teacher/teacher_list_cases');
                            context,
                            '/teacher/teacher_report');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
