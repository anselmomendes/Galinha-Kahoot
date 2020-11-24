import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_perfil/student_perfil_page.dart';
import '../../student_pages/student_perfil/student_perfil_page.dart';

class StudentPerfilModule extends ModuleWidget {
  final bool showAppBar;

  StudentPerfilModule({this.showAppBar = true});

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<StudentPerfilModule>.of();

  @override
  Widget get view => StudentPerfilPage(showAppBar: showAppBar);
}
