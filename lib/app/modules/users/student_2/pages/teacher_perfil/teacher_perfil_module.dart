import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../pages/teacher_perfil/teacher_perfil_page.dart';

class TeacherPerfilModule extends ModuleWidget {
  final bool showAppBar;

  TeacherPerfilModule({this.showAppBar = true});

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<TeacherPerfilModule>.of();

  @override
  Widget get view => TeacherPerfilPage(showAppBar: showAppBar);
}
