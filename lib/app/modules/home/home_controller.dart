import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:galinha_karoot/app/modules/home/services/interfaces/todo_service_interfaces.dart';
import 'package:mobx/mobx.dart';
import 'models/todo_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  var firestore = Firestore.instance;

  final ITodoService todoService;

  @observable
  ObservableStream<List<TodoModel>> todoList;
  List<TodoModel> todoList2;

  _HomeControllerBase(ITodoService this.todoService) {
    getList();
    getByDocumentId();
  }

  @action
  getList() {
    todoList = todoService.get().asObservable();
  }

  @action
  save(TodoModel model) {
    todoService.save(model);
  }

  @action
  delete(TodoModel model) {
    todoService.delete(model);
  }

  @action
  getByDocumentId() async {
    firestore.collection('Teste').getDocuments().then((QuerySnapshot a) {
      if (a.documents.isNotEmpty)
        todoList2 =
            a.documents.map((doc) => TodoModel.fromDocument(doc)).toList();
    });
  }
}
