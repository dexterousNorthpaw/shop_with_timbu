import 'package:shop_with_timbu/utils/constants/app_constants.dart';

// class Products {
//   String name;
//   double price;
//   double quantity;
//   String imgUrl;
//   String? description;

//   bool isAvailable;

//   Products(
//       {required this.name,
//       required this.price,
//       required this.quantity,
//       required this.imgUrl,
//       required this.description,
//       required this.isAvailable});

//   factory Products.fromMap(Map<String, dynamic> data) {
//     return Products(
//       name: data["name"],
//       price: data["current_price"][0]["USD"][0],
//       quantity: data["available_quantity"],
//       description: data['description'],
//       isAvailable: data["is_available"],
//       imgUrl: '$imageUrl${data['photos'][0]['url']}',
//     );
//   }
// }

class Products {
  String name;
  double price;
  double quantity;
  String imgUrl;
  String? description;
  String id;
  String unique_id;

  bool isAvailable;

  Products({
    required this.name,
    required this.price,
    required this.id,
    required this.quantity,
    required this.imgUrl,
    required this.description,
    required this.isAvailable,
    required this.unique_id,
  });

  factory Products.fromMap(Map<String, dynamic> data) {
    return Products(
      name: data["name"],
      id: data["id"],
      unique_id: data["unique_id"],
      price: data["current_price"][0]["USD"][0],
      quantity: data["available_quantity"],
      // imgUrl: '',
      description: data['description'],
      isAvailable: data["is_available"],
      imgUrl: '$imageUrl${data['photos'][0]['url']}',
    );
  }
}






// class Products {
//   int? page;
//   int? size;
//   int? total;
//   Null? debug;
//   Null? previousPage;
//   Null? nextPage;
//   List<Items>? items;

//   Products(
//       {this.page,
//       this.size,
//       this.total,
//       this.debug,
//       this.previousPage,
//       this.nextPage,
//       this.items});

