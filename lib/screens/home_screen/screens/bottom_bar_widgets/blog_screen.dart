import 'package:blog_app/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

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
              'Blog Post',
              style: GoogleFonts.poppins(
                color: AppColorsLightMode.text,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding:AppPaddings.scaffoldPadding,   
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,   
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mansuri Haque',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Why do you need UI?',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
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
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                color: AppColorsLightMode.text,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 20),   
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: AppColorsLightMode.selectionYellow,
                  borderRadius: BorderRadius.circular(20)),
            ),

            const SizedBox(height: 20),   
            Text(
              'User Experiences Design!',
              style: GoogleFonts.poppins(
                color: AppColorsLightMode.text,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),   
            Text(
              'User experience design is the process designers use to build products that provide great experiences to their users. UX design refers to feelings and emotions users experience when interacting with a product.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                color: AppColorsLightMode.text,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          size: 30,
                        ),),
                    Text(
                      '4.2k',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 7),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 30,
                        )),
                    Text(
                      '140',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 7),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send_rounded,
                          size: 30,
                        )),
                    Text(
                      '20',
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.bookmark_border_rounded,
                  size: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
