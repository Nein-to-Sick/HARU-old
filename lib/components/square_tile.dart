import 'package:cap_stone_project/Theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white),
          border: Border.all(color: HARUTheme.HARUGreyscale),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            imagePath,
            height: 50,
          ),
        ),
      ),
    );
  }
}
