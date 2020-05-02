import 'package:flutter/material.dart';

class TeacherAboutPage extends StatefulWidget {
  final String title;
  final bool showAppBar;
  const TeacherAboutPage(
      {Key key, this.title = "TeacherAbout", this.showAppBar})
      : super(key: key);

  @override
  _TeacherAboutPageState createState() => _TeacherAboutPageState();
}

class _TeacherAboutPageState extends State<TeacherAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: Column(
        children: <Widget>[
          Center(
            child: Text('Teste Vegano!'),
          )
        ],
      ),
    );
  }
}
