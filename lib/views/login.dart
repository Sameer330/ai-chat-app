import 'dart:ui';

import 'package:ai_chat_app/services/google_auth_service.dart';
import 'package:ai_chat_app/utils/colors.dart';
import 'package:ai_chat_app/views/reset_password.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/common_vars.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  bool _showPassword = false;

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
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

            Text(
              "Sign in.",
              style: GoogleFonts.montserrat(
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
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Palette.borderColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onPressed: () {
                final provider =
                    Provider.of<AuthService>(context, listen: false);

                provider.signInWithGoogle();
              },
              icon: SvgPicture.asset(
                'assets/svgs/g_logo.svg',
                width: 25,
                // color: Palette.whiteColor,
                theme: const SvgTheme(
                  currentColor: Palette.whiteColor,
                ),
              ),
              label: Text(
                "Sign in with Google",
                softWrap: true,
                style: GoogleFonts.montserrat(
                  color: Palette.whiteColor,
                  fontSize: 17,
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Text(
              "or",
              style: GoogleFonts.montserrat(fontSize: 17),
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
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty!";
                          } else if (!EmailValidator.validate(
                              _emailController.text.trim())) {
                            return "Email does not exist!";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          errorMaxLines: 5,
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
                          hintStyle: GoogleFonts.montserrat(
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
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          errorMaxLines: 5,
                          hintText: "Password",
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            icon: _showPassword
                                ? const Icon(Icons.lock_open)
                                : const Icon(Icons.lock),
                          ),
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
                          hintStyle: GoogleFonts.montserrat(
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
                          FocusScope.of(context).unfocus();

                          if (_loginFormKey.currentState!.validate()) {
                            // Fluttertoast.showToast(msg: "Login");
                            showDialog(
                              context: context,
                              builder: (context) => Scaffold(
                                body: Center(
                                  child: Container(
                                    // height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Shimmer.fromColors(
                                      baseColor: const Color(0xFF8C52FF),
                                      highlightColor: const Color(0xFFFF914D),
                                      direction: ShimmerDirection.ltr,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Logging in...",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 200,
                                            width: 200,
                                            color: Colors.white,
                                            child: Image.asset(
                                                'assets/app-icon/brain.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              barrierDismissible: false,
                            );

                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                            } on FirebaseAuthException catch (e) {
                              Fluttertoast.showToast(
                                msg: e.message!,
                                backgroundColor: Colors.red,
                              );

                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);

                              throw "Sign in error: $e";
                            }

                            navigatorKey.currentState!
                                .popUntil((route) => route.isFirst);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.93, 55),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          "Sign in",
                          style: GoogleFonts.montserrat(
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
              height: 20,
            ),

            /// Already have account
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "No Account? "),
                  TextSpan(
                    text: "Sign Up.",
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,

                    //     () {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const SignUpPage(),
                    //     ),
                    //   );
                    // },
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: Palette.gradient2,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            /// Forgot Password
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "Forgot Password? "),
                  TextSpan(
                    text: "Change Password",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordPage(),
                          ),
                        );
                      },

                    //     () {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const SignUpPage(),
                    //     ),
                    //   );
                    // },
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: Palette.gradient2,
                      decoration: TextDecoration.underline,
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
