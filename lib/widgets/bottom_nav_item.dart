import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class TabItem extends StatelessWidget {
  final String image;
  final bool isSelected;
  final Function onTap;

  const TabItem({Key key, this.image, this.isSelected, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              image,
              width: 20,
              color: isSelected ? primaryColor : Color(0xff808191),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
