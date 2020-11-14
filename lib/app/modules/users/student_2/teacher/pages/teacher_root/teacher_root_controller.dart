import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'teacher_root_controller.g.dart';

class TeacherRootController = _TeacherRootBase with _$TeacherRootController;

abstract class _TeacherRootBase with Store {
  @observable
  //ModuleCallback selectedPage =
  //    () => TeacherMenuModule(showAppBar: true); //Inicia com a Home // Starts with Home

  //Troca a Page conforme o ModuleCallback
  //@computed
  //set changePage(ModuleCallback page) => selectedPage = page;

  Future logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
  }
}

//Aqui eu criei um Lazy da Module, e esse module soh é carregado na Tela/RootPage
typedef ModuleWidget ModuleCallback();
