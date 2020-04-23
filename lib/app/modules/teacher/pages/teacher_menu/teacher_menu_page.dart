import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/teacher/widgets_teacher/custom_drawer.dart';

class TeacherMenuPage extends StatefulWidget {
  final String title;
  const TeacherMenuPage({Key key, this.title = "TeacherMenu"})
      : super(key: key);

  @override
  _TeacherMenuPageState createState() => _TeacherMenuPageState();
}

class _TeacherMenuPageState extends State<TeacherMenuPage> {
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
