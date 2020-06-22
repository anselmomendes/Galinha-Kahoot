import 'package:flutter/material.dart';

class TeacherSelectPage extends StatefulWidget {
  final String title;
  const TeacherSelectPage({Key key, this.title = "Selecione o Layout"})
      : super(key: key);

  @override
  _TeacherSelectPageState createState() => _TeacherSelectPageState();
}

class _TeacherSelectPageState extends State<TeacherSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                GestureDetector(
                  child: Image.asset('assets/img_casos/0001.jpg'),
                  onTap: () {},
                ),
                SizedBox(height: 50),
                GestureDetector(
                  child: Image.asset('assets/img_casos/0002.jpg'),
                  onTap: () {},
                ),
                SizedBox(height: 50),
                GestureDetector(
                  child: Image.asset('assets/img_casos/0003.jpg'),
                  onTap: () {},
                ),
                SizedBox(height: 50),
                GestureDetector(
                  child: Image.asset('assets/img_casos/0004.jpg'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
