import 'package:flutter/material.dart';

class tncPage extends StatelessWidget {
  const tncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Condition'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('This is terms and condition page'),
          )
        ],
      ),
    );
  }
}
