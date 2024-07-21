import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';
import 'package:shop_with_timbu/screens/cart.dart';
import 'package:shop_with_timbu/utils/widget/product_collection.dart';
import 'package:shop_with_timbu/utils/widget/product_wiget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      print("x");
      final provider = Provider.of<ProductsProvider>(context, listen: false);
      provider.items.clear();
      provider.getProducts();
      print("y");
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Sharrie's Signature",
                    style: TextStyle(
                        fontFamily: "Redressed",
                        fontSize: 28,
                        color: Colors.green),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return CartScreen();
                      }));
                    },
                    child: Image.asset("assets/logo/shopping-carticon.png"),
                  )
                  // Icon(Icons.shop),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Welcome, Jane",
                style: TextStyle(fontFamily: "Poppins", fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 48,
                width: 334,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Just for you",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                  )
                ],
              ),
              Container(
                // color: Colors.red,
                height: 200,
                width: 606,
                child: ListView.builder(
                    shrinkWrap: true,
                    // physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          CustomProductWidget(
                            productName: provider.items[index].name,
                            productPrice: provider.items[index].price,
                            assetImage: provider.items[index].imgUrl,
                            product_id: provider.items[index].id,
                            index: index,
                            nindex: index,
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    "Deals",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                  ),
                  Spacer(),
                  Text("View all")
                ],
              ),
              const Divider(),
              Flexible(
                  flex: 2,
                  child: provider.isLoading
                      ? Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          itemCount: provider.items.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 27.0,
                            mainAxisSpacing: 50.0,
                          ),
                          itemBuilder: (context, index) => CustomProductWidget(
                            product_id: provider.items[index].id,
                            productName: provider.items[index].name,
                            productPrice: provider.items[index].price,
                            assetImage: provider.items[index].imgUrl,
                            index: index,
                            nindex: index,
                          ),
                        )),
              SizedBox(
                height: 75,
              ),
              const Text("Our Collections",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 16)),
              const Divider(),
              Container(
                height: 340,
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                  ),
                  children: const <Widget>[
                    ProductCollectionWidget(
                      collectionName: "Cleanse & Prep",
                      collectionImage: "assets/images/postercleanse.png",
                      x: "413eaa549bcc46aabe20b9530e2d6119",
                    ),
                    ProductCollectionWidget(
                      collectionName: "Mosturize & Protect",
                      collectionImage: "assets/images/postermoist.png",
                      x: "d2d235987b4a49f382393098f9124383",
                    ),
                    ProductCollectionWidget(
                        collectionName: "Treat & Nourish",
                        collectionImage: "assets/images/postertreat.png",
                        x: "5d624274dacb4df0ae5e1013f2b3a885"),
                    ProductCollectionWidget(
                        collectionName: "Body Care",
                        collectionImage: "assets/images/posterbodycare.png",
                        x: "af1f91b9e9414217ba1ed18e31a37a56"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text("You Might Also Like"),
                  Spacer(),
                  Text("View All"),
                ],
              ),
              const Divider(),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: provider.items.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 100.0,
                  ),
                  itemBuilder: (context, index) => CustomProductWidget(
                        product_id: provider.items[index].id,
                        productName: provider.items[index].name,
                        productPrice: provider.items[index].price,
                        assetImage: provider.items[index].imgUrl,
                        index: index,
                        nindex: index,
                      )),
            ],
          ),
        ),
      )),
    );
  }
}
