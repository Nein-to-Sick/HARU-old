import 'package:cap_stone_project/pages/daily_emotion_pages/detail_textfield.dart';
import 'package:cap_stone_project/pages/daily_emotion_pages/emoji_select.dart';
import 'package:flutter/material.dart';

class DailyEmotion extends StatefulWidget {
  const DailyEmotion({super.key});

  @override
  State<DailyEmotion> createState() => _DailyEmotionState();
}

class _DailyEmotionState extends State<DailyEmotion> {
  @override
  Widget build(BuildContext context) {
    TabController tabController = DefaultTabController.of(context);
    int currentIndex = tabController.index;

    return Column(
      children: [
        const Expanded(
          child: TabBarView(
            children: [
              // Tab 1의 콘텐츠
              EmojiSelect(),
              // Tab 2의 콘텐츠
              DetailTextfield(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('아니요')),
            (currentIndex < tabController.length - 1)
                ? TextButton(
                    onPressed: () {
                      tabController.animateTo(currentIndex + 1);
                      setState(() {
                        currentIndex = tabController.index;
                      });
                    },
                    child: const Text('예'))
                : TextButton(onPressed: () {}, child: const Text('기록하기')),
          ],
        )
      ],
    );
  }
}
