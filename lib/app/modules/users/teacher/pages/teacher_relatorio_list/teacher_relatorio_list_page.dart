import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'teacher_relatorio_list_controller.dart';

class TeacherRelatorioListPage extends StatefulWidget {
  final String title;
  const TeacherRelatorioListPage({Key key, this.title = "Lista de Alunos", bool showAppBar})
      : super(key: key);

  @override
  _TeacherRelatorioListPageState createState() =>
      _TeacherRelatorioListPageState();
}

class _TeacherRelatorioListPageState extends ModularState<
    TeacherRelatorioListPage, TeacherRelatorioListController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body:
      
      Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
        children: <Widget>[
            Expanded(
              flex: 4,
              child: _getListView(),
            ),
        ],
      ),
      ),
    );
  }
  Widget _getListView() {
    var listview = ListView(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
              ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
              Divider(),
              ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
             ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
            ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
             ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
             ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
              ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
             ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
             ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
             ListTile(
                leading:  CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child:  Icon(Icons.person_outline,
                                        color: Colors.white, size: 30.0),
                )),
                title: Text("Aluno(a)"),
                subtitle: Text("Acertos: 10 / Erros: 10"),
              ),
               Divider(),
            ],
          ),
        ),
      ],
    );
    return listview;
  }
}
