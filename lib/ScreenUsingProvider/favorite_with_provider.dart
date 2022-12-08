import 'package:flutter/material.dart';
import 'package:learnprovider/ScreenUsingProvider/MyFavorite.dart';
import 'package:provider/provider.dart';

import '../ProviderController/favorite_provider.dart';

class FavoriteProviderPage extends StatefulWidget {
  const FavoriteProviderPage({super.key});

  @override
  State<FavoriteProviderPage> createState() => _FavoriteProviderPageState();
}

class _FavoriteProviderPageState extends State<FavoriteProviderPage> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen()));
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.navigate_next_rounded,
              size: 40,
            ),
          ),
        ],
        title: Text('Favourite'),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: ((context, index) {
            return Consumer<FavouriteProvider>(builder: (context, val, child) {
              return ListTile(
                onTap: (() {
                  val.selectedItem.contains(index)
                      ? val.removeItem(index)
                      : val.addItem(index);
                }),
                title: Text('Item ${index}'),
                trailing: Icon(val.selectedItem.contains(index)
                    ? Icons.favorite
                    : Icons.favorite_border),
              );
            });
          })),
    );
  }
}
