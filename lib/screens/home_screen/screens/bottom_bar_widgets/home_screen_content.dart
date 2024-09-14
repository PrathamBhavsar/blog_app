import 'package:blog_app/constants/colors.dart';
import 'package:blog_app/constants/paddings.dart';
import 'package:blog_app/constants/textstyles.dart';
import 'package:blog_app/constants/util.dart';
import 'package:blog_app/screens/home_screen/screens/bottom_bar_widgets/blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.scaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Explore', style: AppTextStyles.heading),
            const SizedBox(height: 20),
            FilterChips(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text('Sort By', style: AppTextStyles.chipText),
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.sort),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlogsList(),
          ],
        ),
      ),
    );
  }
}

    
class FilterChips extends StatefulWidget {
  @override
  _FilterChipsState createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  String selectedTopic = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: AppConstants.topics.map((String topic) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: FilterChip(
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
              label: Text(
                topic,
                style: AppTextStyles.chipText,
              ),
              selected: selectedTopic == topic,
              onSelected: (bool selected) {
                setState(() {
                  selectedTopic = topic;
                });
              },
              selectedColor: AppColorsLightMode.selectionYellow,
              backgroundColor: Colors.grey[200],
            ),
          );
        }).toList(),
      ),
    );
  }
}

    
class BlogsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BlogScreen(),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.account_circle_rounded),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mansuri Haque',
                                    style: GoogleFonts.poppins(
                                      color: AppColorsLightMode.text,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Why do you need UI?',
                                    style: GoogleFonts.poppins(
                                      color: AppColorsLightMode.text,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '8/18/2020',
                          style: GoogleFonts.poppins(
                            color: AppColorsLightMode.text,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Why UX Design Is More Important Than UI Design.',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'User experience (UX) design is the process design teams use to create products that provide meaningful and relevant experiences to users. This involves the design of the entire process of acquiring and integrating the product, including aspects of branding, design, usability and function',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 3,     
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10 min Read',
                          style: GoogleFonts.poppins(
                            color: AppColorsLightMode.green,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(Icons.bookmark_border_rounded),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(indent: 20, endIndent: 20),
            ],
          ),
        );
      }).toList(),
    );
  }
}
