import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<int> _selectedItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedItem(val: _selectedItem)));
            },
            icon: Icon(
              Icons.favorite_rounded,
              size: 40,
              color: Colors.red,
            ))
      ]),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: ((context, index) {
            return ListTile(
              onTap: (() {
                _selectedItem.add(index);
                setState(() {});
                print('${_selectedItem}');
              }),
              onLongPress: () {
                _selectedItem.remove(index);
                setState(() {});
                print('${_selectedItem}');
              },
              title: Text('Item ${index + 1}'),
              trailing: Icon(_selectedItem.contains(index)
                  ? Icons.favorite
                  : Icons.favorite_border),
            );
          })),
    );
  }
}

class SelectedItem extends StatefulWidget {
  List<int> val = [];
  SelectedItem({required this.val, super.key});

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: ListView.builder(
          itemCount: widget.val.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text('Item ${widget.val.toString()}'),
            );
          })),
    );
  }
}
