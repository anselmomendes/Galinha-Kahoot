import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'teacher_relatorio_controller.dart';

class TeacherRelatorioPage extends StatefulWidget {
  final String title;
  const TeacherRelatorioPage(
      {Key key, this.title = "Relatório", bool showAppBar})
      : super(key: key);

  @override
  _TeacherRelatorioPageState createState() => _TeacherRelatorioPageState();
}

class _TeacherRelatorioPageState
    extends ModularState<TeacherRelatorioPage, TeacherRelatorioController> {
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
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Column(
              children: <Widget>[
                /* Container(
                  margin: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 10.0),
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      width: 3.0,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //         <--- border radius here
                        ),
                  ),
                  child: */
                Text('Dados Gerais',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    )),
                Divider(thickness: 2.0),
                Padding(padding: EdgeInsets.only(bottom: 15.0)),
                Column(
                  children: [
                    //Material onde exibe o total de acertos da turma
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('N° de Questões:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                            )),
                        Padding(padding: EdgeInsets.only(right: 30.0)),
                        Material(
                            color: Colors.blue,
                            elevation: 14.0,
                            borderRadius: BorderRadius.circular(12.0),
                            shadowColor: Color(0x802196F3),
                            child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text('30',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22.0)))))
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 20.0)),

                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Acertos:',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('30',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.0))
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Média da Turma:',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('30',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.0))
                                ],
                              ),
                              Material(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.done_outline,
                                        color: Colors.white, size: 30.0),
                                  ))),
                            ]),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 20.0)),

                    /* _buildTile(
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(60.0, 24.0, 60.0, 24.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(

mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Acertos:',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 25.0)),
                                Text('25',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 34.0))
                              ],
                            ),
                            Material(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(24.0),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(Icons.done_outline,
                                      color: Colors.white, size: 30.0),
                                )))
                          ]),
                    ),
                  ),*/

                    Padding(padding: EdgeInsets.only(bottom: 20.0)),

                    //Material onde exibe o total de erros da turma

                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Erros:',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('30',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.0))
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Média da Turma:',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('30',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.0))
                                ],
                              ),
                              Material(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.cancel,
                                        color: Colors.white, size: 30.0),
                                  )))
                            ]),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 40.0)),

                    Divider(thickness: 2.0),

                    Padding(padding: EdgeInsets.only(bottom: 15.0)),

                    _buildTile(
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('N° de Alunos que \nReponderam o Quiz:',
                                      style: TextStyle(
                                          color: Colors.blueGrey[800],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0)),
                                  Text('30',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30.0))
                                ],
                              ),
                              Material(
                                  color: Colors.blueGrey[800],
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.person,
                                        color: Colors.white, size: 30.0),
                                  )))
                            ]),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 40.0)),

                    //Botão para acessar lista de alunos
                    RaisedButton(
                        color: Colors.blue,
                        padding: const EdgeInsets.all(18.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.blueAccent)),
                        child: Text(
                          'Relátorio Individual dos Alunos',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            'teacher/teacher_relatorio_list',
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('null');
                  },
            child: child));
  }
}
