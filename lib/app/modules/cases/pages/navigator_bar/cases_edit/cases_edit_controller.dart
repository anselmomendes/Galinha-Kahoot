import 'dart:io';

import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/cases/repositories/ImageRepository.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as Path;

part 'cases_edit_controller.g.dart';

class CasesEditController = _CasesEditBase with _$CasesEditController;

abstract class _CasesEditBase with Store {
  final CasesRepository casesRepository;

  @observable
  String uploadedFileURL;

  _CasesEditBase({this.casesRepository});

  Future<bool> update(ComponentModel model) {
    return casesRepository.updateWidget(model);
  }

  Future uploadFile(File _selectedImage) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('Cases/${Path.basename(_selectedImage.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_selectedImage);
    await uploadTask.onComplete;
    print('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
    });
  }
}
