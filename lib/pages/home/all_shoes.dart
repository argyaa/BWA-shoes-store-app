import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_tile.dart';
import 'package:shamo/widgets/popular_product_card.dart';

class AllShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    Widget popularProduct() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 30),
            Row(
              children: productProvider.products
                  .map((product) => PopularProduct(product))
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14, left: 30),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(product))
              .toList(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Container(
          margin: EdgeInsets.only(left: defaultMargin),
          child: Text(
            "Popular Product",
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
          ),
        ),
        SizedBox(height: 14),
        popularProduct(),
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.only(left: defaultMargin),
          child: Text(
            "New Arrivals",
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
          ),
        ),
        newArrivals(),
      ],
    );
  }
}
