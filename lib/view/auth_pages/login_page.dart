import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/auth_controler.dart';
import 'package:e_commerce_app/view/auth_pages/sign_up_page.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<AuthControler> {
  LoginPage({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => SignUpPage());
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: primaryColor),
                                  )),
                            ]),
                        Text(
                          'Sign in to Continue',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        SizedBox(height: 60),
                        CustomTextFormField(
                          secured: false,
                          fieldName: 'Email',
                          hintText: 'user@example.com',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                          },
                          onSaved: (value) {
                            controller.email = value!;
                          },
                        ),
                        SizedBox(height: 40),
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        MaterialButton(
                          onPressed: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              controller.emailAndPasswordSignIn();
                            }
                          },
                          child: Text(
                            'SIGN IN',
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
              SizedBox(height: 20),
              Text(
                '-OR-',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  _formKey.currentState!.save();

                  controller.googleSignIn();
                },
                image: 'assets/images/google.png',
                text: '  Continue with Google',
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  _formKey.currentState!.save();

                  controller.facebookSignIn();
                },
                image: 'assets/images/facebook.png',
                text: 'Continue with Facebook',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
