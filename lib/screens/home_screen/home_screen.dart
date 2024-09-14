import 'package:blog_app/constants/colors.dart';
import 'package:blog_app/screens/home_screen/screens/bottom_bar_widgets/add_blog_screen_content.dart';
import 'package:blog_app/screens/home_screen/screens/bottom_bar_widgets/home_screen_content.dart';
import 'package:blog_app/screens/home_screen/screens/bottom_bar_widgets/saved_screen_content.dart';
import 'package:blog_app/screens/home_screen/screens/bottom_bar_widgets/search_content_screen.dart';
import 'package:blog_app/screens/home_screen/screens/bottom_bar_widgets/settings_screen_content.dart';
import 'package:blog_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;    

     
  final List<Widget> _pages = [
    HomeScreenContent(),
    const ScreenScreenContent(),
       
    const SavedScreenContent(),
    const SettingScreenContent()
  ];

     
  void _onItemTapped(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLightMode.backgroundWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddBlogScreenContent(),));
        },
        backgroundColor: AppColorsLightMode.primary,
        child: Icon(
          Icons.add,
          color: AppColorsLightMode.backgroundWhite,
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColorsLightMode.backgroundWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRect(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(),));
                },
                icon: const Icon(Icons.account_circle_rounded,
                size: 40,)
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColorsLightMode.text),
              ),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Icon(Icons.notifications_none_rounded),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],    
      bottomNavigationBar: Container(
        height: 65,
        child: BottomNavigationBar(
          iconSize: 25,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: '',
            ),
               
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),    
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColorsLightMode.text,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
               
              _onItemTapped(index);
               
          },
          type: BottomNavigationBarType.fixed,    
        ),
      ),
    );
  }
}
