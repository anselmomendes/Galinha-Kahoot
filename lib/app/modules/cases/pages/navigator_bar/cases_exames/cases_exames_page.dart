import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_exames/cases_exames_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesExamesPage extends StatefulWidget {
  final String title;
  const CasesExamesPage({Key key, this.title = "CasesExames"})
      : super(key: key);

  @override
  _CasesExamesPageState createState() => _CasesExamesPageState();
}

class _CasesExamesPageState
    extends ModularState<CasesExamesPage, CasesExamesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ListView(
          children: <Widget>[
            Observer(
              builder: (_) {
                return Container(
                  child: Image.network(
                    controller.store.casesModel
                        .imageUrlTree, //widget.casesModel.imageUrlTree,
                    height: 300,
                    width: 300,
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            Observer(builder: (_) {
              return Container(
                height: 50,
                child: Text(
                  controller
                      .store.casesModel.topicTree, //widget.casesModel.textTree,
                  style: TextStyle(fontSize: 18),
                ),
              );
            }),
            Observer(builder: (_) {
              return Container(
                height: 300,
                child: Text(
                  controller
                      .store.casesModel.textTree, //widget.casesModel.textTree,
                  style: TextStyle(fontSize: 18),
                ),
              );
            }),
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
