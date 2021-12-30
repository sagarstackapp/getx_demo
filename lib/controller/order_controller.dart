import 'package:get/get.dart';
import 'package:getx_demo/model/cart_model.dart';
import 'package:getx_demo/model/orders_model.dart';

class OrderController extends GetxController {
  List<OrderModel> orders = [];

  List<OrderModel> get allOrders {
    return [...orders];
  }

  checkout(List<CartModel> cartProducts, double totalAmount) {
    orders.insert(
      0,
      OrderModel(
        id: DateTime.now().toIso8601String(),
        products: cartProducts,
        amount: totalAmount,
        orderDate: DateTime.now(),
      ),
    );
    update();
  }
}
