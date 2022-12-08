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
  TextEditingController _pwcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _pwcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final authprovider = Provider.of<AuthProvider>(context);
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
            controller: _pwcontroller,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              context.read<AuthProvider>().auth(
                    _emailcontroller.toString(),
                    _pwcontroller.toString(),
                  );
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: context.watch<AuthProvider>().isload
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Login')),
            ),
          )
        ],
      ),
    );
  }
}
