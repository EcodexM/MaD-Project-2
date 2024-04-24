import 'package:ffirebaseapp/Models/cart_items.dart';
import 'package:ffirebaseapp/components/my_button.dart';
import 'package:ffirebaseapp/components/my_cart_tile.dart';
import 'package:ffirebaseapp/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:ffirebaseapp/Models/restaurant.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      //Ui
      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                                "Are you sure you wanter to clear you cart?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restaurant.clearCart();
                                  },
                                  child: const Text("Yes")),
                            ],
                          ));
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            //List of items
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(child: const Text("Cart is empty..")))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart items
                                final carItem = userCart[index];

                                //return cart tile
                                return MyCartTile(cartItem: carItem);
                              }),
                        ),
                ],
              ),
            ),
            MyButton(
                text: "Check-Out",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const paymentPage()))),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    });
  }
}
