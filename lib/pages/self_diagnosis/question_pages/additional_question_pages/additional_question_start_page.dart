import 'package:cap_stone_project/pages/self_diagnosis/question_pages/additional_question_pages/additional_question_page.dart';
import 'package:flutter/material.dart';

//  Page route for animation
Route additionalQuestionPage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const AdditionalQuestionPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
