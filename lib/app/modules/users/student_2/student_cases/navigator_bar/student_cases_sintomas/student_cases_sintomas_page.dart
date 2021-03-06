import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_controller.dart';

import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentCasesSintomasPage extends StatefulWidget {
  final String title;
  final String page;
  final String idCase;
  const StudentCasesSintomasPage({Key key, this.title, this.page, this.idCase})
      : super(key: key);

  @override
  _StudentCasesSintomasPageState createState() =>
      _StudentCasesSintomasPageState();
}

class _StudentCasesSintomasPageState extends ModularState<
    StudentCasesSintomasPage, StudentCasesSintomasController> {
  bool editMode;

  // Variável p/ pegar o valor da posição do último campo
  int lastPosition;

  int progress = 0;

  ReceivePort _receivePort = ReceivePort();

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    ///Listening for the data is comming other isolataes

    FlutterDownloader.registerCallback(downloadingCallback);
    super.initState();
    controller.getDocuments(widget.idCase, widget.page);
  }

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appContrastColor,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          if (controller.cases.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.cases.data.isEmpty) {
            return Text("Nenhum caso encontrado");
          } else {
            List<ComponentModel> list = controller.cases.data;
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                children: <Widget>[
                  Container(
                      height: screenWidth * 1.4,
                      child: ListView.builder(
                        itemCount: controller.cases.data.length,
                        itemBuilder: (_, index) {
                          ComponentModel model = list[index];

                          if (model.type.compareTo("Título") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                              child: Text(model.value,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            );
                          }
                          if (model.type.compareTo("Texto") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),

                              // height: 50,
                              child: Text(
                                model.value,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }
                          if (model.type.compareTo("Link") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),

                              // height: 50,
                              child: InkWell(
                                child: Text(
                                  model.value,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                                onTap: () {
                                  launch(model.value);
                                },
                              ),
                            );
                          }
                          if (model.type.compareTo("Documento") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),

                              // height: 50,
                              child: GestureDetector(
                                child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300]),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.file_download,
                                        size: 75,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Baixar Anexo", 
                                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22,),
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  final status =
                                      await Permission.storage.request();
                                  if (status.isGranted) {
                                    final externalDir =
                                        await getExternalStorageDirectory();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              "O download do arquivo foi iniciado!"),
                                          actions: [
                                            FlatButton(
                                                onPressed: () {
                                                  Modular.to.pop();
                                                },
                                                child: Text("Ok"))
                                          ],
                                        );
                                      },
                                    );
                                    final id = await FlutterDownloader.enqueue(
                                      url: "${model.value}",
                                      savedDir: externalDir.path,
                                      fileName: "download",
                                      showNotification: true,
                                      openFileFromNotification: true,
                                    );
                                  } else {
                                    print("Permission deined");
                                  }
                                },
                              ),
                            );
                          } else if (model.type.compareTo("Imagem") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),

                              // height: 50,
                              child: Image.network(
                                model.value,
                                fit: BoxFit.contain,
                                // height: 400,
                                width: 300,
                              ),
                            );
                          }
                        },
                      )),
                ],
              ),
            );
          }
        }));
  }
}
