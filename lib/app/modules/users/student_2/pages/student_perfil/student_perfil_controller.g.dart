// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentPerfilController on _StudentPerfilBase, Store {
  final _$teacherListAtom = Atom(name: '_StudentPerfilBase.teacherList');

  @override
  StudentModel get teacherList {
    _$teacherListAtom.context.enforceReadPolicy(_$teacherListAtom);
    _$teacherListAtom.reportObserved();
    return super.teacherList;
  }

  @override
  set teacherList(StudentModel value) {
    _$teacherListAtom.context.conditionallyRunInAction(() {
      super.teacherList = value;
      _$teacherListAtom.reportChanged();
    }, _$teacherListAtom, name: '${_$teacherListAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_StudentPerfilBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$getListAsyncAction = AsyncAction('getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$_StudentPerfilBaseActionController =
<<<<<<< HEAD:lib/app/modules/users/student_2/student_pages/student_perfil/student_perfil_controller.g.dart
      ActionController(name: '_TeacherPerfilBase');

  @override
  dynamic save(StudentModel model) {
    final _$actionInfo = _$_StudentPerfilBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_StudentPerfilBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(StudentModel model) {
    final _$actionInfo = _$_StudentPerfilBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_StudentPerfilBaseActionController.endAction(_$actionInfo);
    }
  }
=======
      ActionController(name: '_StudentPerfilBase');
>>>>>>> 864e4a80f2e3a8511f8f2f80f27b06a817ceac22:lib/app/modules/users/student_2/pages/student_perfil/student_perfil_controller.g.dart

  @override
  void increment() {
    final _$actionInfo = _$_StudentPerfilBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_StudentPerfilBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'teacherList: ${teacherList.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
