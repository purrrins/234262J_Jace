import 'package:flutter/material.dart';
import 'product.dart';

class ProductInfoScreen extends StatelessWidget {
  final Product product;

  ProductInfoScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          product.name,
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            SizedBox(height: 16),
            Text(
              'Price: ${product.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Brand: ${product.brand}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Sizes: ${product.sizes.join(', ')}',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Cart.addItemToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} added to cart')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
