// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeacherPerfilController on _TeacherPerfilBase, Store {
  final _$teacherListAtom = Atom(name: '_TeacherPerfilBase.teacherList');

  @override
  TeacherModel get teacherList {
    _$teacherListAtom.context.enforceReadPolicy(_$teacherListAtom);
    _$teacherListAtom.reportObserved();
    return super.teacherList;
  }

  @override
  set teacherList(TeacherModel value) {
    _$teacherListAtom.context.conditionallyRunInAction(() {
      super.teacherList = value;
      _$teacherListAtom.reportChanged();
    }, _$teacherListAtom, name: '${_$teacherListAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_TeacherPerfilBase.value');

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

  final _$_TeacherPerfilBaseActionController =
      ActionController(name: '_TeacherPerfilBase');

  @override
  void increment() {
    final _$actionInfo = _$_TeacherPerfilBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_TeacherPerfilBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'teacherList: ${teacherList.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
