// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on ProductStoreBase, Store {
  late final _$productModelAtom =
      Atom(name: 'ProductStoreBase.productModel', context: context);

  @override
  ProductModel get productModel {
    _$productModelAtom.reportRead();
    return super.productModel;
  }

  @override
  set productModel(ProductModel value) {
    _$productModelAtom.reportWrite(value, super.productModel, () {
      super.productModel = value;
    });
  }

  late final _$seletedAtom =
      Atom(name: 'ProductStoreBase.seleted', context: context);

  @override
  bool get seleted {
    _$seletedAtom.reportRead();
    return super.seleted;
  }

  @override
  set seleted(bool value) {
    _$seletedAtom.reportWrite(value, super.seleted, () {
      super.seleted = value;
    });
  }

  @override
  String toString() {
    return '''
productModel: ${productModel},
seleted: ${seleted}
    ''';
  }
}
