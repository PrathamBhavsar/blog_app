import 'package:blog_app/constants/colors.dart';
import 'package:blog_app/constants/paddings.dart';
import 'package:blog_app/constants/textstyles.dart';
import 'package:blog_app/constants/util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {


  Map<String, bool> selectedTopics = {};

  @override
  void initState() {
    super.initState();
    AppConstants.topics.forEach((topic) {
      selectedTopics[topic] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: (){}, child: Text('Login', style: AppTextStyles.loginText,))
          ],
        ),
      ),
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
                children: AppConstants.topics.map((String topic) {
                  return FilterChip(
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    label: Text(
                      topic,
                      style: AppTextStyles.chipText,
                    ),
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
                  if (selected.length > 4) {
                    print("Selected topics: $selected");
                  } else {
                    Fluttertoast.showToast(msg: 'Select atleast 5 topics!');
                  }
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
                    style: AppTextStyles.btnTextBlack,
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
