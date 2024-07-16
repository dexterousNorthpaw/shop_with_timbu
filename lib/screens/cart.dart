import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';
import 'package:shop_with_timbu/screens/home_view.dart';
import 'package:shop_with_timbu/utils/widget/cart_with_products.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // @override
  // void initState() {
  //   final pp = Provider.of<ProductsProvider>(context, listen: false);

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final pp = Provider.of<ProductsProvider>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 34.0, left: 48, right: 48),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp)),
                  Spacer(),
                  Image(
                    image: AssetImage("assets/logo/shopping-carticon.png"),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: pp.hasNoProduct
                    ? Column(
                        children: [
                          Center(
                            child: Image(
                                image: AssetImage(
                                    "assets/images/shopping-cartbig.png")),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Your cart is empty",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 36,
                            width: 334,
                            child: Text(
                                "Explore our collections today and start your journey towards radiant beauty. Your skin will thank you"),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => HomeView()));
                            },
                            child: Container(
                              width: 160,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF408C2B),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                  child: Text(
                                "Start shopping",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pp.cart.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CartWithItems(
                              unique_id: pp.cart[index].unique_id,
                              imageString: pp.cart[index].imgUrl,
                              productName: pp.cart[index].name,
                              price: pp.cart[index].price);
                        }),
              ),
              Container(
                height: 290,
                width: 335,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF408C2B), width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Cart Summary"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Sub total:     \$ ${pp.cartTotalPrice}"),
                      Text("Delivery: \$2.0"),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            height: 34,
                            width: 63,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: Color(0xFFFF363939))),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          Text(
                            "\$  ${pp.cartTotalPrice}",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 37,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xFF408C2B),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: Color(0xFF363939))),
                            child: Center(
                              child: Text(
                                "Checkout",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    "Recently Viewed",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    "View all",
                    style: TextStyle(color: Color(0xFFFF408C2B)),
                  )
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    ));
  }
}
