// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_cases_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentCasesHomeController on _StudentCasesHomeBase, Store {
  final _$caseModelAtom = Atom(name: '_StudentCasesHomeBase.caseModel');

  @override
  ObservableStream<CasesModel> get caseModel {
    _$caseModelAtom.context.enforceReadPolicy(_$caseModelAtom);
    _$caseModelAtom.reportObserved();
    return super.caseModel;
  }

  @override
  set caseModel(ObservableStream<CasesModel> value) {
    _$caseModelAtom.context.conditionallyRunInAction(() {
      super.caseModel = value;
      _$caseModelAtom.reportChanged();
    }, _$caseModelAtom, name: '${_$caseModelAtom.name}_set');
  }

  final _$getCaseAsyncAction = AsyncAction('getCase');

  @override
  Future getCase(ClassModel classModel) {
    return _$getCaseAsyncAction.run(() => super.getCase(classModel));
  }

  @override
  String toString() {
    final string = 'caseModel: ${caseModel.toString()}';
    return '{$string}';
  }
}
