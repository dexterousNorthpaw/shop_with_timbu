import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_with_timbu/models/product_details.dart';
import 'package:shop_with_timbu/models/products.dart';
import 'package:shop_with_timbu/utils/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  String baseUrl = baseApiUrl;
  bool _isLoading = false;
  String productxID = '';
  bool hasNoProduct = true;

  ProductDetails pxd = ProductDetails();

  bool get isLoading {
    return _isLoading;
  }

  final List<Products> items = [];
  final List cart = [];
  int cartNo = 0;
  double cartTotalPrice = 0;

  // ProductDetails? pIn;

  final List<ProductDetails> productinformation = [];

  final queryParams = {
    "organization_id": apiOrganizationId,
    "Appid": apiAppid,
    "Apikey": apiAppkey,
  };

  getProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await http.get(
          Uri.parse("${baseUrl}products").replace(queryParameters: queryParams),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        final myProducts = jsonDecode(response.body)["items"];
        print("started");
        int x = 0;
        for (int i = 0; i < myProducts.length; i++) {
          items.add(Products.fromMap(myProducts[i]));
          print(items[i].name);
          x += 1;
        }
        print(x);
        print("ended");
        _isLoading = false;
        notifyListeners();
      } else
        () {
          print(response.statusCode);
        };
      return items;
    } catch (e) {
      print(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  getProductDescription(String product_id) async {
    _isLoading = true;
    // productxID = "5347751c8b73426e9a585769b9cb30af";
    notifyListeners();
    try {
      Response response = await http.get(
          Uri.parse("${baseUrl}products/$product_id")
              .replace(queryParameters: queryParams),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (response.statusCode == 200) {
        print("started");
        print(response.body);
        final productInfo = jsonDecode(response.body);
        print(productInfo);
        pxd = ProductDetails.fromMap(productInfo);
        print("end1");
        print(pxd.name);
        print("end2");
        notifyListeners();
        // final productInfo = jsonDecode(response.body);
        // pxd = ProductDetails.fromMap(productInfo);
        // notifyListeners();
      }
      return pxd;
    } catch (e) {}
    _isLoading = false;
    notifyListeners();
  }

  addCart(int index) {
    cart.add(items[index]);
    cartNo += 1;
    hasNoProduct = false;

    for (int i = 0; i < cart.length; i++) {
      print(cart[i].name);
      cartTotalPrice += cart[i].price;
    }
    print(cartTotalPrice);
    print(cartNo);
    // print(cart[index].price);
    notifyListeners();
  }
}
