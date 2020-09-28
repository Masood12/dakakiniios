// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetShopStore on _GetShopStore, Store {
  final _$userShopModelAtom = Atom(name: '_GetShopStore.userShopModel');

  @override
  UserShop get userShopModel {
    _$userShopModelAtom.reportRead();
    return super.userShopModel;
  }

  @override
  set userShopModel(UserShop value) {
    _$userShopModelAtom.reportWrite(value, super.userShopModel, () {
      super.userShopModel = value;
    });
  }

  final _$isLoadedAtom = Atom(name: '_GetShopStore.isLoaded');

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  @override
  String toString() {
    return '''
userShopModel: ${userShopModel},
isLoaded: ${isLoaded}
    ''';
  }
}
