class Product {
  final String name;
  final String image;
  final String brand;
  final double price;
  final List<String> sizes;

  Product({
    required this.name,
    required this.image,
    required this.brand,
    required this.price,
    required this.sizes,
  });
}

class ProductRepository {
  static final List<Product> allProducts = [
    Product(
      name: 'Lay\'s Chips',
      image: 'images/lays.png',
      brand: 'Lay\'s',
      price: 10.99,
      sizes: ['250g'],
    ),
    Product(
      name: 'Coke Zero',
      image: 'images/coke.png',
      brand: 'Coca-Cola',
      price: 2.50,
      sizes: ['1.5L'],
    ),
    Product(
      name: 'Pepsi',
      image: 'images/pepsi.png',
      brand: 'Pepsi',
      price: 1.20,
      sizes: ['355 mL'],
    ),
    Product(
      name: 'Cheetos',
      image: 'images/cheetos.png',
      brand: 'PepsiCo',
      price: 6.99,
      sizes: ['150g'],
    ),
    Product(
      name: 'Sprite',
      image: 'images/sprite.png',
      brand: 'Coca-Cola',
      price: 1.20,
      sizes: ['355 mL'],
    ),
    Product(
      name: 'Fanta',
      image: 'images/fanta.png',
      brand: 'Coca-Cola',
      price: 1.20,
      sizes: ['355 mL'],
    ),
    Product(
      name: 'Nissin Chicken',
      image: 'images/nissin.png',
      brand: 'Nissin',
      price: 2.50,
      sizes: ['41g'],
    ),
    Product(
      name: 'Shin Ramyun',
      image: 'images/shin.png',
      brand: 'Nongsim',
      price: 3.50,
      sizes: ['86 g'],
    ),
    Product(
      name: 'KitKat',
      image: 'images/kitkat.png',
      brand: 'Nestle',
      price: 2.50,
      sizes: ['86 g'],
    ),
    Product(
      name: 'Tomyum Wonton',
      image: 'images/wonton.jpg',
      brand: 'CP',
      price: 4.90,
      sizes: ['86 g'],
    ),
    Product(
      name: 'Mogu Mogu',
      image: 'images/mogu.jpeg',
      brand: 'Sappe',
      price: 1.70,
      sizes: ['86 g'],
    ),
    Product(
      name: 'Ben & Jerrys',
      image: 'images/bnj.png',
      brand: 'BNJ',
      price: 8.00,
      sizes: ['86 g'],
    ),
    Product(
      name: 'Pokka Green Tea',
      image: 'images/pokka.jpg',
      brand: 'Pokka',
      price: 2.50,
      sizes: ['86 g'],
    ),
    Product(
      name: 'Mocha Coffee',
      image: 'images/kopi.jpg',
      brand: 'Nestle',
      price: 1.20,
      sizes: ['86 g'],
    ),
  ];

  static Product getProductByName(String name) {
    return allProducts.firstWhere((product) => product.name == name);
  }
}

class Cart {
  static final List<Product> items = [];

  static void addItemToCart(Product product) {
    items.add(product);
  }

  static void clearCart() {
    items.clear();
  }
}
