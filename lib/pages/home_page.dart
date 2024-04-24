import 'dart:async';
import 'package:ffirebaseapp/components/my_current_location.dart';
import 'package:ffirebaseapp/components/my_description_box.dart';
import 'package:ffirebaseapp/components/my_drawer.dart';
import 'package:ffirebaseapp/components/my_sliver_app_bar.dart';
import 'package:ffirebaseapp/components/my_tab_bar.dart';
import 'package:ffirebaseapp/components/my_food_tile.dart';
import 'package:ffirebaseapp/pages/food_page.dart';
import 'package:ffirebaseapp/Models/food.dart';
import 'package:ffirebaseapp/Models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

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

//sort and return a list
  List<Food> _filterMenuByCategory(FoodCategory, List<Food> fullMenu) {
    return fullMenu
        .where((food) => food.category == food.category)
        .toList(); // == category
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];
          return FoodTile(
              food: food,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodPage(food: food))));
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    //my current location
                    const MycurrentLocation(),

                    //discription Box
                    const MyDescriptionBox()
                  ],
                ),
                title: MyTabBar(tabContoller: _tabController))
          ],
          body: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                    controller: _tabController,
                    children: getFoodInThisCategory(restaurant.menu),
                  )),
        ));
  }
}
