import 'package:get/get.dart';
import 'package:getx_demo/model/product_model.dart';

class ProductController extends GetxController {
  List<ProductModel> items = [
    ProductModel(
      id: 1,
      productTitle: 'Sport Shoe',
      description: 'Made for you Check it out!',
      price: 7000.00,
      imageUrl: 'https://m.media-amazon.com/images/I/61z3crSHT0L._UL1100_.jpg',
    ),
    ProductModel(
      id: 2,
      productTitle: 'Legend',
      description:
          'Built to last forever, StormKing™ lug rubber outsoles and a flexible elastic goring, this can only be for the Legends and i bet you, you have not seen it anywhere.',
      price: 63000.00,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Legend-BlackMatte-3.4_672x672.jpg?v=1600886623',
    ),
    ProductModel(
      id: 3,
      productTitle: 'The Chelsea',
      description: 'Functional and Fashionable.',
      price: 49.00,
      imageUrl: 'https://m.media-amazon.com/images/I/71N8iMxI+VL._UY695_.jpg',
    ),
    ProductModel(
      id: 4,
      productTitle: 'Men\'s Sneakers',
      description: 'Clean & Comfortable Sneakers made with classic Leathers.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679',
    ),
    ProductModel(
      id: 5,
      productTitle: 'The Chelsea',
      description:
          'Comfortable as you\'d expect.This can only be found at Resilient collection.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Captain-Natural-3.jpg?v=1584114360',
    ),
    ProductModel(
      id: 6,
      productTitle: 'Men\'s Sneakers',
      description: 'Clean & Comfortable Sneakers made with classic Leathers.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679',
    ),
    ProductModel(
      id: 7,
      productTitle: 'The Chelsea',
      description:
          'Made for the men who understand what classic means, every bit was carefully selected so you can go the extra mile with confidence and alacrity.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Cavalier-Toffee-210402-2.jpg?v=1618424894',
    ),
    ProductModel(
      id: 8,
      productTitle: 'Men\'s Sneakers',
      description: 'Clean & Comfortable Sneakers made with classic Leathers.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Cavalier-Toffee-210402-3.jpg?v=1618424894',
    ),
    ProductModel(
      id: 9,
      productTitle: 'The Chelsea',
      description: 'Functional and Fashionable.',
      price: 49.99,
      imageUrl: 'https://m.media-amazon.com/images/I/710VyQwSg+L._UY741_.jpg',
    ),
    ProductModel(
      id: 10,
      productTitle: 'Men\'s Sneakers',
      description: 'Clean & Comfortable Sneakers made with classic Leathers.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679',
    ),
  ];

  List<ProductModel> get products {
    return [...items];
  }

  List<ProductModel> get favouriteProducts {
    return items.where((element) => element.isFavourite).toList();
  }

  ProductModel findProductById({int? id}) {
    return items.firstWhere((element) => element.id == id);
  }

  addToFavourite(int id) {
    items[id].isFavourite = !items[id].isFavourite;
    update();
  }

  removeFavourite(int id) {
    update();
  }
}
