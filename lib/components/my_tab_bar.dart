import 'package:flutter/material.dart';
import 'package:ffirebaseapp/Models/food.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabContoller});

  final TabController tabContoller;

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabContoller,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
