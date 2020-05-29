import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesRelatorioPage extends StatefulWidget {
  final String title;
  const CasesRelatorioPage({Key key, this.title = "CasesRelatorio"})
      : super(key: key);

  @override
  _CasesRelatorioPageState createState() => _CasesRelatorioPageState();
}

class _CasesRelatorioPageState
    extends ModularState<CasesRelatorioPage, CasesRelatorioController> {
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
                        .imageUrlSix, //widget.casesModel.imageUrlSix,
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
                      .store.casesModel.topicSix, //widget.casesModel.textSix,
                  style: TextStyle(fontSize: 18),
                ),
              );
            }),
            Observer(builder: (_) {
              return Container(
                height: 300,
                child: Text(
                  controller
                      .store.casesModel.textSix, //widget.casesModel.textSix,
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
