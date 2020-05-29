import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cases_single_page.dart';

class CasesSingleModule extends ModuleWidget {
  @override
  List<Bind> get binds => [];

  @override
  Widget get view => CasesSinglePage();

  static Inject get to => Inject<CasesSingleModule>.of();
}
