import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Dados do aluno'),
                  subtitle: Text('Tenha acesso ao seu cadastro.'),
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
          Divider(
            height: 25,
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Turma'),
                  subtitle: Text(
                      'Acesse uma nova turma ou verifique o seu histórico de turmas.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('HISTÓRICO'),
                      onPressed: () {/* ... */},
                    ),
                    FlatButton(
                      child: const Text('NOVA TURMA'),
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
