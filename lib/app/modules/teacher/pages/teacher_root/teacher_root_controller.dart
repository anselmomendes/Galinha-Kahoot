import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/teacher_menu_module.dart';
import 'package:mobx/mobx.dart';

part 'teacher_root_controller.g.dart';

class TeacherRootController = _TeacherRootBase with _$TeacherRootController;

abstract class _TeacherRootBase with Store {
  @observable
  ModuleCallback selectedPage =
      () => TeacherMenuModule(); //Inicia com a Home // Starts with Home

  //Troca a Page conforme o ModuleCallback
  @computed
  set changePage(ModuleCallback page) => selectedPage = page;
}

//Aqui eu criei um Lazy da Module, e esse module soh é carregado na Tela/RootPage
typedef ModuleWidget ModuleCallback();
