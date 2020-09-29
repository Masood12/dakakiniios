// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetShopStore on _GetShopStore, Store {
  final _$userFoodShopModelAtom = Atom(name: '_GetShopStore.userFoodShopModel');

  @override
  UserShop get userFoodShopModel {
    _$userFoodShopModelAtom.reportRead();
    return super.userFoodShopModel;
  }

  @override
  set userFoodShopModel(UserShop value) {
    _$userFoodShopModelAtom.reportWrite(value, super.userFoodShopModel, () {
      super.userFoodShopModel = value;
    });
  }

  final _$userClothShopModelAtom =
      Atom(name: '_GetShopStore.userClothShopModel');

  @override
  UserShop get userClothShopModel {
    _$userClothShopModelAtom.reportRead();
    return super.userClothShopModel;
  }

  @override
  set userClothShopModel(UserShop value) {
    _$userClothShopModelAtom.reportWrite(value, super.userClothShopModel, () {
      super.userClothShopModel = value;
    });
  }

  final _$userBakhoorShopModelAtom =
      Atom(name: '_GetShopStore.userBakhoorShopModel');

  @override
  UserShop get userBakhoorShopModel {
    _$userBakhoorShopModelAtom.reportRead();
    return super.userBakhoorShopModel;
  }

  @override
  set userBakhoorShopModel(UserShop value) {
    _$userBakhoorShopModelAtom.reportWrite(value, super.userBakhoorShopModel,
        () {
      super.userBakhoorShopModel = value;
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

  final _$isFoodListLoadedAtom = Atom(name: '_GetShopStore.isFoodListLoaded');

  @override
  bool get isFoodListLoaded {
    _$isFoodListLoadedAtom.reportRead();
    return super.isFoodListLoaded;
  }

  @override
  set isFoodListLoaded(bool value) {
    _$isFoodListLoadedAtom.reportWrite(value, super.isFoodListLoaded, () {
      super.isFoodListLoaded = value;
    });
  }

  final _$isClothListLoadedAtom = Atom(name: '_GetShopStore.isClothListLoaded');

  @override
  bool get isClothListLoaded {
    _$isClothListLoadedAtom.reportRead();
    return super.isClothListLoaded;
  }

  @override
  set isClothListLoaded(bool value) {
    _$isClothListLoadedAtom.reportWrite(value, super.isClothListLoaded, () {
      super.isClothListLoaded = value;
    });
  }

  final _$isBakhoorListLoadedAtom =
      Atom(name: '_GetShopStore.isBakhoorListLoaded');

  @override
  bool get isBakhoorListLoaded {
    _$isBakhoorListLoadedAtom.reportRead();
    return super.isBakhoorListLoaded;
  }

  @override
  set isBakhoorListLoaded(bool value) {
    _$isBakhoorListLoadedAtom.reportWrite(value, super.isBakhoorListLoaded, () {
      super.isBakhoorListLoaded = value;
    });
  }

  @override
  String toString() {
    return '''
userFoodShopModel: ${userFoodShopModel},
userClothShopModel: ${userClothShopModel},
userBakhoorShopModel: ${userBakhoorShopModel},
isLoaded: ${isLoaded},
isFoodListLoaded: ${isFoodListLoaded},
isClothListLoaded: ${isClothListLoaded},
isBakhoorListLoaded: ${isBakhoorListLoaded}
    ''';
  }
}
