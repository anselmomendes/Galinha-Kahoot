import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuestionModel.dart';

class CasesSinglePage extends StatefulWidget {
  final QuestionModel questionModel;
  final String title;
  const CasesSinglePage(
      {Key key, this.title = "CasesSingle", @required this.questionModel})
      : super(key: key);

  @override
  _CasesSinglePageState createState() => _CasesSinglePageState();
}

class _CasesSinglePageState extends State<CasesSinglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Column(children: <Widget>[
              Container(
                child: Image.network(
                  widget.questionModel.imageUrl,
                  height: 150,
                  width: 300,
                ),
              ),
              Container(
                height: 300,
                child: Text(
                  widget.questionModel.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.red,
                      child: const Text(
                        'Voltar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    FlatButton(
                      color: Colors.red,
                      child: const Text(
                        'Avançar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
