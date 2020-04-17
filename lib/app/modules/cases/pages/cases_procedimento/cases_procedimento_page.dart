import 'package:flutter/material.dart';

class CasesProcedimentoPage extends StatefulWidget {
  final String title;
  const CasesProcedimentoPage({Key key, this.title = "CasesProcedimento"})
      : super(key: key);

  @override
  _CasesProcedimentoPageState createState() => _CasesProcedimentoPageState();
}

class _CasesProcedimentoPageState extends State<CasesProcedimentoPage> {
  @override
  void initState() {
//    lessons = getLessons();
    super.initState();
  }

  // Future<bool> _onBackPressed(){
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text("Sair do aplicativo?"),
  //       actions: <Widget>[
  //         FlatButton(
  //           child: Text("Não", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
  //           onPressed: () => Navigator.pop(context,false),
  //         ),

  //          FlatButton(
  //           child: Text("Sim", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
  //           onPressed: ()=> exit(0),
  //                    )
  //       ],
  //     )
  //   );
  // }
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
                    "Realizada cesárea de urgência, com extração de feto vivo, Escore de Apgar 1 no primeiro minuto e 5 no quinto minuto.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ])),
          ],
        ),
      ),
    )),

        // final makeBody = Container(

        //    child: Column(
        //      children: <Widget>[

        //        SingleChildScrollView(
        //          child: SafeArea(

        //           minimum: const EdgeInsets.all(15.0),
        //           child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra massa massa ultricies mi quis hendrerit. Pharetra magna ac placerat vestibulum. Placerat duis ultricies lacus sed. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Odio tempor orci dapibus ultrices in iaculis nunc sed augue. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Cursus in hac habitasse platea dictumst quisque sagittis purus. \nLorem sed risus ultricies tristique nulla aliquet enim. Tincidunt arcu non sodales neque sodales. Nisi est sit amet facilisis magna etiam tempor. Enim eu turpis egestas pretium aenean pharetra magna ac placerat. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Semper quis lectus nulla at volutpat. Ornare arcu odio ut sem nulla pharetra diam. In tellus integer feugiat scelerisque varius morbi enim nunc. \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra massa massa ultricies mi quis hendrerit. Pharetra magna ac placerat vestibulum. Placerat duis ultricies lacus sed. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Odio tempor orci dapibus ultrices in iaculis nunc sed augue. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Cursus in hac habitasse platea dictumst quisque sagittis purus. Lorem sed risus ultricies tristique nulla aliquet enim. Tincidunt arcu non sodales neque sodales. Nisi est sit amet facilisis magna etiam tempor. Enim eu turpis egestas pretium aenean pharetra magna ac placerat. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Semper quis lectus nulla at volutpat. Ornare arcu odio ut sem nulla pharetra diam. In tellus integer feugiat scelerisque varius morbi enim nunc.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra massa massa ultricies mi quis hendrerit. Pharetra magna ac placerat vestibulum. Placerat duis ultricies lacus sed. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Odio tempor orci dapibus ultrices in iaculis nunc sed augue. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Cursus in hac habitasse platea dictumst quisque sagittis purus. Lorem sed risus ultricies tristique nulla aliquet enim. Tincidunt arcu non sodales neque sodales. Nisi est sit amet facilisis magna etiam tempor. Enim eu turpis egestas pretium aenean pharetra magna ac placerat. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Semper quis lectus nulla at volutpat. Ornare arcu odio ut sem nulla pharetra diam. In tellus integer feugiat scelerisque varius morbi enim nunc.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra massa massa ultricies mi quis hendrerit. Pharetra magna ac placerat vestibulum. Placerat duis ultricies lacus sed. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Odio tempor orci dapibus ultrices in iaculis nunc sed augue. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Cursus in hac habitasse platea dictumst quisque sagittis purus. Lorem sed risus ultricies tristique nulla aliquet enim. Tincidunt arcu non sodales neque sodales. Nisi est sit amet facilisis magna etiam tempor. Enim eu turpis egestas pretium aenean pharetra magna ac placerat. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Semper quis lectus nulla at volutpat. Ornare arcu odio ut sem nulla pharetra diam. In tellus integer feugiat scelerisque varius morbi enim nunc.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra massa massa ultricies mi quis hendrerit. Pharetra magna ac placerat vestibulum. Placerat duis ultricies lacus sed. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Odio tempor orci dapibus ultrices in iaculis nunc sed augue. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Cursus in hac habitasse platea dictumst quisque sagittis purus. Lorem sed risus ultricies tristique nulla aliquet enim. Tincidunt arcu non sodales neque sodales. Nisi est sit amet facilisis magna etiam tempor. Enim eu turpis egestas pretium aenean pharetra magna ac placerat. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Semper quis lectus nulla at volutpat. Ornare arcu odio ut sem nulla pharetra diam. In tellus integer feugiat scelerisque varius morbi enim nunc.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra massa massa ultricies mi quis hendrerit. Pharetra magna ac placerat vestibulum. Placerat duis ultricies lacus sed. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Odio tempor orci dapibus ultrices in iaculis nunc sed augue. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Cursus in hac habitasse platea dictumst quisque sagittis purus. Lorem sed risus ultricies tristique nulla aliquet enim. Tincidunt arcu non sodales neque sodales. Nisi est sit amet facilisis magna etiam tempor. Enim eu turpis egestas pretium aenean pharetra magna ac placerat. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Semper quis lectus nulla at volutpat. Ornare arcu odio ut sem nulla pharetra diam. In tellus integer feugiat scelerisque varius morbi enim nunc.',
        //           textAlign: TextAlign.justify, ),
        //         ) ,
        //        )

        //      ]
        //    ),
        //   );

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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => TiposDeTratamentosPage()
                //     //builder: (context) => SubTitle()
                //     ));
              },
            ),

            //Kahoot
            IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //builder: (context) => KahootCasoPage()
                        //builder: (context) => SubTitle()
                        ));
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
      title: Text("Procedimento cirurgico"),
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
