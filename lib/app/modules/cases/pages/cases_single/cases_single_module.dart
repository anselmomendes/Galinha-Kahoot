import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cases_single_controller.dart';
import 'cases_single_page.dart';

class CasesSingleModule extends ModuleWidget {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => CasesSingleController()),
      ];

  @override
  // TODO: implement view
  Widget get view => CasesSinglePage();

  static Inject get to => Inject<CasesSingleModule>.of();
}
