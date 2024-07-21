import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/heart_icon_icons.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';
import 'package:shop_with_timbu/screens/cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? pro;
  final int pindex;

  const ProductDetailsScreen(
      {super.key, required this.pro, required this.pindex});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      print("xx");
      // w = widget.pro;
      print(widget.pro);
      print(widget.pindex);
      final prov = Provider.of<ProductsProvider>(context, listen: false);
      prov.getProductDescription(widget.pro);
      print("y");
    });
  }

  bool fav = false;

  @override
  Widget build(BuildContext context) {
    final provi = Provider.of<ProductsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xFFFFE4F5E0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return CartScreen();
                            }));
                          },
                          child:
                              Image.asset("assets/logo/shopping-carticon.png"),
                        )
                      ],
                    ),
                    // Center(
                    //   child:
                    //    Image(image: NetworkImage(provi.pxd.imgUrl ?? "")),
                    // )
                  ]),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(provi.pxd.unique_id ?? "No unique ID"),
                        Spacer(),
                        Text(
                          "In Stock",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          provi.pxd.name ?? "...",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            onPressed: () {
                              final p = Provider.of<ProductsProvider>(context,
                                  listen: false);
                              p.addWishList();
                              setState(() {
                                fav = !fav;
                              });
                            },
                            icon: fav
                                ? Icon(
                                    HeartIcon.heart,
                                    color: Colors.red,
                                  )
                                : Icon(HeartIcon.heart_empty)),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 126,
                        width: 333,
                        child: Text(provi.pxd.description ?? "No description")),
                    const Text(
                      "Made with pure natural ingredients",
                      style: TextStyle(color: Colors.green),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Text("How to use"),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                    const Divider(),
                    const Spacer(),
                    const Row(
                      children: [
                        Text("Delivery and Drop off"),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomAppBar(
            color: Color(0xFFFF408C2B),
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sub",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("\$ " + provi.pxd.price.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print("tapped");
                    final addTo =
                        Provider.of<ProductsProvider>(context, listen: false);
                    addTo.addCart(widget.pindex);
                    print("added ${widget.pindex} to cart");
                    // addTo.addCart(widget.index);
                  },
                  child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                          child: Text(
                        "Add to cart",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ))),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
