import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_report/teacher_report_page.dart';

class TeacherReportModule extends ModuleWidget {
  final bool showAppBar;

  TeacherReportModule({this.showAppBar = true});

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<TeacherReportModule>.of();

  @override
  Widget get view => TeacherReportPage(showAppBar: showAppBar);
}
