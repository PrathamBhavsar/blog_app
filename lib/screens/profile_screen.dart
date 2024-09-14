import 'package:blog_app/constants/colors.dart';
import 'package:blog_app/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation: 12,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            Text(
              '@adam007',
              style: GoogleFonts.poppins(
                color: AppColorsLightMode.text,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.scaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                  size: 75,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            '23k',
                            style: GoogleFonts.poppins(
                              color: AppColorsLightMode.text,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: GoogleFonts.poppins(
                              color: AppColorsLightMode.text,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '140',
                            style: GoogleFonts.poppins(
                              color: AppColorsLightMode.text,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Following',
                            style: GoogleFonts.poppins(
                              color: AppColorsLightMode.text,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '03',
                            style: GoogleFonts.poppins(
                              color: AppColorsLightMode.text,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Posts',
                            style: GoogleFonts.poppins(
                              color: AppColorsLightMode.text,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adam Shafi',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'App Designer',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  width: 70,
                  decoration: BoxDecoration(
                      color: AppColorsLightMode.textSecondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Edit',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(indent: 20, endIndent: 20),
            const SizedBox(height: 10),
            Text(
              'Your Posts:',
              style: GoogleFonts.poppins(
                color: AppColorsLightMode.text,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(3, (index) {
                return Dismissible(
                  key: Key('$index'),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Item $index dismissed')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Text(
                            '10 min Read',
                            style: GoogleFonts.poppins(
                              color: AppColorsLightMode.green,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(indent: 20, endIndent: 20),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
