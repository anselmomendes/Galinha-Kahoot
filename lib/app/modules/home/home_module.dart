import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/home/home_controller.dart';
import 'package:galinha_karoot/app/modules/home/home_page.dart';
import 'package:galinha_karoot/app/modules/home/repositories/interfaces/todo_repository_interface.dart';
import 'package:galinha_karoot/app/modules/home/repositories/todo_repository.dart';
import 'package:galinha_karoot/app/modules/home/services/interfaces/todo_service_interfaces.dart';
import 'package:galinha_karoot/app/modules/home/services/todo_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ITodoService>((i) => TodoService(todoRepoitory: i.get())),
        Bind<ITodoRepository>(
            (i) => TodoRepository(firestore: Firestore.instance)),
        Bind((i) => HomeController(i.get<ITodoService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
