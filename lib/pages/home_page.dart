//import 'dart:ffi';
import 'package:ffirebaseapp/pages/food_page.dart';
import 'package:ffirebaseapp/Models/restaurant.dart';
import 'package:ffirebaseapp/components/my_current_location.dart';
import 'package:ffirebaseapp/components/my_description_box.dart';
import 'package:ffirebaseapp/components/my_drawer.dart';
import 'package:ffirebaseapp/components/my_food_tile.dart';
import 'package:ffirebaseapp/components/my_sliver_app_bar.dart';
import 'package:ffirebaseapp/components/my_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:ffirebaseapp/Models/food.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fulMenu) {
    return fulMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fulMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categorMenu = _filterMenuByCategory(category, fulMenu);

      return ListView.builder(
        itemCount: categorMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categorMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                  title: MyTabBar(
                    tabContoller: _tabController,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                        indent: 25,
                        endIndent: 25,
                      ),

                      //switch
                      MycurrentLocation(),

                      // description box
                      const MyDescriptionBox()
                    ],
                  ),
                ),
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu)),
          )),
    );
  }
}
