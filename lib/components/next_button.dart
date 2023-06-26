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
      child: Container(
        height: 60,
        width: 335,
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(67),
            border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xFF717171))),
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
