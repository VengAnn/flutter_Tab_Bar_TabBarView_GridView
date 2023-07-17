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
        children: products.length != 0
            ? List.generate(
                products.length,
                (index) => MyCartProducts(
                  products[index],
                ),
              )
            : [
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 150,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                          child: const Text(
                            'No Products!',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
          //
          Container(
            height: 3,
            color: Colors.blue,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Name:\n ${product['name']}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(child: Text('Price: ${f.format(product['price'])}')),
            ],
          ),
          //
          Container(
            height: 30,
            child: ElevatedButton(
              onPressed: () => _onPressDetail(),
              child: Text('Detail'),
            ),
          ),
        ],
      ),
    );
  }

  void _onPressDetail() {
    var product = widget.product;
    var f = NumberFormat('\$#,##0.00');
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Products Informations'),
          content: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text('ID: ${product['id']}\n'
                    'Name: ${product['name']}\n'
                    'Price: ${f.format(product['price'])}\n'
                    'Catagory: ${product['Catagory']}\n'
                    'Country: ${product['Country']}\n'),
              ),
              //
              Expanded(
                child: Image(
                  width: 100,
                  image: NetworkImage(product['Photo']),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
