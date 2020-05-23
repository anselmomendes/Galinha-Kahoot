import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_detail/class_detail_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class ClassDetailPage extends StatefulWidget {
  final ClassModel classModel;
  final bool showAppBar;
  final String title;
  const ClassDetailPage({
    Key key,
    this.title = "ClassDetail",
    this.showAppBar = true,
    @required this.classModel,
  }) : super(key: key);

  @override
  _ClassDetailPageState createState() => _ClassDetailPageState();
}

class _ClassDetailPageState
    extends ModularState<ClassDetailPage, ClassDetailController> {
  String _statusLocal;

  void _checkStatus(String status) {
    if (status.compareTo('true') == 0) {
      _statusLocal = 'Ativado';
    } else {
      _statusLocal = 'Desativado';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // ClassModel model = widget.classModel;

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: Container(
        child: Observer(
          builder: (_) {
            if (controller.classList.data == null)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (controller.classList.hasError)
              return Center(
                child: RaisedButton(
                  onPressed: () => controller.getList(),
                  child: Text('Error'),
                ),
              );
            else {
              bool _statusBool = widget.classModel.status;
              _statusLocal = _statusBool.toString();
              _checkStatus(_statusLocal);

              return SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: screenWidth * 0.1,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text("Cadastrar Casos", style: headerTextStyle),
                    SizedBox(height: 20),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                            text: 'Status: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${_statusLocal}',
                                  style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Turma criada em: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${widget.classModel.creationDate}',
                                  style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
