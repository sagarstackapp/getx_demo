import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/constant/colors.dart';
import 'package:getx_demo/common/constant/images.dart';
import 'package:getx_demo/common/constant/strings.dart';
import 'package:getx_demo/common/widget/common_image_assets.dart';
import 'package:getx_demo/controller/cart_controller.dart';
import 'package:getx_demo/controller/order_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  final cartController = Get.put(CartController());
  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringResources.cartTitle,
          style: TextStyle(color: ColorResources.white),
        ),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) => Column(
          children: [
            const SizedBox(height: 30),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                  children: [
                    const Spacer(),
                    const Text(
                      'Total Amount :',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(flex: 8),
                    Text(cartController.totalAmount.toStringAsFixed(2)),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItemsMap.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == cartController.cartItemsMap.length) {
                    return cartController.totalAmount > 0.1
                        ? GetBuilder<OrderController>(
                            init: OrderController(),
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: TextButton(
                                  onPressed: () {
                                    orderController.checkout(
                                      cartController.cartItems.values.toList(),
                                      cartController.totalAmount,
                                    );
                                    cartController.clear();
                                    Get.snackbar(
                                      "Orders",
                                      "Orders placed successfully",
                                      backgroundColor: Colors.green,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                  child: const Text('CHECKOUT NOW'),
                                ),
                              );
                            },
                          )
                        : Container();
                  }

                  return Dismissible(
                    key: ValueKey(
                        cartController.cartItemsMap.values.toList()[index].id),
                    background: Container(
                      color: Theme.of(context).errorColor,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40,
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cartController.removeCart(int.parse(cartController
                          .cartItemsMap.values
                          .toList()[index]
                          .id!));
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(
                            cartController.cartItemsMap.values
                                .toList()[index]
                                .productImage!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const CommonImageAsset(
                                    imageName: ImageResources.getX),
                          ),
                          title: Text(cartController.cartItemsMap.values
                              .toList()[index]
                              .productTitle!),
                          subtitle: Text(
                              'Total: ${(cartController.cartItemsMap.values.toList()[index].productPrice! * cartController.cartItemsMap.values.toList()[index].productQuantity!)}'),
                          trailing: Text(
                              '${cartController.cartItemsMap.values.toList()[index].productQuantity} X'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
