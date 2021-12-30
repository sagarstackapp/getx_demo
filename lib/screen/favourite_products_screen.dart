import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/constant/colors.dart';
import 'package:getx_demo/common/constant/images.dart';
import 'package:getx_demo/common/constant/strings.dart';
import 'package:getx_demo/common/widget/common_image_assets.dart';
import 'package:getx_demo/controller/cart_controller.dart';
import 'package:getx_demo/controller/product_controller.dart';
import 'package:getx_demo/model/cart_model.dart';
import 'package:getx_demo/screen/cart_screen.dart';

class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({Key? key}) : super(key: key);

  @override
  State<FavouriteProducts> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<FavouriteProducts> {
  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringResources.favTitle,
          style: TextStyle(color: ColorResources.white),
        ),
        actions: [
          GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) => IconButton(
              onPressed: () => Get.to(() => const CartScreen()),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: productController.favouriteProducts.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                child: Image.network(
                  productController.favouriteProducts[index].imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const CommonImageAsset(imageName: ImageResources.getX),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: Icon(
                    productController.favouriteProducts[index].isFavourite ==
                            true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  onPressed: () {
                    productController.removeFavourite(
                        productController.favouriteProducts[index].id!);
                  },
                ),
                title: Text(
                  productController.favouriteProducts[index].productTitle!,
                  textAlign: TextAlign.center,
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addToCart(
                            CartModel(
                              id: productController.favouriteProducts[index].id
                                  .toString(),
                              productTitle: productController
                                  .favouriteProducts[index].productTitle,
                              productQuantity: 1,
                              productPrice: productController
                                  .favouriteProducts[index].price,
                              productImage: productController
                                  .favouriteProducts[index].imageUrl,
                            ),
                          );
                        },
                        color: Theme.of(context).secondaryHeaderColor,
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
