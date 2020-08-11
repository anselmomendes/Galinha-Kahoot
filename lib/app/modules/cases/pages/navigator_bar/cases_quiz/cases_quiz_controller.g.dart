// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesQuizController on _CasesQuizControllerBase, Store {
  final _$casesPageAtom = Atom(name: '_CasesQuizControllerBase.casesPage');

  @override
  ObservableStream<List<ComponentModel>> get casesPage {
    _$casesPageAtom.context.enforceReadPolicy(_$casesPageAtom);
    _$casesPageAtom.reportObserved();
    return super.casesPage;
  }

  @override
  set casesPage(ObservableStream<List<ComponentModel>> value) {
    _$casesPageAtom.context.conditionallyRunInAction(() {
      super.casesPage = value;
      _$casesPageAtom.reportChanged();
    }, _$casesPageAtom, name: '${_$casesPageAtom.name}_set');
  }

  final _$casesAtom = Atom(name: '_CasesQuizControllerBase.cases');

  @override
  List<ComponentModel> get cases {
    _$casesAtom.context.enforceReadPolicy(_$casesAtom);
    _$casesAtom.reportObserved();
    return super.cases;
  }

  @override
  set cases(List<ComponentModel> value) {
    _$casesAtom.context.conditionallyRunInAction(() {
      super.cases = value;
      _$casesAtom.reportChanged();
    }, _$casesAtom, name: '${_$casesAtom.name}_set');
  }

  final _$editModeAtom = Atom(name: '_CasesQuizControllerBase.editMode');

  @override
  bool get editMode {
    _$editModeAtom.context.enforceReadPolicy(_$editModeAtom);
    _$editModeAtom.reportObserved();
    return super.editMode;
  }

  @override
  set editMode(bool value) {
    _$editModeAtom.context.conditionallyRunInAction(() {
      super.editMode = value;
      _$editModeAtom.reportChanged();
    }, _$editModeAtom, name: '${_$editModeAtom.name}_set');
  }

  final _$getDocumentsAsyncAction = AsyncAction('getDocuments');

  @override
  Future getDocuments(String casesID, String page) {
    return _$getDocumentsAsyncAction
        .run(() => super.getDocuments(casesID, page));
  }

  final _$_CasesQuizControllerBaseActionController =
      ActionController(name: '_CasesQuizControllerBase');

  @override
  dynamic delete(String casesID, String page) {
    final _$actionInfo =
        _$_CasesQuizControllerBaseActionController.startAction();
    try {
      return super.delete(casesID, page);
    } finally {
      _$_CasesQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic create(ComponentModel model) {
    final _$actionInfo =
        _$_CasesQuizControllerBaseActionController.startAction();
    try {
      return super.create(model);
    } finally {
      _$_CasesQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'casesPage: ${casesPage.toString()},cases: ${cases.toString()},editMode: ${editMode.toString()}';
    return '{$string}';
  }
}
