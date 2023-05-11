import 'package:ai_chat_app/views/login.dart';
import 'package:ai_chat_app/views/signup.dart';
import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  const Director({Key? key}) : super(key: key);

  @override
  State<Director> createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  bool isLogin = true;

  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginPage(
            onClickedSignUp: toggle,
          )
        : SignUpPage(
            onClickedSignIn: toggle,
          );
  }
}
