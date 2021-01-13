// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeleteStore on _DeleteStore, Store {
  final _$baseResponseModelAtom = Atom(name: '_DeleteStore.baseResponseModel');

  @override
  BaseResponseModel get baseResponseModel {
    _$baseResponseModelAtom.reportRead();
    return super.baseResponseModel;
  }

  @override
  set baseResponseModel(BaseResponseModel value) {
    _$baseResponseModelAtom.reportWrite(value, super.baseResponseModel, () {
      super.baseResponseModel = value;
    });
  }

  final _$itemIDAtom = Atom(name: '_DeleteStore.itemID');

  @override
  int get itemID {
    _$itemIDAtom.reportRead();
    return super.itemID;
  }

  @override
  set itemID(int value) {
    _$itemIDAtom.reportWrite(value, super.itemID, () {
      super.itemID = value;
    });
  }

  final _$isShopPhotoIDAtom = Atom(name: '_DeleteStore.isShopPhotoID');

  @override
  bool get isShopPhotoID {
    _$isShopPhotoIDAtom.reportRead();
    return super.isShopPhotoID;
  }

  @override
  set isShopPhotoID(bool value) {
    _$isShopPhotoIDAtom.reportWrite(value, super.isShopPhotoID, () {
      super.isShopPhotoID = value;
    });
  }

  @override
  String toString() {
    return '''
baseResponseModel: ${baseResponseModel},
itemID: ${itemID},
isShopPhotoID: ${isShopPhotoID}
    ''';
  }
}
