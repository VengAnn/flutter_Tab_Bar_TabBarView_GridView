import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailApp extends StatelessWidget {
  var products = [];

  DetailApp(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          products.length,
          (index) => MyCartProducts(
            products[index],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyCartProducts extends StatefulWidget {
  var product;

  MyCartProducts(this.product);

  @override
  State<MyCartProducts> createState() => _MyCartProductsState();
}

class _MyCartProductsState extends State<MyCartProducts> {
  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    var f = NumberFormat('\$#,##0.00');
    //
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Image(
            width: 120,
            image: NetworkImage(product['Photo']),
          ),
          Row(
            children: [
              Text('Name: ${product['name']}'),
              Text('Price: ${f.format(product['price'])}'),
            ],
          ),
        ],
      ),
    );
  }
}
