import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_edit/cases_edit_controller.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/shared/widgets/raise_button/RaiseButton.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:load/load.dart';

import 'package:path/path.dart' as Path;

class CasesEditPage extends StatefulWidget {
  final String title;
  final ComponentModel model;
  const CasesEditPage({Key key, this.title = "Editar Campos", this.model})
      : super(key: key);

  @override
  _CasesEditPageState createState() => _CasesEditPageState();
}

class _CasesEditPageState
    extends ModularState<CasesEditPage, CasesEditController> {
  final picker = ImagePicker();
  File _selectedImage;
  bool _inProcess = false;
  File _file;
  String type;

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              alignment: Alignment.center,
              width: 200.0,
              height: 50.0,
              decoration: myBoxDecoration(),
              child: Text(
                'Posição do campo',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              // controller: _initalPosition,
              keyboardType: TextInputType.number,
              maxLength: 2,
              maxLines: 1,
              initialValue: widget.model.position.toString(),
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              onChanged: (v) {
                // Salva no model a posição em int
                widget.model.position = int.parse(v);
              },
              decoration: InputDecoration(
                icon: CircleAvatar(
                    radius: 18.0,
                    backgroundColor: Colors.blueAccent,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        '#',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                labelText: 'Digite a posição do campo',
                fillColor: Colors.redAccent,
                focusColor: Colors.redAccent,
                hoverColor: Colors.redAccent,
                // hintText: 'Digite o título',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Divider(
              height: 10,
              thickness: 1.0,
            ),
            Container(
                height: screenWidth * 1.01, child: _selectField(screenWidth)),
            // SizedBox(height: 20),
            Observer(builder: (_) {
              return circularButton(
                  text: 'Salvar',
                  func: () async {
                    showLoadingDialog();
                    if (widget.model.type == "Imagem") {
                      await controller.uploadImage(
                          _selectedImage, widget.model.idCases);
                      if (controller.uploadedFileURL != null) {
                        widget.model.value = controller.uploadedFileURL;
                        if (await controller.update(widget.model)) {
                          hideLoadingDialog();
                          _showAlertDialog(context, 'Componente Registrado',
                              'O componente do caso foi registrado com sucesso!');
                        } else {
                          hideLoadingDialog();
                          _showAlertDialog(context, 'Componente não Registrado',
                              'O componente do caso não foi registrado com sucesso!');
                        }
                      }
                    }
                    if (widget.model.type == "Documento") {
                      await controller.uploadFile(_file, widget.model.idCases);
                      if (controller.uploadedFileURL != null) {
                        widget.model.value = controller.uploadedFileURL;
                        if (await controller.update(widget.model)) {
                          hideLoadingDialog();
                          _showAlertDialog(context, 'Componente Registrado',
                              'O componente do caso foi registrado com sucesso!');
                        } else {
                          hideLoadingDialog();
                          _showAlertDialog(context, 'Componente não Registrado',
                              'O componente do caso não foi registrado com sucesso!');
                        }
                      }
                    } else {
                      if (await controller.update(widget.model)) {
                        hideLoadingDialog();
                        _showAlertDialog(context, 'Componente Registrado',
                            'O componente do caso foi registrado com sucesso!');
                      } else {
                        hideLoadingDialog();
                        _showAlertDialog(context, 'Componente não Registrado',
                            'O componente do caso não foi registrado com sucesso!');
                      }
                    }
                  });
            })
          ],
        ),
      ),
    );
  }

  // Seleção do tipo de campo
  Widget _selectField(var screenWidth) {
    if (widget.model.type.compareTo("Título") == 0) {
      return _fieldTopic();
    } else if (widget.model.type.compareTo("Texto") == 0) {
      return _fieldText();
    } else if (widget.model.type.compareTo("Imagem") == 0) {
      return _fieldImage(screenWidth);
    } else if (widget.model.type.compareTo("Documento") == 0) {
      return _fieldFile(screenWidth);
    } else if (widget.model.type.compareTo("Link") == 0) {
      return _fieldLink();
    } else
      return null;
  }

  // Campo do tipo "Título"
  Widget _fieldTopic() {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          'Título',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 40,
          maxLines: 2,
          //initialValue: _textFour.text,
          initialValue: widget.model.value,
          onChanged: (v) => widget.model.value = v,
          decoration: InputDecoration(
            labelText: 'Digite um título para o caso',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Campo do tipo "Texto"
  Widget _fieldText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          'Descrição',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 1000,
          maxLines: 15,
          //initialValue: widget.model.topicTree,
          initialValue: widget.model.value,
          onChanged: (v) => widget.model.value = v,
          decoration: InputDecoration(
            labelText: 'Digite um conteúdo para o caso',
            // hintText: 'Descreva o caso',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Campo do tipo "Imagem"
  Widget _fieldImage(var screenWidth) {
    return Column(
      children: <Widget>[
        // SizedBox(height: 5),
        _inProcess != false
            ? Container(
                padding: EdgeInsets.fromLTRB(10, 30, 20, 10),
                // color: Colors.white,
                // height: double.infinity,
                height: screenWidth * 0.3,
                // width: double.infinity,
                width: screenWidth * 0.3,
                alignment: Alignment.center,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _selectedImage != null
                      ? Image.file(
                          _selectedImage,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        )
                      : Container(
                         decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/imagem4.jpg"),
            fit: BoxFit.cover,
          ),
        ),
                          width: 300,
                          height: 300,
                          child: Icon(
                            Icons.camera_alt,
                            size: 250,
                            color: Colors.blueGrey[400],
                          ),
                        ),
                         Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                           color: Colors.redAccent,
                               padding: const EdgeInsets.fromLTRB(18.0, 13.0, 18.0, 13.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.redAccent)),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                        child: Text('Câmera',  style: TextStyle(
                                  color: Colors.white,
                                ),),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      RaisedButton(
                          color: Colors.redAccent,
                               padding: const EdgeInsets.fromLTRB(18.0, 13.0, 18.0, 13.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.redAccent)),
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Text('Galeria', style: TextStyle(
                                  color: Colors.white,
                                ),),
                      ),
                    ],
                  )
                ],
              )
      ],
    );
  }

  Widget _fieldFile(var screenWidth) {
    return Column(
      children: <Widget>[
        // SizedBox(height: 5),
        _inProcess != false
            ? Container(
                padding: EdgeInsets.fromLTRB(10, 30, 20, 10),
                // color: Colors.white,
                // height: double.infinity,
                height: screenWidth * 0.3,
                // width: double.infinity,
                width: screenWidth * 0.3,
                alignment: Alignment.center,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/imagem4.jpg"),
            fit: BoxFit.cover,
          ),
        ),
                            width: 300,
                          height: 300,
                            child: Icon(
                              Icons.file_upload,
                               size: 250,
                               color: Colors.blueGrey[400],
                            ),
                          ),
                          onTap: () {
                            getFile();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _file != null
                            ? Text("${Path.basename(_file.path)}")
                            : Text("Upload do arquivo",
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22,),
),
                      ],
                    ),
                  ),
                ],
              )
      ],
    );
  }

  Widget _fieldLink() {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          'Descrição',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 1000,
          maxLines: 15,
          //initialValue: widget.model.topicTree,
          initialValue: widget.model.value,
          onChanged: (v) => widget.model.value = v,
          decoration: InputDecoration(
            labelText: 'Cole aqui o link',
            // hintText: 'Descreva o caso',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ShowDialog p/ informar se os dados foram salvos ou não
  void _showAlertDialog(BuildContext context, String titulo, String mensagem) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  // Para caixa de texto personalizada
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.blueAccent,
      border: Border.all(
        width: 3.0,
        color: Colors.blueAccent,
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
          ),
    );
  }

  // Método para acessar a câmera ou galeria do celular
  void getImage(ImageSource src) async {
    this.setState(() {
      _inProcess = true;
    });
    final PickedFile = await picker.getImage(source: src);
    if (PickedFile != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: PickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxHeight: 700,
          maxWidth: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Camera',
          ),
          iosUiSettings: IOSUiSettings(
            title: 'Camera',
          ));
      setState(() {
        _selectedImage = cropped;
        _inProcess = false;
      });
    } else {
      setState(() {
        _inProcess = false;
      });
    }
  }

  void getFile() async {
    var result = await FilePicker.getFile(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'pdf',
          'doc',
          'docx',
          'odt',
          'txt',
          'pptx',
          'ppt',
          'png'
        ]);
    if (result != null) {
      setState(() {
        _file = File(result.path);
        _inProcess = false;
      });
    } else {
      setState(() {
        _inProcess = false;
      });
    }
  }
}
