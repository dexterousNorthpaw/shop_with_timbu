import 'package:flutter/material.dart';
import 'package:shop_with_timbu/screens/category_scren.dart';

class ProductCollectionWidget extends StatelessWidget {
  final String collectionName;
  final String collectionImage;
  final String x;

  const ProductCollectionWidget(
      {super.key,
      required this.collectionName,
      required this.collectionImage,
      required this.x});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryScreen(
                  tin: x,
                )));
      },
      child: Container(
        height: 210,
        width: 160,
        child: Column(
          children: [
            Container(height: 130, child: Image.asset(collectionImage)),
            SizedBox(
              height: 5,
            ),
            Text(collectionName),
          ],
        ),
      ),
    );
  }
}
