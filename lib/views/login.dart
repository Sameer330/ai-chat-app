import 'dart:ui';

import 'package:ai_chat_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),

            /// Add Lottie Here
            Ink(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Image.asset(
                    'assets/app-icon/app-icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            const Text(
              "Sign in.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            TextButton.icon(
              style: TextButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.93, 70),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Palette.borderColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onPressed: () {
                // TODO: Login with Google
              },
              icon: SvgPicture.asset(
                'assets/svgs/g_logo.svg',
                width: 25,
                // color: Palette.whiteColor,
                theme: const SvgTheme(
                  currentColor: Palette.whiteColor,
                ),
              ),
              label: const Text(
                "Sign in with Google",
                softWrap: true,
                style: TextStyle(
                  color: Palette.whiteColor,
                  fontSize: 17,
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            const Text(
              "or",
              style: TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 15),

            /// Add Login Form
            Center(
              child: Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty!";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: const EdgeInsets.all(27),
                          disabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.borderColor,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.borderColor,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.gradient1,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: const EdgeInsets.all(27),
                          disabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.borderColor,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.borderColor,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.gradient1,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Login Button

                    Container(
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF8C52FF),
                              Color(0xFFFF914D),
                            ],
                            begin: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_loginFormKey.currentState!.validate()) {
                            // Fluttertoast.showToast(msg: "Login");

                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.93, 55),
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// Add Other Details
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "No Account? "),
                  TextSpan(
                    text: "Sign Up.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.gradient2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
