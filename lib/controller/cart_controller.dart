import 'package:get/get.dart';
import 'package:getx_demo/model/cart_model.dart';

class CartController extends GetxController {
  Map<int, CartModel> cartItemsMap = {};

  Map<int, CartModel> get cartItems {
    return {...cartItemsMap};
  }

  int get cartItemCount {
    return cartItemsMap.length;
  }

  double get totalAmount {
    double subTotal = 0.0;
    cartItemsMap.forEach((key, value) {
      subTotal +=
          value.productPrice! * double.parse(value.productQuantity.toString());
    });
    return subTotal;
  }

  addToCart(CartModel cartModel) {
    if (cartItemsMap.containsKey(int.parse(cartModel.id!))) {
      cartItemsMap.update(
        int.parse(cartModel.id!),
        (value) => CartModel(
          id: cartModel.id,
          productImage: cartModel.productImage,
          productPrice: cartModel.productPrice,
          productQuantity: value.productQuantity! + cartModel.productQuantity!,
          productTitle: cartModel.productTitle,
        ),
      );
    } else {
      cartItemsMap.putIfAbsent(int.parse(cartModel.id!), () => cartModel);
    }
    update();
  }

  removeCart(int productId) {
    cartItemsMap.remove(productId);
    update();
  }

  clear() {
    cartItemsMap.clear();
    update();
  }
}
