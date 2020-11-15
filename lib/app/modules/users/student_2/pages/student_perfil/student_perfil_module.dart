import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'student_perfil_page.dart';

class TeacherPerfilModule extends ModuleWidget {
  final bool showAppBar;

  TeacherPerfilModule({this.showAppBar = true});

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<TeacherPerfilModule>.of();

  @override
  Widget get view => StudentPerfilPage(showAppBar: showAppBar);
}
