import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  var controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Tabbarview and Gridview'),
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text('Food'),
            ),
            //
            Tab(
              child: Text('Soft Drink'),
            ),
            Tab(
              child: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
