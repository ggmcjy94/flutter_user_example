
import 'package:flutter/material.dart';
import 'package:flutter_user_example/components/custom_form_field.dart';
import 'package:flutter_user_example/controller/account_controller.dart';
import 'package:flutter_user_example/model/account.dart';
import 'package:get/get.dart';

class SignInCustomForm extends StatelessWidget {
  SignInCustomForm({Key? key}) : super(key: key);

  AccountController accountController = Get.find<AccountController>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(text: "Email", controller: email),
            SizedBox(height: 10,),
            CustomTextFormField(text: "Password", controller: password),
            SizedBox(height: 30,),
            TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    SignInParams signInParams = SignInParams(email: email.text, password: password.text);
                    var response = accountController.signIn(signInParams);
                    bool checked = false;
                    if (await response) {
                      checked = true;
                      _showSignInAlertDialog(context, "로그인 success", checked);
                    } else {
                      checked = false;
                      email.clear();
                      password.clear();
                      _showSignInAlertDialog(context, "로그인 failed 다시 시도", checked);
                    }

                  }
                },
                child: Text("로그인")
            ),
          ],
        ),
      ),
    );
  }

  void _showSignInAlertDialog(BuildContext context ,String content, bool checked) {
    showDialog(
        context: context ,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: ()  {
                    if (checked) {
                      Get.offAllNamed("/home");
                    } else {
                      Navigator.pop(context);
;                    }
                  },
                  child: Text("예"),
              ),
            ],
          );
        },

    );
  }
}
