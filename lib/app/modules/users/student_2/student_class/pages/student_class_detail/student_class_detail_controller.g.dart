// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_class_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentClassDetailController on _StudentClassDetailControllerBase, Store {
  final _$classListAtom = Atom(name: '_StudentClassDetailControllerBase.classList');

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

  final _$_StudentClassDetailControllerBaseActionController =
      ActionController(name: '_StudentClassDetailControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo =
        _$_StudentClassDetailControllerBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_StudentClassDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'classList: ${classList.toString()}';
    return '{$string}';
  }
}
