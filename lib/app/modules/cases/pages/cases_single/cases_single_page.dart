import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesSinglePage extends StatefulWidget {
  final CasesModel casesModel;
  final String title;
  const CasesSinglePage(
      {Key key, this.title = "CasesSingle", @required this.casesModel})
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.network(
                widget.casesModel.imageUrl,
                height: 150,
                width: 300,
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.casesModel.title,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  circularButton(text: 'Voltar', func: () {}),
                  circularButton(text: 'Avançar', func: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
