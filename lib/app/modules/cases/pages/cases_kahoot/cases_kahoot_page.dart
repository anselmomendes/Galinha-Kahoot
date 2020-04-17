import 'package:flutter/material.dart';

class CasesKahootPage extends StatefulWidget {
  final String title;
  const CasesKahootPage({Key key, this.title = "CasesKahoot"})
      : super(key: key);

  @override
  _CasesKahootPageState createState() => _CasesKahootPageState();
}

class _CasesKahootPageState extends State<CasesKahootPage> {
  @override
  void initState() {
//    lessons = getLessons();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final makebody = SafeArea(
            child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Divider(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                  height: 200,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/bits.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(children: <Widget>[
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra massa massa ultricies mi quis hendrerit. Pharetra magna ac placerat vestibulum. \n\nPlacerat duis ultricies lacus sed. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Odio tempor orci dapibus ultrices in iaculis nunc sed augue. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Cursus in hac habitasse platea dictumst quisque sagittis purus. \n\nLorem sed risus ultricies tristique nulla aliquet enim. Tincidunt arcu non sodales neque sodales. Nisi est sit amet facilisis magna etiam tempor. Enim eu turpis egestas pretium aenean pharetra magna ac placerat. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Semper quis lectus nulla at volutpat. Ornare arcu odio ut sem nulla pharetra diam. In tellus integer feugiat scelerisque varius morbi enim nunc.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ])),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30.0,
              ),
              child: MaterialButton(
                onPressed: () {
                  //Navigator.push(context,
                  //MaterialPageRoute(builder: (context) => QuizPage()));
                },
                child: Text(
                  "Questionário",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  maxLines: 1,
                ),
                color: Colors.redAccent,
                splashColor: Colors.red[200],
                highlightColor: Colors.black12,
                minWidth: 300.0,
                height: 45.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ],
        ),
      ),
    )),
        makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 35,
        //Cor da parte da bottom tab
        color: Colors.red,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,

          //AQUI COMEÇAM OS BOTÕES DA BARRA INFERIOR
          children: <Widget>[
            //Sintomas clinicos
            IconButton(
                icon: Icon(Icons.format_list_numbered, color: Colors.white),
                onPressed: () {
                  Navigator.pop(
                      //Testar push, pull ou pop
                      context,
                      MaterialPageRoute(
                          //builder: (context) => SintomasCasoPage()
                          //builder: (context) => SubTitle()
                          ));
                }),

            //Anamnese
            IconButton(
              icon: Icon(
                Icons.assignment,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => AnamneseCasoPage()
                        //builder: (context) => SubTitle()
                        ));
              },
            ),

            //Avaliação fisica
            IconButton(
              icon: Icon(Icons.accessibility_new, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => AvaliacaoCasoPage()
                        //builder: (context) => SubTitle()
                        ));
              },
            ),

            //Exames complementares
            IconButton(
              icon: Icon(Icons.local_hospital, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => ExamesCasoPage()
                        //builder: (context) => SubTitle()
                        ));
              },
            ),

            //procedimento cirurgico
            IconButton(
              icon: Icon(Icons.healing, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => ProcedimentoCasoPage()
                        //builder: (context) => SubTitle()
                        ));
              },
            ),

            //Kahoot
            IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => TiposDeTratamentosPage()
                //     //builder: (context) => SubTitle()
                //     ));
              },
            ),

            //Relatório
            IconButton(
              icon: Icon(Icons.subject, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => RelatorioCasoPage()
                        //builder: (context) => SubTitle()
                        ));
              },
            ),
          ],
        ),
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.red,
      title: Text("Pergunta"),
      centerTitle: true,
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.list),
      //     onPressed: () {},
      //   )
      // ],
    );

    //Cor do background da parte "vazia"

    return Container(
        // onWillPop: _onBackPressed,
        child: Stack(
      children: <Widget>[
        Scaffold(
          //backgroundColor: Colors.white,
          backgroundColor: Colors.white,

          appBar: topAppBar,
          body: makebody,
          key: _scaffoldKey,

          //bottomNavigationBar: makeBottom,
        )
      ],
    ));
  }
}
