//import 'dart:js_util';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'package:ffirebaseapp/Models/cart_items.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //bowls
    Food(
        name: "Classic Bowl",
        description:
            "The classic bowl with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath: "lib/images/bowls/Salad Bowl.png",
        price: 0.99,
        category: FoodCategory.bowls,
        availableAddons: [
          Addon(name: "Dressing", price: 0.99),
          Addon(name: "Extra Greens", price: 1.99),
          Addon(name: "Protien", price: 2.99)
        ]),
    Food(
        name: "Raspberry Cheesecake",
        description:
            "Delicious cheesecake made with all fresh ingredients from our garden and local farms",
        imagePath: "lib/images/dessert/Raspberry Cheesecake.png",
        price: 0.99,
        category: FoodCategory.bowls,
        availableAddons: [
          Addon(name: "Extra raspberry", price: 0.99),
          Addon(name: "Whipped Cream", price: 1.99),
          Addon(name: "Ice Cream", price: 2.99)
        ]),
    Food(
        name: "Classic Green Meal",
        description:
            "Enjoy your eggs with a little bit of green from our garden!",
        imagePath: "lib/images/greens/Eggs and Greens.png",
        price: 0.99,
        category: FoodCategory.bowls,
        availableAddons: [
          Addon(name: "Extra Greens", price: 0.99),
          Addon(name: "Egg", price: 1.99),
          Addon(name: "Bacon", price: 2.99)
        ]),
  ];
//getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
//user cart
  List<CartItem> _cart = [];

//operations
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //calculation for the total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //calculating totat item count
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

//helper functions
}
