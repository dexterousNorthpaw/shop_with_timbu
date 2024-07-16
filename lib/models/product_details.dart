import 'package:shop_with_timbu/utils/constants/app_constants.dart';

class ProductDetails {
  String? name;
  double? price;
  double? quantity;
  String? imgUrl;
  String? description;
  String? unique_id;

  ProductDetails({
    this.name,
    this.price,
    this.imgUrl,
    this.description,
    this.quantity,
    this.unique_id,
  });

  factory ProductDetails.fromMap(Map<String, dynamic> data) {
    return ProductDetails(
      name: data['name'],
      price: data["current_price"],
      imgUrl: "$imageUrl${data["photos"][0]['url']}",
      description: data["description"],
      quantity: data["quantity"],
      unique_id: data["unique_id"],
    );
  }
}
