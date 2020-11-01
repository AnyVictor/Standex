// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StandApiStore on _StandApiStoreBase, Store {
  final _$standAPIAtom = Atom(name: '_StandApiStoreBase.standAPI');

  @override
  StandAPI get standAPI {
    _$standAPIAtom.reportRead();
    return super.standAPI;
  }

  @override
  set standAPI(StandAPI value) {
    _$standAPIAtom.reportWrite(value, super.standAPI, () {
      super.standAPI = value;
    });
  }

  final _$_StandApiStoreBaseActionController =
      ActionController(name: '_StandApiStoreBase');

  @override
  dynamic fetchStandList() {
    final _$actionInfo = _$_StandApiStoreBaseActionController.startAction(
        name: '_StandApiStoreBase.fetchStandList');
    try {
      return super.fetchStandList();
    } finally {
      _$_StandApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
standAPI: ${standAPI}
    ''';
  }
}
