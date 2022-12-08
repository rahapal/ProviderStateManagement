import 'package:flutter/material.dart';
import 'package:learnprovider/ScreenUsingProvider/Slider_with_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../ProviderController/count_provider.dart';

class CountProviderPage extends StatefulWidget {
  const CountProviderPage({super.key});

  @override
  State<CountProviderPage> createState() => _CountProviderPageState();
}

class _CountProviderPageState extends State<CountProviderPage> {
  @override
  void initState() {
    super.initState();
    final countprovider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), ((timer) {
      countprovider.addcount();
    }));
  }

  @override
  Widget build(BuildContext context) {
    print('top build');
    final countprovider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SliderProviderPage()));
            },
            icon: Icon(
              Icons.skip_next_rounded,
              size: 40,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(builder: (context, value, child) {
              print('Down');
              return Text(
                value.count.toString(),
                style: TextStyle(
                  fontSize: 58,
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countprovider.addcount();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
