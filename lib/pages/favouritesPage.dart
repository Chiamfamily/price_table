import 'package:flutter/material.dart';

class favouritesPage extends StatefulWidget {
  const favouritesPage({Key? key}) : super(key: key);

  @override
  State<favouritesPage> createState() => _favouritesPageState();
}

class _favouritesPageState extends State<favouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('This is Favourite Page'),
          )
        ],
      ),
    );
  }
}
