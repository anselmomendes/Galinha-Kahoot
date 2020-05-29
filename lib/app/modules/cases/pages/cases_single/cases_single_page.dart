import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

import 'cases_single_controller.dart';

class CasesSinglePage extends StatefulWidget {
  final String title;
  const CasesSinglePage({Key key, this.title = "CasesSingle"})
      : super(key: key);

  @override
  _CasesSinglePageState createState() => _CasesSinglePageState();
}

class _CasesSinglePageState
    extends ModularState<CasesSinglePage, CasesSingleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.network(
                'https://musikcity.mus.br/ra/logos/viewMarabaPA.jpg', //widget.casesModel.imageUrlOne,
                height: 150,
                width: 300,
              ),
            ),
            Container(
              height: 300,
              child: Text(
                controller.store.casesModel.title, //widget.casesModel.textOne,
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
