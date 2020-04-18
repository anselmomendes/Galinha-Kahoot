import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/student/widgets_student/custom_drawer.dart';

class StudentMenuPage extends StatefulWidget {
  final String title;
  const StudentMenuPage({Key key, this.title = "StudentMenu"})
      : super(key: key);

  @override
  _StudentMenuPageState createState() => _StudentMenuPageState();
}

class _StudentMenuPageState extends State<StudentMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            elevation: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15,),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Dados do aluno'),
                  subtitle: Text('Caro aluno, aqui você acessa os seus dados.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('ACESSAR'),
                      onPressed: () {/* ... */},
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
                const SizedBox(height: 15,),
                const ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Turmas'),
                  subtitle: Text('Acesso uma nova turma ou o seu histórico.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('NOVA TURMA'),
                      onPressed: () {/* ... */},
                    ),
                    FlatButton(
                      child: const Text('HISTÓRICO'),
                      onPressed: () {/* ... */},
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
