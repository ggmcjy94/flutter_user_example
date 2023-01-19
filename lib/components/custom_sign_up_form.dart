
import 'package:flutter/material.dart';
import 'package:flutter_user_example/controller/account_controller.dart';
import 'package:flutter_user_example/model/account.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'custom_form_field.dart';

class SignUpCustomForm extends StatelessWidget {
  SignUpCustomForm({Key? key}) : super(key: key);

  AccountController accountController = Get.find<AccountController>();

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController tel = TextEditingController();
  SignUpParams? signUpParams;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(text: "Email", controller: email,),
              SizedBox(height: 10,),
              CustomTextFormField(text: "Password", controller: password,),
              SizedBox(height: 10,),
              CustomTextFormField(text: "username", controller: username,),
              SizedBox(height: 10,),
              CustomTextFormField(text: "Phone", controller: tel,),
              SizedBox(height: 20.0,),
              TextButton(
                  onPressed: () async {
                    signUpParams = SignUpParams(
                        email : email.text,
                        password: password.text,
                        username: username.text,
                        tel: tel.text
                    );
                    if (_formKey.currentState!.validate()) {
                      _showSignUpAlerterDialog(context, signUpParams);
                    }
                  },
                  child: Text("회원가입")
              ),
            ],
          )

      ),
    );
  }

  void _showSignUpAlerterDialog(BuildContext context, param) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: Text("회원가입을 하시겠습니까?"),
            actions: [
              TextButton(onPressed: () async {
                var response = accountController.signUp(param);
                if (await response) {
                  Get.offAllNamed("/home");
                } else {
                  _showFailDialog(context);
                }
              }, child: Text("예")),
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("아니오")),
            ],
          );
        }
    );
  }

  void _showFailDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: Text("에러"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("예")),

            ],
          );
        }
    );
  }
}
