import 'package:flutter/material.dart';

class ProductCollectionWidget extends StatelessWidget {
  final String collectionName;
  final String collectionImage;

  const ProductCollectionWidget(
      {super.key, required this.collectionName, required this.collectionImage});
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
