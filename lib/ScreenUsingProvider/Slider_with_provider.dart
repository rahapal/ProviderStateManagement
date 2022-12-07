import 'package:flutter/material.dart';
import 'package:learnprovider/ScreenUsingProvider/favorite_with_provider.dart';
import 'package:learnprovider/favourite_without_provider.dart';
import 'package:provider/provider.dart';

import '../ProviderController/silder_provider.dart';

class SliderProviderPage extends StatefulWidget {
  const SliderProviderPage({super.key});

  @override
  State<SliderProviderPage> createState() => _SliderProviderPageState();
}

class _SliderProviderPageState extends State<SliderProviderPage> {
  @override
  Widget build(BuildContext context) {
    final slideprovider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteProviderPage(),
                    ));
              },
              icon: Icon(
                Icons.navigate_next_rounded,
                size: 40,
              ))
        ],
      ),
      body: Column(
        children: [
          Consumer<SliderProvider>(builder: (context, comeValue, child) {
            return Slider(
                min: 0,
                max: 1,
                value: comeValue.value,
                onChanged: ((val) {
                  comeValue.setValue(val);
                }));
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<SliderProvider>(builder: (context, comeValue, child) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(comeValue.value),
                  ),
                  child: Text(
                    'Color opacity:${comeValue.value}',
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }),
              Consumer<SliderProvider>(builder: (context, comeValue, child) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(comeValue.value),
                  ),
                  child: Text(
                    'Color opacity:${comeValue.value}',
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
