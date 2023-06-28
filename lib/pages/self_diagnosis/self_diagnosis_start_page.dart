import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelfDiagnosisStartPage extends StatelessWidget {
  const SelfDiagnosisStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DiagnosisModel(
            currentTabIndex: 0,
            currentProgressbarIndex: 1,
            stage: 0,
            isSelected: false,
          ),
        ),
      ],
      child: const DefaultTabController(
          length: 8, initialIndex: 0, child: SelfDiagnosisPage()),
    );
  }
}
