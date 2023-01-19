
import 'package:flutter/material.dart';
import 'package:flutter_user_example/components/custom_sign_up_form.dart';
import 'package:flutter_user_example/controller/account_controller.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _signUpAppBar(),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원가입"),
            SignUpCustomForm()
          ],
        ),
      ),

    );
  }

  AppBar _signUpAppBar() {
    return AppBar(
      toolbarHeight: 0,
    );
  }

}
