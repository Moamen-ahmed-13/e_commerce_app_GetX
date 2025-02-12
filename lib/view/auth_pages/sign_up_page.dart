import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/auth_controler.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetWidget<AuthControler> {
  SignUpPage({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign Up,',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 60),
                        CustomTextFormField(
                          hintText: 'Enter your name',
                          fieldName: "Name",
                          onSaved: (value) {
                            controller.name = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                          },
                          secured: false,
                        ),
                        SizedBox(height: 15),
                        CustomTextFormField(
                          secured: false,
                          fieldName: 'Email',
                          hintText: 'example@gmail.com',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                          },
                          onSaved: (value) {
                            controller.email = value!;
                          },
                        ),
                        SizedBox(height: 15),
                        CustomTextFormField(
                          secured: true,
                          fieldName: 'Password',
                          hintText: '**********',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                          },
                          onSaved: (value) {
                            controller.password = value!;
                          },
                        ),
                        SizedBox(height: 60),
                        MaterialButton(
                          onPressed: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              controller.emailAndPasswordSignUp();
                            }
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: primaryColor,
                          minWidth: double.infinity,
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
