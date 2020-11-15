// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_perfil_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentPerfilEditController on _StudentPerfilEditControllerBase, Store {
  final _$teacherListAtom =
      Atom(name: '_StudentPerfilEditControllerBase.teacherList');

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

  @override
  String toString() {
    final string = 'teacherList: ${teacherList.toString()}';
    return '{$string}';
  }
}
