
import 'package:flutter/material.dart';

import '../components/custom_sign_in_form.dart';



class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login"),
              SignInCustomForm(),
            ],

          ),
        ),
      ),
    );
  }
}
