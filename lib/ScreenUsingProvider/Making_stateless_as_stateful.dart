import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learnprovider/ScreenUsingProvider/api_provider.dart';

class DemoPage extends StatelessWidget {
  DemoPage({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _password = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo'), actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AuthScreen()));
          },
          icon: Icon(
            Icons.navigate_next,
            size: 40,
          ),
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: _password,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _password.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: () {
                        _password.value = !_password.value;
                      },
                      child: _password.value
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                );
              }),
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
