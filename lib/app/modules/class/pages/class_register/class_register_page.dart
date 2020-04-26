import 'package:flutter/material.dart';

class ClassRegisterPage extends StatefulWidget {
  final String title;
  const ClassRegisterPage({Key key, this.title = "ClassRegister"})
      : super(key: key);

  @override
  _ClassRegisterPageState createState() => _ClassRegisterPageState();
}

class _ClassRegisterPageState extends State<ClassRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
