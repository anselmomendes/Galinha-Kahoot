import 'package:flutter/material.dart';

class TeacherReportPage extends StatefulWidget {
  final String title;
  const TeacherReportPage({Key key, this.title = "TeacherReport"})
      : super(key: key);

  @override
  _TeacherReportPageState createState() => _TeacherReportPageState();
}

class _TeacherReportPageState extends State<TeacherReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 25),
                Text("Olá professor 'Vegano'! ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Text(
                    "Gere relatório por turmas. \nEscolhar a turma que deseja gerar o relatório:",
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),
                  
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),

                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),

                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),
                  
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),

                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),

                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),
                  
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),

                  Text('data1'),
                  Text('data1'),
                  Text('data1'),
                SizedBox(height: 20),

                  Text('data1'),
                  Text('data1'),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
