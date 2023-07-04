import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            // color: Color(0xFF619F70),
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                // color: Colors.white,\
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )),
    );
  }
}
