import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';
import 'package:shop_with_timbu/screens/product_screen.dart';

class CustomProductWidget extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String assetImage;
  final String? product_id;
  final int index;
  final int nindex;

  CustomProductWidget({
    required this.productName,
    required this.productPrice,
    required this.assetImage,
    this.product_id,
    required this.index,
    required this.nindex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 160,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                              pro: product_id, pindex: nindex,
                              // pindex: nindex,
                            )));
              },
              child: Image(
                image: NetworkImage(assetImage),
                fit: BoxFit.cover,
                // height: 118
              ),
            ),
          ),
          // Image.network(
          //   loadingBuilder: (context, child, loadingProgress) {
          //     if (loadingProgress == null) {
          //       return child;
          //     }
          //     return Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          //   assetImage,
          //   fit: BoxFit.cover,
          // ),
          // Row(
          //   children: [
          // Text(
          //   productName,
          //   style: TextStyle(fontFamily: "Poppins", fontSize: 10),
          // ),
          //     Spacer(),
          //     Container(
          //       child: Center(
          //         child: Text(
          //           "Add to Cart",
          //           style: TextStyle(fontSize: 8),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          // Text(
          //   "\$ $productPrice",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // )

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontFamily: "Poppins", fontSize: 10),
                  ),
                  Text(
                    "\$ $productPrice",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              // Icon(
              //   Icons.favorite,
              //   color: Colors.red,
              //   size: 10,
              // ),
              GestureDetector(
                onTap: () {
                  final p =
                      Provider.of<ProductsProvider>(context, listen: false);
                  p.addCart(index);
                },
                child: Container(
                  width: 56,
                  height: 24,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFF408C2B))),
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style:
                          TextStyle(fontSize: 7.1, color: Color(0xFFFF408C2B)),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
