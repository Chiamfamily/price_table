import 'package:flutter/cupertino.dart';

class mainPage extends StatefulWidget {
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Center(
      child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Recent Updated Price',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
