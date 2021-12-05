import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_tile.dart';

class TrainingShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget product() {
      return Column(
        children: [
          // ProductTile(),
          // ProductTile(),
          // ProductTile(),
          // ProductTile(),
          // ProductTile(),
        ],
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
            "For You",
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
          ),
          SizedBox(height: 14),
          product(),
        ],
      ),
    );
  }
}
