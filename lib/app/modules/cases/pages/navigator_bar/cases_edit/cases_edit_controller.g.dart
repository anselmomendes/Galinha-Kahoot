// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesEditController on _CasesEditBase, Store {
  final _$uploadedFileURLAtom = Atom(name: '_CasesEditBase.uploadedFileURL');

  @override
  String get uploadedFileURL {
    _$uploadedFileURLAtom.context.enforceReadPolicy(_$uploadedFileURLAtom);
    _$uploadedFileURLAtom.reportObserved();
    return super.uploadedFileURL;
  }

  @override
  set uploadedFileURL(String value) {
    _$uploadedFileURLAtom.context.conditionallyRunInAction(() {
      super.uploadedFileURL = value;
      _$uploadedFileURLAtom.reportChanged();
    }, _$uploadedFileURLAtom, name: '${_$uploadedFileURLAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'uploadedFileURL: ${uploadedFileURL.toString()}';
    return '{$string}';
  }
}
