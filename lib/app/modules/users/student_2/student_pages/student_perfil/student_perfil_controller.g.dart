// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentPerfilController on _StudentPerfilBase, Store {
  final _$studentModelAtom = Atom(name: '_StudentPerfilBase.studentModel');

  @override
  StudentModel get studentModel {
    _$studentModelAtom.context.enforceReadPolicy(_$studentModelAtom);
    _$studentModelAtom.reportObserved();
    return super.studentModel;
  }

  @override
  set studentModel(StudentModel value) {
    _$studentModelAtom.context.conditionallyRunInAction(() {
      super.studentModel = value;
      _$studentModelAtom.reportChanged();
    }, _$studentModelAtom, name: '${_$studentModelAtom.name}_set');
  }

  final _$getListAsyncAction = AsyncAction('getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$_StudentPerfilBaseActionController =
      ActionController(name: '_StudentPerfilBase');

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

  @override
  String toString() {
    final string = 'studentModel: ${studentModel.toString()}';
    return '{$string}';
  }
}