//   Products.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     size = json['size'];
//     total = json['total'];
//     debug = json['debug'];
//     previousPage = json['previous_page'];
//     nextPage = json['next_page'];
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(new Items.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['page'] = this.page;
//     data['size'] = this.size;
//     data['total'] = this.total;
//     data['debug'] = this.debug;
//     data['previous_page'] = this.previousPage;
//     data['next_page'] = this.nextPage;
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Items {
//   String? name;
//   String? description;
//   String? uniqueId;
//   String? urlSlug;
//   bool? isAvailable;
//   bool? isService;
//   Null? previousUrlSlugs;
//   bool? unavailable;
//   Null? unavailableStart;
//   Null? unavailableEnd;
//   String? id;
//   Null? parentProductId;
//   Null? parent;
//   String? organizationId;
//   List? productImage;
//   List? categories;
//   String? dateCreated;
//   String? lastUpdated;
//   String? userId;
//   List<Photos>? photos;
//   List<CurrentPrice>? currentPrice;
//   bool? isDeleted;
//   int? availableQuantity;
//   Null? sellingPrice;
//   Null? discountedPrice;
//   Null? buyingPrice;
//   Null? extraInfos;

//   Items(
//       {this.name,
//       this.description,
//       this.uniqueId,
//       this.urlSlug,
//       this.isAvailable,
//       this.isService,
//       this.previousUrlSlugs,
//       this.unavailable,
//       this.unavailableStart,
//       this.unavailableEnd,
//       this.id,
//       this.parentProductId,
//       this.parent,
//       this.organizationId,
//       this.productImage,
//       this.categories,
//       this.dateCreated,
//       this.lastUpdated,
//       this.userId,
//       this.photos,
//       this.currentPrice,
//       this.isDeleted,
//       this.availableQuantity,
//       this.sellingPrice,
//       this.discountedPrice,
//       this.buyingPrice,
//       this.extraInfos});

//   Items.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     description = json['description'];
//     uniqueId = json['unique_id'];
//     urlSlug = json['url_slug'];
//     isAvailable = json['is_available'];
//     isService = json['is_service'];
//     previousUrlSlugs = json['previous_url_slugs'];
//     unavailable = json['unavailable'];
//     unavailableStart = json['unavailable_start'];
//     unavailableEnd = json['unavailable_end'];
//     id = json['id'];
//     parentProductId = json['parent_product_id'];
//     parent = json['parent'];
//     organizationId = json['organization_id'];
//     productImage = json['product_image'];
//     // if (json['product_image'] != null) {
//     //   productImage = <Null>[];
//     //   json['product_image'].forEach((v) {
//     //     productImage!.add(new Null.fromJson(v));
//     //   });
//     // }
//     categories = json['catergories'];
//     // if (json['categories'] != null) {
//     //   categories = [];
//     //   json['categories'].forEach((v) {
//     //     categories!.add(Null.fromJson(v));
//     //   });
//     // }
//     dateCreated = json['date_created'];
//     lastUpdated = json['last_updated'];
//     userId = json['user_id'];
//     if (json['photos'] != null) {
//       photos = <Photos>[];
//       json['photos'].forEach((v) {
//         photos!.add(new Photos.fromJson(v));
//       });
//     }
//     if (json['current_price'] != null) {
//       currentPrice = <CurrentPrice>[];
//       json['current_price'].forEach((v) {
//         currentPrice!.add(new CurrentPrice.fromJson(v));
//       });
//     }
//     isDeleted = json['is_deleted'];
//     availableQuantity = json['available_quantity'];
//     sellingPrice = json['selling_price'];
//     discountedPrice = json['discounted_price'];
//     buyingPrice = json['buying_price'];
//     extraInfos = json['extra_infos'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['unique_id'] = this.uniqueId;
//     data['url_slug'] = this.urlSlug;
//     data['is_available'] = this.isAvailable;
//     data['is_service'] = this.isService;
//     data['previous_url_slugs'] = this.previousUrlSlugs;
//     data['unavailable'] = this.unavailable;
//     data['unavailable_start'] = this.unavailableStart;
//     data['unavailable_end'] = this.unavailableEnd;
//     data['id'] = this.id;
//     data['parent_product_id'] = this.parentProductId;
//     data['parent'] = this.parent;
//     data['organization_id'] = this.organizationId;
//     if (this.productImage != null) {
//       data['product_image'] =
//           this.productImage!.map((v) => v.toJson()).toList();
//     }
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     data['date_created'] = this.dateCreated;
//     data['last_updated'] = this.lastUpdated;
//     data['user_id'] = this.userId;
//     if (this.photos != null) {
//       data['photos'] = this.photos!.map((v) => v.toJson()).toList();
//     }
//     if (this.currentPrice != null) {
//       data['current_price'] =
//           this.currentPrice!.map((v) => v.toJson()).toList();
//     }
//     data['is_deleted'] = this.isDeleted;
//     data['available_quantity'] = this.availableQuantity;
//     data['selling_price'] = this.sellingPrice;
//     data['discounted_price'] = this.discountedPrice;
//     data['buying_price'] = this.buyingPrice;
//     data['extra_infos'] = this.extraInfos;
//     return data;
//   }
// }

// class Photos {
//   String? modelName;
//   String? modelId;
//   String? organizationId;
//   String? filename;
//   String? url;
//   bool? isFeatured;
//   bool? saveAsJpg;
//   bool? isPublic;
//   bool? fileRename;
//   int? position;

//   Photos(
//       {this.modelName,
//       this.modelId,
//       this.organizationId,
//       this.filename,
//       this.url,
//       this.isFeatured,
//       this.saveAsJpg,
//       this.isPublic,
//       this.fileRename,
//       this.position});

//   Photos.fromJson(Map<String, dynamic> json) {
//     modelName = json['model_name'];
//     modelId = json['model_id'];
//     organizationId = json['organization_id'];
//     filename = json['filename'];
//     url = json['url'];
//     isFeatured = json['is_featured'];
//     saveAsJpg = json['save_as_jpg'];
//     isPublic = json['is_public'];
//     fileRename = json['file_rename'];
//     position = json['position'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['model_name'] = this.modelName;
//     data['model_id'] = this.modelId;
//     data['organization_id'] = this.organizationId;
//     data['filename'] = this.filename;
//     data['url'] = this.url;
//     data['is_featured'] = this.isFeatured;
//     data['save_as_jpg'] = this.saveAsJpg;
//     data['is_public'] = this.isPublic;
//     data['file_rename'] = this.fileRename;
//     data['position'] = this.position;
//     return data;
//   }
// }

// class CurrentPrice {
//   List<double>? nGN;

//   CurrentPrice({this.nGN});

//   CurrentPrice.fromJson(Map<String, dynamic> json) {
//     nGN = json['NGN'].cast<double>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['NGN'] = this.nGN;
//     return data;
//   }
// }
