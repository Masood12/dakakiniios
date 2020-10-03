// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateMenuStore on _CreateMenuStore, Store {
  final _$uploadImageModelAtom =
      Atom(name: '_CreateMenuStore.uploadImageModel');

  @override
  UploadImageModel get uploadImageModel {
    _$uploadImageModelAtom.reportRead();
    return super.uploadImageModel;
  }

  @override
  set uploadImageModel(UploadImageModel value) {
    _$uploadImageModelAtom.reportWrite(value, super.uploadImageModel, () {
      super.uploadImageModel = value;
    });
  }

  final _$createShopMenuAtom = Atom(name: '_CreateMenuStore.createShopMenu');

  @override
  CreateShopMenu get createShopMenu {
    _$createShopMenuAtom.reportRead();
    return super.createShopMenu;
  }

  @override
  set createShopMenu(CreateShopMenu value) {
    _$createShopMenuAtom.reportWrite(value, super.createShopMenu, () {
      super.createShopMenu = value;
    });
  }

  final _$base64ImageAtom = Atom(name: '_CreateMenuStore.base64Image');

  @override
  dynamic get base64Image {
    _$base64ImageAtom.reportRead();
    return super.base64Image;
  }

  @override
  set base64Image(dynamic value) {
    _$base64ImageAtom.reportWrite(value, super.base64Image, () {
      super.base64Image = value;
    });
  }

  final _$shopIDAtom = Atom(name: '_CreateMenuStore.shopID');

  @override
  int get shopID {
    _$shopIDAtom.reportRead();
    return super.shopID;
  }

  @override
  set shopID(int value) {
    _$shopIDAtom.reportWrite(value, super.shopID, () {
      super.shopID = value;
    });
  }

  final _$ownerIDAtom = Atom(name: '_CreateMenuStore.ownerID');

  @override
  int get ownerID {
    _$ownerIDAtom.reportRead();
    return super.ownerID;
  }

  @override
  set ownerID(int value) {
    _$ownerIDAtom.reportWrite(value, super.ownerID, () {
      super.ownerID = value;
    });
  }

  final _$titleAtom = Atom(name: '_CreateMenuStore.title');

  @override
  dynamic get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(dynamic value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descAtom = Atom(name: '_CreateMenuStore.desc');

  @override
  dynamic get desc {
    _$descAtom.reportRead();
    return super.desc;
  }

  @override
  set desc(dynamic value) {
    _$descAtom.reportWrite(value, super.desc, () {
      super.desc = value;
    });
  }

  final _$priceAtom = Atom(name: '_CreateMenuStore.price');

  @override
  dynamic get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(dynamic value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  @override
  String toString() {
    return '''
uploadImageModel: ${uploadImageModel},
createShopMenu: ${createShopMenu},
base64Image: ${base64Image},
shopID: ${shopID},
ownerID: ${ownerID},
title: ${title},
desc: ${desc},
price: ${price}
    ''';
  }
}
