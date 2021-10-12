import 'package:flutter/material.dart';
import 'package:shopping_app/home/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  late ProductModel currentProduct;

  addItemToCart(ProductModel product) {
    if (_isExistInCart(product)) {
      product.count++;
    } else {
      productList.add(product);
    }
    currentProduct = product;
    notifyListeners();
  }

  removeItemFromCart(ProductModel product) {
    if (product.count == 1) {
      productList.remove(product);
    } else {
      product.count--;
    }
    currentProduct = product;
    notifyListeners();
  }

  bool _isExistInCart(ProductModel product) {
    return productList.map((e) => e.id).contains(product.id);
  }
}
