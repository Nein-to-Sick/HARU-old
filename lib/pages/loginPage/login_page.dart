import 'package:cap_stone_project/components/button.dart';
import 'package:cap_stone_project/components/square_tile.dart';
import 'package:cap_stone_project/components/test_field.dart';
import 'package:cap_stone_project/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
      backgroundColor: Theme.of(context).colorScheme.background,
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
                    // const SizedBox(
                    //   height: 200,
                    // ),
                    //logo
                    Image.asset(
                      // imagePath: 'assets/images/login/applelogin.jpg',
                      'assets/images/login/firstpage.jpg',
                    ),
                    // AssetImage(
                    //   "./assests/images/login/firstpage.png",
                    // ),

                    const SizedBox(
                      height: 104.34,
                    ),

                    //app names
                    // Text(
                    //   "하루",
                    //   style: TextStyle(
                    //     fontSize: 61,
                    //     color: Theme.of(context).colorScheme.primary,
                    //     height: 1.0,
                    //   ),
                    // ),
                    // Text(
                    //   "Haru",
                    //   style: TextStyle(
                    //     fontSize: 30,
                    //     color: Theme.of(context).colorScheme.primaryContainer,
                    //     height: 1.0,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                    // SignInButton(
                    //   Buttons.GoogleDark,
                    //   onPressed: () {
                    //     AuthService().signInWithGoogle();
                    //   },
                    // ),
                    // SignInButton(
                    //   Buttons.AppleDark,
                    //   onPressed: () {
                    //     showErrorMessage("V.1.0.0에 구현될 예정입니다.");
                    //   },
                    // ),

                    GestureDetector(
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                      child: AnimatedContainer(
                        height: 60,
                        width: 335,
                        decoration: BoxDecoration(
                          // color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(67),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        duration: const Duration(milliseconds: 300),
                        child: const Row(children: [
                          SizedBox(
                            width: 30,
                          ),
                          SquareTile(
                            imagePath: 'assets/images/login/googlelogin.jpg',
                            radians: 30,
                          ),
                          Expanded(
                            child: Text(
                              "   Google 로그인",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        showErrorMessage("V.1.0.0에 구현될 예정입니다.");
                      },
                      child: AnimatedContainer(
                        height: 60,
                        width: 335,
                        decoration: BoxDecoration(
                          // color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(67),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        duration: const Duration(milliseconds: 300),
                        child: const Row(children: [
                          SizedBox(
                            width: 30,
                          ),
                          SquareTile(
                            imagePath: 'assets/images/login/applelogin.jpg',
                            radians: 30,
                          ),
                          Expanded(
                            child: Text(
                              "   Google 로그인",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ]),
                      ),
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
