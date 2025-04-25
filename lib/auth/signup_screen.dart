import 'dart:convert';

import 'package:daytask/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../app/theme.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _gkey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _fullnameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool isPolicyAgreed = false;
  bool showAlert = false;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _gkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 8),
                  CustomTextformfield(
                    controller: _fullnameTextController,
                    hintText: 'Enter your full name',
                    icon: Icons.email,
                    obscureText: false,
                    validator: (value) => fullnameValidator(value),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Email Address',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 8),
                  CustomTextformfield(
                    controller: _emailTextController,
                    hintText: 'Enter your email',
                    icon: Icons.email,
                    obscureText: false,
                    validator: (value) => emailValidator(value),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 8),
                  CustomTextformfield(
                    controller: _passwordTextController,
                    hintText: 'Enter your password',
                    icon: Icons.password,
                    obscureText: true,
                    validator: (value) => passwordValidator(value),
                  ),
                  SizedBox(height: 14),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: Checkbox(
                          value: isPolicyAgreed,
                          side:  BorderSide(
                            width: 2,
                            color: showAlert ? Colors.redAccent : Ccolor.Catfish
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              isPolicyAgreed = newValue!;
                              showAlert = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: RichText(
                            softWrap: true,
                            // maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: "I have read & agreed to DayTask ",
                                style: Theme.of(context).textTheme.labelSmall,
                                children: [
                                  TextSpan(
                                      text: "Privacy Policy, Terms & Condition",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                              color: Ccolor.Orange_Yellow,
                                              fontWeight: FontWeight.w400))
                                ])),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  CustomButton(
                      outlined: false,
                      onPressed: () async{

                        if (_gkey.currentState!.validate() && isPolicyAgreed) {
                        try {
                          final res = await AuthService().signUpWithMail(
                              email: _emailTextController.text.trim(),
                              password: _passwordTextController.text.trim(),
                              username : _fullnameTextController.text.trim()
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("User has been created successfully")));



                          Navigator.of(context).pop();

                        }on AuthException catch( e){
                          ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Text(e.message ))
                          );
                        }
                        } else if (!isPolicyAgreed) {

                          setState(() {
                            showAlert = true;
                          });

                        }
                      },
                      text: "Sign Up"),
                  SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(
                        height: 10,
                        thickness: 3,
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration:
                              BoxDecoration(color: Ccolor.Charleston_Green),
                          child: Text('Or continue with',
                              style: Theme.of(context).textTheme.labelMedium))
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    outlined: true,
                    onPressed: () {



                    },
                    text: "Google",
                    icon: Icons.g_mobiledata,
                  ),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Text("Log In",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontWeight: FontWeight.w400)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
