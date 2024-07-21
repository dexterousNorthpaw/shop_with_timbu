// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_with_timbu/providers/products_provider.dart';
// import 'package:shop_with_timbu/utils/widget/product_wiget.dart';

// class CategoryScreen extends StatefulWidget {
//   final String tin;
//   const CategoryScreen({super.key, required this.tin});

//   @override
//   State<CategoryScreen> createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoryScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // TODO: implement initState
//     Future.delayed(Duration.zero, () {
//       print("cat start");
//       final provided = Provider.of<ProductsProvider>(context, listen: false);
//       provided.displaycategory.clear();
//       provided.getCategory(widget.tin);
//       print("cat end");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final psp = Provider.of<ProductsProvider>(context);
//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//         children: [
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back)),
//               Text(widget.tin)
//             ],
//           ),
//           Expanded(
//               child: psp.isLoading
//                   ? Center(
//                       child: LinearProgressIndicator(),
//                     )
//                   : GridView.builder(
//                       itemCount: psp.displaycategory.length,
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 27.0,
//                           mainAxisSpacing: 50.0),
//                       itemBuilder: (context, index) {
//                         return CustomProductWidget(
//                           productName: psp.displaycategory[index].name,
//                           productPrice: psp.displaycategory[index].price,
//                           assetImage: psp.displaycategory[index].imgUrl,
//                           product_id: psp.displaycategory[index].id,
//                           index: index,
//                           nindex: index,
//                         );
//                       }))
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';
import 'package:shop_with_timbu/utils/widget/product_wiget.dart';

class CategoryScreen extends StatefulWidget {
  final String tin;
  const CategoryScreen({super.key, required this.tin});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      print("cat start");
      final provided = Provider.of<ProductsProvider>(context, listen: false);
      provided.displaycategory.clear();
      provided.getCategory(widget.tin);
      print("cat end");
    });
  }

  @override
  Widget build(BuildContext context) {
    final psp = Provider.of<ProductsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              left: 32.0, right: 32, top: 28), // Added padding
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(widget.tin)
                ],
              ),
              Expanded(
                child: psp.isLoading
                    ? Center(
                        child: LinearProgressIndicator(),
                      )
                    : GridView.builder(
                        itemCount: psp.displaycategory.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 27.0,
                          mainAxisSpacing: 50.0,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            productName: psp.displaycategory[index].name,
                            productPrice: psp.displaycategory[index].price,
                            assetImage: psp.displaycategory[index].imgUrl,
                            product_id: psp.displaycategory[index].id,
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
  }
}
