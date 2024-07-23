import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_with_timbu/models/product_details.dart';
import 'package:shop_with_timbu/models/products.dart';
import 'package:shop_with_timbu/utils/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  String baseUrl = baseApiUrl;
  bool _isLoading = false;
  String productxID = '';
  String categoryName = '';
  bool hasNoProduct = true;

  // final _myBox = Hive.box("orderHistory");

  ProductDetails pxd = ProductDetails();

  bool get isLoading {
    return _isLoading;
  }

  final List<Products> items = [];
  final List cart = [];
  final List orderHistory = [];
  final List<Products> displaycategory = [];

  final List wishList = [];

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

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
    _errorMessage = '';
    _isLoading = true;
    items.clear;
    notifyListeners();
    try {
      Response response = await http.get(
          Uri.parse("${baseUrl}products").replace(queryParameters: queryParams),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(const Duration(seconds: 5), onTimeout: () {
        _errorMessage = "Request timed out. Please try again";
        _isLoading = false;
        notifyListeners();
        return http.Response("Error", 408);
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        final myProducts = jsonDecode(response.body)["items"];
        print("started");
        print(myProducts);
        int x = 0;
        for (int i = 0; i < myProducts.length; i++) {
          print(myProducts.length);
          items.add(Products.fromMap(myProducts[i]));
          print(items[i].name);
          print(x);

          x += 1;
        }
        print(x);
        print("ended");
        _isLoading = false;
        notifyListeners();
      } else {
        switch (response.statusCode) {
          case 400:
            _errorMessage = 'Bad request. Please try again.';
            break;
          case 401:
            _errorMessage = 'Unauthorized. Please check your credentials.';
            break;
          case 403:
            _errorMessage =
                'Forbidden. You do not have permission to access this resource.';
            break;
          case 404:
            _errorMessage =
                'Not found. The requested resource could not be found.';
            break;

          case 408:
            _errorMessage = "Request timed out. Please try again";
            break;
          case 500:
            _errorMessage = 'Internal server error. Please try again later.';
            break;
          case 503:
            _errorMessage = 'Service unavailable. Please try again later.';
            break;
          default:
            _errorMessage = 'An unknown error occurred. Please try again.';
        }
        print(_errorMessage);
      }
      return items;
    } catch (e) {
      print(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  getProductDescription(String? product_id) async {
    // _isLoading = true;
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
        productinformation.add(pxd);
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
    // _isLoading = false;
    notifyListeners();
  }

  addCart(int index) {
    print(items[index].price);
    cart.add(items[index]);

    cartNo += 1;
    hasNoProduct = false;
    // print(cart.length);
    // print("Cart Price is $cartTotalPrice");
    print("Selected Item price is ${items[index].price}");
    cartTotalPrice += items[index].price;

    // for (int i = 0; i < cart.length; i++) {
    //   print(cart[i].name);
    //   cartTotalPrice += cart[i].price;
    // }

    print("Cart Price is $cartTotalPrice");
    print(cart.length);
    // print(cartNo);
    // print(cart[index].price);
    notifyListeners();
  }

  delCartItem(int index) {
    cartTotalPrice -= cart[index].price;
    cart.removeAt(index);
    // print(cart[index].price);

    if (cart.isEmpty) {
      cartTotalPrice = 0;
      hasNoProduct = true;
      notifyListeners();
    }
    notifyListeners();
  }

  clearCart() {
    cart.clear();
    cartTotalPrice = 0;
    hasNoProduct = true;
    notifyListeners();
  }

  getCategory(String catId) async {
    _isLoading = true;
    displaycategory.clear;
    notifyListeners();
    try {
      print(catId);
      final link = Uri.parse(
          "https://api.timbu.cloud/products?Apikey=612557eb98a34df99e1f096b0e6421b420240713194233293701&Appid=WOSP9QJSFU6225A&organization_id=d7fbe4c9c1e04e3aab2c976fe6ecac78&&category_id=${catId}");

      Response response = await http.get(link);
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        print("back");
        print(response.body);
        final categoryItems = jsonDecode(response.body)["items"];
        print(categoryItems.length);
        for (int i = 0; i < categoryItems.length; i++) {
          print("CAtItem: ${categoryItems[i]}");
          displaycategory.add(Products.fromMap(categoryItems[i]));
          notifyListeners();
          print(displaycategory[i].name);
        }
        _isLoading = false;
        notifyListeners();
      } else {
        print(response.statusCode);
        return displaycategory;
      }
    } catch (e) {
      print(e.toString());
    }

    _isLoading = false;
    notifyListeners();
  }

  addWishList() {
    // print(items[index].price);
    print("product information is $productinformation");
    print("pxd is $pxd");

    if (wishList.contains(pxd)) {
      wishList.remove(pxd);
      notifyListeners();
    } else {
      wishList.add(pxd);
      notifyListeners();
    }
    print("wishlist is ${wishList}");
    print("tapped");
    notifyListeners();
  }

  addOrder() async {
    orderHistory.add(cart);
    print(orderHistory);
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<String> orderList = orderHistory.map((item) => jsonEncode(item.toMap())).toList();
    // prefs.setList
  }
}
