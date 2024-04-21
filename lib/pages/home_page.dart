import 'package:ffirebaseapp/components/my_drawer.dart';
import 'package:ffirebaseapp/components/my_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [MySliverAppBar(child: Text("Hello"), title: Text("Title"))],
          body: Container(
            color: Colors.blue,
          )),
    );
  }
}
