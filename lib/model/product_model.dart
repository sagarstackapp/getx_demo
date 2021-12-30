class ProductModel {
  ProductModel({
    this.id,
    this.productTitle,
    this.imageUrl,
    this.description,
    this.price,
    this.isFavourite = false,
  });

  final int? id;
  final String? productTitle;
  final String? imageUrl;
  final String? description;
  final double? price;
  bool isFavourite;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productTitle: json["productTitle"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        price: json["price"],
        isFavourite: json["isFavourite"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productTitle": productTitle,
        "imageUrl": imageUrl,
        "description": description,
        "price": price,
        "isFavourite": isFavourite,
      };
}
