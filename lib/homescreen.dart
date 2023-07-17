import 'package:flutter/material.dart';
import 'package:tabbar_tabbarview_gridview/detailapp.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  var controller;
  var header = [
    'Food',
    'Soft Drink',
    'Beer',
  ];
  //
  var ls = [
    [
      {
        'id': 1,
        'name': 'Water',
        'Price': 1.2,
        'Catagory': 'Soft drink',
        'Country': 'KH',
        'Photo':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSsp-D-4fetFngRBJu3i23-Zov3FJhNXISeJAeHLLyHvCn58ZrEgKhasSzZGncgs-MfyQ&usqp=CAU',
      },
      //can hava alot of {};
    ],
    [
      {
        'id': 100,
        'name': 'chicken',
        'price': 3.85,
        'catagory': 'Food',
        'country': 'KH',
        'Photo': 'https://pngimg.com/d/kfc_food_PNG2.png',
      },
    ],
    [
      {
        'id': 200,
        'name': 'tigger beer',
        'Price': 2.5,
        'Catagory': 'Beer',
        'Country': 'KH',
        'Photo':
            'https://ggfmcg.com/media/catalog/product/cache/a3ab923d5ec177a135e8b988f9586000/1/6/161a003-tiger_crystal_beer_can_330ml_x_24_can_1__2.png',
      },
    ],
  ];

  @override
  void initState() {
    controller = TabController(length: header.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Tabbarview and Gridview'),

        ///
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          tabs: [
            for (var head in header)
              Tab(
                child: Text(head),
              ),
          ],
        ),
      ),
      //
      body: TabBarView(
        controller: controller,
        children: [
          for (var products in ls) DetailApp(products),
        ],
      ),
    );
  }
}
