// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_class_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentClassDetailController
    on _StudentClassDetailControllerBase, Store {
  final _$classModelAtom =
      Atom(name: '_StudentClassDetailControllerBase.classModel');

  @override
  ObservableStream<ClassModel> get classModel {
    _$classModelAtom.context.enforceReadPolicy(_$classModelAtom);
    _$classModelAtom.reportObserved();
    return super.classModel;
  }

  @override
  set classModel(ObservableStream<ClassModel> value) {
    _$classModelAtom.context.conditionallyRunInAction(() {
      super.classModel = value;
      _$classModelAtom.reportChanged();
    }, _$classModelAtom, name: '${_$classModelAtom.name}_set');
  }

  final _$setClassAsyncAction = AsyncAction('setClass');

  @override
  Future<dynamic> setClass(ClassModel model) {
    return _$setClassAsyncAction.run(() => super.setClass(model));
  }

  @override
  String toString() {
    final string = 'classModel: ${classModel.toString()}';
    return '{$string}';
  }
}
