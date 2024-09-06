import 'package:blog_app/constants/colors.dart';
import 'package:blog_app/constants/paddings.dart';
import 'package:blog_app/constants/textstyles.dart';
import 'package:flutter/material.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  List<String> topics = [
    "UI Design",
    "UX Design",
    "Blog Design",
    "Visual Design",
    "Motion",
    "Graphic",
    "Typography",
    "3d",
    "Icon",
    "News",
    "Business",
    "Sports",
    "Fashion",
    "Technology",
    "Health",
    "Shopping",
    "Music",
    "Video",
    "Recipe",
    "Fun",
    "Entertainment",
    "Creative"
  ];

  Map<String, bool> selectedTopics = {};

  @override
  void initState() {
    super.initState();
    topics.forEach((topic) {
      selectedTopics[topic] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.scaffoldPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pick Topics to Start\nReading...',
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: topics.map((String topic) {
                  return FilterChip(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),
                    label: Text(topic, style: AppTextStyles.chipText,),
                    selected: selectedTopics[topic]!,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedTopics[topic] = selected;
                      });
                    },
                    selectedColor: AppColorsLightMode.selectionYellow,
                    backgroundColor: Colors.grey[200],
                  );
                }).toList(),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () {
                  List<String> selected = selectedTopics.entries
                      .where((entry) => entry.value)
                      .map((entry) => entry.key)
                      .toList();
                  print("Selected topics: $selected");
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColorsLightMode.primary,
                  ),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(color: AppColorsLightMode.backgroundWhite),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
