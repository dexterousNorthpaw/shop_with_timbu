import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';

class CartWithItems extends StatelessWidget {
  final String unique_id;
  final String imageString;
  final String productName;
  String unitPrice = "Unit Price";
  final double price;
  // final VoidCallback delItem;
  final int index;

  CartWithItems(
      {super.key,
      required this.unique_id,
      required this.imageString,
      required this.productName,
      required this.price,
      required this.index});

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
                GestureDetector(
                    onTap: () {
                      final pvd =
                          Provider.of<ProductsProvider>(context, listen: false);
                      pvd.delCartItem(index);
                    },
                    child: Image.asset("assets/images/Delete.png"))
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
