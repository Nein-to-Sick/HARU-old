import 'package:flutter/material.dart';

class AdditionalQuestionPage extends StatelessWidget {
  const AdditionalQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('질문'),
            const SizedBox(
              height: 25,
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 50,
              ),
              onPressed: () {
                print('record submitted!!');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
