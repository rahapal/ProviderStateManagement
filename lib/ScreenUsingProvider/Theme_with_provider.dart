import 'package:flutter/material.dart';
import 'package:learnprovider/ProviderController/Theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Theme Color')),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themeprovider.themeMode,
            onChanged: themeprovider.setcolor,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeprovider.themeMode,
            onChanged: themeprovider.setcolor,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeprovider.themeMode,
            onChanged: themeprovider.setcolor,
          ),
          Icon(Icons.favorite),
        ],
      ),
    );
  }
}
