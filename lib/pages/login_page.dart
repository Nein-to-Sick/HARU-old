import 'package:cap_stone_project/components/button.dart';
import 'package:cap_stone_project/components/square_tile.dart';
import 'package:cap_stone_project/components/test_field.dart';
import 'package:cap_stone_project/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  void signIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      Navigator.pop(context);
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    Image(
                      image: AssetImage('assets/thecat.jpg'),
                      width: 120,
                      height: 146.9,
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    //app names
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
                      height: 25,
                    ),

                    //sign in button
                    Container(
                        width: 295,
                        height: 60,
                        child: MyButton(onTap: signIn, text: '로그인')),
                    const SizedBox(
                      height: 10,
                    ),

                    //go to register page
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "회원가입",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF717171),
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Social Media Logins
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
      ),
    );
  }
}
