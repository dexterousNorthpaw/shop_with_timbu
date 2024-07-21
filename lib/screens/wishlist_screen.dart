import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';
import 'package:shop_with_timbu/utils/widget/product_wiget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    final wishPro = Provider.of<ProductsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              left: 32.0, right: 32, top: 28), // Added padding
          child: Column(
            children: [
              Text("WishList"),
              Expanded(
                child: GridView.builder(
                  itemCount: wishPro.wishList.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 27.0,
                    mainAxisSpacing: 50.0,
                  ),
                  itemBuilder: (context, index) {
                    return CustomProductWidget(
                      productName: wishPro.wishList[index].name,
                      productPrice: 500,
                      assetImage: wishPro.wishList[index].imgUrl,
                      // product_id: wishPro.wishList[index].id,
                      index: index,
                      nindex: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
