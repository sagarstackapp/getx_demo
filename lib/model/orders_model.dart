import 'package:getx_demo/model/cart_model.dart';

class OrderModel {
  OrderModel({
    this.id,
    this.amount,
    this.products,
    this.orderDate,
  });

  final String? id;
  final double? amount;
  final List<CartModel>? products;
  final DateTime? orderDate;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        amount: json["amount"],
        products: List<CartModel>.from(json["products"].map((x) => x)),
        orderDate: DateTime.parse(json["DateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "products": List<dynamic>.from(products!.map((x) => x)),
        "DateTime": orderDate!.toIso8601String(),
      };
}
