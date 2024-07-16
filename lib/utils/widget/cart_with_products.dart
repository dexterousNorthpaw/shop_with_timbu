import 'package:flutter/material.dart';

class CartWithItems extends StatelessWidget {
  final String unique_id;
  final String imageString;
  final String productName;
  String unitPrice = "Unit Price";
  final double price;

  CartWithItems(
      {super.key,
      required this.unique_id,
      required this.imageString,
      required this.productName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 100, width: 87, child: Image.network(imageString)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(unique_id),
                Text(
                  productName,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(unitPrice),
                Text(
                  "\$${price}",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
