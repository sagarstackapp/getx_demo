class CartModel {
  CartModel({
    this.id,
    this.productTitle,
    this.productQuantity,
    this.productPrice,
    this.productImage,
  });

  final String? id;
  final String? productTitle;
  final int? productQuantity;
  final double? productPrice;
  final String? productImage;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        productTitle: json["productTitle"],
        productQuantity: json["productQuantity"],
        productPrice: json["productPrice"],
        productImage: json["productImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productTitle": productTitle,
        "productQuantity": productQuantity,
        "productPrice": productPrice,
        "productImage": productImage,
      };
}
