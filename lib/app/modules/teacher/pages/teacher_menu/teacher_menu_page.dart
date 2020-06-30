// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          child: ListView(
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
                    size: 35.0,
                  ),
                  title: Text('Casos',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  subtitle: Text('Acesse ou crie casos médicos.',
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
                        // Navigator.pushNamed(context, '/');
                        Modular.to.pushNamed('/teacher/teacher_list_cases');
                      },
                    ),
                    FlatButton(
                      color: Colors.redAccent,
                      child: const Text('CRIAR'),
                      onPressed: () {
                        Modular.to.pushNamed('/teacher/teacher_select');
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
                  leading: Icon(
                    Icons.list,
                    size: 35.0,
                  ),
                  title: Text('Turmas',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  subtitle:
                      Text('Acesse status de turmas ou crie novas turmas.',
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
                        Modular.to.pushNamed('/class/class_list');
                      },
                    ),
                    FlatButton(
                      color: Colors.redAccent,
                      child: const Text('CRIAR'),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/')
                        // Navigator.pushNamed(context, '/teacher_select');
                        Modular.to.pushNamed('/class/class_register');
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
                  leading: Icon(
                    Icons.description,
                    size: 35.0,
                  ),
                  title: Text('Relatório',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  subtitle:
                      Text('Acesse os relatórios do Quiz do casos clínicos.',
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
                        Modular.to.pushNamed('/teacher/teacher_report');
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
