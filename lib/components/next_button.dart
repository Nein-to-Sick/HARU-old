import 'package:cap_stone_project/Theme/color_schemes.dart';
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
          borderRadius: BorderRadius.circular(67),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          )),
      child: SizedBox(
        height: 60,
        width: 335,
        child: ElevatedButton(
          onPressed: isSelected ? onTap : null,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primaryContainer),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );

    /*
    GestureDetector(
      onTap: isSelected ? onTap : () {},
      child: AnimatedContainer(
        height: 60,
        width: 335,
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
            borderRadius: BorderRadius.circular(67),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline,
            ),
            ),
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
    */
  }
}
