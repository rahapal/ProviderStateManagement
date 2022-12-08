import 'package:flutter/material.dart';
import 'package:learnprovider/ProviderController/api_provider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailcontroller,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextFormField(
            controller: _passwordcontroller,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              authprovider.auth(
                _emailcontroller.toString(),
                _passwordcontroller.toString(),
              );
            },
            child: Container(
              height: 50,
              width: double.infinity,
              child: Center(
                  child: authprovider.load(true)
                      ? const CircularProgressIndicator()
                      : const Text('Login')),
            ),
          )
        ],
      ),
    );
  }
}
