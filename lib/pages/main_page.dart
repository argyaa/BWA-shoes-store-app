import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/chat_page.dart';
import 'package:shamo/pages/favorite_page.dart';
import 'package:shamo/providers/state/bottom_nav_state.dart';
import 'package:shamo/widgets/bottom_nav_item.dart';
import 'package:shamo/pages/homepage.dart';
import 'package:shamo/pages/profile_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var bottom_nav_state = Provider.of<BottomNavState>(context);

    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Image.asset(
          "assets/icon_cart.png",
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: bgColor2,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabItem(
                  image: "assets/icon_home.png",
                  isSelected: bottom_nav_state.index == 0,
                  onTap: () {
                    bottom_nav_state.index = 0;
                  },
                ),
                TabItem(
                  image: "assets/icon_chat.png",
                  isSelected: bottom_nav_state.index == 1,
                  onTap: () {
                    bottom_nav_state.index = 1;
                  },
                ),
                SizedBox(
                  width: 48,
                ),
                TabItem(
                  image: "assets/icon_favorite.png",
                  isSelected: bottom_nav_state.index == 2,
                  onTap: () {
                    bottom_nav_state.index = 2;
                  },
                ),
                TabItem(
                  image: "assets/icon_profile.png",
                  isSelected: bottom_nav_state.index == 3,
                  onTap: () {
                    bottom_nav_state.index = 3;
                  },
                )
              ],
            ),
          ),
        ),
      );
    }

    // Widget customBottomNav() {
    //   return ClipRRect(
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(30),
    //     ),
    //     child: BottomAppBar(
    //       shape: CircularNotchedRectangle(),
    //       notchMargin: 10,
    //       clipBehavior: Clip.antiAlias,
    //       child: BottomNavigationBar(
    //         backgroundColor: bottomNav,
    //         currentIndex: _currentIndex,
    //         onTap: (val) {
    //           print(val);
    //           setState(() {
    //             _currentIndex = val;
    //           });
    //         },
    //         type: BottomNavigationBarType.fixed,
    //         items: [
    //           BottomNavigationBarItem(
    //             icon: Container(
    //               margin: EdgeInsets.only(top: 20, bottom: 10),
    //               child: Image.asset(
    //                 'assets/icon_home.png',
    //                 width: 20,
    //                 color:
    //                     _currentIndex == 0 ? primaryColor : Color(0xff808191),
    //               ),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Container(
    //               margin: EdgeInsets.only(top: 20, bottom: 10, right: 50),
    //               child: Image.asset(
    //                 'assets/icon_chat.png',
    //                 width: 20,
    //                 color:
    //                     _currentIndex == 1 ? primaryColor : Color(0xff808191),
    //               ),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Image.asset(
    //               'assets/icon_favorite.png',
    //               width: 20,
    //               color: _currentIndex == 2 ? primaryColor : Color(0xff808191),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Image.asset(
    //               'assets/icon_profile.png',
    //               width: 20,
    //               color: _currentIndex == 3 ? primaryColor : Color(0xff808191),
    //             ),
    //             label: '',
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget body() {
      switch (bottom_nav_state.index) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return FavoritePage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: bottom_nav_state.index == 0 ? bgColor1 : bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
