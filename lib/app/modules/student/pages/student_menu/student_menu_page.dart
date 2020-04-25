import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/student/widgets_student/custom_drawer.dart';

class StudentMenuPage extends StatefulWidget {
  final String title;
  const StudentMenuPage({Key key, this.title = "Aluno"})
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
                //const SizedBox(height: 15,),
                const ListTile(
                  //contentPadding: EdgeInsets.only(left: 30),
                  leading: Icon(Icons.playlist_add),
                  title: Text('Acessar Turma'),
                  subtitle: Text('Acesse a turma através de QR Code.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.red,
                      child: const Text('ACESSAR TURMA'),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/')
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
                //const SizedBox(height: 15,),
                const ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Hitórico de Turmas'),
                  subtitle: Text('Acesso seu histórico de turmas.'),
                ),
                ButtonBar(
                  children: <Widget>[
                     FlatButton(
                      color: Colors.red,
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
