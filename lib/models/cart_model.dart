import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CartModel {
  String _id,
      _imageUrl,
      _productName,
      _productPoints,
      _productDesc,
      _productQuantity;

  CartModel(this._id, this._imageUrl, this._productName, this._productPoints,
      this._productDesc, this._productQuantity);

  String get id => _id;

  get productQuantity => _productQuantity;

  get productDesc => _productDesc;

  get productPoints => _productPoints;

  get productName => _productName;

  String get imageUrl => _imageUrl;

  CartModel.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _imageUrl = snapshot.value['imageUrl'];
    _productName = snapshot.value['productName'];
    _productPoints = snapshot.value['productPoints'];
    _productDesc = snapshot.value['productDesc'];
    _productQuantity = snapshot.value['productQuantity'];
  }
}
