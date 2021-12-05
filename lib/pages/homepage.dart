import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/pages/home/all_shoes.dart';
import 'package:shamo/pages/home/basketball.dart';
import 'package:shamo/pages/home/hiking.dart';
import 'package:shamo/pages/home/running.dart';
import 'package:shamo/pages/home/sport.dart';
import 'package:shamo/pages/home/training.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/providers/state/categories_state.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/categories_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var categories_state = Provider.of<CategoriesState>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, ${user.name}",
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semibold),
                  ),
                  Text(
                    "@${user.username}",
                    style: thirdTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.profilePhotoUrl))),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              CategoriesWidget(
                text: "All shoes",
                isActive: categories_state.index == 0,
                onTap: () {
                  categories_state.index = 0;
                },
              ),
              CategoriesWidget(
                text: "Running",
                isActive: categories_state.index == 1,
                onTap: () {
                  categories_state.index = 1;
                },
              ),
              CategoriesWidget(
                text: "Sport",
                isActive: categories_state.index == 2,
                onTap: () {
                  categories_state.index = 2;
                },
              ),
              CategoriesWidget(
                text: "Basketball",
                isActive: categories_state.index == 3,
                onTap: () {
                  categories_state.index = 3;
                },
              ),
              CategoriesWidget(
                text: "Training",
                isActive: categories_state.index == 4,
                onTap: () {
                  categories_state.index = 4;
                },
              ),
              CategoriesWidget(
                text: "Hiking",
                isActive: categories_state.index == 5,
                onTap: () {
                  categories_state.index = 5;
                },
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      switch (categories_state.index) {
        case 0:
          return AllShoes();
          break;
        case 1:
          return RunningShoes();
          break;
        case 2:
          return SportShoes();
          break;
        case 3:
          return BasketballShoes();
          break;
        case 4:
          return TrainingShoes();
          break;
        case 5:
          return HikingShoes();
          break;
        default:
          return AllShoes();
      }
    }

    return ListView(
      children: [
        header(),
        categories(),
        content(),
      ],
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;

//   var selectedIndex = 0;

//   @override
//   void initState() {
//     _tabController = TabController(length: 6, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget header() {
//       return Container(
//         margin: EdgeInsets.all(defaultMargin),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Hallo, Alex",
//                     style: primaryTextStyle.copyWith(
//                         fontSize: 24, fontWeight: semibold),
//                   ),
//                   Text(
//                     "@alexkein",
//                     style: thirdTextStyle.copyWith(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//             Image.asset(
//               "assets/image_profile.png",
//               width: 54,
//             )
//           ],
//         ),
//       );
//     }

//     Widget tabBar() {
//       return Container(
//         child: Column(
//           children: [
//             header(),
//             Container(
//               margin: (selectedIndex == 0)
//                   ? EdgeInsets.only(left: 24)
//                   : EdgeInsets.all(0),
//               height: 35,
//               child: TabBar(
//                 controller: _tabController,
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     12.0,
//                   ),
//                   color: primaryColor,
//                 ),
//                 onTap: (val) {
//                   setState(() {
//                     selectedIndex = val;
//                   });
//                 },
//                 labelColor: primaryTextColor,
//                 unselectedLabelColor: primaryTextColor,
//                 isScrollable: true,
//                 tabs: [
//                   Text("All Shoes"),
//                   Text("Sport"),
//                   Text("Hiking"),
//                   Text("Baskeball"),
//                   Text("training"),
//                   Text("Running")
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   allShoes(),
//                   Container(),
//                   Container(),
//                   Container(),
//                   Container(),
//                   Container(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return DefaultTabController(
//         length: 6,
//         child: Scaffold(
//           backgroundColor: bgColor1,
//           body: tabBar(),
//         ));
//   }
// }

// class allShoes extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
