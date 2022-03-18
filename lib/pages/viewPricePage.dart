import 'package:flutter/material.dart';

class viewPricePage extends StatefulWidget {
  const viewPricePage({Key? key}) : super(key: key);

  @override
  State<viewPricePage> createState() => _viewPricePageState();
}

class _viewPricePageState extends State<viewPricePage> {
  @override
  final List<String> product = <String>[
    'Product 01',
    'Product 02',
    'Product 03'
  ];
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: product.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50.0,
          child: Center(
            child: Text(product[index]),
          ),
        );
      },
    );
  }
}
