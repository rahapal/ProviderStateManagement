import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo'), actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.navigate_next,
            size: 40,
          ),
        ),
      ]),
    );
  }
}
