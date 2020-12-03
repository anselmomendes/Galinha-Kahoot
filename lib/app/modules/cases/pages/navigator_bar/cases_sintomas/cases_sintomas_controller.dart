import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:mobx/mobx.dart';
part 'cases_sintomas_controller.g.dart';

class CasesSintomasController = _CasesSintomasBase
    with _$CasesSintomasController;

abstract class _CasesSintomasBase with Store {
  final CasesRepository casesRepository;

  void dispose() {
    casesRepository.dispose();
  }

  @observable
  ObservableStream<List<ComponentModel>> casesPage;

  @observable
  List<ComponentModel> cases;

  @observable
  bool editMode = false;

  _CasesSintomasBase({this.casesRepository});

  @action
  getDocuments(String casesID, String page) async {
    cases = await casesRepository.getDocuments(casesID, page);
  }

  @action
  delete(String casesID, String page, String componentID) {
    return casesRepository.deleteWidget(casesID, page, componentID);
  }

  @action
  create(ComponentModel model) {
    return casesRepository.createWidget(model);
  }

  void downloadFile(String url) async {
    await FlutterDownloader.initialize(
        debug: true // optional: set false to disable printing logs to console
        );
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: '/PeensaFiles',
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }
}
