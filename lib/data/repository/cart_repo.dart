import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstants.CART_LIST);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var checkoutTime = DateTime.now().toString();
    cart = [];
    //covert objects to string because sharedPreferences only accepts string
    cartList.forEach((element) {
      element.time = checkoutTime;
      return cart
          .add(jsonEncode(element)); // use return in forEach not break the loop
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    // getCartList();
  }

  List<CartModel> getCartList() {
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);

    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print('inside getCartList ' + carts.toString());
    }
    List<CartModel> cartList = [];

    // for (var element in carts) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
    // }

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      // cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    // for (var element in cartHistory) {
    //   cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    // }

    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));

    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      print('history list ' + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
    print('The length of history list is ' +
        getCartHistoryList().length.toString());
    for (int j = 0; j < getCartHistoryList().length; j++) {
      print('The time for the order is ' +
          getCartHistoryList()[j].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
