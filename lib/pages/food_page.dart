import 'package:flutter/material.dart';
import 'package:ffirebaseapp/Models/food.dart';
import 'package:ffirebaseapp/Models/restaurant.dart';
import 'package:ffirebaseapp/components/my_button.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  FoodPage({super.key, required this.food}) {
//initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  @override
  State<FoodPage> createState() => _foodPageState();
}

class _foodPageState extends State<FoodPage> {
  //add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //back to menu
    Navigator.pop(context);

    //Selected addons
    List<Addon> currentlySelectedAddons = [];

    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //image
                Image.network(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      //price
                      Text(
                        '\$' + widget.food.price.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //description
                      Text(
                        widget.food.description,
                      ),
                      const SizedBox(height: 10),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 10),

                      //addons
                      Text(
                        "Addons",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              //get individual addons
                              Addon addon = widget.food.availableAddons[index];

                              //return check Boc UI
                              return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text(
                                    '\$${addon.price}',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  });
                            }),
                      )
                    ],
                  ),
                ),

                //buttton add
                MyButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                    text: "Add to cart"),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
