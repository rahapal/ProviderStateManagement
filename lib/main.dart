import 'package:flutter/material.dart';
import 'package:learnprovider/ProviderController/Theme_provider.dart';
import 'package:learnprovider/ProviderController/favorite_provider.dart';
import 'package:learnprovider/ProviderController/silder_provider.dart';
import 'package:learnprovider/ScreenUsingProvider/Slider_with_provider.dart';
import 'package:learnprovider/favourite_without_provider.dart';
import 'package:learnprovider/silder_without_provider.dart';
import 'package:provider/provider.dart';

import 'ProviderController/count_provider.dart';
import 'ScreenUsingProvider/count_with_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //For multiple provider

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const CountProviderPage(),
      ),
    );

    //For single provider class
    // return ChangeNotifierProvider(
    //     create: (_) => CountProvider(),
    //     child: MaterialApp(
    //       home: SliderPage(),
    //     ));
  }
}
