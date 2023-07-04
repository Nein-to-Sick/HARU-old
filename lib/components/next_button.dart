import 'package:cap_stone_project/Theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool isSelected;

  const NextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected ? onTap : () {},
      child: AnimatedContainer(
        height: 60,
        width: 335,
        decoration: BoxDecoration(
            color: isSelected
                ? HARUTheme.HARUPrimary.shade300
                : HARUTheme.HARUPrimary.shade300,
            borderRadius: BorderRadius.circular(67),
            border: Border.all(
                color: isSelected
                    ? HARUTheme.HARUPrimary.shade900
                    : const Color(0xFF717171))),
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.background
                  : const Color(0xFF717171),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
