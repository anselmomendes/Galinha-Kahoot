// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_class_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentClassListController on _StudentClassListBase, Store {
  final _$classListAtom = Atom(name: '_StudentClassListBase.classList');

  @override
  ObservableStream<List<ClassModel>> get classList {
    _$classListAtom.context.enforceReadPolicy(_$classListAtom);
    _$classListAtom.reportObserved();
    return super.classList;
  }

  @override
  set classList(ObservableStream<List<ClassModel>> value) {
    _$classListAtom.context.conditionallyRunInAction(() {
      super.classList = value;
      _$classListAtom.reportChanged();
    }, _$classListAtom, name: '${_$classListAtom.name}_set');
  }

  final _$classList2Atom = Atom(name: '_StudentClassListBase.classList2');

  @override
  ObservableStream<List<ClassModel>> get classList2 {
    _$classList2Atom.context.enforceReadPolicy(_$classList2Atom);
    _$classList2Atom.reportObserved();
    return super.classList2;
  }

  @override
  set classList2(ObservableStream<List<ClassModel>> value) {
    _$classList2Atom.context.conditionallyRunInAction(() {
      super.classList2 = value;
      _$classList2Atom.reportChanged();
    }, _$classList2Atom, name: '${_$classList2Atom.name}_set');
  }

  final _$_StudentClassListBaseActionController =
      ActionController(name: '_StudentClassListBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_StudentClassListBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_StudentClassListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getListTrue() {
    final _$actionInfo = _$_StudentClassListBaseActionController.startAction();
    try {
      return super.getListTrue();
    } finally {
      _$_StudentClassListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(ClassModel model) {
    final _$actionInfo = _$_StudentClassListBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_StudentClassListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(ClassModel model) {
    final _$actionInfo = _$_StudentClassListBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_StudentClassListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'classList: ${classList.toString()},classList2: ${classList2.toString()}';
    return '{$string}';
  }
}
