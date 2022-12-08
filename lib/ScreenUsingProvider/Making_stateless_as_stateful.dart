import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  DemoPage({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _password = ValueNotifier<bool>(true);
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
      body: Column(
        children: [
          TextFormField(
            obscureText: _password.value,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
