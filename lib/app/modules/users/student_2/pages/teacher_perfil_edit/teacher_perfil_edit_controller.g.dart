// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_perfil_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeacherPerfilEditController on _TeacherPerfilEditControllerBase, Store {
  final _$teacherListAtom =
      Atom(name: '_TeacherPerfilEditControllerBase.teacherList');

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

  final _$_TeacherPerfilEditControllerBaseActionController =
      ActionController(name: '_TeacherPerfilEditControllerBase');

  @override
  dynamic save(StudentModel model) {
    final _$actionInfo =
        _$_TeacherPerfilEditControllerBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_TeacherPerfilEditControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'teacherList: ${teacherList.toString()}';
    return '{$string}';
  }
}
