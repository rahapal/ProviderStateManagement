//Material deyena vani
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isload = false;
  bool get isload => _isload;

  load(bool value) {
    _isload = value;
    notifyListeners();
  }

  void auth(String email, String password) async {
    load(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        load(false);
        var data = jsonDecode(response.body.toString());
        print('Successful');
      } else {
        load(false);
        print('Failed');
      }
    } catch (e) {
      load(false);
      print(e.toString());
    }
  }
}
