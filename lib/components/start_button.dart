import 'package:cap_stone_project/%EC%95%88%EC%93%B0%EB%8A%94%20%ED%8E%98%EC%9D%B4%EC%A7%80/energyState.dart';
import 'package:cap_stone_project/pages/mainPage/mainPage.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartButton extends StatelessWidget {
  final String text;

  const StartButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = Provider.of<UserInfoValueModel>(context).isAgree;

    return AnimatedContainer(
      curve: Curves.easeInQuart,
      onEnd: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
            (route) => false);
      },
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
      child: SizedBox(
        height: 60,
        width: 335,
        child: ElevatedButton(
          onLongPress: () {
            Provider.of<UserInfoValueModel>(context, listen: false)
                .isAgreeUpdate(true);
          },
          style: ButtonStyle(
            overlayColor: null,
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {},
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
      onLongPress: () {
        Provider.of<UserInfoValueModel>(context, listen: false)
            .isAgreeUpdate(true);
      },
      child: AnimatedContainer(
        height: 60,
        width: 335,
        curve: Curves.easeInQuart,
        onEnd: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const EnergyState()),
              (route) => false);
        },
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
        duration: const Duration(milliseconds: 500),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.background,
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
