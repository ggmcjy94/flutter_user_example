


import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, this.text,  this.controller}) : super(key: key);
  final String? text;
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text!),
        ),
        TextFormField(
          controller: controller,
          validator: (value) => value!.isEmpty ? "Please enter some $text" : null,
          obscureText: text == "Password" ? true : false,

          decoration: InputDecoration(
              hintText: "Enter $text",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
          ),
        )

      ],
    );
  }
}
