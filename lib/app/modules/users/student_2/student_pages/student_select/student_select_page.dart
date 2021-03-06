import 'package:flutter/material.dart';

class StudentSelectPage extends StatefulWidget {
  final String title;
  const StudentSelectPage({Key key, this.title = "Selecione o Layout"})
      : super(key: key);

  @override
  _StudentSelectPageState createState() => _StudentSelectPageState();
}

class _StudentSelectPageState extends State<StudentSelectPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            // textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text("Olá professor! ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Text("Escolha um layout para o tópico do caso médico.",
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            print('Layout 1');
                            // Navigator.pushNamed(context, '/class/class_list');
                          },
                          child: Card(
                            elevation: 20.0,
                            child: Image.asset(
                              'assets/Layout_cases/layout_1.jpg',
                              scale: 2.0,
                            ),
                          ),
                        ),
                        // color: Colors.redAccent
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            print('Layout 2');
                          },
                          child: Card(
                            elevation: 20.0,
                            child: Image.asset(
                              'assets/Layout_cases/layout_2.jpg',
                              scale: 2.0,
                            ),
                          ),
                        ),
                        // color: Colors.redAccent
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            print('Layout 3');
                          },
                          child: Card(
                            elevation: 20.0,
                            child: Image.asset(
                              'assets/Layout_cases/layout_3.jpg',
                              scale: 2.0,
                            ),
                          ),
                        ),
                        // color: Colors.redAccent
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            print('Layout 4');
                          },
                          child: Card(
                            elevation: 20.0,
                            child: Image.asset(
                              'assets/Layout_cases/layout_4.jpg',
                              scale: 2.0,
                            ),
                          ),
                        ),
                        // color: Colors.redAccent
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )

        /* SingleChildScrollView(
        child: 
        
        /* Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/img_casos/01.jpg',
                    scale: 3,
                    ),
                  onTap: () {},
                ),
                SizedBox(height: 50),
                GestureDetector(
                  child: Image.asset('assets/img_casos/02.jpg'),
                  onTap: () {},
                ),
                SizedBox(height: 50),
                GestureDetector(
                  child: Image.asset('assets/img_casos/03.jpg'),
                  onTap: () {},
                ),
                SizedBox(height: 50),
                GestureDetector(
                  child: Image.asset('assets/img_casos/04.jpg'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ) */,
      ), */
        );
  }
}
