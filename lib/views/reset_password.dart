import 'dart:ui';

import 'package:ai_chat_app/utils/colors.dart';
import 'package:ai_chat_app/utils/common_vars.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _resetPasswordFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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

            Text(
              "Reset Password",
              softWrap: true,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            Text(
              "Receive an email to reset your password.",
              textAlign: TextAlign.center,
              softWrap: true,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            /// Add Login Form
            Center(
              child: Form(
                key: _resetPasswordFormKey,
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
                    const SizedBox(height: 20),
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

                          if (_resetPasswordFormKey.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: _emailController.text.trim());

                              Fluttertoast.showToast(
                                msg: "Password reset email sent!",
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                              );

                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);
                            } on FirebaseAuthException catch (e) {
                              Fluttertoast.showToast(
                                msg: e.message!,
                                backgroundColor: Colors.red,
                              );

                              Navigator.of(context).pop();

                              throw "Sign in error: $e";
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.93, 55),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          "Reset Password",
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
          ],
        ),
      ),
    );
  }
}
