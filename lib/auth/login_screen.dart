import 'package:daytask/app/theme.dart';
import 'package:daytask/auth/auth_service.dart';
import 'package:daytask/utils/validators.dart';
import 'package:daytask/widgets/custom_button.dart';
import 'package:daytask/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _gkey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

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
                    "Welcome Back!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 14),
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
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () => {},
                        style: TextButton.styleFrom(
                            foregroundColor: Ccolor.Catfish,
                            textStyle: Theme.of(context).textTheme.labelMedium),
                        child: Text("Forgot Password ?")),
                  ),
                  SizedBox(height: 32),
                  CustomButton(
                      outlined: false,
                      onPressed: () {
                        if (_gkey.currentState!.validate()){
                        AuthService().signInWithMail(email: _emailTextController.text.trim(), password: _passwordTextController.text.trim());
                        }
                      },
                      text: "Log In"),
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
                    onPressed: () {},
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
                            Navigator.of(context).pushNamed('/signUp');
                          },
                          child: Text("Sign Up",
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
