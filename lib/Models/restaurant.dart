//import 'dart:js_util';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'package:ffirebaseapp/Models/cart_items.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
        name: "Classic Cheese Burger",
        description:
            "The classic burger with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://www.shutterstock.com/image-photo/craft-beef-burger-french-fries-600nw-592346543.jpg",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 2.99)
        ]),
    Food(
        name: "Juicy Cheese Burger",
        description:
            "The Juicy burger with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://th.bing.com/th/id/OIP.TaG4oMg7RpLu0niYve_rlgHaEo?rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 2.99)
        ]),
    Food(
        name: "Delicious Cheese Burger",
        description:
            "The Delicious burger with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://th.bing.com/th/id/R.ce068c6f5684d47b46ce2dd5b77dc3c5?rik=SSHXrenAYH70AA&riu=http%3a%2f%2fownchef.files.wordpress.com%2f2011%2f12%2fwhopper-good-image.jpg&ehk=N7ry2JW5xnj6vxNi4a%2bL4bou0qUO04WCvBUz02EU9L0%3d&risl=&pid=ImgRaw&r=0",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Tamatoes", price: 2.99)
        ]),
    Food(
        name: "Cruncy Cheese Burger",
        description:
            "The crunchy burger with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://th.bing.com/th/id/OIP.xIYX-RGwO1kKHdqIaBQlUAHaE8?rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Veggies", price: 2.99)
        ]),
    Food(
        name: "Yammy Cheese Burger",
        description:
            "The Yammy burger with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://th.bing.com/th/id/OIP.sOAJps2SSB-m65IFV6IRbgHaHa?w=500&h=500&rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 2.99)
        ]),

    //desserts
    Food(
        name: "Cherry Cheesecake",
        description:
            "Delicious cheesecake made with all fresh ingredients from our garden and local farms",
        imagePath:
            "https://th.bing.com/th/id/R.0c6225ea3b639d50191fa4a561a12da9?rik=Hks9HPgHkOO3mQ&pid=ImgRaw&r=0",
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra raspberry", price: 0.99),
          Addon(name: "Whipped Cream", price: 1.99),
          Addon(name: "Ice Cream", price: 2.99)
        ]),
    Food(
        name: "White Chocolate Parfait",
        description: "Delicious cake made with all fresh ingredients",
        imagePath:
            "https://th.bing.com/th/id/R.41685d965d64c00ddb8f78c458d5f6d2?rik=nNcaLLG2LGnTpQ&riu=http%3a%2f%2f4.bp.blogspot.com%2f_Pe9obweD_W8%2fTH5lSLYTgPI%2fAAAAAAAAABU%2fjWp0YWwlP8A%2fs1600%2fwhite-chocolate-parfait-flambeed-cherries200711131%5b1%5d.jpg&ehk=V2fo27SKZkLNgq1LV34E65nv73g2YTvtqNAcbUmY6zE%3d&risl=&pid=ImgRaw&r=0",
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra raspberry", price: 0.99),
          Addon(name: "Whipped Cream", price: 1.99),
          Addon(name: "Ice Cream", price: 2.99)
        ]),

    //drinks
    Food(
        name: "Sprite",
        description: "Icy cold",
        imagePath: "lib/images/drinks/drink2.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "No Ice", price: 0.99),
          Addon(name: "With ice", price: 1.99),
        ]),
    Food(
        name: "Coke",
        description: "Icy cold",
        imagePath:
            "https://i5.walmartimages.com/asr/6497856e-a3c4-45e6-b473-19fd366664f4_3.b47aa509d7ae747f6ed6909c5e461346.jpeg",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "No Ice", price: 0.99),
          Addon(name: "With ice", price: 1.99),
        ]),
    Food(
        name: "Dr Pepper",
        description: "Icy cold",
        imagePath:
            "https://th.bing.com/th/id/OIP.k6UdTVqb5wiW7PlTOIO-QwAAAA?rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "No Ice", price: 0.99),
          Addon(name: "With ice", price: 1.99),
        ]),

    //salads
    Food(
        name: "Meat Bowl",
        description:
            "Juicy Meat with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://th.bing.com/th/id/OIP.yr3zNQOGu2R_FfZoLPeElwHaE8?rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra vegies", price: 0.99),
          Addon(name: "Extra Sauce", price: 1.99),
        ]),
    Food(
        name: "Green Bowl",
        description:
            "fresh veggies with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://th.bing.com/th/id/OIP.PKAEzAlKMVGZlYYjpVdUMQAAAA?rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra vegies", price: 0.99),
          Addon(name: "Extra Sauce", price: 1.99),
        ]),
    Food(
        name: "Korean Beef",
        description:
            "fresh Meat with all the nutrients you need! Fresh cut vegetables form our garden.",
        imagePath:
            "https://th.bing.com/th/id/OIP.ikY0zysZhgB2RfcgDKJ21gHaJ1?rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra vegies", price: 0.99),
          Addon(name: "Extra Sauce", price: 1.99),
        ]),

    //sides
    Food(
        name: "Classic Green Meal",
        description:
            "Enjoy your eggs with a little bit of green from our garden!",
        imagePath:
            "https://pinchofyum.com/wp-content/uploads/Roasted-Veggie-Bowl-with-Egg-1-1024x1536.jpg",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Greens", price: 0.99),
          Addon(name: "Egg", price: 1.99),
          Addon(name: "Bacon", price: 2.99)
        ]),
    Food(
        name: "Asparagus with Peas",
        description: "Enjoy your plate wit juicy greens from our garden!",
        imagePath:
            "https://th.bing.com/th/id/OIP.HmYphRdLjbQxfddB2KBfNwAAAA?rs=1&pid=ImgDetMain",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Greens", price: 0.99),
          Addon(name: "Egg", price: 1.99),
        ]),
    Food(
        name: "Green Salad Mix",
        description:
            "Enjoy your a little bit of all Salads packed with nutrients!",
        imagePath:
            "https://th.bing.com/th/id/R.e815a02458ed3ed63ededd746e75bb70?rik=M6WyH9YEUyqDlw&pid=ImgRaw&r=0",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Greens", price: 0.99),
          Addon(name: "Avocado", price: 1.99),
          Addon(name: "Tamatoes", price: 2.99)
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
