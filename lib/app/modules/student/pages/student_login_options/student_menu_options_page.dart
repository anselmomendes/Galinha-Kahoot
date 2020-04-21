import 'package:flutter/material.dart';

class StudentMenuOptionsPage extends StatefulWidget {
  @override
  _StudentMenuOptionsPageState createState() => _StudentMenuOptionsPageState();
}

class _StudentMenuOptionsPageState extends State<StudentMenuOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Text("Opções de login",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          SizedBox(height: 5),
          Text(
              "Há duas maneira de acesso a área do Aluno. \nEscolhar uma das opções abaixo:",
              textAlign: TextAlign.center),
          SizedBox(height: 20),
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
                  // contentPadding: EdgeInsets.only(top: 10),
                  leading: Icon(Icons.mail),
                  title: Text(
                    'Login com E-mail',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      'Com essa opção, você terá acesso a área do aluno, assim como histórico de turma.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('LOGIN'),
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
                const SizedBox(
                  height: 15,
                ),
                const ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Text(
                    'Acesso direto',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      'Aqui você não terá acesso a área do aluno e histórico de turmas.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('ACESSO DIRETO'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/student/student_login');
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
