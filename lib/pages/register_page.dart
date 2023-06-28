import 'package:cap_stone_project/components/test_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/square_tile.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // void _tryValidation() {
  //   final isValid = _formKey.currentState!.validate();
  //   if (isValid) {
  //     _formKey.currentState!.save();
  //   }
  // }

  void signUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign up
    try {
      if (passwordTextController.text == confirmPasswordTextController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailTextController.text,
            password: passwordTextController.text);

        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showErrorMessage("비밀번호가 같지 않습니다!");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //wrong email or pw
      showErrorMessage(e.code);
    }
  }

  //error message popup
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Image(
                    image: AssetImage('assets/thecat.jpg'),
                    width: 120,
                    height: 146.9,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "하루",
                    style: TextStyle(
                      fontSize: 61,
                      color: Color(0xFF544437),
                      height: 1.0,
                    ),
                  ),
                  const Text(
                    "Haru",
                    style: TextStyle(
                        fontSize: 30, color: Color(0xFF544437), height: 1.0),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //email textfield
                  Container(
                    width: 295,
                    height: 44,
                    child: MyTextField(
                        controller: emailTextController,
                        hintText: '이메일',
                        obscureText: false,
                        validatorType: 1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //pw textfield
                  Container(
                    width: 295,
                    height: 44,
                    child: MyTextField(
                      controller: passwordTextController,
                      hintText: '비민번호',
                      obscureText: true,
                      validatorType: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //confirm password textfield
                  Container(
                    width: 295,
                    height: 44,
                    child: MyTextField(
                      controller: confirmPasswordTextController,
                      hintText: '비밀번호 확인',
                      obscureText: true,
                      validatorType: 3,
                      passwordcheck: passwordTextController,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  Container(
                      width: 295,
                      height: 60,
                      child: MyButton(onTap: signUp, text: '회원 가입')),
                  const SizedBox(
                    height: 25,
                  ),

                  //go to register page
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "로그인 하러 가기",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF717171),
                          decoration: TextDecoration.underline),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SquareTile(
                          onTap: () => AuthService().signInWithGoogle(),
                          imagePath: 'assets/googlelogin.jpg'),
                      SquareTile(
                          onTap: () {}, imagePath: 'assets/kakaologin.jpg'),
                      SquareTile(
                          onTap: () {}, imagePath: 'assets/applelogin.jpg'),
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
