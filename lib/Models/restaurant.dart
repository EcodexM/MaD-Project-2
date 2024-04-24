import 'dart:js_util';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'package:ffirebaseapp/Models/cart_items.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
        name: "Classic Cheeseburger",
        description:
            "A juicey beef patty with melted cheddar, lettuce, tamato, and a hint of onion and pickle.",
        imagePath: "lib/images/burgers/cheese_burger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 2.99)
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A juicey beef patty with melted cheddar, lettuce, tamato, and a hint of onion and pickle.",
        imagePath: "lib/images/burgers/cheese_burger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 2.99)
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A juicey beef patty with melted cheddar, lettuce, tamato, and a hint of onion and pickle.",
        imagePath: "lib/images/burgers/cheese_burger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 2.99)
        ]),

    //salads

    //sides

    //desserts

    //drinks
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
