import 'package:flutter/material.dart';
import 'package:learnprovider/ProviderController/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedprovider = Provider.of<FavouriteProvider>(context);
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
        ],
        title: Text('Favourite'),
      ),
      body: ListView.builder(
          itemCount: selectedprovider.selectedItem.length,
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
