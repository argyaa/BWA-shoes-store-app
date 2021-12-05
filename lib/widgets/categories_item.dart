import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CategoriesWidget extends StatelessWidget {
  String text;
  bool isActive;
  Function onTap;
  CategoriesWidget({this.isActive, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: !isActive ? Border.all(color: thirdTextColor) : null,
            color: isActive ? primaryColor : Colors.transparent),
        child: Text(
          text,
          style: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
        ),
      ),
    );
  }
}
